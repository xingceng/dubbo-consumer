<%--
  Created by IntelliJ IDEA.
  User: 张怀宇
  Date: 2019/3/19
  Time: 14:54
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
<!-- 定义新增表格 -->
<div id="searchDivk">

    <a href="javascript:openDig()" class="easyui-linkbutton" data-options="iconCls:'icon-add',plain:true">新增</a>

</div>
<table id="MyTable"></table>
<div id="myDialog" class="easyui-dialog" style="width:500px;height:400px" data-options="modal:true,maximizable:true,resizable:true,buttons:'#myButton',closed:true,iconCls:'icon-save'">
    <form id="myForm" method="post">
        <table>
            <tr>
                <td>客户名称</td>
                <td>
                    <input class="easyui-textbox" name="kehuname">
                </td>
            </tr>
            <tr>
                <td>客户手机号</td>
                <td>
                    <input class="easyui-textbox" name="kehuphone">
                </td>
            <tr>
                <td>客户身份证号</td>
                <td>
                    <input class="easyui-textbox" name="kehucard">
                </td>
            </tr>
            <tr>
                <td>身份证图片</td>
                <td>
                    <img width="100px" height="100px" id="add_img" >
                    <!-- 文件域 上传图片 -->
                    <input type="file" id="uploadImg">
                    <!-- 隐藏域 上传图片的路径 -->
                    <input type="hidden" name="kehucardimg" id="hideImg">
                    <div id="fileQueue"></div>

                </td>
            </tr>
            <tr>
                <td>客户邮箱</td>
                <td>
                    <input class="easyui-textbox" name="kehuemail">
                </td>
            </tr>
            <tr>
                <td>密码</td>
                <td>
                    <input class="easyui-passwordbox" name="kehupassword">
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
    //查询
    $("#MyTable").datagrid({
        url:"<%=request.getContextPath()%>/querykehu",
        columns:[[
            {field:'check',checkbox:true},
            {field:'kehuid',title:'客户id',width:100,align:'center'},
            {field:'kehuname',title:'客户名字',width:100,align:'center'},
            {field:'kehuphone',title:'客户手机号',width:100,align:'center'},
            {field:'kehucard',title:'客户身份证号',width:100,align:'center'},
            {field:'kehucardimg',title:'kehucardimg',formatter:function(value,row,index){
                return "<img width='50px' height='50px' src='"+value+"'>";
            }},
            {field:'kehuemail',title:'客户邮箱',width:100,align:'center'},
            {field:'tools',title:'操作',width:100,align:'center',formatter:function(value,row,index){

                var str="<a href='javascript:delt("+row.kehuid+")'>删除</a>"

                return str;

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
            url:"<%=request.getContextPath() %>/addkehu",
            success:function(){
                $.messager.alert("提示","保存成功","info")
                //关闭弹框
                $("#myDialog").dialog("close")
                //关闭
                closeDig()
                //刷新
                $("#MyTable").datagrid("load")

            }

        })

    }



    $("#uploadImg").uploadify({
        //插件自带  不可忽略的参数flash插件
        'swf': '<%=request.getContextPath()%>/js/uploadify/uploadify.swf',
        //前台请求后台的url 不可忽略的参数
        'uploader': '<%=request.getContextPath()%>/uploadBookImg',
        //给div的进度条加背景 不可忽略
        'queueID': 'fileQueue',
        //对应controller层上传方法中 接收文件的参数名
        'fileObjName' : 'image',
        //给上传按钮设置文字
        'buttonText': '上传头像',
        //设置文件是否自动上传
        'auto': true,
        //可以同时选择多个文件 默认为true  不可忽略
        'multi': true,
        //上传后队列是否消失
        'removeCompleted': true,
        //允许上传的文件后缀
        'fileExt': '*.jpg;*.gif;*.png',
        //
        'cancelImg': '<%=request.getContextPath()%>/js/uploadify/uploadify-cancel.png',
        //队列消失时间
        'removeTimeout' : 1,
        //上传文件的个数，项目中一共可以上传文件的个数
        'uploadLimit':  -1,
        'fileTypeExts': '*.jpg;*.png',
        //成功回调函数 file：文件对象。data后台输出数据
        'onUploadSuccess':function(file,data,response){
            //alert(file.name+" 路径："+data.imagePath)
            var imgurl = "http://<%= request.getServerName()%>:<%=request.getServerPort()%><%=request.getContextPath()%>/"+eval(data);
            //图片回显， 预览
            $("#add_img").attr("src",imgurl)
            // 文本框 回填
            $('#hideImg').val(imgurl);
        }

    });


    //单个删除
    function  delt(kehuid){
        $.messager.confirm("提示","是否确认删除！",function(r){
            if(r){
                $.ajax({
                    url:"<%=request.getContextPath() %>/delt",
                    type:"post",
                    data:{"kehuid":kehuid},
                    success:function(){
                        alert("删除成功");
                        $.messager.alert("提示消息","删除成功！","info");
                        //刷新页面
                        $("#MyTable").datagrid("load")
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
