<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<meta name="keywords"
      content="Internship Sign In & Sign Up Form Responsive Widget,Login form widgets, Sign up Web forms , Login signup Responsive web form,Flat Pricing table,Flat Drop downs,Registration Forms,News letter Forms,Elements"/>
<script type="application/x-javascript"> addEventListener("load", function () {
    setTimeout(hideURLbar, 0);
}, false);

function hideURLbar() {
    window.scrollTo(0, 1);
} </script>
<script type="text/javascript" src="<%=request.getContextPath()%>/login/js/jquery-2.1.4.min.js"></script>
<!-- Custom Theme files -->
<link href="<%=request.getContextPath()%>/login/css/font-awesome.min.css" rel="stylesheet" type="text/css" media="all">
<link href="<%=request.getContextPath()%>/login/css/snow.css" rel="stylesheet" type="text/css" media="all"/>
<link href="<%=request.getContextPath()%>/login/css/style.css" rel="stylesheet" type="text/css" media="all"/>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>hello</title>

</head>
<body>
<div class="snow-container">
    <div class="snow foreground"></div>
    <div class="snow foreground layered"></div>
    <div class="snow middleground"></div>
    <div class="snow middleground layered"></div>
    <div class="snow background"></div>
    <div class="snow background layered"></div>
</div>
<div class="top-buttons-agileinfo">
</div>
<br><br><br><br><br>
<div class="main-agileits">
    <!--form-stars-here-->
    <div class="form-w3-agile">
        <h2 class="sub-agileits-w3layouts">登录</h2>
        <form id="loginForm">
            <input type="text" id="staffname" name="username" placeholder="用户" required=""/>
            <input type="password" id="staffpass" name="password" placeholder="密码" required=""/>
            <P>${message }</P>
            <div class="submit-w3l">
                <input type="button" value="登录🔏" id="loginButton"/>
            </div>
        </form>
    </div>
</div>
<!--//form-ends-here-->
<!-- copyright -->
<div class="copyright w3-agile">
    <p><a> © shiro-test</a></p>
</div>
<!-- //copyright -->
<script type="text/javascript">
    $("#loginButton").on("click", function () {
        $.ajax({
            url: "<%=request.getContextPath()%>/loginuser",
            type: "post",
            data: $("#loginForm").serialize(),
            dataType: "text",
            success: function (loginFlag) {
                //用户名不存在
                if (loginFlag == "userNameNO") {
                    alert("用户名不存在");
                }
                //密码错误
                if (loginFlag == "userPassNo") {
                    alert("密码错误")
                }
                //登录成功
                if (loginFlag == "loginSuccess") {
                    alert("登陆成功")
                    location.href = "/login/toIndex";

                }
            },
            error: function () {
                alert("程序错误");
            }
        })
    });
</script>
</body>
</html>