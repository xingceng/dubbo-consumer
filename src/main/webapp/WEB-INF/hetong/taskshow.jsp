<%--
  Created by IntelliJ IDEA.
  User: zhao先生
  Date: 2019/3/19
  Time: 9:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>任务列表</title>
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
</head>
<body>
<div id="toolbar">
    联系手机:<input class="easyui-textbox" id="phone">
    <a href="javascript:searchUser()" class="easyui-linkbutton" data-options="iconCls:'icon-search',plain:true">搜索</a>
</div>
<table id="myTable"></table>
</body>
<script>
    $(function(){
        queryTask();
    })
    //条查
    function searchUser(){
        $("#myTable").datagrid("load",{
            phone:$("#phone").textbox("getValue"),
        });
    }
    //查询表格
    function queryTask(){
        $("#myTable").datagrid({
            url:"queryTask",
            title:"任务列表",
            fit:true,
            pagination:true,
            toolbar:"#toolbar",
            columns:[[
                {field:"check",checkbox:true},
                {field:"id",title:"id"},
                {field:"phone",title:"手机号"},
                {field:"email",title:"邮箱"},
                {field:"content",title:"内容"},
                {field:"hname",title:"房屋名称"},
                {field:"supportid",title:"客服id"},
                {field:'tools',title:'操作',formatter:function(value,row,index){
                        return   "<a href='javascript:delTaskBack("+row.id+")'>删除</a>";
                    }}
            ]]
        })
    }
    function delTaskBack(id){
        $.ajax({
            url:'/delTaskBack',
            data:{id:id},
            type:'post',
            success:function(){
                $.messager.alert("提示","删除成功","info");
                searchUser();
            },error:function(){
                $.messager.alert("提示","删除失败","info");
            }
        })
    }
</script>
</html>
