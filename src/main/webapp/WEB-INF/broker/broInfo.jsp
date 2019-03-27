<%--
  Created by IntelliJ IDEA.
  User: 18730
  Date: 2019/3/22
  Time: 11:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
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

    <!--定义表格 -->
    <table id="broTab"></table>

    <script type="text/javascript">

        $(function () {
            initBroTable();
        })

        //查询
        function initBroTable() {
            $("#broTab").datagrid({
                url: "<%=request.getContextPath()%>/queryBroInfo",
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
                    {field: 'coverage', title: '服务区域', width: 150, align: 'center'},
                    {field: 'broStore', title: '所属店铺', width: 150, align: 'center'},
                    {field: 'daikan', title: '带看次数', width: 100, align: 'center'},
                    {field: 'zuping', title: '成交次数', width: 100, align: 'center'},
                    {field: 'daikan', title: '关注人数', width: 100, align: 'center'}
                ]]
            })
        }
    </script>
</body>
</html>
