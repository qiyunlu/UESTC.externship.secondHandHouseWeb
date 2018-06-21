<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form:form action="/city/add" method="post" modelAttribute="account">
		<table>
			<tr>
				<td>城市名：</td><td><input type="text" name="cityName"/></td>
			</tr>
			<tr>
				<td>父城市：</td><td><input type="text" name="parentCityId"/></td>
			</tr>
			<tr>
				<td>城市简介：</td><td><input type="text" name="remark"/></td>
			</tr>
		</table>
		<input type="submit" value="添加" />
	</form:form>
</body>
</html>