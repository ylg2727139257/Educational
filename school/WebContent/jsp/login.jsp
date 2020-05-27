<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
<meta charset="UTF-8">
<title>登  录</title>
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
<div class="bg"></div>
<div class="container">
    <div class="line bouncein">
        <div class="xs6 xm4 xs3-move xm4-move">
            <div style="height:150px;"></div>
            <div class="media media-y margin-big-bottom">
            </div>         
            <form action="${pageContext.request.contextPath }/login.action" method="post" onsubmit="return checkUser()" >
            <div class="panel loginbox">
                <div class="text-center margin-big padding-big-top"><h1>教务管理中心</h1></div>
                <div class="panel-body" style="padding:30px; padding-bottom:10px; padding-top:10px;">
                    <div class="form-group">
                        <div class="field field-icon-right">
                            <input type="text" class="input input-big" id="lid" name="lid" placeholder="登录账号" data-validate="required:请填写账号" />
                            <span class="icon icon-user margin-small"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="field field-icon-right">
                            <input type="password" class="input input-big" name="password" placeholder="登录密码" data-validate="required:请填写密码" />
                            <span class="icon icon-key margin-small"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="field">
                            <input type="text" class="input input-big" name="code" placeholder="填写右侧的验证码" data-validate="required:请填写右侧的验证码" />
                           <img src="images/passcode.jpg" alt="" width="100" height="32" class="passcode" style="height:43px;cursor:pointer;" onclick="this.src=this.src+'?'">  
                        </div>
                    </div>
                </div>
                <div style="padding:30px;"><input type="submit" class="button button-block bg-main text-big input-big" value="登录"></div>
            </div>
            </form>
        </div>
    </div>
</div>
<script>
/* -----  login  */
	var lid=document.getElementsByName("lid")[0];
	var password=document.getElementsByName("password")[0];	
	var code=document.getElementsByName("code")[0];	
	function checkUser(){
   	/*  ----  lid      */ 
   		if( lid.value.length!=6){
   			alert("用户名错误！");
   			return false;
   		}
   	/*  ----  password      */	
   		if( password.value.length<6 || password.value.length>14 ){
   			alert("密码错误！");
   			return false;
   		}
   	/*  ----  code      */
   		if( code.value!="6982" ){
   			alert("验证码错误！");
   			return false;
   		}
   		return true;
   	}
 	var lid=document.getElementById("lid");
	lid.onkeydown=function(ev){
		var charcode=String.fromCharCode(ev.keyCode);
			if(charcode>="0"&&charcode<="9"||ev.keyCode==8||ev.keyCode==37||ev.keyCode==39){
				if(lid.value.length>=8){
					return false;
				}
				return true;
			}
		return false;
	}
</script>
</body>
</html>