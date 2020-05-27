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
	.input{position: relative;}
	#ss{position:absolute;left:79.7%;top:2%;}
	#mk{color:orange;font-size:30px;}
</style>
</head>
<body>
<form id="listform">
  <div class="panel admin-panel">
    <div class="padding border-bottom">
      <ul class="search" style="padding-left:10px;">
        <li>
          <input type="text" placeholder="请输入搜索关键字" name="keywords" class="input" id="sea"
          style="width:250px;margin-left:260%; line-height:17px;display:inline-block" value="${LIKETCOUR }" />
          <a href="javascript:void(0)" id="ss" class="button border-main icon-search" 
          onclick="changesearch()" > 搜索</a></li>
      </ul>
    </div>
    <table class="table table-hover text-center">
      <tr>
        <th>  序  号  </th>
        <th>  课  程  </th>
        <th>  图  片  </th>
        <th>  类  型  </th>
        <th>  学  分  </th>
        <th>  人  数  </th>
        <th>  学  生  信  息  </th>
      </tr>
      <c:if test="${empty TCOURSE }">
      	<tr>
      	 <td colspan="7"><div id="mk">  抱  歉  ，  暂  无  课  程  信  息  ！  </div></td>
      	 </tr>
      </c:if>
      <c:forEach items="${TCOURSE }" var="item" >
        <tr>
          <td>${item.cid }</td>
          <td><font color="#00CC99">${item.cname }</font></td>
          <td><img src="images/11.jpg" alt="" width="70" height="50" /></td>
          <td><font color="#00CC99">${cty=item.ctype==1 ? "选 修" :  "必 修" }</font></td>
          <td><font color="#00CC99">${item.credit }</font></td>
          <td><font color="#00CC99">${item.curr}</font>/${item.cmax }</td>
          <td><div class="button-group"><a href="../teaSlist.action?cid=${item.cid }"
           class="button border-main" ><span class="icon-edit"></span>  查  看  </a></div></td>
        </tr>
	  </c:forEach>
    </table>
  </div>
</form>
<script type="text/javascript">
//搜索
var sea =document.getElementById("sea");
function changesearch(){	
	location.href="${pageContext.request.contextPath }/teaCourse.action?cname=" + sea.value;	
}
</script>
</body>
</html>