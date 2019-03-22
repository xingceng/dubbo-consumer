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

</head>
<body>
<!-- 条件查询 -->
<div id="searchDiv">
    手机号：<input class="easyui-textbox" id="phone">

    <a href="javascript:searchUSer()" class="easyui-linkbutton" data-options="iconCls:'icon-search'">搜索</a>
    <br>
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
                <td>看房时间</td>
                <td>
                    <input class="easyui-datebox" name="looktime">
                </td>
            </tr>
            <tr>
                <td>手机号</td>
                <td>
                    <input class="easyui-textbox" name="phone">
                </td>
            </tr>
            <tr>
                <td>房源</td>
                <td>
                    <select name="hid">
                        <option value="-1" selected>请选择
                            <c:forEach items="${houselist}" var="h">
                        <option value="${h.houseid }" ${h.houseid ==book.houseid?"selected":"" }>${h.housename}</option>
                        </c:forEach>
                    </select>
                </td>
            </tr>
            <tr>
                <td>经纪人</td>
                <td>
                    <select name="brokerid">
                        <option value="-1" selected>请选择
                            <c:forEach items="${brolist}" var="h">
                        <option value="${h.id }" ${h.id ==book.houseid?"selected":"" }>${h.username}</option>
                        </c:forEach>
                    </select>
                </td>
            </tr>
            <tr>
                <td>是否确认</td>
                <td>
                    <input type="radio" name="commit" value="0">否
                    <input type="radio" name="commit" value="1">是
                </td>
            </tr>
            <tr>
                <td>反馈</td>
                <td>
                    <input class="easyui-textbox" name="feedback">
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

    //修改回显
    function openUser(id){
        $.ajax({
            url:"queryLookHouseById",
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
    //新增、修改用户
    function addUser(){
        $("#myForm").form("submit",{
            url:"addLookHouse",
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
            phone:$("#phone").textbox("getValue"),
        })
    }
    $("#myTable").datagrid({
        url:"queryLookHouse",
        columns:
            [[{field:'check',checkbox:true},
                {field:'id',title:'编号'},
                {field:'looktime',title:'看房时间'},
                {field:'phone',title:'客户手机号'},
                {field:'housename',title:'房源'},
                {field:'feedback',title:'反馈'},
                {field:'commit',title:'是否确认',formatter:function(value,row,index){
                        if(value==1){
                            return "是";
                        }else if(value==0){
                            return "否";
                        }
                }},
                {field:'username',title:'经纪人'},
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
                    url:"deleteLookHouse",
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
</script>
</html>
