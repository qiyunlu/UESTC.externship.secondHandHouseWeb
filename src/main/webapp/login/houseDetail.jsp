<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<%@page import="com.hwadee.SecondHandHouse.*"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>

<body>

<%
JDBCFunction fun = new JDBCFunction();
%>

<div><h3><b>房产详情：</b></h3></div>
<br/>

<%
String houseID = request.getParameter("houseID");
House house = fun.findByHouseID(Integer.parseInt(houseID));
%>

<img src="kunxi.jpg" data-src="holder.js/200x200" class="img-thumbnail" alt="200x200" style="width: 160px; height: 160px;">
<h2><b><%=house.getHouseTitle() %></b></h2>
<div></div><b>房产类型：</b><%=house.getHouseType() %></div>
<div><b>房产质量：</b><%=house.getHouseQuality() %></div>
<div><b>房屋地址：</b><%=house.getHouseAddress() %><%=house.getHouseSituation() %></div>
<div><b>平方米单价：</b><%=house.getHousePricePerM() %>元/平方米</div>
<div><b>总面积：</b><%=house.getHouseMeasurement() %>平方米</div>
<div><b>房屋总价：</b><%=house.getHouseTotalPrice() %>万元</div>
<div><b>房主：</b><%=house.getHouseManager() %></div>

<br>

<div><a href="/login/home.jsp">返回主页</a></div>

</body>
</html>