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
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0,
 user-scalable=no" />
<meta name="renderer" content="webkit">
<link rel="stylesheet" href="css/pintuer.css">
<link rel="stylesheet" href="css/admin.css">
<script src="js/jquery.js"></script>
<script src="js/pintuer.js"></script>
<style>
	#ss{position:relative;}
	#ssa{position: absolute;left:330%;top:0%;width:35%;height:100%;}
	#mk{color:orange;font-size:30px;}
</style>
</head>
<body>
<form method="post" action="${pageContext.request.contextPath }/required.action" id="listform">
<div class="panel admin-panel">
  <div class="panel-head"><strong class="icon-reorder">  必  修  课  程  </strong></div>
 <div class="padding border-bottom">
     <ul class="search" style="padding-left:10px;">
      <li>
    	<select class="input" onchange="changesearch(this)" style="width:60px;
    		line-height:17px; display:inline-block">
         <option selected>  排  序  </option>
         <option value="cid">  序  号  </option>
         <option value="credit">  学  分  </option>
         <option value="cname">  课  程  </option>
        </select>
      </li>
      <li id="ss">
         <input type="text" placeholder="请输入搜索关键字" name="cname" class="input" 
         style="width:250px;margin:0 230%; line-height:17px;display:inline-block;"
         value="${LIKEREQ }" />
         <input type="submit" id="ssa" class="button border-main icon-search" value="搜索"/></li>
     </ul>
    </div>
  <table class="table table-hover text-center">
     <tr>
      <th width="10%">  序  号  </th>
      <th width="20%">  课  程  </th>
      <th width="15%">  学  分  </th>
      <th width="20%">  教  师  </th>
      <th width="15%">  备  注  </th>
    </tr>
    <c:if test="${empty COURSES.list }">
      	<tr>
      	 <td colspan="5"><div id="mk">  抱  歉  ，  暂  无  课  程  信  息  ！  </div></td>
      	 </tr>
      </c:if>
   	<c:forEach items="${COURSES.list }" var="item">
	    <tr>
	      <td>${item.cid }</td>
	      <td><font color="#00CC99">${item.cname }</font></td>
	      <td><font color="#00CC99">${item.credit }</font></td>
	      <td><font color="#00CC99">${item.teacher.tname }</font></td>
	      <td></td>
	    </tr> 
    </c:forEach>
	     <tr>
        <td colspan="5"><div class="pagelist">
        	 当前第   <font color="purple"> ${COURSES.pageNum }</font>    页，共      <font color="purple">${COURSES.pages }</font>    页。 
        </div></td>
      </tr>
      <tr>
        <td colspan="5"><div class="pagelist">
        <a href="${pageContext.request.contextPath }/required.action?page=1">  首  页  </a>
        <a href="${pageContext.request.contextPath }/required.action?page=${COURSES.pageNum<=1 ? 1 : COURSES.pageNum-1 }">  上  一  页  </a>
        <a href="${pageContext.request.contextPath }/required.action?page=${COURSES.pageNum>=COURSES.pages ? COURSES.pages : COURSES.pageNum+1 }">  下  一  页  </a>
        <a href="${pageContext.request.contextPath }/required.action?page=${COURSES.pages }">  尾  页  </a>
        </div></td>
      </tr>
  </table>
</div>
</form>
<script>
	function changesearch(curr){
		location.href="${pageContext.request.contextPath }/required.action?cnote=" + curr.value;
	}
</script>
</body>
</html>