package com.jk.controller;

import com.alibaba.dubbo.common.json.JSON;
import com.alibaba.dubbo.common.json.JSONObject;
import com.alibaba.dubbo.common.json.ParseException;
import com.jk.model.*;
import com.jk.service.LoginService;
import com.jk.service.TaskService;
import com.jk.utils.HttpClientUtil;
import com.jk.utils.Md5Util;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;
import javax.servlet.http.HttpSession;
import java.io.FileOutputStream;
import java.security.NoSuchProviderException;
import java.text.SimpleDateFormat;
import java.util.*;

@Controller
public class LoginController {

    @Autowired
    private LoginService loginService;

    @Autowired
    private TaskService taskService;


    //登陆
    @RequestMapping("login")
    @ResponseBody
    public String login(User user,String valCode,HttpSession session){
        queryHeTong();
        //验证用户名
        User user2 = loginService.queryUserByLoginNumber(user.getUsername());
        if(user2==null){
            return "用户名不存在";
        }
        //验证密码
        if(!user.getPassword().equals(user2.getPassword())){
            return "密码错误";
        }
        session.setAttribute("user", user2);
        return "登录成功";
    }
    //查询权限树
    @RequestMapping("queryNavTree")
    @ResponseBody
    public List<Tree> queryNavTree(){
        return loginService.queryNavTree();
    }

    public void queryHeTong(){
        SimpleDateFormat time = new SimpleDateFormat("hh-mm-ss");
        String time1 = time.format(new Date());
        System.out.println(time1);
        if(time1.equals("0")){
            return ;
        }

        //得到时间类
        Calendar date = Calendar.getInstance();

        //设置时间为 xx-xx-xx 00:00:00

        date.set(date.get(Calendar.YEAR), date.get(Calendar.MONTH), date.get(Calendar.DATE), 0, 0, 0);

        //一天的毫秒数

        long daySpan =  24*60*60*1000;

        //得到定时器实例

        Timer t = new Timer();

        //使用匿名内方式进行方法覆盖

        t.schedule(new TimerTask() {

            public void run() {
                List<HeTong> list=loginService.queryHeTong();
                String name="";
                for(int i=0;i<list.size();i++) {
                    SimpleDateFormat time = new SimpleDateFormat("yyyy-MM-dd");
                    int day = 1;
                    try {
                        day = (int) ((time.parse(list.get(i).getLatedate()).getTime()-new Date().getTime()) / 24 / 60 / 60 / 1000);
                    } catch (java.text.ParseException e) {
                        e.printStackTrace();
                    }
                    System.out.println(day);
                    if (day <= 30 && day >= 15) {
                        Properties prop = new Properties();
                        prop.setProperty("mail.host", "smtp.163.com");
                        prop.setProperty("mail.transport.protocol", "smtp");
                        prop.setProperty("mail.smtp.auth", "true");
                        //使用JavaMail发送邮件的5个步骤
                        //1、创建session
                        Session session = Session.getInstance(prop);
                        //开启Session的debug模式，这样就可以查看到程序发送Email的运行状态
                        session.setDebug(true);
                        //2、通过session得到transport对象
                        Transport ts = null;
                        try {
                            ts = session.getTransport();
                        } catch (Exception e) {
                            e.printStackTrace();
                        }
                        //3、使用邮箱的用户名和密码连上邮件服务器，发送邮件时，发件人需要提交邮箱的用户名和密码给smtp服务器，用户名和密码都通过验证之后才能够正常发送邮件给收件人。
                        try {
                            ts.connect("smtp.163.com", "xinzhouzyl@163.com", "123qwe123qwe");
                        } catch (Exception e) {
                            e.printStackTrace();
                        }
                        //4、创建邮件
                        Message message = null;
                        try {
                            message = createImageMail(session,list.get(i).getEmail());
                        } catch (Exception e) {
                            e.printStackTrace();
                        }
                        //5、发送邮件
                        try {

                            ts.sendMessage(message, message.getAllRecipients());

                        } catch (Exception e) {
                            e.printStackTrace();
                        }
                        try {

                        } catch (Exception e) {
                            e.printStackTrace();
                            System.out.println("发送失败!");
                        }

                    } else if (day <= 15 && day >= 3) {
                        //发送短信
                        HashMap<String, Object> params = new HashMap<>();
                        params.put("accountSid", "69c6b938017a4a6895a3dbe3ff26d7ce");
                        params.put("to", list.get(i).getPhone());
                        SimpleDateFormat time2 = new SimpleDateFormat("yyyy-MM-dd");
                        String time1 = time2.format(new Date());
                        params.put("timestamp", time1);
                        String sigStr = "69c6b938017a4a6895a3dbe3ff26d7ce" + "c98acca2940a460e8161e72927292a72" + time1;
                        params.put("sig", Md5Util.getMd532(sigStr));
                        params.put("templateid", "1120306180");
                        params.put("param", list.get(i).getLatedate());//短信内容参数
                        String respData = HttpClientUtil.post("https://api.miaodiyun.com/20150822/industrySMS/sendSMS", params);
                        System.out.println(111);
                        JSONObject parseObject = null;
                        try {
                            parseObject = (JSONObject) JSON.parse(respData);
                        } catch (ParseException e) {
                            e.printStackTrace();
                        }
                        String respCode = parseObject.getString("respCode");
                        System.out.println(respCode);
                        if (!"00000".equals(respCode)) {
                            System.out.println("验证码发送失败");
                        }
                    } else if (day <= 3 && day>0) {
                        Task task1=taskService.queryRWById(list.get(i).getId());
                        if(task1==null){
                            Task task = new Task();
                            task.setPhone(list.get(i).getPhone());
                            task.setEmail(list.get(i).getEmail());
                            task.setHtid(list.get(i).getId());
                            task.setContent("合同将要到期!");
                            int sid=loginService.random();
                            task.setSupportid(sid);
                            taskService.save(task);
                            System.out.println("小于3天");
                        }
                        System.out.println("已从在");
                    }else if(day<0){
                        if(list.get(i).getStatus()==1){
                            System.out.println("已失效");
                        }
                        taskService.updateHeTong(list.get(i).getId(),1);
                        System.out.println("以修改为失效");
                    }

                }
            }

        }, date.getTime(),daySpan); //daySpan是一天的毫秒数，也是执行间隔
    }

    public static MimeMessage createImageMail(Session session,String email) throws Exception {
        //创建邮件
        MimeMessage message = new MimeMessage(session);
        // 设置邮件的基本信息
        //发件人
        message.setFrom(new InternetAddress("xinzhouzyl@163.com"));
        //收件人
        message.setRecipient(Message.RecipientType.TO, new InternetAddress(email));
        //邮件标题
        message.setSubject("《房源基地》");

        // 准备邮件数据
        // 准备邮件正文数据
        MimeBodyPart text = new MimeBodyPart();
        text.setContent("你的租房合同将要在半个月内失效请你及时续租！", "text/html;charset=UTF-8");
        // 描述数据关系
        MimeMultipart mm = new MimeMultipart();
        mm.addBodyPart(text);
        mm.setSubType("related");
        message.setContent(mm);
        message.saveChanges();
        //将创建好的邮件写入到E盘以文件的形式进行保存
        message.writeTo(new FileOutputStream("D:\\em\\ImageMail.eml"));
        //返回创建好的邮件
        return message;
    }


}
