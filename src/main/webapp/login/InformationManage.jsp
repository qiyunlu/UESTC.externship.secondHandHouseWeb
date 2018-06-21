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

<div><h3><a href="/login/Admin.jsp">返回</a></h3></div>

<br/>

<%
JDBCFunction fun = new JDBCFunction();
%>
<div><h1>添加：</h1></div>
<form action="/infor/add" method="post">
	<div>消息标题：<input type="text" name="inforTitle" /></div>
	<div>消息类型：<input type="radio" name="inforTextType" value="企业介绍" checked="checked" />企业介绍
				<input type="radio" name="inforTextType" value="发展历程" />发展历程
				<input type="radio" name="inforTextType" value="组织机构" />组织机构
				<input type="radio" name="inforTextType" value="文化理念" />文化理念
				<input type="radio" name="inforTextType" value="社会责任" />社会责任
				<input type="radio" name="inforTextType" value="公司新闻" />公司新闻
				<input type="radio" name="inforTextType" value="市场动态" />市场动态
				<input type="radio" name="inforTextType" value="人才理念" />人才理念
				<input type="radio" name="inforTextType" value="团队风采" />团队风采
	</div>
	<div>消息内容：<input type="text" name="inforContent" /></div>
	<div>消息作者：<input type="text" name="inforPublisher" /></div>
	<div>发布日期：<input type="text" name="inforPublicDate" /></div>
	<div><input type="submit" value="Submit" /></div>
</form>

<div><h1>删除：</h1></div>
<form action="/infor/delete" method="post">
	<div>消息ID：<input type="text" name="inforID" /></div>
	<div><input type="submit" value="Submit" /></div>
</form>

<div><h1>查找：</h1></div>
<form action="/infor/search" method="post">
	<div>消息类型：<input type="radio" name="inforTextType" value="企业介绍" checked="checked" />企业介绍
				<input type="radio" name="inforTextType" value="发展历程" />发展历程
				<input type="radio" name="inforTextType" value="组织机构" />组织机构
				<input type="radio" name="inforTextType" value="文化理念" />文化理念
				<input type="radio" name="inforTextType" value="社会责任" />社会责任
				<input type="radio" name="inforTextType" value="公司新闻" />公司新闻
				<input type="radio" name="inforTextType" value="市场动态" />市场动态
				<input type="radio" name="inforTextType" value="人才理念" />人才理念
				<input type="radio" name="inforTextType" value="团队风采" />团队风采
	</div>
	<div><input type="submit" value="Submit" /></div>
</form>

<div><h1>修改：</h1></div>
<form action="/infor/change" method="post">
	<div>消息ID：<input type="text" name="inforID" /></div>
	<div>消息标题：<input type="text" name="inforTitle" /></div>
	<div>消息类型：<input type="radio" name="inforTextType" value="企业介绍" checked="checked" />企业介绍
				<input type="radio" name="inforTextType" value="发展历程" />发展历程
				<input type="radio" name="inforTextType" value="组织机构" />组织机构
				<input type="radio" name="inforTextType" value="文化理念" />文化理念
				<input type="radio" name="inforTextType" value="社会责任" />社会责任
				<input type="radio" name="inforTextType" value="公司新闻" />公司新闻
				<input type="radio" name="inforTextType" value="市场动态" />市场动态
				<input type="radio" name="inforTextType" value="人才理念" />人才理念
				<input type="radio" name="inforTextType" value="团队风采" />团队风采
	</div>
	<div>消息内容：<input type="text" name="inforContent" /></div>
	<div>消息作者：<input type="text" name="inforPublisher" /></div>
	<div>发布日期：<input type="text" name="inforPublicDate" /></div>
	<div><input type="submit" value="Submit" /></div>
</form>

<br/>
<br/>
<br/>
<br/>
<br/>

<%
List<Information> list = fun.findByInforTextType("null");
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
			<td><a href="newsDetail.jsp?inforId=<%=infor.getInforID() %>"><%=infor.getInforTitle() %></a></td>
			<td><a href="newsList.jsp?type=<%=infor.getInforTextType() %>"><%=infor.getInforTextType() %></a></td>
			<td><%=infor.getInforPublisher() %></td>
			<td><%=infor.getInforPublicDate() %></td>
		</tr>
		<%} %>
	</tbody>
</table>


</body>
</html>