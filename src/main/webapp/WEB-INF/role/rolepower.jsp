<%--
  Created by IntelliJ IDEA.
  User: Simpon
  Date: 2019/3/19
  Time: 14:07
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
    <!-- 引文工具树js -->
    <script type="text/javascript" src="<%=request.getContextPath() %>/jquery-easyui-1.5/util-js.js"></script>
</head>
<body>
<!-- 定义布局 -->
<div class="easyui-layout" data-options="fit:true">
    <div data-options="region:'west',title:'角色列表'" style="width:30%">
        <!-- 角色工具栏 -->
        <div id="roleToolbar">
            <a href="javascript:openDialog()" class="easyui-linkbutton" data-options="iconCls:'icon-add',plain:true">新增</a>
        </div>
        <table id="roleTable"></table>
    </div>
    <div data-options="region:'center',title:'权限列表'" style="width:40%">
        <div class="easyui-panel" data-options="footer:'#footer',fit:true">
            <!-- 定义隐藏域：角色id -->
            <input style="display:none" id="roleid">
            <!-- 定义树 -->
            <ul id="navTree"></ul>
            <div id="footer" style="text-align:right">
                <a class="easyui-linkbutton" href="javascript:saveRolePower()" data-options="iconCls:'icon-ok',plain:true">保存权限</a>
            </div>
        </div>
        <div id="mm" class="easyui-menu" style="width:120px;">
            <div onclick="append()" data-options="iconCls:'icon-add'">追加</div>
            <div onclick="edit()" data-options="iconCls:'icon-edit'">修改</div>
            <div onclick="remove()" data-options="iconCls:'icon-remove'">移除</div>
        </div>
        <!-- 定义新增权限弹框 -->
        <div class="easyui-dialog" id="powerDialog" data-options="width:300,height:200,closed:true,modal:true,title:'添加权限',iconCls:'icon-save',buttons:'#buttons'">
            节点名称:<input class="easyui-textbox" id="powerNodeName">
            <br>
            节点url:<input class="easyui-textbox" id="powerNodeUrl">
        </div>
        <!-- 对话框按钮 -->
        <div id="buttons">
            <a href="javascript:savePower()" class="easyui-linkbutton" data-options="iconCls:'icon-ok'">保存</a>
            <a href="javascript:closeDialog()" class="easyui-linkbutton" data-options="iconCls:'icon-cancel'">关闭</a>
        </div>
    </div>
    <div data-options="region:'east',title:'权限详细'" style="width:30%">
        <!-- 权限详细工具栏 -->
        <div id="powerToolbar">
            <a href="javascript:openPowerDialog()" class="easyui-linkbutton" data-options="iconCls:'icon-add',plain:true">新增</a>
        </div>
        <table id="powerMenuTable"></table>
        <!-- 定义详细新增、修改对话框 -->
        <div class="easyui-dialog" id="powerMenuDig" data-options="width:500,height:200,modal:true,iconCls:'icon-save',closed:true,buttons:'#menubuttons'">
            <form method="post" id="menuForm">
                <!-- 权限隐藏域：放id -->
                <input style="display:none" name="powerId" id="powerId">
                <table>
                    <tr>
                        <td>名称</td>
                        <td>
                            <input class="easyui-textbox" name="name">
                        </td>
                    </tr>
                    <tr>
                        <td>url路径</td>
                        <td>
                            <input class="easyui-textbox" name="url">
                        </td>
                    </tr>
                </table>
            </form>
        </div>
        <!-- 详细对话框按钮 -->
        <div id="menubuttons">
            <a href="javascript:savePowerMenu()" class="easyui-linkbutton" data-options="iconCls:'icon-ok'">保存</a>
            <a href="javascript:closeDialog()" class="easyui-linkbutton" data-options="iconCls:'icon-cancel'">关闭</a>
        </div>
    </div>
