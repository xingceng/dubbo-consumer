<%--
  Created by IntelliJ IDEA.
  User: Simpon
  Date: 2019/3/19
  Time: 9:44
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
<table id="blogTable" class="table"></table>
</body>
<script>
    $("#blogTable").datagrid({
        url:"<%=request.getContextPath()%>/queryLog",
        columns:[[
            {field: 'id', title: '编号',width:100,align:'center'},
            {field: "createDate", title: '日志时间',width:100,align:'center'},
            {field: "userName", title: '用户',width:100,align:'center'},
            {field: "ip", title: 'ip',width:100,align:'center'},
            {field: "className", title: '类名',width:100,align:'center'},
            {field: "method", title: '方法名称',width:100,align:'center'},
            {field: 'repParam', title: '返回参数',width:100,align:'center'},
        ]],
        pagination:true,//开启分页
        pageList:[1,2,3,4,5,6], //初始化页面大小选择列表
        pageSize:5, //初始化每页显示条数，默认是10
        pageNumber:1, //当前页,默认是1
        fit:true,
        toolbar:"#searchDivk",
        pagePosition:"top"
    })
</script>
</html>
