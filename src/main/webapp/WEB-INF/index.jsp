<%--
  Created by IntelliJ IDEA.
  User: Simpon
  Date: 2019/3/18
  Time: 10:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>后台管理页面</title>
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
    <!-- 引文工具树js -->
    <script type="text/javascript" src="<%=request.getContextPath() %>/jquery-easyui-1.5/util-js.js"></script>
</head>
<body>
<!-- 定义布局 -->
<div class="easyui-layout" data-options="fit:true">
    <div data-options="region:'north',height:100"><center><h1>上海之家后台管理系统</h1></center></div>
    <div data-options="region:'west',width:200,title:'导航菜单',split:true">
        <!-- 定义树 -->
        <ul id="navTree"></ul>
    </div>
    <div data-options="region:'center'">
        <!-- 选项卡 -->
        <div class="easyui-tabs" id="myTabs" data-options="fit:true"></div>
    </div>
</div>
</body>
<script>
    //加载导航树
    $("#navTree").tree({
        url:"<%=request.getContextPath() %>/queryNavTreeByUserId",
        parentField:"pid",
        onClick:function(node){
            if(node.url!=null && node.url!=''){
                if($("#myTabs").tabs("exists",node.text)){
                    $("#myTabs").tabs("select",node.text);
                }else{
                    $("#myTabs").tabs("add",{
                        title:node.text,
                        closable:true,
                        content:createJsp(node.url),
                        tools:[{
                            iconCls:"icon-mini-refresh",
                            handler:function(){
                                $("#myTabs").tabs("update",{
                                    tab:$("#myTabs").tabs("getSelected"),
                                    options:{
                                        content:createJsp(node.url)
                                    }
                                })
                            }
                        }]
                    })
                }
            }
        }

    })

    function createJsp(url){
        return "<iframe frameborder='0' src='<%=request.getContextPath() %>"+url+"' style='width:100%;height:100%' scrolling='auto'></iframe>";
    }
</script>
</html>
