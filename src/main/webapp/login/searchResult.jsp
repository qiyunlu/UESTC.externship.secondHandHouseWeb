<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<%@page import="com.hwadee.SecondHandHouse.*"%>
<%@page import="java.util.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width,initial-scale=1">
        <title>居间业务管理系统前台</title>
        
        <link rel="stylesheet" type="text/css" href="live_pro.css">
        <link rel="stylesheet" type="text/css" href="bootstrap.css">
        
        <link rel="stylesheet" href="http://netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css">
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
    
    <body>
    	<%
        JDBCFunction fun = new JDBCFunction();
        int count = 0;
        %>
                    <!--这里应该是由上面的li传值到后端，用SQL语句返回不同的排序方式-->
                    <div class="house-show">
                    	<ul class="clearfix">
                        	<%
                        	String searchCondition = request.getParameter("searchCondition");
							List<House> house = fun.findByHouseType(searchCondition);
							%>
                            <%
							for(House houses : house) {
							%>
                            <li>
                            	<a href="/login/houseDetail.jsp?houseID=<%=houses.getHouseID() %>"><img src="kunxi.jpg" data-src="holder.js/200x200" class="img-thumbnail" alt="200x200" style="width: 160px; height: 160px;"></a>
                                
                                <div class="house-information">
                                	<ul>
                                        <li>标　　题：<a href="#"><%=houses.getHouseTitle() %></a></li>
		                    			<li>楼盘名称：<a href="#"><%=houses.getHouseAddress() %></a></li>
		                    			<li>房屋信息：<a href="#"><%=houses.getHouseSituation() %></a></li>
		                    			<li>经 纪 人：<a href="#"><%=houses.getHouseManager() %></a></li>
                                    </ul>
                                </div>
                                <div class="square-box">
                                	<span><%=houses.getHouseMeasurement() %></span>
                                    <span>平方米</span>
                                </div>
                                <div class="price-box">
                                	<div><%=houses.getHouseTotalPrice() %>万</div>
                                	<div class="unit-price">单价：<span><%=houses.getHousePricePerM() %></span>元/平米</div>
                                </div>
                                <span class="check"><input type="checkbox" value="" /></span>
                            </li>
                            <%
							}
							%>
                        </ul>
                    </div>                   
                   
        <script src="http://libs.baidu.com/jquery/2.0.0/jquery.js"></script>
		<script type="text/javascript">
		function check(index) {
			var searchCondition = $('#searchCondition').val();
			
			//alert(searchCondition);
		}
		
		$(document).ready(function(){
				$('#btn-find').click(function(){
					var house_type = $('#select1[option=selected]').val();
				})
				
				$('#city').click(function(){
					$('.area-panel').toggle();
				})
				
				$("dd").children().click(function(){
					if($(this).prop("className")==="choosen"){
					$(this).removeClass("choosen");
					}
					else{
						$(this).addClass("choosen");
					}
				})
			})

		
		window.onload = function()
		{
			
			var subsystem = document.getElementsByClassName("subsystem");
			for(var i = 0; i < subsystem.length; i++)
			{
				init( subsystem[i] );
			}
			
		}
		
		function init( subsystem )
		{
		
			var li = subsystem.firstChild.nextSibling.childNodes;//获得li节点

			for(var i = 0;i < li.length; i++)
			{
				if(li[i].nodeName !== "LI")
				{
					continue;
				}
				li[i].onclick = function(change)
				{
					
					change.preventDefault();//取消原有操作
					if( this.className !== "active")
					{
						//遍历取消原有active类标签的active类
						resetli(this.parentNode.childNodes)
						
						var sys = this.parentNode.parentNode.parentNode.childNodes;
						for(var k = 0; k < sys.length; k++)
						{
							var panel = sys[k];
							if( panel.nodeName === "DIV" && panel.className === 

"panel show left-box" )
							{
								panel.className = "panel left-box";
								break;
							}
						}
						
						//将点击的标签的类变成active,相应的界面变成show
						var id = this.firstChild.nextSibling.getAttribute("data-id");
						this.className = "active";
						document.getElementById(id).className = "panel show left-box";	

				
					}
				}
			}
		}
		
		
		function resetli(li)
		{
			for(var i = 0;i < li.length; i++)
			{
				var t = li[i];
				if(t.className === "active" && t.nodeName === "LI")
				{
					t.className = "";
					break;
				}
			}
		}
		
		function addFavorite() 
		{
			var url = window.location;
			var title = document.title;
			//捕获加入收藏过程中的异常 
			try{
				//判断浏览器是否支持document.all 
				if (document.all) {
					try{
						//如果支持则用external方式加入收藏夹 
						window.external.addFavorite(url,title);
					}catch(e){
						alert('加入收藏夹失败，您的浏览器不支持，请按 Ctrl+D 手动收藏');
					}
				}
				//如果支持window.sidebar，则用下列方式加入收藏夹 
				else if (window.sidebar) {
					window.sidebar.addPanel(title, url, "");
				}
				else{
					alert('加入收藏夹失败，您的浏览器不支持，请按 Ctrl+D 手动收藏');
				}
			}
			//处理异常
			catch (e){          
		 		alert("加入收藏夹失败，请使用Ctrl+D快捷键进行添加操作!");     
		 	}
		}
		
		function switch_active(obj) {
			$("#sort-house").children().children(".active").removeClass("active");
			$(obj).addClass("active");
		}
		
		function change_city(obj) {
			var city = $(obj).html();
			$(".choose-city").html(city);
			$('.area-panel').hide();
		}
		
		var t = n =0, count;
		$(document).ready(function(){
			count=$("#banner_list a").length;
			$("#banner_list a:not(:first-child)").hide();
			$("#banner_info").html($("#banner_list a:first-child").find("img").attr('alt'));
			$("#banner_info").click(function(){
				window.open($("#banner_list a:first-child").attr('href'), "_blank")
			});
			$("#banner li").click(function() {
				var i = $(this).text() -1;//获取Li元素内的值，即1，2，3，4
				n = i;
				if (i >= count) return;
				$("#banner_info").html($("#banner_list a").eq(i).find("img").attr('alt'));
				$("#banner_info").unbind().click(function(){window.open($("#banner_list a").eq(i).attr('href'), "_blank")
				})
			$("#banner_list a").filter(":visible").fadeOut(500).parent().children().eq(i).fadeIn(1000);
			document.getElementById("banner").style.background="";
			$(this).toggleClass("on");
			$(this).siblings().removeAttr("class");
			});
			t = setInterval("showAuto()", 4000);
			$("#banner").hover(function(){clearInterval(t)}, function(){t = setInterval("showAuto()", 4000);});
		})
		
		function showAuto()
		{
		n = n >=(count -1) ?0 : ++n;
		$("#banner li").eq(n).trigger('click');
		}
        </script>
    </body>
</html>
   