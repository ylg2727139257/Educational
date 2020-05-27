<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@	taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
<meta charset="UTF-8">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
    <meta name="renderer" content="webkit">
    <title>教务管理中心</title>  
    <link rel="stylesheet" href="css/pintuer.css">
    <link rel="stylesheet" href="css/admin.css">
    <script src="js/jquery.js"></script>
    <style>
	.leftnav{height:80%;}
    
    </style>
</head>
<body style="background-color:#f2f9fd;">
<div class="header bg-main">
  <div class="logo margin-big-left fadein-top">
    <h1><img src="images/y.jpg" class="radius-circle rotate-hover" height="50" alt="" />教务管理中心</h1>
  </div>
  <div class="head-l">
  <a class="button button-little bg-green" href="teaIndex.jsp">
  <span class="icon-home"></span>  首  页/通  知  </a> &nbsp;&nbsp;
  <a class="button button-little bg-red" href="${pageContext.request.contextPath }/exit.action">
  <span class="icon-power-off"></span>  登  录/退  出  </a></div>
</div>
<div class="leftnav">
  <div class="leftnav-title"><strong><span class="icon-list"></span>菜单列表</strong></div>
  <h2><span class="icon-user"></span>  基  本  设  置  </h2>
  <ul style="display:block">
    <li><a href="message.jsp" target="right"><span class="icon-caret-right"></span>  教  务  通  知  </a></li>
    <li><a href="teaInfo.jsp" target="right"><span class="icon-caret-right"></span>  个  人  信  息  </a></li>
    <li><a href="teaModify.jsp" target="right"><span class="icon-caret-right"></span>  修  改  密  码  </a></li>
    <li><a href="${pageContext.request.contextPath }/teaCourse.action" target="right"><span class="icon-caret-right"></span>  课  程  信  息  </a></li>
  </ul>
  <h2><span class="icon-pencil-square-o"></span>  信  息  管  理  </h2>
  <ul>
    <li><a href="${pageContext.request.contextPath }/adminStu.action" target="right">
    	<span class="icon-caret-right"></span>  学  生  管  理  </a></li>
    <li><a href="${pageContext.request.contextPath }/adminTea.action" target="right"><span class="icon-caret-right">
    	</span>  教  师  管  理  </a></li>
    <li><a href="${pageContext.request.contextPath }/adminCour.action" target="right"><span class="icon-caret-right">
    	</span>  课  程  管  理  </a></li>        
    <li><a href="message.jsp" target="right"><span class="icon-caret-right">
    	</span>  通  知  管  理  </a></li>        
  </ul>   
</div>
<script type="text/javascript">
$(function(){
  $(".leftnav h2").click(function(){
	  $(this).next().slideToggle(200);	
	  $(this).toggleClass("on"); 
  })
  $(".leftnav ul li a").click(function(){
	    $("#a_leader_txt").text($(this).text());
  		$(".leftnav ul li a").removeClass("on");
		$(this).addClass("on");
  })
});
</script>
<ul class="bread">
  <li><a id="a_leader_txt"  class="icon-home">教务通知</a></li>
  <li><span style="color:red;">${TEACHER.tname }<b>老师， 你好！</b></span>
</ul>
<div class="admin">
  <iframe scrolling="auto" rameborder="0" src="message.jsp" name="right" width="100%" height="99%"></iframe>
</div>
</body>
</html>