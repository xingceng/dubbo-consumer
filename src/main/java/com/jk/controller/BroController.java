/**
 * Copyright (C), 2015-2019, XXX有限公司
 * FileName: 杨明瑞
 * Author:   18730
 * Date:     2019/3/18 15:00
 * Description: 经纪人增删改查
 */
package com.jk.controller;

import com.jk.model.Broker;
import com.jk.model.Circuit;
import com.jk.service.BroService;
import com.jk.utils.OssUpFileUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
public class BroController {

    @Autowired
    private BroService broService;

    /**
     * @Author 杨明瑞
     * @Description //TODO 查询经纪人列表
     * @Date 15:21 2019/3/18
     * @Param [page, rows]
     * @return java.util.HashMap<java.lang.String,java.lang.Object>
     **/
    @RequestMapping("queryBro")
    public HashMap<String,Object> queryBroker(int page,int rows,Broker bro){
        return broService.queryBroker(page,rows,bro);
    }

    /**
     * @Author 杨明瑞
     * @Description //TODO 新增经纪人信息
     * @Date 13:40 2019/3/19
     * @Param []
     * @return void
     **/
    @RequestMapping("saveBro")
    public void saveBro(Broker broker){
        broService.saveBro(broker);
    }

    /**
     * @Author 杨明瑞
     * @Description //TODO 查询地区
     * @Date 14:48 2019/3/19
     * @Param []
     * @return java.util.List<com.jk.model.Circuit>
     **/
    @RequestMapping("queryCir")
    public List<Circuit> queryCirByPid(int pid){
        return broService.queryCirByPid(pid);
    }

    //OOS图片上传
    @ResponseBody
    @RequestMapping("addFiletwo")
    public String addFile(@RequestParam("headimg") MultipartFile file){
        Map<String, Object> stringObjectMap = OssUpFileUtil.uploadFile(file);
        String count = "";
        for(String key : stringObjectMap.keySet()){
            Object o = stringObjectMap.get(key);
            System.out.println("key: " + key + " value: " + o);
            if(key=="url"){
                count+=o;
            }
        }
        return count;
    }
}
