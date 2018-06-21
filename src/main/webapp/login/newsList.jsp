<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<%@page import="com.hwadee.SecondHandHouse.*"%>
<%@page import="java.util.*"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<%
		String type = request.getParameter("type");
		%>
    	<title><%=type %></title>
	</head>
	<body>
		<%
        JDBCFunction fun = new JDBCFunction();
        int count = 0;
        %>
		<div class="content">
			<div id="main">
				<div id="newsList"><h3><%=type %></h3></div>
                    <%
						List<Information> gsxwlist = fun.findByInforTextType(type);
					%>
                    <ul class="info-list">
                    <% 
					for(Information infor : gsxwlist) {
					%>
                        <li><a href="newsDetail.jsp?inforId=<%=infor.getInforID() %>" class=""><%=infor.getInforTitle() %><%=infor.getInforPublicDate() %></a></li>   
<%--                            <a href="/deleteinformation?inforId=<%=infor.getInforID() %>">删除</a> --%>
                    <%
					}
					%>
                    </ul>
			</div>
		</div>
	</body>
</html>
