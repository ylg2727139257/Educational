<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@	taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@	include file="stuNoLogin.jsp" %>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
<meta charset="UTF-8">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
<meta name="renderer" content="webkit">
<link rel="stylesheet" href="css/pintuer.css">
<link rel="stylesheet" href="css/admin.css">
<script src="js/jquery.js"></script>
<script src="js/pintuer.js"></script>
<style>
#ss{position:relative;}
#ssa{position: absolute;left:310%;top:0%;width:35%;height:100%;}
#mk{color:orange;font-size:30px;}
.hh{font-size: 30px;}
</style>
</head>
<body>
<form method="post" action="${pageContext.request.contextPath }/elective.action" id="listform">
  <div class="panel admin-panel">
  <div class="panel admin-panel">
    <div class="panel-head"><strong class="icon-reorder">  选  修  课  程  </strong>
    </div>
    <div class="padding border-bottom">
      <ul class="search" style="padding-left:10px;">
      <li class="hh"><font color="blue">  可  选  课  程  </font></li>
      <li>
    	<select class="input" onchange="changesearch(this)" style="width:60px;
    	line-height:17px; display:inline-block">
         <option selected>  排  序  </option>
         <option value="cid">  序  号  </option>
         <option value="credit">  学  分  </option>
         <option value="cname">  课  程  </option>
         <option value="curr">  已  选  人  数  </option>
        </select>
      </li>
      <li id="ss">
         <input type="text" placeholder="请输入搜索关键字" name="cname" class="input" 
         style="width:250px;margin:0 210%; line-height:17px;display:inline-block;"
         value="${LIKEELECT }" />
         <input type="submit" id="ssa" class="button border-main icon-search" value="搜索"/></li>
      </ul>
    </div>
    <table class="table table-hover text-center">
      <tr>
        <th style="text-align:left; padding-left:2%;">  序  号  </th>
        <th>  课  程  </th>
        <th>  学  分  </th>
        <th>  教  师  </th>
        <th>  人  数  </th>
        <th>  备  注  </th>
        <th >  操  作  </th>
      </tr>
      <c:if test="${empty PAGEINFO.list }">
      	<tr>
      	 <td colspan="9"><div id="mk">  抱  歉  ，  暂  无  课  程  信  息  ！  </div></td>
      	 </tr>
      </c:if>
		<c:forEach items="${PAGEINFO.list }" var="item">
	        <tr>
	          <td>${item.cid }</td>
	          <td><font color="#00CC99">${item.cname }</font></td>
	          <td><font color="#00CC99">${item.credit }</font></td>
	          <td><font color="#00CC99">${item.teacher.tname }</font></td>
	          <td><font color="#00CC99">${item.curr}</font>/${item.cmax}</td>
	          <td>    </td>
	          <td><div class="button-group"><a class="button border-main" 
	          onclick="dx(${item.cid})">
	          <span class="icon-edit"></span>  选  课  </a></div></td>
	        </tr>
        </c:forEach>
      <tr>
        <td colspan="9"><div class="pagelist">
        	 当前第   <font color="purple"> ${PAGEINFO.pageNum }</font>    页，共      <font color="purple">${PAGEINFO.pages }</font>    页。 
        </div></td>
      </tr>
      <tr>
        <td colspan="9"><div class="pagelist">
        <a href="${pageContext.request.contextPath }/elective.action?page=1">  首  页  </a>
        <a href="${pageContext.request.contextPath }/elective.action?page=${PAGEINFO.pageNum<=1 ? 1 : PAGEINFO.pageNum-1 }">  上  一  页  </a>
        <a href="${pageContext.request.contextPath }/elective.action?page=${PAGEINFO.pageNum>=PAGEINFO.pages ? PAGEINFO.pages : PAGEINFO.pageNum+1 }">  下  一  页  </a>
        <a href="${pageContext.request.contextPath }/elective.action?page=${PAGEINFO.pages }">  尾  页  </a>
        </div></td>
      </tr>
     </table>
     </div>
     <div class="panel admin-panel">
      <div class="padding border-bottom">
      <ul class="search" style="padding-left:10px;">
      <li class="hh"><font color="blue">  不  可  选  课  程  </font></li>
       </ul>
    </div>
    <table class="table table-hover text-center">
      <tr>
        <th style="text-align:left; padding-left:2%;">  序  号  </th>
        <th>  课  程  </th>
        <th>  学  分  </th>
        <th>  教  师  </th>
        <th>  人  数  </th>
        <th>  备  注  </th>
        <th >  操  作  </th>
      </tr>
      <c:if test="${empty COURSES0 and empty COURSES1 }">
      	<tr>
      	 <td colspan="9"><div id="mk">  抱  歉  ，  暂  无  课  程  信  息  ！  </div></td>
      	 </tr>
      </c:if>
		<c:forEach items="${COURSES0 }" var="item">
	        <tr>
	          <td>${item.cid }</td>
	          <td><font color="#00CC99">${item.cname }</font></td>
	          <td><font color="#00CC99">${item.credit }</font></td>
	          <td><font color="#00CC99">${item.teacher.tname }</font></td>
	          <td><font color="#00CC99">${item.curr }</font>/${item.cmax }</td>
	          <td>    </td>
	          <td><div class="button-group">  已  选  </div></td>
	        </tr>
        </c:forEach>
		<c:forEach items="${COURSES1 }" var="item">
	        <tr>
	          <td>${item.cid }</td>
	          <td><font color="#00CC99">${item.cname }</font></td>
	          <td><font color="#00CC99">${item.credit }</font></td>
	          <td><font color="#00CC99">${item.teacher.tname }</font></td>
	          <td><font color="#00CC99">${item.curr }</font>/${item.cmax }</td>
	          <td>    </td>
	          <td><div class="button-group">  已  满  员  </div></td>
	        </tr>
        </c:forEach>
	        <tr><td colspan="9"></td></tr>

    </table>
    <br/>
    <br/>
    </div>
    </div>
</form>
<script>
function changesearch(curr){
	location.href="${pageContext.request.contextPath }/elective.action?cnote=" + curr.value;
}	
function dx(cid){
	location.href="${pageContext.request.contextPath }/insertElect.action?cid=" + cid;
}
</script>
</body>
</html>