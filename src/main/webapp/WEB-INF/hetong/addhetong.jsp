<%--
  Created by IntelliJ IDEA.
  User: zhao先生
  Date: 2019/3/20
  Time: 18:32
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
</head>
<body>

<!-- 定义弹框、对话框 -->
<div id="myDialog" class="easyui-dialog" style="width:800px;height:500px" data-options="modal:true,collapsible:true,minimizable:true,maximizable:true,resizable:true,buttons:'#myButton',closed:true,iconCls:'icon-save'">
    <form id="myForm" method="post">
        <table>
            <tr>
                <td>手机号</td>
                <td>
                    <input class="easyui-textbox" name="phone">
                </td>
            </tr>
            <tr>
                <td>邮箱</td>
                <td>
                    <input class="easyui-textbox" name="email">
                </td>
            </tr>
            <tr>
                <td>身份证图</td>
                <td>
                    <input type="file" id="cardimg">
                    <input type="button" value="识别" onclick="shibie()">
                </td>
            </tr>
            <tr>
                <td>身份证号</td>
                <td>
                    <input class="easyui-textbox" name="card" id="card" value="此条信息有识别出来的">
                </td>
            </tr>
            <tr>
                <td>房源</td>
                <td>
                    <input name="hid"  class="easyui-combobox" data-options="url:'<%=request.getContextPath() %>/queryHousebyRoleid',valueField:'houseid',textField:'housename'">
                </td>
            </tr>
            <tr>
                <td>期限</td>
                <td>
                    <select name="deadline" class="easyui-combobox">
                        <option value="0">请选择期限</option>
                        <option value="1">1年</option>
                        <option value="2">2年</option>
                        <option value="3">3年</option>
                    </select>
                </td>
            </tr>
            <tr>
                <td>价格</td>
                <td>
                    <input class="easyui-textbox" name="price">
                </td>
            </tr>
            <tr>
                <td>备注</td>
                <td>
                    <textarea name="comment">

                    </textarea>
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

    //识别
    function shibie(){
        var cardimg =  $('#cardimg').val();
        var i=cardimg.lastIndexOf("\\");
        var cardimg1=cardimg.substring(i+1);
        alert(cardimg1);
        $.ajax({
            url:"queryCard",
            data:{cardimg:cardimg1},
            type:'post',
            datatype:"json",
            success:function(data){
                $("#card").textbox('setValue',data);
                $.messager.alert("提示","识别成功","info");
            }
        })
    }
    //新增
    function addUser(){
        $("#myForm").form("submit",{
            url:"addHeTong",
            success:function(){
                $.messager.alert("提示","保存成功！","info");
                //关闭弹框
                $("#myDialog").dialog('close');
                //刷新页面
                $("#myTable").datagrid("load");
            }
        })
    }
    $(function () {
        $("#myForm").form("reset");
        $("#myDialog").dialog({
            title:'新增合同',
            closed:false   //true 关闭 false 打开
        })
    })
    function closeDig(){
        $("#myDialog").dialog('close');
    }

</script>
</html>
