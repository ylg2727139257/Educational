<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@	taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@	include file="teaNoLogin.jsp" %>
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
#ssa{position: absolute;left:330%;top:0%;width:35%;height:100%;}
.sc{width:15%;text-align:center;color:red;}
#mk{color:orange;font-size:30px;}
</style>
</head>
<body>
<form method="post" action="${pageContext.request.contextPath }/teaSlist.action" id="listform">
  <div class="panel admin-panel">
    <div class="panel-head"><strong class="icon-reorder">  学  生  信  息  </strong>
    </div>
    <div class="padding border-bottom">
      <ul class="search" style="padding-left:10px;">
      <li>
    	<select class="input" onchange="changesearch(this)" style="width:60px;
    	line-height:17px; display:inline-block">
         <option selected>  排  序  </option>
         <option value="sid">  学  号  </option>
         <option value="sname">  姓  名  </option>
         <option value="score">  成  绩  </option>
         <option value="age">  年  龄  </option>
        </select>
      </li>
       <li  id="ss">
          <input type="text" placeholder="请输入搜索关键字" name="sname" class="input" 
          style="width:250px;margin:0 230%; line-height:17px;display:inline-block;"
          value="${LIKETSLIST }" />
          <input type="submit" id="ssa" class="button border-main icon-search" value="搜索"/></li>
      </ul>
    </div>
    <table class="table table-hover text-center">
      <tr>
        <th style="text-align:left; padding-left:2%;">  学  号  </th>
        <th width="10%">  姓  名  </th>
        <th>  性  别  </th>
        <th>  年  龄  </th>
        <th>  地  址  </th>
        <th>  电  话  </th>
        <th width="10%">  邮  箱  </th>
        <th>成  绩  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        	&nbsp;&nbsp;&nbsp;&nbsp;评  估 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</th>
      </tr>
	      <c:if test="${empty SEPAGEINFO.list }">
		     <tr>
	      	 <td colspan="9"><div id="mk">  抱  歉  ，  暂  无  学  生  信  息  ！  </div></td>
	      	 </tr>
	      </c:if>
		<c:forEach items="${SEPAGEINFO.list }" var="item">
	        <tr>
	          <td>${item.sid }</td>
	          <td><font color="#00CC99">${item.sname }</font></td>
	          <td width="10%">${item.sex }</td>
	          <td>${item.age }</td>
	          <td>${item.address }</td>
	          <td><font color="#00CC99">${item.phone }</font></td>
	          <td><font color="#00CC99">${item.email }</font></td>
	          <td><input name="score" class="sc" 
	          value="${item.elect.score==0.0 ? '- -' : item.elect.score }"/>
	          	&nbsp;&nbsp;<div class="button-group"><a class="button border-main" 
	          onclick="dx(this,${item.sid },${item.elect.cid })">
	          <span class="icon-edit"></span>  确  认  评  分  </a></div></td>
	        </tr>
        </c:forEach>
      <tr>
        <td colspan="10"><div class="pagelist">
        	 当前第   <font color="purple"> ${SEPAGEINFO.pageNum }</font>    页，共      <font color="purple">${SEPAGEINFO.pages }</font>    页。 
        </div></td>
      </tr>
      <tr>
        <td colspan="9"><div class="pagelist">
        <a href="${pageContext.request.contextPath }/teaSlist.action?page=1">  首  页  </a>
        <a href="${pageContext.request.contextPath }/teaSlist.action?page=${pageNum=SEPAGEINFO.pageNum<=1 ? 1 : SEPAGEINFO.pageNum-1 }">  上  一  页  </a>
        <a href="${pageContext.request.contextPath }/teaSlist.action?page=${pageNum=SEPAGEINFO.pageNum>=SEPAGEINFO.pages ? SEPAGEINFO.pages : SEPAGEINFO.pageNum+1 }">  下  一  页  </a>
        <a href="${pageContext.request.contextPath }/teaSlist.action?page=${pageNum=SEPAGEINFO.pages }">  尾  页  </a>
        </div></td>
      </tr>
    </table>
  </div>
</form>
<script>
function changesearch(curr){
	location.href="${pageContext.request.contextPath }/teaSlist.action?cnote=" + curr.value;
}
var score=document.getElementsByName("score");
for(var i=0;i<score.length;i++){
	score[i].onkeydown=function(ev){
		var charcode=String.fromCharCode(ev.keyCode);
			if(charcode>="0"&&charcode<="9"||ev.keyCode==8||ev.keyCode==37||ev.keyCode==39||ev.keyCode==190){
				if(score[i].value.length>=4){
					return false;
				}
				return true;
			}
		return false;
	}
}
function dx(curr,sid,cid){
	var score=curr.parentElement.previousElementSibling.value;
	location.href="${pageContext.request.contextPath }/teaUE.action?score=" 
		+ score +"&sid=" + sid + "&cid=" + cid;
}
</script>
</body>
</html>