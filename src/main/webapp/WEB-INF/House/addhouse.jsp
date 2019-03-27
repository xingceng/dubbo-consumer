<%--
  Created by IntelliJ IDEA.
  User: 张怀宇
  Date: 2019/3/18
  Time: 15:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
    <!-- 引入easyui样式文件 -->
    <link type="text/css" rel="stylesheet" href="<%=request.getContextPath() %>/jquery-easyui-1.5/themes/default/easyui.css">
    <!-- 引入easyui图标样式文件 -->
    <link type="text/css" rel="stylesheet" href="<%=request.getContextPath() %>/jquery-easyui-1.5/themes/icon.css">
    <!-- 引入jquery js文件 -->
    <script type="text/javascript" src="<%=request.getContextPath() %>/jquery-easyui-1.5/jquery.min.js"></script>
    <!-- 引入easyui的js文件 -->
    <script type="text/javascript" src="<%=request.getContextPath() %>/jquery-easyui-1.5/jquery.easyui.min.js"></script>
    <!-- 引文easyui支持中文js -->
    <script type="text/javascript" src="<%=request.getContextPath() %>/jquery-easyui-1.5/locale/easyui-lang-zh_CN.js"></script>
    <!-- 引入uploadify css js文件 -->
    <link rel="stylesheet" href="<%=request.getContextPath() %>/js/uploadify/uploadify.css">
    <script type="text/javascript" src="<%=request.getContextPath() %>/js/uploadify/jquery.uploadify.min.js"></script>
    <!-- 引入kindeditor css js文件 -->
    <link rel="stylesheet" href="<%=request.getContextPath() %>/js/kindeditor-4.1.10/themes/default/default.css" />
    <script src="<%=request.getContextPath() %>/js/kindeditor-4.1.10/kindeditor-all.js"></script>
</head>
<body>
<!-- 定义新增表格 -->
<div id="searchDivk">

    <a href="javascript:openDig()" class="easyui-linkbutton" data-options="iconCls:'icon-add',plain:true">新增</a>

</div>
<div id="myDialog" class="easyui-dialog" style="width:700px;height:400px" data-options="modal:true,maximizable:true,resizable:true,buttons:'#myButton',closed:true,iconCls:'icon-save'">
    <form id="myForm" method="post">
        <table>
            <tr>
                <td>房名</td>
                <td>
                    <input class="easyui-textbox" name="housename">
                </td>
            </tr>
            <tr>
                <td>房子图片</td>
                <td>
                <input name="houseimg" id="hideImg" type="hidden">
                <input id="uploadify" type="file">
                <div id="fileQueue"></div>
                <img id="testimg" width="66">
                </td>
            </tr>


            <tr>
                <td>房子详情</td>
                <td>

                    <textarea name="housexiangqing"></textarea>
                </td>
            </tr>
            <tr>
                <td>地址</td>
                <td>
                    市：<input class="easyui-combobox" name="housecircuitid" id="province">
                    区：<input class="easyui-combobox" name="cityid" id="city">
                </td>
            </tr>

            <tr>
                <td>房类型</td>
                <td>
                    <input type="radio" value="1" name="housetype">二手房
                    <input type="radio" value="2" name="housetype">租房
                    <input type="radio" value="3" name="housetype">公寓
                    <input type="radio" value="4" name="housetype">新房
                    <input type="radio" value="5" name="housetype">海外
                </td>
            <tr>
                <td>价格</td>
                <td>
                    <select name="housepriceid">
                        <option value="0" selected>请选择
                            <c:forEach items="${aa}" var="c">
                        <option value="${c.priceid}"  >${c.pricename}</option>
                        </c:forEach>
                    </select>
                </td>
            </tr>
            <tr>
                <td>面积</td>
                <td>
                    <select name="houseacreageid">
                        <option value="0" selected>请选择
                            <c:forEach items="${bb}" var="c">
                        <option value="${c.acreageid}"  >${c.acreagename}</option>
                        </c:forEach>
                    </select>
                </td>
            </tr>
            <tr>
                <td>户型</td>
                <td>
                    <select name="houseunitid">
                        <option value="0" selected>请选择
                            <c:forEach items="${cc}" var="c">
                        <option value="${c.unitid}"  >${c.unitname}</option>
                        </c:forEach>
                    </select>
                </td>
            </tr>
            <tr>
                <td>用途</td>
                <td>
                    <select name="houseyongtuid">
                        <option value="0" selected>请选择
                            <c:forEach items="${oo}" var="c">
                        <option value="${c.yongtuid}"  >${c.yongtuname}</option>
                        </c:forEach>
                    </select>
                </td>
            </tr>

            <tr>
                <td>楼层</td>
                <td>
                    <select name="houseloucengid">
                        <option value="0" selected>请选择
                            <c:forEach items="${ee}" var="c">
                        <option value="${c.locengid}"  >${c.loucengname}</option>
                        </c:forEach>
                    </select>
                </td>
            </tr>

            <tr>
                <td>朝向</td>
                <td>
                    <select name="housemianxiang">
                        <option value="0" selected>请选择
                            <c:forEach items="${ff}" var="c">
                        <option value="${c.mianxiangid}"  >${c.mianxiangname}</option>
                        </c:forEach>
                    </select>
                </td>
            </tr>


            <tr>
                <td>楼龄</td>
                <td>
                    <select name="houseloulingid">
                        <option value="0" selected>请选择
                            <c:forEach items="${hh}" var="c">
                        <option value="${c.loulingid}"  >${c.loulingname}</option>
                        </c:forEach>
                    </select>
                </td>
            </tr>


            <tr>
                <td>装修</td>
                <td>
                    <select name="housezhuangxiuid">
                        <option value="0" selected>请选择
                            <c:forEach items="${ii}" var="c">
                        <option value="${c.zhuangxiuid}"  >${c.zhuangxiuname}</option>
                        </c:forEach>
                    </select>
                </td>
            </tr>
        </table>
    </form>
