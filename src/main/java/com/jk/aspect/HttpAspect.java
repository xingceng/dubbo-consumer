package com.jk.aspect;
/**
 * <pre>项目名称:ssm-ws
 * 文件名称:LogAspect.java
 * 包名:com.jk.ws.service.impl
 * 创建日期:2018年12月27日上午11:04:13
 * Copyright (c) 2018, yuxy123@gmail.com All Rights Reserved.</pre>
 */


import java.util.Date;

import javax.servlet.http.HttpServletRequest;


import com.jk.model.LogBean;
import com.jk.model.User;
import com.jk.utils.CommonUtils;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.AfterReturning;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.stereotype.Component;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.servlet.support.RequestContext;


@Aspect
@Component
public class HttpAspect {

    @Autowired
    private MongoTemplate mongoTemplate;

    @Pointcut("execution(public * com.jk.controller..*.*(..))")
    public void LogPointCut() {
    }


    @AfterReturning(value = "LogPointCut()", returning = "rtv")
    public void afterLog(JoinPoint joinPoint, Object rtv) {
        System.out.println("进去切点。。。。。");
        LogBean logBean = new LogBean();
        //获取时间
        logBean.setCreateDate(new Date());
        //获取类名
        String classname = joinPoint.getTarget().getClass().getSimpleName();
        logBean.setClassName(classname);
        //获取方法名
        String method = joinPoint.getSignature().getName();
        logBean.setMethod(method);
        //获取请求参数
      /*  String reqparam = "";
        Object[] args = joinPoint.getArgs();
        for (Object object : args) {
            reqparam += "||" +object.toString();
        }
        logBean.setReqParam(reqparam);*/

        //返回值
        if (rtv != null) {
            logBean.setRepParam(rtv.toString());
        }
        //获取request对象
        ServletRequestAttributes requestAttributes = (ServletRequestAttributes) RequestContextHolder.getRequestAttributes();
        HttpServletRequest request = requestAttributes.getRequest();
        User user = (User) request.getSession().getAttribute("user");
        //获取userid
        if (user != null) {
            logBean.setUserId(user.getId());
            logBean.setUserName(user.getUsername());
        }
        //获取ip地址
        String ip = CommonUtils.getIp(request);
        logBean.setIp(ip);
        //保存mongodb
        System.out.println(logBean);
        mongoTemplate.save(logBean);
    }
}
