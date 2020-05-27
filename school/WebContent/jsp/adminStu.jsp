<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@	taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@	include file="adminNoLogin.jsp" %>
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
#ssa{position: absolute;left:300%;top:0%;width:35%;height:100%;}
.sc{width:15%;text-align:center;color:red;}
#mk{color:orange;font-size:30px;}
</style>
</head>
<body>
<form method="post" action="${pageContext.request.contextPath }/adminStu.action" id="listform">
  <div class="panel admin-panel">
    <div class="panel-head"><strong class="icon-reorder">  学  生  管  理  </strong>
    </div>
    <div class="padding border-bottom">
      <ul class="search" style="padding-left:10px;">
      <li><a class="button border-main icon-plus-square-o" href="adminSIN.jsp">增加学生</a></li>
      <li>
    	<select class="input" onchange="changesearch(this)" style="width:60px;
    	line-height:17px; display:inline-block">
         <option selected>  排  序  </option>
         <option value="sid">  学  号  </option>
         <option value="sname">  姓  名  </option>
         <option value="credit">  学  分  </option>
         <option value="age">  年  龄  </option>
        </select>
      </li>
       <li  id="ss">
          <input type="text" placeholder="请输入搜索关键字" name="sname" class="input" 
          style="width:250px;margin:0 200%; line-height:17px;display:inline-block;" 
          value="${LIKEAS }" />
          <input type="submit" id="ssa" class="button border-main icon-search" value="搜索"/></li>
      </ul>
    </div>
    <table class="table table-hover text-center">
      <tr>
        <th style="text-align:left; padding-left:2%;">  学  号  </th>
        <th width="10%">  姓  名  </th>
        <th>  密  码  </th>
        <th>  性  别  </th>
        <th>  年  龄  </th>
        <th>  地  址  </th>
        <th>  电  话  </th>
        <th width="10%">  邮  箱  </th>
        <th>  学  分  </th>
        <th width="310">  操  作  </th>
      </tr>
      <c:if test="${empty ASPAGEINFO.list }">
	     <tr>
      	 <td colspan="10"><div id="mk">  抱  歉  ，  暂  无  学  生  信  息  ！  </div></td>
      	 </tr>
      </c:if>
		<c:forEach items="${ASPAGEINFO.list }" var="item">
	        <tr>
	          <td><font color="#00CC99">${item.sid }</font></td>
	          <td><font color="#00CC99">${item.sname }</font></td>
	          <td><font color="#00CC99">${item.skey }</font></td>
	          <td width="10%">${item.sex }</td>
	          <td>${item.age }</td>
	          <td>${item.address }</td>
	          <td><font color="#00CC99">${item.phone }</font></td>
	          <td><font color="#00CC99">${item.email }</font></td>
	          <td><font color="#00CC99">${item.credit }</font></td>
	          <td><div class="button-group"> <a class="button border-main" 
	          href="${pageContext.request.contextPath }/findAS.action?sid=${item.sid }"><span class="icon-edit"></span> 修改</a> 
	          <a class="button border-red" href="${pageContext.request.contextPath }/deleteStudent.action?sid=${item.sid }" 
	          onclick="return del(1,1,1)"><span class="icon-trash-o"></span> 删除</a></div>
	          	&nbsp;&nbsp;</td>
	        </tr>
        </c:forEach>
      <tr>
        <td colspan="10"><div class="pagelist">
        	 当前第   <font color="purple"> ${ASPAGEINFO.pageNum }</font>    页，共      <font color="purple">${ASPAGEINFO.pages }</font>    页。 
        </div></td>
      </tr>
      <tr>
        <td colspan="10"><div class="pagelist">
        <a href="${pageContext.request.contextPath }/adminStu.action?page=1">  首  页  </a>
        <a href="${pageContext.request.contextPath }/adminStu.action?page=${pageNum=ASPAGEINFO.pageNum<=1 ? 1 : ASPAGEINFO.pageNum-1 }">  上  一  页  </a>
        <a href="${pageContext.request.contextPath }/adminStu.action?page=${pageNum=ASPAGEINFO.pageNum>=ASPAGEINFO.pages ? ASPAGEINFO.pages : ASPAGEINFO.pageNum+1 }">  下  一  页  </a>
        <a href="${pageContext.request.contextPath }/adminStu.action?page=${pageNum=ASPAGEINFO.pages }">  尾  页  </a>
        </div></td>
      </tr>
    </table>
  </div>
</form>
<script>
function changesearch(curr){
	location.href="${pageContext.request.contextPath }/adminStu.action?cnote=" + curr.value;
}
function del(id,mid,iscid){
	if(confirm("您确定要删除吗?")){
		return true;
	}
	return false;
}
</script>
</body>
</html>