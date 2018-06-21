<%@page import="org.springframework.beans.factory.parsing.ImportDefinition"%>
<%@page import="org.springframework.context.annotation.Import"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<%@page import="com.hwadee.SecondHandHouse.*"%>
<%@page import="java.util.*"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>蓝光易居</title>
</head>
<body>
	
	<!-- 首页 -->
	<div>
		<%
		JDBCFunction fun = new JDBCFunction();
		List<Information> gsxwlist = fun.findByInforTextType("公司新闻");
		Collections.reverse(gsxwlist);
		List<Information> scdtlist = fun.findByInforTextType("市场动态");
		Collections.reverse(scdtlist);
		int count = 0;
		%>
		<div>
			<div>公司新闻</div>
			<table>
				<tbody>
					<% 
					count = 0;
					for(Information infor : gsxwlist) {
						if(count >= 10) {
							break;
						}
					%>
					<tr>
						<td><%=infor.getInforTitle() %></td>
						<td><%=infor.getInforPublicDate() %></td>
						<td>
							<%
							if(infor.getInforPictureType() == 1) {
							%>
							<img src=infor.getInforPictureUpdate() />
							<%		
							}
							%>
						</td>
					</tr>
					<%
						count++;
					}
					%>
				</tbody>
			</table>
		</div>
		<div>
			<div>市场动态</div>
			<table>
				<tbody>
					<% 
					count = 0;
					for(Information infor : scdtlist) {
						if(count >= 10) {
							break;
						}
					%>
					<tr>
						<td><%=infor.getInforTitle() %></td>
						<td><%=infor.getInforPublicDate() %></td>
						<td>
							<%
							if(infor.getInforPictureType() == 1) {
							%>
							<img src=infor.getInforPictureUpdate() />
							<%		
							}
							%>
						</td>
					</tr>
					<%
						count++;
					}
					%>
				</tbody>
			</table>
		</div>
	</div>
	
	<!-- 企业概况 -->
	<div>企业介绍</div>
	<!-- 从这里开始以下几项都是一样的，所以只写一个例子 -->
	<%
	List<Information> qyjslist = fun.findByInforTextType("企业介绍");
	Collections.reverse(qyjslist);
	int num = 0;
	Information information = qyjslist.get(num);
	%>
	<h1><%=information.getInforTitle() %></h1>
	<p>
	<div><%=information.getInforContent()%></div>
	<div><%=information.getInforPublisher() %></div>
	<div><%=information.getInforPublicDate() %></div>
	<div>
	<%
	if(information.getInforPictureType() == 1) {
	%>
	<img src=infor.getInforPictureUpdate() />
	<%		
	}
	%>
	</div>
	</p>
	
	
	<div>发展历程</div>
	<div>组织机构</div>
	
	<!-- 企业文化 -->
	<div>文化理念</div>
	<div>社会责任</div>
	
	<!-- 新闻中心 -->
	<div>公司新闻</div>
	<div>市场动态</div>
	
	<!-- 人力资源 -->
	<div>人才理念</div>
	<div>团队风采</div>
	
</body>
</html>