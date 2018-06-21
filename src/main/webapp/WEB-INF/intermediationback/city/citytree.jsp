<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
		<script src="//cdn.bootcss.com/jquery/1.11.3/jquery.min.js"></script>
		
		<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
		<script src="//cdn.bootcss.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
		
		<script src="/assets/js/city.js"></script>
		<link href="/assets/CSS/styles.css" type="text/css" rel="stylesheet">
		<script src="/assets/js/jquery-1.8.3.min.js"></script>
		<script src="/assets/js/banner.js"></script>
		
		<title>City Tree</title>
		<style type="text/css">
			
			body,html {
				height:100%;
				width: 100%;
				margin:0px;
				padding:0px;
			}
			
			body{
				background:#F5F5F5;
				font-size:100%;
			}
			
			li {
				list-style-type:none;
			}
			
		  	td{
		  		width:20%;
		  		
		  		word-break:break-all;
		  	}
		  	
		  	td>form{
		  		width:150px;
		  	}
		  	
		  	input[type="file"],input[type="button"],input[type="submit"]{
		  		border:1px #DCDCDC solid;
		  		background:#EFEFEF;
		  		vertical-align:top;
		  	}
		  	
		  	input[type="file"]{
		  		opacity: 0;
		  	}
		  	
		  	.filediv{
		  		vertical-align:top;
		  		border:1px #DCDCDC solid;
		  		width:8.5%;
		  		height:21px;
		  		display:inline-block;
		  		background:#EFEFEF;
		  	}
		  	
		  	.filediv a{
		  		position:relative;
		  		top:5%;
		  		left:12%;
		  		font-size:13.5px;
		  	}
		  	
		  	.filediv input[type="file"]{
		  		position:relative;
		  		top:-93%;
		  		left:-1%;
		  		font-size:13.5px;
		  		width:100%;
		  	}
		  	
		  	td>form>input[type="file"]{
		  		width:56%;
		  	}
		  	
		  	.divareamap{
		  		vertical-align:top;
		  		border:1px #DCDCDC solid;
		  		width:45%;
		  		height:21px;
		  		display:inline-block;
		  		background:#EFEFEF;
		  	}
		  	
		  	.divareamap a{
		  		font-size:13.5px;
		  		position:relative;
		  		top:5%;
		  		left:10%;
		  	}
		  	
		  	.divareamap input[type="file"]{
		  		position:relative;
		  		top:-110%;
		  		left:0;
		  		font-size:13.5px;
		  		width:100%;
		  	}
		  	
		  	.divdismap {
		  		vertical-align:top;
		  		border:1px #DCDCDC solid;
		  		width:20%;
		  		height:21px;
		  		display:inline-block;
		  		background:#EFEFEF;
		  	}
		  	
		  	.divdismap a{
		  		font-size:13.5px;
		  		position:relative;
		  		top:5%;
		  		left:10%;
		  	}
		  	
		  	.divdismap input[type="file"]{
		  		position:relative;
		  		top:-95%;
		  		left:0;
		  		font-size:13.5px;
		  		width:100%;
		  	}
		  	
			.hidden {
				display:none;
			}
			
			.divcitylist {
				height:100%;
				width:17%;
				border-right:1px solid #333333;
				
			}
			
			#list {
				margin:0px;
				height:55%;
				width:100%;
				padding-left:0px;
				overflow:auto;
				border-bottom:1px solid #333333;
			}
			
			.searchcitylist>ul {
				margin:0px;
				height:90%;
				padding-left:0px;
				overflow:auto;
			}
			
			.searchcitylist>input {
				width:30%;
				margin:0px;
				padding-left:0px;
				overflow:auto;
			}
			
			.searchcitylist {
				width:100%;
				height:44%;
			}
			
			.infopage {
				position:absolute;
				top:0px;
				right:0.9%;
				width:82%;
				height:100%;
				background:#DBEAF9;
			}
			
			.citypage {
				position:absolute;
				top:0px;
				left:0;
				width:30%;
			}
			
			.districtinfo {
				position:absolute;
				top:55%;
				right:0px;
				width:30%;
				height:44%;
			}
			
			.districtinfo table td{
				word-wrap:break-word;
			}
			
			.cityinfo {
				padding:0px;
				margin:0px;
				width:70%;
				position:absolute;
				top:0px;
				left:0%;
				height:100%
			}
			
			.cityinfo li{
				padding:0 0 5% 0;
			}
			
			.infopage .areapageli {
				height:44%;
				overflow:auto;
				position:absolute;
				top:55%;
				width:90%;
				margin:0px;
				padding-left:10px;
				padding-bottom:0px;
			}
			
			.areapage table{
				overflow:auto;
				padding:0px;
				margin:0px;
				width:93%;
			}
			
			.areapage {
				border:#EFEFEF;
				border-style:double;
			}
			
			.map {
				position:absolute;
				right:0px;
				top:0px;
				width:30%;
				height:50%;
			}
			
			.map img {
				position:absolute;
				right:0px;
				top:0px;
				width:100%;
				height:100%;
			}
			
			.user {
				position:absolute;
				right:35%;
				top:0px;
			}
			
			.banner {
				position:absolute;
				right:0;
				top:0;
				width:100%;
				height:100%;
			}
		</style>
	</head>
	<body>
		<div class="divcitylist">
			<ul class="citylist" id="list">
				<c:forEach items="${citylist }" var="city" >
					<c:if test="${city.parentCityId==0 }">
						<li class="city">
							<a class="hidden">${city.cityId }</a>
							<a class="cityname">${city.cityName }</a>
							<input type="button" class="opspread" value="展开"/>
							<input type="button" class="opputaway hidden" value="收起"/>	
						</li>
					</c:if>
				</c:forEach>
			</ul>
			<div class="searchcitylist">
				<input type="text"/>
				<input type="button" value="搜索城市" class="btnsearchcity"/>
				<input type="button" value="清空结果" class="clearsearchcity"/>
			</div>
		</div>
		<div class="infopage">
		
			<ul class="cityinfo hidden">
				<li>城市编号：<input type="text" /></li>
				<li>城市名称：<input type="text" /></li>
				<li>所属城市：<select>
						<option value="0">null</option>
						<c:forEach items="${citylist }" var="city">
							<option value="${city.cityId }">${city.cityName }</option>
						</c:forEach>
					</select>
				</li>
				<li>城市简介：<input type="text" /></li>
				<li><input type="button" class="saveupdatecity" value="保存修改"  /></li>
				<li>
					<form action="/city/addcitymap" method="post" enctype="multipart/form-data">
						<input name="cityId" id="cityId" type="hidden">
						<div class="filediv"><a>上传地图</a><input name="citymap" type="file"/></div>
	      				<input type="submit" value="保存地图" />
					</form>
				</li>
				<li class="areapageli">
					<div class="areapage">
						包含城区：
						<table rules="all" border="box">
						</table>
						<input class="btnaddareablock" value="新增城区" type="button"/>
						<input type="text" />
						<input class="btnsearcharea" type="button" value="搜索城区" />
					</div>
				</li>
			</ul>
			<div class="citypage">
				<form:form action="/city/add" method="post" modelAttribute="account">
					<table>
						<tr>
							<td>城市名：</td><td><input type="text" name="cityName"/></td>
						</tr>
						<tr>
							<td>父城市：</td>
							<td>
								<select>
									<option value ="0">null</option>
									<c:forEach items="${citylist }" var="city" >		
										<option value ="${city.cityId }">${city.cityName }</option>
									</c:forEach>
								</select>
							</td>
						</tr>
						<tr>
							<td>城市简介：</td><td><input type="text" name="remark"/></td>
						</tr>
					</table>
					<input type="submit" value="添加" />
				</form:form>
			</div>
			<div class="districtinfo hidden">
				<table>
					<tr>
						<td class="header">片区编号:</td><td><input type="text" readonly="readonly"/></td>
					</tr>
					<tr>
						<td class="header">片区名称:</td><td><input type="text" /></td>
					</tr>
					<tr>
						<td class="header">所属城区:</td>
						<td>
							<select>
								<option value = "0" selected="selected">null</option>					
								<c:forEach items="${arealist }" var="Area" >
									<option value ="${Area.areaId }">${Area.areaName }</option>	
								</c:forEach> 
							</select>  
						</td>
					</tr>
					<tr>
						<td class="header">片区简介:</td><td><input type="text" /></td>
					</tr>
				</table>
				<input class="buttonsavedis" type="button" value="保存">
				<input class="buttonadddis" type="button" value="添加">
				<input type="text" />
				<input class="buttonsearchdis" type="button" value="搜索地区">
				
				<form action="/district/adddistrictmap" method="post" enctype="multipart/form-data">
					<input name="disId" type="hidden">
      				<div class="divdismap"><a>选择地图</a><input name="dismap" type="file" /></div>
      				<input type="submit" />
   				</form>
   				
			</div>
			<div class="user">欢迎您，${user.userAccount } </div>
			<div class="map" >
				<img class="hidden"/>
				<div class="banner">
					<div class="b-list" style="width: 60px;">
						
					</div>
					<a class="bar-left" href="#">
						<em></em>
					</a>
					<a class="bar-right" href="#">
						<em></em>
					</a>
					<div class="b-img" style="width: 200%; left: -100%;">
						<c:forEach items="${citylist }" var="city">
							<c:if test="${city.parentCityId==0 }">
								<a style="background-image:url(/assets/image/${city.map })"></a>
							</c:if>
						</c:forEach>
					</div>
				</div>
			</div>
		
		</div>
	</body>
	<script type="text/javascript">
		$(function(){
			CITY.init();
		});
	</script>
</html>