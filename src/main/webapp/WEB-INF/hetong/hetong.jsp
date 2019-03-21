<%--
  Created by IntelliJ IDEA.
  User: zhao先生
  Date: 2019/3/18
  Time: 16:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>合同管理</title>
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
        邮箱:<input class="easyui-textbox" id="email">
        <a href="javascript:searchUser()" class="easyui-linkbutton" data-options="iconCls:'icon-search',plain:true">搜索</a>
    </div>
    <table id="myTable"></table>
</body>
    <script>
        $(function(){
            queryHeTong();
        })
        //条查
        function searchUser(){
            $("#myTable").datagrid("load",{
                email:$("#email").textbox("getValue")
            });
        }
        //查询表格
        function queryHeTong(){
            $("#myTable").datagrid({
                url:"queryHeTong",
                title:"合同列表",
                fit:true,
                pagination:true,
                toolbar:"#toolbar",
                columns:[[
                    {field:"check",checkbox:true},
                    {field:"id",title:"id"},
                    {field:"phone",title:"手机号"},
                    {field:"email",title:"邮箱"},
                    {field:"card",title:"身份证"},
                    {field:"cardimg",title:"身份证图",formatter:function(value,row,index){
                            return "<img src='"+value+"' width='50px' height='60'/>";
                        }},
                    {field:"latedate",title:"到期时间"},
                    {field:"comment",title:"备注"},
                    {field:"status",title:"状态",formatter:function(value,row,index){
                        if(value==0){
                            return "生效";
                        }else if(value==2){
                            return "续约";
                        }else if(value==1){
                            return "失效";
                        }}},
                    {field:"brokername",title:"经纪人"},
                    {field:"price",title:"价格"},
                    {field:"hname",title:"房屋名称"},
                    {field:"deadline",title:"期限",formatter:function(value,row,index){
                        return value+"年";
                        }},
                    {field:'tools',title:'操作',formatter:function(value,row,index){
                        return   "<a href='javascript:delheTong("+row.id+")'>删除</a>";
                        }}
                ]]
            })
        }
        function delheTong(id){
            $.ajax({
                url:'/delheTong',
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
