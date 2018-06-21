<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<%@page import="com.hwadee.SecondHandHouse.*"%>
<%@page import="java.util.*"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
    	<title>资讯</title>
	</head>
	<body>
	<%
        JDBCFunction fun = new JDBCFunction();
        int count = 0;
        %>
		<div class="content">
			<div id="main">
				<div id="newsList"><h3>详情</h3></div>
					 <%
					 	String inforId = request.getParameter("inforId");
						List<Information> gsxwlist = fun.findByInforTextType(inforId);
					%>
					<% 
					for(Information infor : gsxwlist) {
					%>
					<div class="tit"><h4><%=infor.getInforTitle() %></h4></div>
					<div class="time">作者：<%=infor.getInforPublisher() %> 时间：<%=infor.getInforPublicDate() %></div>
					<br/>
					<div class="cont"><%=infor.getInforContent() %></div>
					<%
					}
					%>
<!-- 				<s:set name="ND" value="#request.newsDetail"/> -->
<%-- 				<div class="tit"><h2>${ND.title}</h2></div> --%>
<%--    				<div class="time">作者:${ND.author}　时间:${ND.time}</div> --%>
<!--    				<div class="cont"> -->
<%--    						${ND.content} --%>
<!-- 				</div> -->
			</div>
		</div>
	</body>
</html>
