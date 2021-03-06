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
<title></title>
<link rel="stylesheet" href="css/pintuer.css">
<link rel="stylesheet" href="css/admin.css">
<script src="js/jquery.js"></script>
<script src="js/pintuer.js"></script>
<style>
.body-content{position: relative;text-align:center;}
#myright{position:absolute;left:45%;top:6%;width:100%;}
.input w50{width:120%;}
#addre{width:78%;}
#yr{margin-left:-60%;}
</style>
</head>
<body>
<div class="panel admin-panel margin-top">
  <div class="panel-head" id="add">
  <strong><span class="icon-pencil-square-o"></span>  添  加  信  息  </strong></div>
  <div class="body-content">
    <form class="form-x" method="post" onsubmit="return checkUser()" action="${pageContext.request.contextPath }/insertTeacher.action">
      <div class="form-group">
        <div class="label">
          <label>  姓  名  </label>
        </div>
        <div class="field">
          <input type="text" class="input w50" name="tname" >
        </div>
      </div>
      <div class="form-group">
        <div class="label">
          <label>  密  码  </label>
        </div>
        <div class="field">
          <input type="text" class="input w50" name="tkey" >
        </div>
      </div>
      <div class="form-group">
        <div class="label">
          <label>  性   别   </label>
        </div>
        <div class="field">
          <input type="text" class="input w50" name="sex" />
        </div>
      </div>
      <div class="form-group">
        <div class="label">
          <label>  年  龄  </label>
        </div>
        <div class="field">
          <input type="number" class="input w50" name="age" />
        </div>
      </div>
      <div class="form-group">
        <div class="label">
          <label>  电  话  </label>
        </div>
        <div class="field">
          <input type="text" class="input w50" name="phone" />
        </div>
      </div>
      <div class="form-group">
        <div class="label">
          <label>  邮  箱  </label>
        </div>
        <div class="field">
          <input type="text" class="input w50" name="email" />
        </div>
      </div>
      <div class="field">
       <input class="button bg-main icon-check-square-o" id="yr" type="submit" value="  确  认  添  加  " />
      </div>
    </form>
  </div>
</div>
<script>
/* -----  submit  */
	var tname=document.getElementsByName("tname")[0];	
	var phone=document.getElementsByName("phone")[0];	
	var email=document.getElementsByName("email")[0];	
	var tkey=document.getElementsByName("tkey")[0];	
	var age=document.getElementsByName("age")[0];	
	var sex=document.getElementsByName("sex")[0];	
	function checkUser(){
   	/*  ----  tname      */ 
   		if( tname.value==""||tname.value==null){
   			alert("  请  填  写  姓  名  ！");
   			return false;
   		}
   	/*  ----  tkey      */ 
   		if( tkey.value==null || tkey.value==""){
   			alert("  请  填  写  密  码  ！");
   			return false;
   		}
   	/*  ----  tkey length      */ 
   		if( tkey.value.length<6 || tkey.value.length>14){
   			alert("  密  码  不  符  合  要  求  ！");
   			return false;
   		}
	/*  ----  sex      */ 
	if( sex.value==""||sex.value==null){
		alert("  请  填  写  性  别  ！");
		return false;
	}
	/*  ----  age      */ 
		if( age.value==""||age.value==null){
			alert("  请  填  写  年  龄  ！");
			return false;
		}
   	/*  ----  phone      */ 
   		if( phone.value==""||phone.value==null){
   			alert("  请  填  写  电  话  ！");
   			return false;
   		}
   	/*  ----  email      */ 
   		if( email.value==""||email.value==null){
   			alert("  请  填  写  邮  箱  ！");
   			return false;
   		}
		return true;
   	}
</script>
</body>
</html>