</div>
<!-- 定义按钮 -->
<div id="myButton">
    <a href="javascript:add()" class="easyui-linkbutton" data-options="iconCls:'icon-ok'">保存</a>
    <a href="javascript:closeDig()" class="easyui-linkbutton" data-options="iconCls:'icon-cancel'">关闭</a>
</div>



</body>
<script>

    $(function(){
        preFile();

    })
    //初始省
    function initPro(){
        $("#province").combobox({
            url:"<%=request.getContextPath() %>/queryAreaByPid?pid=0",
            valueField:"circuitid",
            textField:"circuitname",
            onChange:function(newValue,oldValue){
                $("#city").combobox({
                    url:"<%=request.getContextPath() %>/queryAreaByPid?pid="+newValue,
                    valueField:"circuitid",
                    textField:"circuitname"
                })
            }
        })
    }





    //打开对话框
    function openDig() {
        //重置表单
        $("#myForm").form("reset");
        initPro();

        //打开
        $("#myDialog").dialog({
            title:'新增用户',
            closed:false

        })

    }
    //关闭对话框
    function closeDig(){
        $("#myDialog").dialog("close")

    }


    function add() {
        var form = new FormData($("#myForm")[0]);
        $.ajax({
            url: "<%=request.getContextPath() %>/addHouse",
            type: "post",
            data: form,
            processData: false,
            contentType: false,
            success: function () {
                $.messager.alert("提示", "保存成功", "info")
                //关闭弹框
                $("#myDialog").dialog("close")
                //关闭
                closeDig()
                //刷新
                $("#MyTable").datagrid("load")
            },
            error: function () {


            }

        })
    }



    //图片控件
    function preFile() {
    //上传插件
        $("#uploadify").uploadify({
            //插件自带  不可忽略的参数
            'swf': '<%=request.getContextPath() %>/js/uploadify/uploadify.swf',
            //前台请求后台的url 不可忽略的参数                //*****要修改路经 !!!!!!!!!
            'uploader': '<%=request.getContextPath() %>/upload',
            //给div的进度条加背景 不可忽略
            'queueID': 'fileQueue',
            //上传文件文件名 !!!!!!!与后台接口参数名字需要完全一致!!!!!!!!
            'fileObjName': 'file',
            //给上传按钮设置文字
            'buttonText': '上传图片',
            //设置文件是否自动上传
            'auto': true,
            //可以同时选择多个文件 默认为true  不可忽略
            'multi': false,
            //上传后队列是否消失
            'removeCompleted': true,
            //队列消失时间
            'removeTimeout': 1,
            //上传文件的个数，项目中一共可以上传文件的个数
            'uploadLimit': -1,
            'onFallback': function () {
                alert("浏览器不支持,请更换其他浏览器,或打开Flash插件");
            },
            //上传失败
            'onUploadError': function () {
                alert("上传失败");
            },
            //成功回调函数 file：文件对象。data后台输出数据
            'onUploadSuccess': function (file, data, response) {
                console.log(data);
                //给img框赋值进行展示
                $("#testimg").attr("src", data);
                //给隐藏的文本框赋值 传到后台
                $('#hideImg').val(data);
            }
        })
    }

</script>
</html>
