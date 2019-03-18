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

<div id="searchDivk">
    <a href="javascript:openDig()" class="easyui-linkbutton" data-options="iconCls:'icon-add',plain:true">新增</a>
</div>

<!--定义表格 -->
<table id="MyTable"></table>
<!-- 定义新增表格 -->
<div id="myDialog" class="easyui-dialog" style="width:500px;height:400px" data-options="modal:true,maximizable:true,resizable:true,buttons:'#myButton',closed:true,iconCls:'icon-save'">
    <form id="myForm" method="post">
        <table>
            <tr>
                <td>房名</td>
                <td>
                    <input class="easyui-textbox" name="housename">
                </td>
            </tr>
            <tr>
                <td>房类型</td>
                <td>
                    <input type="radio" value="1">二手房
                    <input type="radio" value="2">租房
                    <input type="radio" value="3">公寓
                    <input type="radio" value="4">新房
                    <input type="radio" value="5">海外
                </td>
            <tr>
                <td>价格</td>
                <td>
                    <select>
                        <option value="0" selected>请选择
                            <c:forEach items="${aa}" var="c">
                        <option value="${c.priceid}"  >${c.peoplename}</option>
                        </c:forEach>
                    </select>
                </td>
            </tr>
            <tr>
                <td>面积</td>
                <td>
                    <select>
                        <option value="0" selected>请选择
                            <c:forEach items="${bb}" var="c">
                        <option value="${c.acreageid}"  >${c.acreagename}</option>
                        </c:forEach>
                    </select>
                </td>
            </tr>
            <tr>
                <td>户型</td>
                <td>
                    <select>
                        <option value="0" selected>请选择
                            <c:forEach items="${cc}" var="c">
                        <option value="${c.unitid}"  >${c.unitname}</option>
                        </c:forEach>
                    </select>
                </td>
            </tr>
            <tr>
            <td>用途</td>
            <td>
                <select>
                    <option value="0" selected>请选择
                        <c:forEach items="${dd}" var="c">
                    <option value="${c.yongtuid}"  >${c.yongtuname}</option>
                    </c:forEach>
                </select>
            </td>
        </tr>

            <tr>
                <td>楼层</td>
                <td>
                    <select>
                        <option value="0" selected>请选择
                            <c:forEach items="${ee}" var="c">
                        <option value="${c.loucengid}"  >${c.loucengname}</option>
                        </c:forEach>
                    </select>
                </td>
            </tr>

            <tr>
                <td>朝向</td>
                <td>
                    <select>
                        <option value="0" selected>请选择
                            <c:forEach items="${ff}" var="c">
                        <option value="${c.mianxiangid}"  >${c.mianxiangname}</option>
                        </c:forEach>
                    </select>
                </td>
            </tr>

            <tr>
                <td>朝向</td>
                <td>
                    <select>
                        <option value="0" selected>请选择
                            <c:forEach items="${gg}" var="c">
                        <option value="${c.mianxiangid}"  >${c.mianxiangname}</option>
                        </c:forEach>
                    </select>
                </td>
            </tr>

            <tr>
                <td>楼龄</td>
                <td>
                    <select>
                        <option value="0" selected>请选择
                            <c:forEach items="${hh}" var="c">
                        <option value="${c.loulingid}"  >${c.loulingname}</option>
                        </c:forEach>
                    </select>
                </td>
            </tr>


            <tr>
                <td>装修</td>
                <td>
                    <select>
                        <option value="0" selected>请选择
                            <c:forEach items="${ii}" var="c">
                        <option value="${c.zhuangxiuid}"  >${c.zhuangxiuname}</option>
                        </c:forEach>
                    </select>
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


    //打开对话框
    function openDig() {
        //重置表单
        $("#myForm").form("reset");

        //打开
        $("#myDialog").dialog({
            title:'新增用户',
            closed:false

        })

    }
    //关闭对话框
    function closeDig(){
        $("#myDialog").dialog("close")

    }


    //新增
    function add(){
        $("#myForm").form("submit",{
            url:"<%=request.getContextPath() %>/addHouse",
            success:function(){
                $.messager.alert("提示","保存成功","info")
                //关闭弹框
                $("#myDialog").dialog("close")
                //关闭
                closeDig()
                //刷新
               $("MyTable").datagrid("load")

            }

        })

    }


    //查询
    $("#MyTable").datagrid({
        url:"<%=request.getContextPath()%>/queryFangwu?housetype="+'1',
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
