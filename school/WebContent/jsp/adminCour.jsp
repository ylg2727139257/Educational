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
<form method="post" action="${pageContext.request.contextPath }/adminCour.action" id="listform">
  <div class="panel admin-panel">
    <div class="panel-head"><strong class="icon-reorder">  课  程  管  理  </strong>
    </div>
    <div class="padding border-bottom">
      <ul class="search" style="padding-left:10px;">
      <li><a class="button border-main icon-plus-square-o" href="${pageContext.request.contextPath }/findCT.action">增加课程</a></li>
      <li>
    	<select class="input" onchange="changesearch(this)" style="width:60px;
    	line-height:17px; display:inline-block">
         <option selected>  排  序  </option>
         <option value="cid">  编  号  </option>
         <option value="cname">  课  程  </option>
         <option value="ctype">  类  型  </option>
         <option value="credit">  学  分  </option>
         <option value="cmax">  极  限  人  数  </option>
         <option value="curr">  已  选  人  数  </option>
        </select>
      </li>
       <li  id="ss">
          <input type="text" placeholder="请输入搜索关键字" name="cname" class="input" 
          style="width:250px;margin:0 200%; line-height:17px;display:inline-block;"
           value="${LIKEAC }" />
          <input type="submit" id="ssa" class="button border-main icon-search" value="搜索"/></li>
      </ul>
    </div>
    <table class="table table-hover text-center">
      <tr>
        <th style="text-align:left; padding-left:2%;">  编  号  </th>
        <th>  教  师  </th>
        <th width="10%">  课  程  </th>
        <th>  类  型  </th>
        <th>  学  分  </th>
        <th>  人  数  </th>
        <th width="310">  操  作  </th>
      </tr>
      <c:if test="${empty ACPAGEINFO.list }">
	     <tr>
      	 <td colspan="8"><div id="mk">  抱  歉  ，  暂  无  课  程  信  息  ！  </div></td>
      	 </tr>
      </c:if>
		<c:forEach items="${ACPAGEINFO.list }" var="item">
	        <tr>
	          <td><font color="#00CC99">${item.cid }</font></td>
	          <td>${item.tid }</td>
	          <td><font color="#00CC99">${item.cname }</font></td>
	          <td><font color="#00CC99">${item.ctype==1?"选修":"必修" }</font></td>
	          <td>${item.credit }</td>
	          <td><font color="#00CC99">${item.curr }</font>/${item.cmax }</td>
	          <td><div class="button-group"> <a class="button border-main" 
	          href="${pageContext.request.contextPath }/findAC.action?cid=${item.cid }"><span class="icon-edit"></span> 修改</a> 
	          <a class="button border-red" href="${pageContext.request.contextPath }/deleteCourse.action?cid=${item.cid }" 
	          onclick="return del(1,1,1)"><span class="icon-trash-o"></span> 删除</a></div>
	          	&nbsp;&nbsp;</td>
	        </tr>
        </c:forEach>
      <tr>
        <td colspan="8"><div class="pagelist">
        	 当前第   <font color="purple"> ${ACPAGEINFO.pageNum }</font>    页，共      <font color="purple">${ACPAGEINFO.pages }</font>    页。 
        </div></td>
      </tr>
      <tr>
        <td colspan="8"><div class="pagelist">
        <a href="${pageContext.request.contextPath }/adminCour.action?page=1">  首  页  </a>
        <a href="${pageContext.request.contextPath }/adminCour.action?page=${pageNum=ACPAGEINFO.pageNum<=1 ? 1 : ACPAGEINFO.pageNum-1 }">  上  一  页  </a>
        <a href="${pageContext.request.contextPath }/adminCour.action?page=${pageNum=ACPAGEINFO.pageNum>=ACPAGEINFO.pages ? ACPAGEINFO.pages : ACPAGEINFO.pageNum+1 }">  下  一  页  </a>
        <a href="${pageContext.request.contextPath }/adminCour.action?page=${pageNum=ACPAGEINFO.pages }">  尾  页  </a>
        </div></td>
      </tr>
    </table>
  </div>
</form>
<script>
function changesearch(curr){
	location.href="${pageContext.request.contextPath }/adminCour.action?cnote=" + curr.value;
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