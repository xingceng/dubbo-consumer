/**
 * @ClassName: BroService
 * @Description:
 * @Author: 杨明瑞
 * @Date: 2019/3/18 15:25
 * @Version: 1.0
 */
package com.jk.service;

import com.jk.model.Broker;
import com.jk.model.Circuit;
import org.springframework.web.multipart.MultipartFile;

import java.util.HashMap;
import java.util.List;

public interface BroService {
    
    /**
     * @Author 杨明瑞
     * @Description //TODO 查询经纪人列表
     * @Date 15:33 2019/3/18
     * @Param [page, rows]
     * @return java.util.HashMap<java.lang.String,java.lang.Object>
     **/
    HashMap<String, Object> queryBroker(int page, int rows,Broker bro);
    
    /**
     * @Author 杨明瑞
     * @Description //TODO 新增经纪人信息
     * @Date 13:46 2019/3/19
     * @Param []
     * @return void
     **/
    void saveBro(Broker broker);

    /**
     * @Author 杨明瑞
     * @Description //TODO 查询地区
     * @Date 14:17 2019/3/19
     * @Param []
     * @return java.util.List<com.jk.model.Circuit>
     **/
    List<Circuit> queryCirByPid(int pid);

    /**
     * @Author 杨明瑞
     * @Description //TODO 上传图片
     * @Date 11:32 2019/3/20
     * @Param [file, id]
     * @return java.lang.String
     **/
    String updateHead(MultipartFile file, Integer id);
}
