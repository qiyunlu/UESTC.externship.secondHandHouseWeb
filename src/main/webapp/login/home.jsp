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
    	<div class="head-box">
 			<h2>易居二手房交易平台</h2>
        	<ul>
            	<li><a target="_top" href="#" onclick="addFavorite()"  title="将本站加入您的收藏夹">添加收藏</a></li>
                <c:if test="${user==null }">
		        	<li><a href="login.jsp" title="用户登录与注册">用户登录</a></li>
		        </c:if>
                
                <c:if test="${user!=null }">
        			<li><a href="#">欢迎您，${user.userAccount}</a></li>
        		</c:if>
            </ul>	
        </div>
        

        
        <div class="cont clearfix">
        	<!--标题-->
        	<div class="title clearfix">
                <img src="yiju3.jpg" alt="" class="yijuimg">
                <div class="choose">点击选择城市</div>
                <div class="choose-city" id="city"><a href="#">成都</a></div><i> </i>
                <div class="area-panel">
                	<div class="first-letter">
                    	<ul>
                        	<li><a href="#">A-E</a></li>
                            <li><a href="#">F-J</a></li>
                            <li><a href="#">K-O</a></li>
                            <li><a href="#">P-T</a></li>
                            <li><a href="#">U-Z</a></li>
                        </ul>
                    </div>
                 	<div class="change-city">
                    	<ul>
                        	<li onclick="change_city(this)"><a href="#">成都</a></li>
                            <li onclick="change_city(this)"><a href="#">重庆</a></li>
                        </ul>
                    </div>
                </div>
                
            </div>
            
            
            <!--子系统切换-->
        	<div class="subsystem clearfix">
            	<ul class="nav nav-pills" role="tablist">               	
                	<li class="">
                    	<a data-id="home_page">首页</a>
                    </li>
                    <li class="active">
                    	<a data-id="secondhand_house">二手房</a>
                    </li>
                    <li class="">
                    	<a data-id="rental_house">出租房</a>
                    </li>
                    <li class="">
                    	<a data-id="realestate_consulting">房产咨询</a>
                    </li>
                    <li class="">
                    	<a data-id="house_agent">房产经纪人</a>
                    </li>
                    <li class="">
                    	<a data-id="about_us">关于易居</a>
                    </li>
                </ul>
            </div>
	
    		<div id="home_page" class="panel left-box">
            	首页
            </div>
            
            
            <div id="secondhand_house" class="panel show left-box">
                <!--条件选择-->
                <div class="requirements">
                    <dl>
                        <dt>区域：</dt>
                        <dd>
                        	<a href="#">不限</a>
							<%
                            List<Area> area = fun.findAreaByCityName("null");
                            %>
                            
                            <%
                            for(Area areas : area) {
                            %>
                            <a href="#"><%=areas.getAreaName() %></a>
                            <%
                            }
                            %>
                        </dd>
                        
                        <dt>售价：</dt>
                        <dd>
                        	<a href="#">不限</a>
                            <a href="#">30万以下</a>
                            <a href="#">30-40万</a>
                            <a href="#">40-50万</a>
                            <a href="#">50-60万</a>
                            <a href="#">60-80万</a>
                            <a href="#">80-100万</a>
                            <a href="#">100-150万</a>
                            <a href="#">150万以上</a>
                        </dd>
                        
                        <dt>面积：</dt>
                        <dd>
                        	<a href="#">不限</a>
                            <a href="#">50平米以下</a>
                            <a href="#">50-70平米</a>
                            <a href="#">70-90平米</a>
                            <a href="#">90-120平米</a>
                            <a href="#">120-150平米</a>
                            <a href="#">150平米以上</a>
                        </dd>
                        
                        <dt>房型：</dt>
                        <dd>
                        	<a href="#">不限</a>
                            <a href="#">一室</a>
                            <a href="#">二室</a>
                            <a href="#">三室</a>
                            <a href="#">四室</a>
                            <a href="#">五室</a>
                            <a href="#">五室以上</a>
                        </dd>
                        
                        <dt>环线：</dt>
                        <dd>
                        	<a href="#">不限</a>
                            <%
                            List<RoundLine> line = fun.findRoundNameByCityName("null");
                            %>
                            
                            <%
                            for(RoundLine lines : line) {
                            %>
                            <a href="#"><%=lines.getRoundName() %></a>
                            <%
                            }
                            %>
                        </dd>
                        
                        <dt>地铁：</dt>
                        <dd>
                        	<a href="#">不限</a>
                            <%
                            List<Subway> subway = fun.findSubwayNameByCityName("null");
                            %>
                            
                            <%
                            for(Subway subways : subway) {
                            %>
                            <a href="#"><%=subways.getSubwayName() %></a>
                            <%
                            }
                            %>
                        </dd>
                    </dl>
                    
                    <!--房屋类型-->
                    <div class="house-kind">
                    	<b>房屋类型：</b>
                        <select class="choose-style" name="select" id="select_k1" value="">
                        	<option value="null">----- 请选择 -----</option>
                            <option value="住宅">住宅</option>
                            <option value="别墅">别墅</option>
                            <option value="商住">商住</option>
                            <option value="商铺">商铺</option>
                        </select>
                        <input type="text"  id="searchCondition" name="search" maxlength="100" autocomplete="off" placeholder="      请输入房源特征、小区名或地名  " class="input-style"/>
                        <input type="button" id="btn-find" class="btn btn-sm btn-primary" value="&nbsp查&nbsp&nbsp&nbsp&nbsp询&nbsp" onclick="check(1)"/>
                      
                    </div>
                </div>
                
                <!--房源展示-->
                <div class="show-box">
                    <div class="show-way" id="sort-house">
                    	<ul class="nav nav-tabs" role="tablist">
                            <li class="active" onclick="switch_active(this)">
                                <a data-id="all">全部房源</a>
                            </li>
                            <li class="" onclick="switch_active(this)">
                                <a data-id="great">优质房源</a>
                            </li>
                            <li class="" onclick="switch_active(this)">
                                <a data-id="urgent">急售房源</a>
                            </li>
                            <li class="" onclick="switch_active(this)">
                                <a data-id="new">新增房源</a>
                            </li>
                        </ul>
                        <div class="sort">
                            <input type="button" class="btn btn-sm btn-primary" name="square" value="按面积排序" />
                            <input type="button" class="btn btn-sm btn-primary" name="sum_price" value="按总价排序" />
                            <input type="button" class="btn btn-sm btn-primary" name="ave_price" value="按均价排序" />
                        </div>
                        
                    </div>
                    
                    <!--这里应该是由上面的li传值到后端，用SQL语句返回不同的排序方式-->
                    <div class="house-show">
                    	<ul class="clearfix">
                        	<%
							List<House> house = fun.findByHouseType("null");
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
                </div>
        	</div>
            
            <div id="rental_house" class="panel left-box">
            	出租房
            </div>
            
            <div id="realestate_consulting" class="panel left-box">
            	房产咨询
            </div>
            
            <div id="house_agent" class="panel left-box">
            	房产经纪人
            </div>
            
            <div id="about_us" class="panel left-box">
            	关于易居
            </div>
            
            <div class="right-box">
                <!--ad-->
                <div class="advertisement" id="banner">
                    <div id="banner_bg"></div><!--标题背景-->
                    <div id="banner_info"></div><!--标题-->
                    <ul>
                        <li class="on">1</li>
                        <li>2</li>
                        <li>3</li>
                        <li>4</li>
                    </ul>
                    <div id="banner_list">
                        <a href="#" target="_blank"><img src="ex1.png"/></a>
                        <a href="#" target="_blank"><img src="ex2.jpg"/></a>
                        <a href="#" target="_blank"><img src="ex3.jpg"/></a>
                        <a href="#" target="_blank"><img src="ex4.jpg"/></a>
                    </div>
                </div>
                   
                <div class="consult clearfix">
                    <a href="newsList.jsp?type=公司新闻" class="more">更多</a>
                    <%
					List<Information> gsxwlist = fun.findByInforTextType("公司新闻");
					//Collections.reverse(gsxwlist);
					%>
                    <h4>公司新闻</h4>
                    
                    <ul class="info-list">
                    <% 
					count = 0;
					for(Information infor : gsxwlist) {
						if(count >= 5) {
							break;
						}
					%>
                        <li><a href="newsDetail.jsp?inforId=<%=infor.getInforID() %>" class=""><%=infor.getInforTitle() %>  <%=infor.getInforPublicDate() %></a></li>
                    <%
					count++;
					}
					%>
                    </ul>
                </div>
                    
                <div class="trends clearfix ">
                	<a href="newsList.jsp?type=市场动态" class="more">更多</a>
					<%
					List<Information> scdtlist = fun.findByInforTextType("市场动态");
					//Collections.reverse(scdtlist);
					%>
                     <h4>市场动态</h4>
				
                     <ul class="info-list">
                     	<% 
						count = 0;
						for(Information infor : scdtlist) {
							if(count >= 5) {
								break;
							}
						%>
                        <li><a href="newsDetail.jsp?inforId=<%=infor.getInforID() %>" class=""><%=infor.getInforTitle() %>  <%=infor.getInforPublicDate() %></a></li>
                        <%
						count++;
						}
						%>
                     </ul>
                </div>
             
            </div>
            
        </div>
        
        
<!--         在线咨询 -->
<!--         	<div class="right-window"> -->
<!--             	<a href="#"><img src="publish.png" alt=""></a> -->
<!--             </div> -->
            
<!--             房屋对比 -->
<!--             <div class="compare"> -->
<!--             	<div class="compare-head"><span>房源对比</span></div> -->
<!--             	<ul> -->
<!--                 	<li><a href="#"></a></li> -->
<!--                     <li><a href="#"></a></li> -->
<!--                 </ul> -->
<!--             </div> -->
        
        <script src="http://libs.baidu.com/jquery/2.0.0/jquery.js"></script>
		<script type="text/javascript">
		function check(index) {
			var searchCondition = $('#searchCondition').val();
			 window.location.href="searchResult.jsp?searchCondition="+searchCondition; 
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
   