<%--
  Created by IntelliJ IDEA.
  User: 18730
  Date: 2019/3/18
  Time: 17:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
</head>
<body>

    <!-- 工具栏 -->
    <div id="toolbar">
        市：<input class="easyui-combobox" name="province" id="province1">
        区：<input class="easyui-combobox" name="city" id="city1">
        <a href="javascript:searchUser()" class="easyui-linkbutton" data-options="iconCls:'icon-search',plain:true">搜索</a>
        <br>
        <a href="javascript:openDialog()" class="easyui-linkbutton" data-options="iconCls:'icon-add',plain:true">新增</a>
    </div>

    <div id="myDialog" class="easyui-dialog" data-options="iconCls:'icon-save',closed:true,width:600,height:500,buttons:'#buttons'">
        <form method="post" id="myFrom" enctype="multipart/form-data">
            <input style="display:none" name="id">
            <table>
                <tr>
                    <td>头像</td>
                    <td>
                        <textarea name="broCover" class="form-control"></textarea>
                        <img id="testimg" width="50"> <!-- 上传完显示的图片  -->
                        <div id="fileQueue"></div><!--文件上传的进度条  -->
                        <input id="uploadify" name="headimg" type="file" >
                    </td>
                </tr>
                <tr>
                    <td>姓名</td>
                    <td>
                        <input class="easyui-textbox" name="broName">
                    </td>
                </tr>
                <tr>
                    <td>手机号</td>
                    <td>
                        <input class="easyui-textbox" name="iphone">
                    </td>
                </tr>
                <tr>
                    <td>服务区域</td>
                    <td>
                        市：<input class="easyui-combobox" name="province" id="province">
                        区：<input class="easyui-combobox" name="city" id="city">
                    </td>
                </tr>
            </table>
        </form>
    </div>
    <!-- 对话框按钮 -->
    <div id="buttons">
        <a href="javascript:saveBro()" class="easyui-linkbutton" data-options="iconCls:'icon-ok'">保存</a>
        <a href="javascript:closeDialog()" class="easyui-linkbutton" data-options="iconCls:'icon-cancel'">关闭</a>
    </div>

    <!--定义表格 -->
    <table id="broTab"></table>

    <script type="text/javascript">

        //初始化
        $(function(){
            initBroTable();
            preFile();
            initPro1();
            searchUser();
        })

        //条查
        function searchUser(){
            $("#broTab").datagrid("load",{
                province:$("#province1").combobox("getValue"),
                city:$("#city1").combobox("getValue")
            });
        }

        //初始省
        function initPro1(){
            $("#province1").combobox({
                url:"<%=request.getContextPath() %>/queryCir?pid=0",
                valueField:"circuitid",
                textField:"circuitname",
                onChange:function(newValue,oldValue){
                    $("#city1").combobox({
                        url:"<%=request.getContextPath() %>/queryCir?pid="+newValue,
                        valueField:"circuitid",
                        textField:"circuitname"
                    })
                }
            })
        }

        //初始省
        function initPro(){
            $("#province").combobox({
                url:"<%=request.getContextPath() %>/queryCir?pid=0",
                valueField:"circuitid",
                textField:"circuitname",
                onChange:function(newValue,oldValue){
                    $("#city").combobox({
                        url:"<%=request.getContextPath() %>/queryCir?pid="+newValue,
                        valueField:"circuitid",
                        textField:"circuitname"
                    })
                }
            })
        }

        //查询
        function initBroTable() {
            $("#broTab").datagrid({
                url: "<%=request.getContextPath()%>/queryBro",
                pagination: true,//开启分页
                pageList: [1, 2, 3, 4, 5, 6], //初始化页面大小选择列表
                pageSize: 3, //初始化每页显示条数，默认是10
                pageNumber: 1, //当前页,默认是1
                fit: true,
                toolbar: "#toolbar",
                pagePosition: "top",
                columns: [[
                    {field: 'check', checkbox: true},
                    {field: 'id', title: 'ID', width: 100, align: 'center'},
                    {field: 'broCover', title: '头像', width: 100, align: 'center',formatter:function(value,row,index){
                            return "<img width='50px' height='50px' src='"+value+"'>";
                        }},
                    {field: 'broName', title: '姓名', width: 100, align: 'center'},
                    {field: 'iphone', title: '手机号', width: 100, align: 'center'},
                    {field: 'workYear', title: '工作年限', width: 100, align: 'center'},
                    {field: 'coverage', title: '服务区域', width: 100, align: 'center'},
                    {field: 'zuping', title: '租凭次数', width: 100, align: 'center'},
                    {field: 'daikan', title: '带看次数', width: 100, align: 'center'},
                    {field: 'follCount', title: '关注人数', width: 100, align: 'center'},
                ]]
            })
        }
        //保存用户数据
        function saveBro(){
            $("#myFrom").form("submit",{
                url:"<%=request.getContextPath() %>/saveBro",
                success:function(){
                    $.messager.alert("提示","保存成功","info");
                    closeDialog();
                    initBroTable();
                }
            })
        }

        //关闭弹框
        function closeDialog(){
            $("#myDialog").dialog("close");
        }

        //打开弹框
        function openDialog(){
            $("#myFrom").form("reset");
            $("#city").combobox("loadData",[]);
            $("#testimg").prop("src","");
            initPro();
            $("#myDialog").dialog({
                title:"新增用户",
                closed:false
            })
        }

        //图片
        //杂七杂八start
        function preFile(){
//上传插件
            $("#uploadify").uploadify({
                //插件自带  不可忽略的参数
                'swf': '<%=request.getContextPath() %>/js/uploadify/uploadify.swf',
                //前台请求后台的url 不可忽略的参数                          //*****要修改路经 !!!!!!!!!!!!!!!!!!!!!!!!
                'uploader':'<%=request.getContextPath() %>/addFiletwo',
                //给div的进度条加背景 不可忽略
                'queueID': 'fileQueue',
                //上传文件文件名 !!!!!!!!!!!!!!!!!!与后台接口参数名字需要完全一致!!!!!!!!!!!!!!!!!!!!!!!!
                'fileObjName':'headimg',
                //给上传按钮设置文字
                'buttonText': '上传图片',
                //设置文件是否自动上传
                'auto':true,
                //可以同时选择多个文件 默认为true  不可忽略
                'multi':false,
                //上传后队列是否消失
                'removeCompleted':true,
                //队列消失时间
                'removeTimeout' : 1,
                //上传文件的个数，项目中一共可以上传文件的个数
                'uploadLimit':  -1,
                'onFallback':function(){alert("浏览器不支持,请更换其他浏览器,或打开Flash插件");},
                //上传失败
                'onUploadError':function(){
                    alert("上传失败");
                },
                //成功回调函数 file：文件对象。data后台输出数据
                'onUploadSuccess':function(file,data,response){
                    var imgurl = data
                    //给img框赋值进行展示
                    $("#testimg").attr("src",imgurl);
                    //给隐藏的文本框赋值 传到后台
                    $("[name='broCover']").html(data); //改!!!!!!!!!!11111
                }
            });
        }
        //杂七杂八end
    </script>
</body>
</html>