</div>
</body>
<script>
    $(function(){
        initRoleTable();
        initPowerTree(-1);//初始化权限树
        initPowerMenuTable(-1);//初始化权限详细表格
    })
    //初始化角色表格
    function initRoleTable(){
        $('#roleTable').datagrid({
            url:'<%=request.getContextPath() %>/queryRoleList',
            fit:true,
            toolbar:"#roleToolbar",
            columns:[[
                {field:"check",checkbox:true},
                {field:"id",title:"id"},
                {field:"name",title:"角色名称"},
                {field:"info",title:"描述"},
                {field:"tools",title:"操作",formatter:function(value,row,index){
                        return "<a href='javascript:openPower("+row.id+")'>赋权限</a>";
                    }}
            ]]
        })
    }

    //给角色赋权限：回显权限
    function openPower(roleid){
        //给角色id隐藏域赋值
        $("#roleid").val(roleid);
        initPowerTree(roleid);
    }

    function initPowerTree(roleid){
        //加载权限树
        $("#navTree").tree({
            url:"<%=request.getContextPath() %>/queryPowerTree?roleid="+roleid,
            checkbox:true,
            parentField:"pid",
            onContextMenu:function(e, node){
                //组织浏览器本身的右击事件
                e.preventDefault();
                // 选中节点
                $('#navTree').tree('select', node.target);
                // 显示快捷菜单
                $('#mm').menu('show', {
                    left: e.pageX,
                    top: e.pageY
                });
            },
            onAfterEdit:function(node){
                //编辑节点后触发：修改权限节点
                //alert(node.text);
                $.ajax({
                    url:"<%=request.getContextPath() %>/updatePower",
                    type:"post",
                    data:{"id":node.id,"text":node.text},
                    success:function(){
                        $.messager.alert("提示","修改权限节点成功！","info");
                    }
                })
            },
            onDblClick:function(node){//节点双击事件
                initPowerMenuTable(node.id);
                $("#powerId").val(node.id);
            }
        })
    }


    //给角色赋权限：保存角色权限
    function saveRolePower(){
        var roleId = $("#roleid").val();
        //获取选中的权限树节点
        var powerArr = $("#navTree").tree("getChecked");
        var powerIds = "";
        for(var i=0;i<powerArr.length;i++){
            //powerIds+=powerIds==""?powerArr[i].id:","+powerArr[i].id;
            if(powerIds==""){
                powerIds+=powerArr[i].id;
            }else{
                powerIds+=","+powerArr[i].id;
            }
        }
        $.ajax({
            url:"<%=request.getContextPath() %>/saveRolePower",
            type:"post",
            data:{"roleId":roleId,"powerIds":powerIds},
            success:function(){
                $.messager.alert("提示","赋权限成功！","info");
            }
        })
    }

    //初始化权限详细表格
    function initPowerMenuTable(powerId){
        $('#powerMenuTable').datagrid({
            url:'<%=request.getContextPath() %>/queryPowerMenuList?powerId='+powerId,
            fit:true,
            toolbar:"#powerToolbar",
            columns:[[
                {field:"check",checkbox:true},
                {field:"id",title:"id"},
                {field:"name",title:"名称"},
                {field:"url",title:"路径"},
                {field:"tools",title:"操作",formatter:function(value,row,index){
                        return "<a href='javascript:'>删除</a>";
                    }}
            ]]
        })
    }

    //打开详细对话框
    function openPowerDialog(){
        //判断权限树没有选择，不能新增
        var powerId = $("#powerId").val();
        if(powerId==null || powerId == ""){
            $.messager.alert("提示","权限树没有选择，不能新增！","info");
            return;
        }
        $("#powerMenuDig").dialog({
            title:"新增详细",
            closed:false
        })
    }

    //保存权限详细信息
    function savePowerMenu(){
        $("#menuForm").form("submit",{
            url:"<%=request.getContextPath() %>/savePowerMenu",
            success:function(){
                $.messager.alert("提示","添加权限详细成功！","info");
                $("#powerMenuDig").dialog("close");//关闭弹框
                initPowerMenuTable($("#powerId").val());
            }
        })
    }
</script>
</html>
