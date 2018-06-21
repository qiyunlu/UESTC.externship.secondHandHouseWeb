<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        
        <!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
		<script src="//cdn.bootcss.com/jquery/1.11.3/jquery.min.js"></script>
		
		<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
		<script src="//cdn.bootcss.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width,initial-scale=1">
        <script src="/assets/js/login.js"></script>
        <link rel="stylesheet" type="text/css" href="register.css">
        <link rel="stylesheet" type="text/css" href="bootstrap.css">
        
        <link rel="stylesheet" href="http://netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css">
        <title>注册</title>
    </head>
    
    <body class="bground">
    	
    	<div class="register-box">
        	<div class="homeimg">
            	<a href="易居前台.html"><img src="yiju3.jpg" alt=""></a>
            </div>
            
	        <div class="text-style">*用户名</div>
	        <input type="text" name="userAccount" class="input-style">
	        <div class="text-style">*电子邮件</div>
	        <input type="text" name="email" class="input-style">
	        <div class="text-style">*密码</div>
	        <input type="password" name="userPassword" class="input-style">
	        <div class="text-style">*确认密码</div>
	        <input type="password" name="userPassword" class="input-style">
	        <div class="text-error"></div>
	        <div class="clearfix">
	      		<input type="button" value="注 册" class="btn btn-primary register-btn">
	        </div>
            <div class="hyperlink-box">
                <a href="login.jsp">登陆</a>&nbsp&nbsp
                <a href="login.jsp">返回易居</a>
        	</div>
        </div>
    </body>
    <script type="text/javascript">
		$(function(){
			LOGIN.init();
		});
	</script>
</html>
