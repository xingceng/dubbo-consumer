<%--
  Created by IntelliJ IDEA.
  User: 张怀宇
  Date: 2019/3/18
  Time: 11:25
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

<!--定义表格 -->
<table id="MyTable"></table>


</body>
<script>



    //查询
    $("#MyTable").datagrid({
        url:"<%=request.getContextPath()%>/queryFangwu?housetype="+'4',
        columns:[[
            {field:'check',checkbox:true},
            {field:'houseid',title:'编号',width:100,align:'center'},
            {field:'housename',title:'房名',width:100,align:'center'},
            {field:'circuitname',title:'地区',width:100,align:'center'},
            {field:'pricename',title:'价格',width:100,align:'center'},
            {field:'acreagename',title:'面积',width:100,align:'center'},
            {field:'unitname',title:'户型',width:100,align:'center'},
            {field:'yongtuname',title:'用途',width:100,align:'center'},
            {field:'zhuangxiuname',title:'用途',width:100,align:'center'},
            {field:'housestuts',title:'状态',width:100,align:'center'},
            {field:'houseyongtuid',title:'用途',width:100,align:'center'},
            {field:'housestuts',title:'用途',width:100,align:'center',formatter:function(value,row,index){
                if(housestuts==0){
                    return "未出租"
                }
                if(housestuts==1){
                    return "已出租"
                }
            }},


        ]],
        pagination:true,//开启分页
        pageList:[1,2,3,4,5,6], //初始化页面大小选择列表
        pageSize:3 , //初始化每页显示条数，默认是10
        pageNumber:1, //当前页,默认是1
        fit:true,
        toolbar:"#searchDivk",
        pagePosition:"top"
    })



</script>
</html>
