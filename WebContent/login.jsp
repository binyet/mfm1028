<%@page import="org.haze.base.util.AppUtil"%>
<%@page import="java.util.Properties"%>
<%@ page pageEncoding="UTF-8" %>
<%@page import="org.springframework.security.web.WebAttributes"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="renderer" content="webkit">
<title>料场管理系统</title>
<link rel="stylesheet" type="text/css" href="${ctx }/resource/bootstrap-3.3.5/css/bootstrap.css" />
<link rel="stylesheet" type="text/css" href="${ctx }/resource/bootstrap-3.3.5/css/font-awesome.min.css" />
<link rel="stylesheet" type="text/css" href="${ctx }/resource/frame/css/gs.ui.core.css" />
<link rel="shortcut icon" type="image/x-icon" href="${ctx }/resource/resource/frame/image/icon.ico" media="screen" />
<script type="text/javascript" src="${ctx }/resource/frame/js/jquery-1.9.1.min.js"></script>
<!--[if lt IE 9]>
<script type="text/javascript" src="${ctx }/resource/bootstrap-3.3.5/js/respond.min.js"></script>
<script type="text/javascript" src="${ctx }/resource/bootstrap-3.3.5/js/html5shiv-printshiv.min.js"></script>
<![endif]-->
<script type="text/javascript" src="${ctx }/resource/bootstrap-3.3.5/js/bootstrap.min.js"></script>
<script type="text/javascript">
			if(top!=this){//当这个窗口出现在iframe里，表示其目前已经timeout，需要把外面的框架窗口也重定向登录页面
				  top.location='<%=request.getContextPath()%>/system/login/login.jsp';
			}
			<%
			Properties configProperties=(Properties)AppUtil.getBean("configproperties");
			String validCodeEnabled=configProperties.getProperty("validCodeEnabled");
			
			%>
</script>
<style type="text/css">
.accountCheckDiv{
	display:none;
	position: absolute;
	height: 80%;
	width: 100%;
	top :20px;
	left:0;
}
.accountCheckIcon{
	height: 100%;
	width: 100%;
	position: absolute;
	left:0;
	background: url(resource/frame/image/ajax-loader-16x16.gif) no-repeat center center;
    z-index: 2; 
}
.accountMaskBody{
    height: 100%;
    width: 100%;
    position: absolute;
	background-color: #fff;
    z-index: 1;
    opacity: 0.8
}
body{
/* 	overflow:hidden; */
/*  	background: url(resource/resource/frame/image/bg2.jpg) repeat-x;  */
	background-position: center;
}
.panel-login-div{
	width: 300px;
	float: right;
	margin-top: 150px;
	margin-right: 200px;
 	opacity: 0.7; 
}
.layer{
/* 	background:url(resource/resource/frame/image/bg.jpg) center 0 no-repeat; */
	width:1280px;
	height:750px;
	margin:0 auto;
}
</style>
</head>
<body>
<div class="layer">
	<div class="panel panel-default panel-login-div ">
	  <div class="panel-heading">登陆</div>
	  <div class="panel-body">
	   		<form id="loginForm" action="${ctx }/platform/login.haze" method="post">
			  <div class="form-group">
			    <label>账号</label>
			    <input type="text" id="username" name="username" class="form-control" placeholder="请输入用户名">
			  </div>
			  <div class="form-group">
			    <label>密码</label>
			    <input type="password" name="password" class="form-control" placeholder="请输入密码">
			  </div>
			  <%
	            if(validCodeEnabled!=null && "true".equals(validCodeEnabled)){
	            %>
	           <div class="form-group">
		   		 <label>验证码</label>
		   		 <input type="text" name="validCode" class="form-control"  placeholder="validCode">
		   		 <img onclick="changev(this)" src="${ctx}/validate/ValidCode" />
			  	</div>
	            <%
	            }
	            %>
	<!-- 		  <div class="form-group" id="systemSelector" style="position: relative;"> -->
	<!-- 		    <label>系统选择</label> -->
	<!-- 		     <div id="accountCheckDiv" class="accountCheckDiv"> -->
	<!-- 		    	<div class="accountCheckIcon"></div> -->
	<!-- 		    	<div class="accountMaskBody"></div> -->
	<!-- 		    </div> -->
	<!-- 		    <select class="form-control" id="loginSystem" name="loginSystem"></select> -->
	<!-- 		  </div> -->
			  <div id="errorText">
			  <%
				String loginError=(String)request.getSession().getAttribute(WebAttributes.AUTHENTICATION_EXCEPTION);	
				if(loginError!=null && !loginError.equals(""))
				{
				%>
				  <p class="help-block"><font color="red"><%=loginError %></font></p>
				<%
					}
				%>
			  </div>
			  <div class="checkbox">
			    <label>
			      <input type="checkbox"><input type="checkbox"  name="rememberMe" value="1" />记住密码
			    </label>
			  </div>
			  <button id="login" type="submit" class="btn btn-default">
			   <span class="fa fa-unlock"></span>
			  	登  陆</button>
			  <button id="eliminate" type="button" class="btn btn-default">
			   <span class="fa fa-trash"></span>
			  	重  置</button>
			</form>
	  </div>
	</div>
</div>
</body>
<script type="text/javascript">
$(document).ready(function(){	
	$("#login").click(function(){
		$("#loginForm").submit();
	});
	$("#eliminate").click(function(){
		$("input").each(function(){
			$(this).val("");
		});
		$("input[type='checkbox']").each(function(){
			$(this).attr("checked", false);
		});
	});
	
});
//刷新验证码
function changev(ob) {
	var time = new Date().getTime();
	var path = "${ctx}/validate/ValidCode";
	ob.src=path+"?rand="+time;
}
</script>
</html>
