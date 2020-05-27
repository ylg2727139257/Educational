<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
	</head>
	<body>
		<%
		Object obj=session.getAttribute("TEACHER");
	   	if(null==obj){
	   		out.println("<script>alert('亲 ， 还 未 登 录 哦 !');parent.location.href='login.jsp';"
					+ "</script>");
	   		return ;
	   	}
		%>
	</body>
</html>