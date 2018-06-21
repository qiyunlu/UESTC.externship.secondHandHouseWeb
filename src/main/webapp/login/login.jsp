<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width,initial-scale=1">
        
        <link rel="stylesheet" type="text/css" href="login.css">
        <link rel="stylesheet" type="text/css" href="bootstrap.css">
        
        <link rel="stylesheet" href="http://netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css">
        
        <title>用户登录</title>
    </head>
    
    <body class="bground">
    	<div class="login-box">
  			<div class="homeimg">
            	<a href=home.jsp><img src="yiju3.jpg" alt=""></a>
            </div>
            
            <form:form action="/user/login" method="post" modelAttribute="User">
	
					<div class="text-style">用户名</div>
		            <div>
		            	<input type="text" name="userAccount" class="input-style">
		            </div>
		            <div class="text-style">密码</div>
		            <div>
		            	<input type="password" name="userPassword" class="input-style">
		            </div>
		            <div class="text-error">&nbsp&nbsp&nbsp&nbsp&nbsp${sessionScope['org.springframework.web.servlet.support.SessionFlashMapManager.FLASH_MAPS'][0]['msg']}</div>
		            <div class="clearfix">
		            	<input type="submit" value="登 陆" class="btn login-btn btn-primary">
		            </div>
			</form:form>
            
        	
            <div class="hyperlink-box">
            	<a href="register.jsp">注册</a>&nbsp&nbsp
        		<a href="home.jsp">返回易居</a>
            </div>
        </div>
    </body>
</html>