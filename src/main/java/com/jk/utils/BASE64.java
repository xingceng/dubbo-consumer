package com.jk.utils;


import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import sun.misc.BASE64Encoder;

import java.io.*;
import java.net.HttpURLConnection;
import java.net.URL;

public class BASE64 {

    /**
     * 将本地图片进行Base64位编码
     *
     * @param
     * @return
     */
    public static String encodeImgageToBase64(File imageFile) {
    // 将图片文件转化为字节数组字符串，并对其进行Base64编码处理
        // 其进行Base64编码处理
        byte[] data = null;
        // 读取图片字节数组
        try {
            InputStream in = new FileInputStream(imageFile);
            data = new byte[in.available()];
            in.read(data);
            in.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        // 对字节数组Base64编码
        BASE64Encoder encoder = new BASE64Encoder();
        return encoder.encode(data);// 返回Base64编码过的字节数组字符串
    }

    public static String UpFileImg(String cardimg){
        //获取本地的绝对路径图片
        File file = new File("C:\\Users\\13993\\Desktop\\身份证照\\"+cardimg);
        //进行BASE64位编码
        String imageBase = BASE64.encodeImgageToBase64(file);
        imageBase = imageBase.replaceAll("\r\n", "");
        imageBase = imageBase.replaceAll("\\+", "%2B");
        //百度云的文字识别接口,后面参数为获取到的token
        String httpUrl="https://aip.baidubce.com/rest/2.0/ocr/v1/idcard?access_token=24.50e141fb317094f8f3b17257b4b78a42.2592000.1555664664.282335-15806388";
        String httpArg = "detect_direction=true&id_card_side=front&image="+imageBase;
        String jsonResult = request(httpUrl, httpArg);
        System.out.println("返回的结果--------->" + jsonResult);

        JSONObject repdate = JSON.parseObject(jsonResult);
        JSONObject words_result = repdate.getJSONObject("words_result");
        JSONObject haoma = words_result.getJSONObject("公民身份号码");
        String card = haoma.getString("words");
        return card;
    }
    public static void  main(String[] args) {
        //获取本地的绝对路径图片
        File file = new File("C:\\Users\\13993\\Desktop\\身份证照\\4bd1e803738da9778ff5995eb951f8198718e3aa.jpg");
        //进行BASE64位编码
        String imageBase = BASE64.encodeImgageToBase64(file);
        imageBase = imageBase.replaceAll("\r\n", "");
        imageBase = imageBase.replaceAll("\\+", "%2B");
        //百度云的文字识别接口,后面参数为获取到的token
        String httpUrl="https://aip.baidubce.com/rest/2.0/ocr/v1/idcard?access_token=24.50e141fb317094f8f3b17257b4b78a42.2592000.1555664664.282335-15806388";
        String httpArg = "detect_direction=true&id_card_side=front&image="+imageBase;
        String jsonResult = request(httpUrl, httpArg);
        System.out.println("返回的结果--------->" + jsonResult);
        JSONObject repdate = JSON.parseObject(jsonResult);
        JSONObject words_result = repdate.getJSONObject("words_result");
        JSONObject haoma = words_result.getJSONObject("公民身份号码");
        String s = haoma.getString("words");
        System.out.println(s+"----====");
    }

    public static String request(String httpUrl, String httpArg) {
        BufferedReader reader = null;
        String result = null;
        StringBuffer sbf = new StringBuffer();
        try {
        //用java JDK自带的URL去请求
            URL url = new URL(httpUrl);
            HttpURLConnection connection = (HttpURLConnection) url
                    .openConnection();
        //设置该请求的消息头
        //设置HTTP方法：POST
            connection.setRequestMethod("POST");
        //设置其Header的Content-Type参数为application/x-www-form-urlencoded
            connection.setRequestProperty("Content-Type",
                    "application/x-www-form-urlencoded");
        // 填入apikey到HTTP header
            connection.setRequestProperty("apikey","RnNQSrVB7GUwO2e0mvF6ORis");
        //将第二步获取到的token填入到HTTP header
            connection.setRequestProperty("access_token","access_token=24.50e141fb317094f8f3b17257b4b78a42.2592000.1555664664.282335-15806388");
            connection.setDoOutput(true);
            connection.getOutputStream().write(httpArg.getBytes("UTF-8"));
            connection.connect();
            InputStream is = connection.getInputStream();
            reader = new BufferedReader(new InputStreamReader(is, "UTF-8"));
            String strRead = null;
            while ((strRead = reader.readLine()) != null) {
                sbf.append(strRead);
                sbf.append("\r\n");
            }
            reader.close();
            result = sbf.toString();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return result;

    }


}
