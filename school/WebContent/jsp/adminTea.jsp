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
<form method="post" action="${pageContext.request.contextPath }/adminTea.action" id="listform">
  <div class="panel admin-panel">
    <div class="panel-head"><strong class="icon-reorder">  教  师  管  理  </strong>
    </div>
    <div class="padding border-bottom">
      <ul class="search" style="padding-left:10px;">
      <li><a class="button border-main icon-plus-square-o" href="adminTIN.jsp">增加教师</a></li>
      <li>
    	<select class="input" onchange="changesearch(this)" style="width:60px;
    	line-height:17px; display:inline-block">
         <option selected>  排  序  </option>
         <option value="tid">  编  号  </option>
         <option value="tname">  姓  名  </option>
         <option value="age">  年  龄  </option>
        </select>
      </li>
       <li  id="ss">
          <input type="text" placeholder="请输入搜索关键字" name="tname" class="input" 
          style="width:250px;margin:0 200%; line-height:17px;display:inline-block;"
          value="${LIKEAT }" />
          <input type="submit" id="ssa" class="button border-main icon-search" value="搜索"/></li>
      </ul>
    </div>
    <table class="table table-hover text-center">
      <tr>
        <th style="text-align:left; padding-left:2%;">  编  号  </th>
        <th width="10%">  姓  名  </th>
        <th>  密  码  </th>
        <th>  性  别  </th>
        <th>  年  龄  </th>
        <th>  电  话  </th>
        <th width="10%">  邮  箱  </th>
        <th width="310">  操  作  </th>
      </tr>
      <c:if test="${empty ATPAGEINFO.list }">
	     <tr>
      	 <td colspan="8"><div id="mk">  抱  歉  ，  暂  无  教  师  信  息  ！  </div></td>
      	 </tr>
      </c:if>
		<c:forEach items="${ATPAGEINFO.list }" var="item">
	        <tr>
	          <td><font color="#00CC99">${item.tid }</font></td>
	          <td><font color="#00CC99">${item.tname }</font></td>
	          <td><font color="#00CC99">${item.tkey }</font></td>
	          <td width="10%">${item.sex }</td>
	          <td>${item.age }</td>
	          <td><font color="#00CC99">${item.phone }</font></td>
	          <td><font color="#00CC99">${item.email }</font></td>
	          <td><div class="button-group"> <a class="button border-main" 
	          href="${pageContext.request.contextPath }/findAT.action?tid=${item.tid }"><span class="icon-edit"></span> 修改</a> 
	          <a class="button border-red" href="${pageContext.request.contextPath }/deleteTeacher.action?tid=${item.tid }" 
	          onclick="return del(1,1,1)"><span class="icon-trash-o"></span> 删除</a></div>
	          	&nbsp;&nbsp;</td>
	        </tr>
        </c:forEach>
      <tr>
        <td colspan="8"><div class="pagelist">
        	 当前第   <font color="purple"> ${ATPAGEINFO.pageNum }</font>    页，共      <font color="purple">${ATPAGEINFO.pages }</font>    页。 
        </div></td>
      </tr>
      <tr>
        <td colspan="8"><div class="pagelist">
        <a href="${pageContext.request.contextPath }/adminTea.action?page=1">  首  页  </a>
        <a href="${pageContext.request.contextPath }/adminTea.action?page=${pageNum=ATPAGEINFO.pageNum<=1 ? 1 : ATPAGEINFO.pageNum-1 }">  上  一  页  </a>
        <a href="${pageContext.request.contextPath }/adminTea.action?page=${pageNum=ATPAGEINFO.pageNum>=ATPAGEINFO.pages ? ATPAGEINFO.pages : ATPAGEINFO.pageNum+1 }">  下  一  页  </a>
        <a href="${pageContext.request.contextPath }/adminTea.action?page=${pageNum=ATPAGEINFO.pages }">  尾  页  </a>
        </div></td>
      </tr>
    </table>
  </div>
</form>
<script>
function changesearch(curr){
	location.href="${pageContext.request.contextPath }/adminTea.action?cnote=" + curr.value;
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