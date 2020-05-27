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
#xb{margin-left:-80%;}
select{text-align:right;}
</style>
</head>
<body>
<div class="panel admin-panel margin-top">
  <div class="panel-head" id="add">
  <strong><span class="icon-pencil-square-o"></span>  修  改  信  息  </strong></div>
  <div class="body-content">
    <form class="form-x" method="post" onsubmit="return checkUser()" action="${pageContext.request.contextPath }/updateCourse.action">
       <div class="form-group">
        <div class="label">
          <label>  编  号  </label>
        </div>
        <div class="field">
          <input type="text" class="input w50" name="sid" value="${UCOURSE.cid }" readonly />
          <div class="tips"></div>
        </div>
      </div> 
      <div class="form-group">
        <div class="label">
          <label>  课  程  </label>
        </div>
        <div class="field">
          <input type="text" class="input w50" name="cname" value="${UCOURSE.cname }" >
        </div>
      </div>
      <div class="form-group">
        <div class="label">
          <label>  教  师  </label>
        </div>
        <div class="field">
          <select class="input w50" name="tid" >
          	<c:forEach items="${ACUTEACHER }" var="item">
          		<c:if test="${UCOURSE.tid eq item.tid }">
          			<option selected="selected" value="${item.tid }">${item.tid }--${item.tname }</option>
          		</c:if>
          		<c:if test="${UCOURSE.tid ne item.tid }">
          			<option value="${item.tid }">${item.tid }  ·  ·  ·  ${item.tname }</option>
          		</c:if>
          	</c:forEach>
          </select>
        </div>
      </div>
      <div class="form-group">
        <div class="label">
          <label>  类  型  </label>
        </div>
        <div class="field">
        	<c:if test="${UCOURSE.ctype eq 1 }">
	          <input type="radio"  name="ctype" value="2" id="xb"/>  必  修
	          <input type="radio"  name="ctype" value="1" checked="checked"/>  选  修
        	</c:if>
        	<c:if test="${UCOURSE.ctype eq 2 }">
        	<input type="radio"  name="ctype" value="2" id="xb" checked="checked"/>  必  修
          	<input type="radio"  name="ctype" value="1"/>  选  修
        </c:if>  
        </div>
      </div>
      <div class="form-group">
        <div class="label">
          <label>  学  分  </label>
        </div>
        <div class="field">
          <input type="text" class="input w50" name="credit" value="${UCOURSE.credit }"/>
        </div>
      </div>
      <div class="form-group">
        <div class="label">
          <label>  极  限  人  数  </label>
        </div>
        <div class="field">
          <input type="number" class="input w50" name="cmax" value="${UCOURSE.cmax }" />
        </div>
      </div>
            <div class="form-group">
        <div class="label">
          <label>  已  选  人  数  </label>
        </div>
        <div class="field">
          <input type="number" class="input w50" name="curr" value="${UCOURSE.curr }" />
        </div>
      </div>
      <div class="field">
       <input class="button bg-main icon-check-square-o" id="yr" type="submit" value="  确  认  修  改 " />
      </div>
    </form>   
  </div>
</div>
<script>
/* -----  submit  */
	var cname=document.getElementsByName("cname")[0];	
	var credit=document.getElementsByName("credit")[0];	
	var cmax=document.getElementsByName("cmax")[0];	
	var curr=document.getElementsByName("curr")[0];	
	function checkUser(){
   	/*  ----  cname      */ 
   		if( cname.value==""||cname.value==null){
   			alert("  请  填  写  课  程  ！");
   			return false;
   		}
   	/*  ----  credit      */ 
   		if( credit.value==null || credit.value==""){
   			alert("  请  填  写  学  分  ！");
   			return false;
   		}
   	/*  ----  cmax      */ 
   		if( cmax.value==null || cmax.value==""){
   			alert("  请  填  写  极  限  人  数  ！");
   			return false;
   		}
   	/*  ----  curr      */ 
   		if( curr.value==null || curr.value==""){
   			alert("  请  填  写  已  选  人  数  ！");
   			return false;
   		}
   		return true;
   	}
</script>

</body>
</html>