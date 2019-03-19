<%--
  Created by IntelliJ IDEA.
  User: Simpon
  Date: 2019/3/18
  Time: 19:09
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
    <!-- 引入kindeditor css js文件 -->
    <link rel="stylesheet" href="<%=request.getContextPath() %>/js/kindeditor-4.1.10/themes/default/default.css" />
    <script src="<%=request.getContextPath() %>/js/kindeditor-4.1.10/kindeditor-all.js"></script>
</head>
<body>
<table id="MyTable"></table>
<!-- 定义对话框 -->
<div id="userDialog" class="easyui-dialog" data-options="iconCls:'icon-save',closed:true,width:600,height:500,buttons:'#buttons'">
    <form method="post" id="userForm">
        <input style="display:none" name="id">
        <table>
            <tr>
                <td>用户名</td>
                <td>
                    <input class="easyui-textbox" name="username">
                </td>
            </tr>
            <tr>
                <td>密码</td>
                <td>
                    <input class="easyui-passwordbox" name="password">
                </td>
            </tr>
            <tr>
                <td>年龄</td>
                <td>
                    <input class="easyui-textbox" name="age">
                </td>
            </tr>
            <tr>
                <td>性别</td>
                <td>
                    <input type="radio" name="sex" value="1">男
                    <input type="radio" name="sex" value="2">女
                </td>
            </tr>
            <tr>
                <td>手机号</td>
                <td>
                    <input class="easyui-textbox" name="phone">
                </td>
            </tr>
            <tr>
                <td>出生日期</td>
                <td>
                    <input class="easyui-datebox" name="birthday">
                </td>
            </tr>
            <tr>
                <td>角色名称</td>
                <td>
                    <input class="easyui-combobox" name="roleid" id="roleId">
                </td>
            </tr>
        </table>
    </form>
</div>
<!-- 对话框按钮 -->
<div id="buttons">
    <a href="javascript:saveUser()" class="easyui-linkbutton" data-options="iconCls:'icon-ok'">保存</a>
    <a href="javascript:closeDialog()" class="easyui-linkbutton" data-options="iconCls:'icon-cancel'">关闭</a>
</div>
</body>
<script>

    $(function(){
        initUserTable();
    })

    function searchUser(){
        $("#MyTable").datagrid("load");
    }

    //初始角色
    function initRole(){
        $("#roleId").combobox({
            url:"<%=request.getContextPath() %>/queryRole",
            valueField:"id",
            textField:"name",
            multiple:true
        })
    }

   function initUserTable() {
       //查询
       $("#MyTable").datagrid({
           url:"<%=request.getContextPath()%>/queryUser",
           columns:[[
               {field:'check',checkbox:true},
               {field:'id',title:'编号',width:100,align:'center'},
               {field:'username',title:'用户名',width:100,align:'center'},
               {field:'password',title:'密码',width:100,align:'center'},
               {field:'age',title:'年龄',width:100,align:'center'},
               {field:'sex',title:'性别',width:100,align:'center',formatter:function(value,row,index){
                       if(value==1){
                           return "男"
                       }
                       if(value==2){
                           return "女"
                       }
                   }},
               {field:'phone',title:'手机号码',width:100,align:'center'},
               {field:'birthday',title:'出生日期',width:100,align:'center'},
               {field:'name',title:'角色名称',width:100,align:'center'},
               {field:"tools",title:"操作",formatter:function(value,row,index){
                       return "<a href='javascript:openUpdate("+row.id+")'>修改</a>";
                   }}
           ]],
           pagination:true,//开启分页
           pageList:[1,2,3,4,5,6], //初始化页面大小选择列表
           pageSize:3 , //初始化每页显示条数，默认是10
           pageNumber:1, //当前页,默认是1
           fit:true,
           toolbar:"#searchDivk",
           pagePosition:"top"
       })
   }

    //打开修改弹框
    function openUpdate(id){
        $.ajax({
            url:"<%=request.getContextPath() %>/queryUserById",
            type:"post",
            data:{"id":id},
            success:function(data){
                initRole();
                //回显数据
                $("#userForm").form("load",data);
                $("#userDialog").dialog({
                    title:"修改用户",
                    closed:false
                })
            }
        })
    }
    //关闭弹框
    function closeDialog(){
        $("#userDialog").dialog("close");
    }
    //保存用户数据
    function saveUser(){
        $("#userForm").form("submit",{
            url:"<%=request.getContextPath() %>/saveUser",
            success:function(){
                $.messager.alert("提示","保存成功","info");
                closeDialog();
                searchUser();
            }
        })
    }
</script>
</html>
