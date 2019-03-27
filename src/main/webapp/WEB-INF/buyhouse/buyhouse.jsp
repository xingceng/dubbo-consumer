<%--
  Created by IntelliJ IDEA.
  User: zhangcong
  Date: 2019/3/18
  Time: 15:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
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
<!-- 条件查询 -->
<div id="searchDiv">
    标题：<input class="easyui-textbox" id="title">

    <a href="javascript:searchUSer()" class="easyui-linkbutton" data-options="iconCls:'icon-search'">搜索</a>
    <br>
    <a href="javascript:openDig()" class="easyui-linkbutton" data-options="iconCls:'icon-add',plain:true">新增</a>
</div>
<!-- 定义表格 -->
<table id="myTable">
</table>
<!-- 定义弹框、对话框 -->
<div id="myDialog" class="easyui-dialog" style="width:800px;height:500px" data-options="modal:true,collapsible:true,minimizable:true,maximizable:true,resizable:true,buttons:'#myButton',closed:true,iconCls:'icon-save'">
    <form id="myForm" method="post">
        <input style="display:none" name="id">
        <table>
            <tr>
                <td>标题</td>
                <td>
                    <input class="easyui-textbox" name="title">
                </td>
            </tr>
            <tr>
                <td>简介</td>
                <td>
                    <textarea name="content">

                    </textarea>
                </td>
            </tr>
            <tr>
                <td>知识类型</td>
                <td>
                    <input id="kid" class="easyui-combobox" data-options="url:'<%=request.getContextPath() %>/queryKnowByPid?pid=0',valueField:'id',textField:'name'">
                    <input id="kids" name="kid">
                </td>
            </tr>
            <tr>
                <td>封面</td>
                <td><input name="cover" id="hideImg" type="hidden">
                    <input id="uploadify" type="file">
                    <div id="fileQueue"></div>
                    <img id="testimg" width="66">
                </td>
            </tr>
        </table>
    </form>
</div>
<!-- 定义按钮 -->
<div id="myButton">
    <a href="javascript:addUser()" class="easyui-linkbutton" data-options="iconCls:'icon-ok'">保存</a>
    <a href="javascript:closeDig()" class="easyui-linkbutton"  data-options="iconCls:'icon-cancel'">关闭</a>
</div>
</body>
<script>
    $(function(){
        preFile();
    })

    $("#kid").combobox({
        onChange:function(newValue,oldValue){
            $("#kids").combobox({
                url:"<%=request.getContextPath() %>/queryKnowByPid?pid="+newValue,
                valueField:"id",
                textField:"name"
            })
        }
    })

    //修改回显
    function openUser(id){
        $.ajax({
            url:"queryBuyHouseById",
            type:"post",
            data:{id:id},
            success:function(data){
                //数据回显
                $("#myForm").form("load",data);//重新加载表单
                //打开对话框
                $("#myDialog").dialog({
                    title:'修改用户',
                    closed:false
                })
            }
        })
    }

    //关闭按钮
    function closeDig(){
        $("#myDialog").dialog('close');
    }
    //新增知识
    function addUser(){
        $("#myForm").form("submit",{
            url:"addBuyHouse",
            success:function(){
                $.messager.alert("提示","保存成功！","info");
                //关闭弹框
                $("#myDialog").dialog('close');
                //刷新页面
                searchUSer();
            }
        })
    }
    //打开新增对话框
    function openDig(){
        //重置表单
        $("#myForm").form("reset");

        $("#myDialog").dialog({
            title:'新增用户',
            closed:false   //true 关闭 false 打开
        })
    }
    //条件查询
    function searchUSer(){
        $("#myTable").datagrid("load",{
            title:$("#title").textbox("getValue"),
        })
    }
    $("#myTable").datagrid({
        url:"queryBuyHouse",
        columns:
            [[{field:'check',checkbox:true},
                {field:'id',title:'编号'},
                {field:'title',title:'标题'},
                {field:'content',title:'简介'},
                {field:'kid',title:'知识类型'},
                {field:'cover',title:'封面'},
                {field:'dateout',title:'发布时间'},
                {field:'click',title:'点赞数'},
                {field:'tools',title:'操作',width:100,align:'center',formatter:function(value,row,index){
                        var str = "<a href='javascript:deleteUser("+row.id+")'>删除</a>";
                        str+=" | <a href='javascript:openUser("+row.id+")'>修改</a>";
                        return str;
                    }}
            ]],
        pagination:true,//开启分页
        pageList:[4,5,6], //初始化页面大小选择列表
        pageSize:4 , //初始化每页显示条数，默认是10
        pageNumber:1, //当前页,默认是1
        fit:true,
        //pagePosition:"both",
        loadMsg:"正在努力加载中。。。", //请求后台的提示信息
        toolbar: "#searchDiv"     //添加工具栏 ： div的id

    })

    //单个删除
    function deleteUser(id){
        //alert(id);
        $.messager.confirm("提示","是否确认删除！",function(r){
            if(r){
                $.ajax({
                    url:"deleteBuyHouse",
                    type:"post",
                    data:{"ids":id},
                    success:function(){
                        //alert("删除成功");
                        $.messager.alert("提示消息","删除成功！","info");
                        //刷新页面
                        searchUSer();
                    },error:function(){
                        //alert("删除失败");
                        $.messager.alert("提示消息","删除失败！","error");
                    }
                })
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
