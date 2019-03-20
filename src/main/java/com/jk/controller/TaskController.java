package com.jk.controller;

import com.jk.model.Task;
import com.jk.model.TaskBack;
import com.jk.model.User;
import com.jk.service.TaskService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.HashMap;

@Controller
public class TaskController {

    @Autowired
    private TaskService taskService;

    //新增反馈结果
    @RequestMapping("addTaskBask")
    @ResponseBody
    public void addTaskBask(TaskBack taskBack){
        taskService.addTaskBask(taskBack);
    }
    //查询任务
    @RequestMapping("queryTask")
    @ResponseBody
    public HashMap<String,Object> queryTask(Integer page, Integer rows, Task task){
        return taskService.queryTask(page,rows,task);
    }
    //查询我的任务
    @RequestMapping("queryMyTask")
    @ResponseBody
    public HashMap<String,Object> queryMyTask(Integer page, Integer rows, Task task, HttpSession session){
        User user = (User) session.getAttribute("user");
        Integer userid=user.getId();
        return taskService.queryMyTask(page,rows,userid,task);
    }
    //查询任务反馈表
    @RequestMapping("queryTaskBack")
    @ResponseBody
    public HashMap<String,Object> queryTaskBack(Integer page, Integer rows,TaskBack taskBack){
        return taskService.queryTaskBack(page,rows,taskBack);
    }

    //删除任务反馈结果
    public void delTaskBack(Integer id){
        taskService.delTaskBack(id);
    }
}
