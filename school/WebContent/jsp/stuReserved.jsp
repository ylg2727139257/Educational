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
</head>
<body>
<form method="post">
  <div class="panel admin-panel">
    <div class="panel-head"><strong class="icon-reorder">  已  选  课  程  </strong></div>
    <table class="table table-hover text-center">
      <tr>
        <th>  序  号  </th>       
        <th>  课  程  </th>
        <th>  教  师  </th>
        <th>  学  分  </th>
        <th>  人  数  </th>
        <th>  成  绩  </th>
        <th>  备  注  </th>
        <th>  操  作  </th>
      </tr>     
      <c:forEach items="${COURSES2 }" var="item">
      	<tr>
          <td>${item.cid }</td>
          <td><font color="#00CC99">${item.cname }</font></td>
          <td><font color="#00CC99">${item.teacher.tname }</font></td>
          <td><font color="#00CC99">${item.credit }</font></td>
          <td><font color="#00CC99">${item.curr }</font>/${item.cmax }</td>
          <td id="sc"><font color="red">${item.elect.score==0.0 ? "- -" : item.elect.score }</font></td>
          <td>    </td>
          <td><div class="button-group"><a class="button border-red" 
          href="${pageContext.request.contextPath }/deleteElect.action?cid=${item.cid }" 
          onmousedown="return de(${item.elect.score==0.0 ? '- -' : item.elect.score });" onclick="return del(1,1,1);">
          <span class="icon-trash-o"></span>  取  消  选  课  </a> </div></td>
        </tr>
      </c:forEach>
    </table>
  </div>
</form>
<script>
	function de(sc){
		if(sc == "- -"){
			return true;
		}else{
		 	alert("该科目已开课且结课，无法退课！");
			return false;
		}
	}
	function del(id,mid,iscid){
		if(confirm("您确定要删除吗?")){
			return true;
		}
		return false;
	}
</script>
</body></html>