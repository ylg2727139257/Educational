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
</style>
</head>
<body>
<div class="panel admin-panel margin-top">
  <div class="panel-head" id="add">
  <strong><span class="icon-pencil-square-o"></span> 个人信息</strong></div>
  <div class="body-content">
    <form class="form-x">
      <div class="form-group">
        <div class="label">
          <label>  学  号  </label>
        </div>
        <div class="field">
          <input type="text" class="input w50" name="title" value="${STUDENT.sid }" readonly />
          <div class="tips"></div>
        </div>
      </div>        
      <div class="form-group">
        <div class="label">
          <label>  姓  名  </label>
        </div>
        <div class="field">
          <input type="text" class="input w50" name="s_title" value="${STUDENT.sname }" readonly/>
        </div>
      </div>
      <div class="form-group">
        <div class="label">
          <label>  电  话  </label>
        </div>
        <div class="field">
          <input type="text" class="input w50" name="s_keywords" value="${STUDENT.phone }" readonly/>
        </div>
      </div>
      <div class="form-group">
        <div class="label">
          <label>  邮  箱  </label>
        </div>
        <div class="field">
          <input type="text" class="input w50" name="s_desc" value="${STUDENT.email }" readonly />
        </div>
      </div>
      <div class="form-group">
        <div class="field"></div>
      </div>
    </form>
    
    
    
    
    
    <form class="form-x" id="myright">
      <div class="form-group">
        <div class="label">
          <label>  学  分  </label>
        </div>
        <div class="field">
          <input type="text" class="input w50" name="title" value="${STUDENT.credit }" readonly />
          <div class="tips"></div>
        </div>
      </div>        
      <div class="form-group">
        <div class="label">
          <label>  性   别   </label>
        </div>
        <div class="field">
          <input type="text" class="input w50" name="s_title" value="${STUDENT.sex }" readonly/>
        </div>
      </div>
      <div class="form-group">
        <div class="label">
          <label>  年  龄  </label>
        </div>
        <div class="field">
          <input type="text" class="input w50" name="s_keywords" value="${STUDENT.age }" readonly/>
        </div>
      </div>
      
      
      
      
      
      <div class="form-group">
        <div class="label">
          <label>  地  址  </label>
        </div>
        <div class="field">
          <input type="text" class="input w50" name="s_desc" value="${STUDENT.address }" readonly />
        </div>
      </div>
      <div class="form-group">
        <div class="label">
          <label></label>
        </div>
        <div class="field">
        </div>
      </div>
      <div class="form-group">
        <div class="field"></div>
      </div>
    </form>
  </div>
</div>
</body></html>