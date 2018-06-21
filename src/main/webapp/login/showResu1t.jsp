<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<%@page import="com.hwadee.SecondHandHouse.*"%>
<%@page import="java.util.*"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<%
String resp0 = (String)request.getAttribute("response0");
String resp1 = (String)request.getAttribute("response1");
%>
<h2><%=resp0 %></h2>

<br/>

<%
//连接用户数据库
JDBCFunction fun = new JDBCFunction();
List<Information> list = fun.findByInforTextType(resp1);
%>
<table>
	<thead>
		<tr>
			<th>消息ID</th><th>消息标题</th><th>消息类型</th><th>消息作者</th><th>发布日期</th>
		</tr>
	</thead>
	<tbody>
		<% for(Information infor : list) {%>
		<tr>
			<td><%=infor.getInforID() %></td>
			<td><%=infor.getInforTitle() %></td>
			<td><%=infor.getInforTextType() %></td>
			<td><%=infor.getInforPublisher() %></td>
			<td><%=infor.getInforPublicDate() %></td>
		</tr>
		<%} %>
	</tbody>
</table>

<br/>
<br/>
<br/>

<div><a href="/login/InformationManage.jsp">点击返回</a></div>

</body>
</html>