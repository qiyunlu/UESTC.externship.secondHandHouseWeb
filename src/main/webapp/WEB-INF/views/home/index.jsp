<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="zh-CN">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
		<title>我的首页  微博-随时随地发现新鲜事</title>
		<!-- 新 Bootstrap 核心 CSS 文件 -->
		<link rel="stylesheet" href="//cdn.bootcss.com/bootstrap/3.3.5/css/bootstrap.min.css">
		
		<!-- 可选的Bootstrap主题文件（一般不用引入） -->
		<link rel="stylesheet" href="//cdn.bootcss.com/bootstrap/3.3.5/css/bootstrap-theme.min.css">
		
		<!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
		<script src="//cdn.bootcss.com/jquery/1.11.3/jquery.min.js"></script>
		
		<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
		<script src="//cdn.bootcss.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
		
		<script src="/assets/js/weibo.js"></script>
		
		<style type="text/css">
			body{
				background: #0e3c6e;
			}
			.weibo, .info {
				border-radius: 4px;
				background: #071a37;
			}
			.content {
				margin: 10px 0;
				padding: 16px 5px 5px 80px;
				position: relative;
				color: #fff;
			}
			.weibo dl dt, .weibo dl dd {
				padding: 5px 0;
			}
			.weibo .h{

				position: absolute;
				top: 20px;
				left: 20px;
				border-radius: 50%;
			}
			.weibo .foot ul {
				list-style: none;
				margin: 0;
			}
			.weibo .foot ul li {
				float: left;
				width: 45%;
				text-align: center;
				height: 30px;
				line-height: 30px;
			}
			.weibo .foot {
				border-top: 1px solid #162e4f;
			}
			.first {
				border-right: 1px solid #162e4f;
			}
			.info .h {
				left: 100px;
				top:60px;
				
			}
			.info .content {
				height: 80px;
				padding: 20px 0;
			}
			.info .foot {
				height: 80px;
				padding: 20px 0 0 0;
			}
			.info .foot ul {
				padding: 0 20px;
			}
			.info .foot ul li {
				height: 20px;
				line-height: 20px;
				text-align:center;
				width: 70px;
				border-left: 1px solid #162e4f;
			}
			.info .foot ul li.first {
				border: none;
			}
			.info .foot p {
				text-align: center;
				color: #257cde;
			}
			.pi {
				height: 50px;
				line-height: 50px;
				text-align: center;
			}
			.pi a {
				text-decoration: none;
				cursor: pointer;
				border: 1px solid #257cde;
				margin: 2px 10px;
				padding: 5px 8px;
			}
		</style>
	</head>
	<body>

		<div class="container center-block">
			  <div class="row">
			  	<div class="col-md-2"></div>
			    <div class="col-md-7">
			    	<div class="top">
			    		<textarea rows="5" cols="100" id="content" name="content"></textarea>
			    		<input type="button" id="send" value="发送"/>
			    	</div>
			    </div>
			    <div class="col-md-3"></div>
			  </div>
			  <div class="row">
			  	<div class="col-md-2"></div>
			    <div class="col-md-7">
			    	
			    	<div id="list" class="list">
			    		<c:forEach items="${pi.list }" var="w">
			    		<div class="weibo">
			    			<div class="content">
				    			<img class="h" alt="${w.account.name }" src="/assets/image/${w.account.pic }" />
				    			<dl>
				    				<dt><a href="#">${w.account.name }</a></dt>
				    				<dd><i><fmt:formatDate value="${w.wdatetime}" pattern="yyyy-MM-dd HH:mm:ss"/></i></dd>
				    				<dd>
				    					<p>${w.content }</p>
				    				</dd>
				    			</dl>
			    			</div>
			    			<div class="foot">
			    				<ul class="clearfix">
			    					<li class="first"><a href="javascript:void(0);">评论(${w.comment })</a></li>
			    					<li><a href="javascript:void(0);">赞(${w.liked })</a></li>
			    				</ul>
			    			</div>
			    		</div>
			    		</c:forEach>
			    		
			    	</div>
			    	<div class="pi">
			    		<c:if test="${pi.current > 1 }">
			    			<a href="${pi.current -1 }">上一页</a>
			    		</c:if>
			    		<c:if test="${pi.current < pi.total }">
			    			<a href="${pi.current + 1 }">下一页</a>
			    		</c:if>
			    	</div>
			    </div>
				<div class="col-md-3">
					<div class="weibo info">
						<div class="content">
			    			<img class="h" src="/assets/image/${sessionScope.account.pic }" />
		    			</div>
		    			<div class="foot">
		    				<p>${sessionScope.account.name }</p>
		    				<ul class="clearfix">
		    					<li class="first"><a href="/follow">关注${sessionScope.account.follow }</a></li>
		    					<li><a href="/fans">粉丝${sessionScope.account.fans }</a></li>
		    					<li><a href="/u/${sessionScope.account.accountId }/">微博${sessionScope.account.weibo }</a></li>
		    				</ul>
		    			</div>
					</div>
				</div>
			  </div>
		</div>
		
	</body>
	<script type="text/javascript">
		$(function(){
			WEIBO.init();
		});
	</script>
</html>