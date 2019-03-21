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
    <title>我的任务列表</title>
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
<div id="myDialog" class="easyui-dialog" style="width:500px;height:400px" data-options="modal:true,maximizable:true,resizable:true,buttons:'#myButton',closed:true,iconCls:'icon-save'">
    <form id="myForm" method="post">
        <input style="display:none" name="taskid" id="taskid">
        <input style="display:none" name="supportid" id="supportid">
        <table>
            <tr>
                <td>是否续租:<input type="radio" value="1" name="select" onclick="ifpanduan()">是<input type="radio" value="0" name="select" onclick="ifpanduan()">否</td>
                <td>
                    <span id="qixian"></span>
                </td>
            </tr>
            <tr>
                <td>反馈结果</td>
                <td>
                    <textarea name="feedback"></textarea>
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
    function ifpanduan(){
        var sex = $("input[name=select]:checked").val();
        if(sex==1){
            var op="续租时常<select name='deadline'>"+
                    "<option value='1'>1</option>"+
                    "<option value='2'>2</option>"+
                    "<option value='2'>3</option>"+
                    "</select>"
            $("#qixian").html(op);
        }
    }
    //关闭对话框
    function closeDig(){
        $("#myDialog").dialog("close")
    }

    //新增
    function add(){
        $("#myForm").form("submit",{
            url:"<%=request.getContextPath() %>/addTaskBask",
            success:function(){
                $.messager.alert("提示","保存成功","info")
                //关闭弹框
                $("#myDialog").dialog("close")
                //关闭
                closeDig();
                //刷新
                $("#myTable").datagrid("load");

            }

        })

    }
    $(function(){
        queryMyTask();
    })
    //条查
    function searchUser(){
        $("#myTable").datagrid("load",{
            phone:$("#phone").textbox("getValue"),
        });
    }
    //查询表格
    function queryMyTask(){
        $("#myTable").datagrid({
            url:"queryMyTask",
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
                {field:'tools',title:'操作',width:100,align:'center',formatter:function(value,row,index){

                        var str="<a href='javascript:openDialog("+row.id+","+row.supportid+")'>处理</a>"

                        return str;

                    }}
            ]]
        })
    }
    //处理
    function openDialog(taskid,supportid){
        //重置表单
        $("#myForm").form("reset");
        $("#taskid").val(taskid)
        $("#supportid").val(supportid)
        //打开
        $("#myDialog").dialog({
            title:'用户反馈',
            closed:false
        })
    }
</script>
</html>
