<%@page import="org.haze.gplat.rbac.model.SysOrg"%>
<%@page import="org.haze.base.util.ContextUtil"%>
<%@page import="java.util.Random"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<title>${currentSystem.sysName }</title>

<link rel="stylesheet" type="text/css" href="${ctx }/resource/bootstrap-3.3.5/css/bootstrap.css" />
<link type="text/css" rel="stylesheet" href="${ctx }/resource/bootstrap-3.3.5/css/font-awesome.min.css">
<link type="text/css" rel="stylesheet" href="${ctx }/resource/easyui/css/gs.ui.datagrid.css">
<link type="text/css" rel="stylesheet" href="${ctx }/gresource/platform/main/css/main.css">
<link type="text/css" rel="stylesheet" href="${ctx }/gresource/platform/main/css/tooltip.css">
<link type="text/css" rel="stylesheet" href="${ctx }/resource/perfectscroll/css/perfect-scrollbar.min.css">
<link type="text/css" rel="stylesheet" href="${ctx }/resource/nprogress/css/nprogress.css">
<script type="text/javascript" src="${ctx }/resource/frame/js/jquery-1.9.1.min.js"></script>
<script type="text/javascript">
$.ctx = "${pageContext.request.contextPath}";
</script>
<!--[if lt IE 9]>
<script type="text/javascript" src="${ctx }/resource/bootstrap-3.3.5/js/respond.min.js"></script>
<script type="text/javascript" src="${ctx }/resource/bootstrap-3.3.5/js/html5shiv-printshiv.min.js"></script>
<![endif]-->
<script type="text/javascript" src="${ctx }/resource/bootstrap-3.3.5/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${ctx }/resource/easyui/js/gs.ui.datagrid.js"></script> 
<script type="text/javascript" src="${ctx }/gresource/platform/main/js/main.js?r=<%=new Random().nextInt() %>"></script>
<script type="text/javascript" src="${ctx }/resource/frame/js/gs.ui.msgtip.js"></script> 
<script type="text/javascript" src="${ctx }/resource/frame/js/gs.ui.window.js"></script>
<script type="text/javascript" src="${ctx }/resource/frame/js/gs.ui.core.js"></script>
<script type="text/javascript" src="${ctx }/resource/frame/js/gs.ui.dialog.js"></script>
<script type="text/javascript" src="${ctx }/resource/perfectscroll/js/perfect-scrollbar.jquery.min.js"></script>
<script type="text/javascript" src="${ctx }/resource/nprogress/js/nprogress.js"></script>
<style type="text/css">
body {
	font-family: 'Microsoft YaHei', '微软雅黑', 'SimSun', '宋体';
}
.panel-header{
	background: #41b0fc !important;
	filter:none !important;
}
.panel-title{
	color:#fff !important;
	height: 16px !important;
	line-height: 16px !important;
}
</style>
<script type="text/javascript">
	$(function(){
		$('#cc').layout({fit:true});
	});
	function resetPassword(){
// 		$.gsWindow({
// 			url:'${ctx}/platform/rbac/sysUser/resetPwdView.haze?userId='+$('#userId').val(),
// 			title:'重置密码',
// 			width:350,
// 			height:220
// 		});
		var changePwdDialog = $.gsDialog({
			title:'修改密码',
			text:'<div class="form-group"><label for="exampleInputEmail1">原始密码：</label><input type="password" class="form-control" id="currPwd" name="currPwd"></div><div class="form-group"><label for="exampleInputEmail1">新密码：</label><input type="password" class="form-control" id="newPwd" name="newPwd"></div><div class="form-group"><label for="exampleInputEmail1">确认密码：</label><input type="password" class="form-control" id="newPwdA" name="newPwdA"></div>',
			button:[{
				text:'确定',
				btnType:'info',
				autoClose:false,
				click:function(){
					var currPwd = $("#currPwd").val();
					var newPwd = $("#newPwd").val();
					var newPwdA = $("#newPwdA").val();
					
					if(currPwd == "" || newPwd == "" || newPwdA == ""){
						$.msgtip({type:'warning',text:'当前密码、新密码、确认密码 不能为空！'});
					}else if(newPwd != newPwdA){
						$.msgtip({type:'warning',text:'新密码、确认密码 输入不一致！'});
					}else{
						$.ajax({
							type:'post',
							url:'${ctx}/platform/rbac/sysUser/userChangePwd.haze',
							data:{
								userId:$('#userId').val(),
								currPwd:$("#currPwd").val(),
								newPwd:$("#newPwd").val()
							},
							dataType:'json',
							success:function(data){
								if(data.success == "1"){
									$.msgtip({text:'密码修改成功！'});
									changePwdDialog.close();
								}else{
									$.msgtip({type:'warning',text:data.message});
								}
							},
							error:function(){
								$.msgtip({type:'danger',text:'密码修改失败！'});
							}
						});
					}
				}
			}]
		});
	}
	function feedback(){
		$.gsWindow({
			url:'${ctx}/platform/demo/feedback/edit.haze',
			title:'请输入反馈的问题',
			width:550,
			height:300
		});
	}
	function out(){
		window.location.href = 'http://'+document.location.host+'/mes/platform/logout';
	}
	function changeOrg(orgId){
		$.ajax({
			type:'post',
			url:'${ctx}/platform/main/changeOrg.haze',
			data:{orgId:orgId},
			dataType:'json',
			beforeSend:function(){
				//$.gsDialog({title:'提示',text:'正在切换组织...'});
				$.messager.watting({
		  			title:'&nbsp;&nbsp;提示',
		  			msg:'正在切换组织...'
		  		});
			},
			success:function(data){
				if(data.success){
					window.location.reload();
				}
			},
			error:function(){
				$.messager.watting("close");
				$.msgtip({type:'danger',text:'切换组织出错！'});
			}
		});
	}
</script>
</head>
<body>
	<!-- 顶部栏开始 -->
	<div class="gscon-topbar ng-scope">
		<div class="gs-console-topbar ng-isolate-scope">
			<div class="topbar-wrap topbar-clearfix">
				<div class="topbar-head topbar-left">
<!-- 					<a href="#" class="topbar-logo topbar-left" id="sidebar-fold"> -->
<!-- 					<span class="fa fa-th-list"></span> -->
<!-- 					</a>  -->
					<a class="topbar-home-link topbar-btn topbar-left ng-scope">
						<span class="ng-binding gs-system-title">
<%-- 							<img style="max-height: 35px;" src="${ctx }/platform/upload/upload/getImg.haze?fileId=${currentSystem.logo }" />&nbsp;&nbsp;${currentSystem.sysName } --%>
								<img style="max-height: 35px;" src="${ctx }/gresource/platform/main/css/zjlogo.png" />&nbsp;&nbsp;生产管理系统
						</span>
					</a>
				</div>
				<div class="topbar-head topbar-center">
					<img style="height: 50px" src="${ctx }/gresource/platform/main/css/centertext.gif" />
				</div>
				<div class="topbar-info topbar-right">
					<div class="topbar-right">
						<div class="topbar-left ng-scope">
							<span class="topbar-info-gap ng-scope"></span>
							<div class="dropdown topbar-info-item ng-scope">
								<a href="#" class="dropdown-toggle topbar-btn" data-toggle="dropdown">
									<img src="${ctx }/gresource/platform/main/css/right-icon1.png">
									<span class="ng-binding gs-title-right-text">模块选择</span>
									<span class="fa fa-caret-down"></span>
								</a>
								<ul class="dropdown-menu" style="width: inherit;min-width: 100%;">
									<c:forEach items="${subSystemList }"  var="subSystem" varStatus="stat">
										<li class="topbar-info-btn ng-scope"><a tabindex="-1" href="${subSystem.defaultUrl }/platform/loginSSO.haze?
									username=<%=ContextUtil.getCurrentUser(). getUsername() %>
									&password=<%=request.getSession().getAttribute("password") %>
									&returnurl=/platform/main/main.haze?systemId=${subSystem.systemId }"><span
											class="ng-binding">${subSystem.sysName }</span></a></li>
											<c:if test="${!stat.last }">
												<li class="dropdown-menu-li-hr"></li>
											</c:if>
									</c:forEach>
								</ul>
							</div>
						</div>
						<div class="topbar-left">
							<span class="topbar-info-gap"></span>
							<div class="dropdown topbar-info-item">
								<a href="#" class="dropdown-toggle topbar-btn" data-toggle="dropdown">
									<img src="${ctx }/gresource/platform/main/css/right-icon2.png">
									<span class="ng-binding gs-title-right-text">
										${username }<%=ContextUtil.getCurrentOrg() != null ? ("（" + ContextUtil.getOrgByPathLevel(ContextUtil.getCurrentOrg(), 1).getOrgName() + "-" + ContextUtil.getCurrentOrg().getOrgName() + "）") : "" %>
									</span>
									<span class="fa fa-caret-down"></span>
								</a>
								<ul class="dropdown-menu">
									<c:forEach items="${userOrgList }" var="uo" varStatus="stat">
										<li class="topbar-info-btn ng-scope">
											<a href="#" tabindex="-1" onclick="changeOrg(${uo.orgId});" >
											<span class="ng-binding"><%
												SysOrg so = ContextUtil.getOrgByPathLevel(((SysOrg)pageContext.getAttribute("uo")), 1);
												if(null != so){
													out.print(so.getOrgName());
												}
											%>&nbsp;-&nbsp;${uo.orgName }</span></a>
										</li>
										<li class="dropdown-menu-li-hr"></li>
									</c:forEach>
									<li class="topbar-info-btn ng-scope">
										<a href="#" tabindex="-1" onclick="resetPassword();" >
										<span class="ng-binding">修改密码</span></a>
										<input type="hidden" id="userId" name="userId" value="${userId }"/>
									</li>
									<li class="dropdown-menu-li-hr"></li>
									<li class="topbar-info-btn ng-scope"><a href="javascript:out();"
										tabindex="-1" ><span class="ng-binding">退出</span></a></li>
								</ul>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- 顶部栏结束 -->

	<!-- 页面中部 -->
	<div class="gscon-body gscon-sidebar-full">
		<!-- 左侧菜单 -->
		<div class="gscon-sidebar">
			<div class="sidebar-content" id="leftBarContent" >
				<div class="left-sidebar-top">
					<div class="left-search-div form-group form-group-sm has-success has-feedback">
					    <input type="text" class="form-control" id="left-search-input" name="left-search-input" placeholder="搜索内容...">
					    <span class="fa fa-search form-control-feedback" id="sidebar-search"></span>
					  </div>
					<div class="sidebar-fold-img" id="sidebar-fold"></div>
				</div>
				<div class="sidebar-inner ng-scope">
<!-- 					<div id="sidebar-fold" class="sidebar-fold ng-scope fa fa-th-list"></div> -->
					<c:forEach items="${resourcesList }"  var="resource">
						
						<c:if test="${resource.parentId == 0 }">
							<div class="sidebar-nav">
								<div class="sidebar-title" data-toggle="collapse"
									data-target="#${resource.resId }" title="${resource.resName }">
									<div class="sidebar-title-inner ng-scope">
<!-- 										<span class="sidebar-title-icon fa fa-caret-right"></span> -->
										<span class="sidebar-title-text ng-binding" title="${resource.resName }">${resource.resName }</span>
										<span class="sidebar-manage ng-scope">
											<span class="sidebar-title-icon fa fa-angle-right" style="font-size: 18px;"></span>
<%-- 											<a class="fa fa-${resource.icon } ng-isolate-scope icon-menu-right"></a> --%>
										</span>
									</div>
								</div>
								<ul id="${resource.resId }" class="sidebar-trans collapse">
									<c:forEach items="${resourcesList }"  var="resourcechi">
										<c:if test="${resourcechi.parentId == resource.resId }">
											<li class="nav-item ng-scope">
												<a href="#" class="sidebar-trans ng-scope" onclick="selectMenu('${resourcechi.resId }','${resourcechi.defaultUrl }','${resourcechi.resName }','${ctx }')" >
													<div class="nav-icon sidebar-trans" title="${resourcechi.resName }">
															<span class="left-sub-menu-icon fa fa-${resourcechi.icon }"></span>
															<span class="left-sub-menu-circle fa fa-circle" style="font-size: 7px;margin-left: 20px;vertical-align: middle;-webkit-transform:scale(0.6);"></span>
													</div> <span class="nav-title ng-binding">${resourcechi.resName }&nbsp;</span>
												</a>
											</li>
										</c:if>
									</c:forEach>
								</ul>
							</div>
						</c:if>
					</c:forEach>
					
					
					
					<!-- 菜单组 -->
<!-- 					<div class="sidebar-nav main-nav"> -->
<!-- 						<div class="sidebar-title" data-toggle="collapse" -->
<!-- 							data-target="#nav1" title="测试菜单"> -->
<!-- 							<div class="sidebar-title-inner ng-scope"> -->
<!-- 								<span class="sidebar-title-icon icon-caret-right"></span><span -->
<!-- 									class="sidebar-title-text ng-binding" title="测试菜单">测试菜单</span> <span -->
<!-- 									class="sidebar-manage ng-scope"><a -->
<!-- 									class="icon-dashboard ng-isolate-scope icon-menu-right"></a></span> -->
<!-- 							</div> -->
<!-- 						</div> -->
<!-- 						<ul id="nav1" class="sidebar-trans collapse"> -->
<!-- 							<li class="nav-item ng-scope"><a href="#" -->
<!-- 								class="sidebar-trans ng-scope"> -->
<!-- 									<div class="nav-icon sidebar-trans" title="测试11111"> -->
<!-- 										<span class="icon-book"></span> -->
<!-- 									</div> <span class="nav-title ng-binding">测试11111&nbsp;</span> -->
<!-- 							</a></li> -->
<!-- 							<li class="nav-item ng-scope"><a href="#" -->
<!-- 								class="sidebar-trans ng-scope"> -->
<!-- 									<div class="nav-icon sidebar-trans" title="测试11111"> -->
<!-- 										<span class="icon-bookmark"></span> -->
<!-- 									</div> <span class="nav-title ng-binding">测试11111&nbsp;</span> -->
<!-- 							</a></li> -->
<!-- 						</ul> -->
<!-- 					</div> -->
					<!-- 菜单组 -->
				</div>
			</div>
		</div>
		<!-- 左侧菜单结束 -->

		<!-- 中间内容 -->
		<div class="gscon-product gscon-product-col-1">
			<div id="loadImgDiv" align="center" style="position: absolute;top:30px;left:0;width:100%;height:100%;z-index: 1000;background: #FFF;"><!-- 首先放一个div，用做loading效果 -->
				<div style="position: absolute;left: 50%;top: 45%;">
					<img src="${ctx }/resource/frame/image/loading.gif" /><br>正在加载...
				</div>
			</div> 
			<div id="tabs" class="easyui-tabs"
				data-options="fit:true,border:false,tools:'#tab-tools',toolPosition:'left'">
				
				<div id="cc" title="主页" style="overflow: hidden;" class="easyui-layout">
					<div data-options="region:'center'" >
					<iframe id="mainFrame" onload="hideLoading();" frameborder=no scrolling="auto"
						style="overflow-x: hidden; overflow-y: hidden; margin: 0px; padding: 3px; height: inherit;width: inherit;"
						src="${ctx }/platform/main/desktop.haze"></iframe>
					</div>
<!-- 					<div data-options="region:'east'" style="width:200px" > -->
<!-- 						<div class="form-group" > -->
<%-- 							<c:forEach items="${subSystemList }"  var="subSystem">  --%>
<!-- 			    				<div class="col-sm-6" style="padding-top: 15px;"> -->
<%-- 									<a href="${subSystem.defaultUrl }/platform/loginSSO.haze? --%>
<%-- 									username=<%=ContextUtil.getCurrentUser(). getUsername() %> --%>
<%-- 									&password=<%=request.getSession().getAttribute("password") %> --%>
<%-- 									&returnurl=/platform/main/main.haze?systemId=${subSystem.systemId }" class="btn btn-primary" role="button">${subSystem.sysName }</a>	 --%>
<!-- 							</div> -->
<%-- 			    			</c:forEach> --%>
<!-- 						</div> -->
<!-- 					</div>     -->
				</div>
			</div>
		</div>
		<!-- 中间内容结束 -->
	</div>
	<!-- 页面中部结束 -->
	
	<!-- 标签右键菜单 -->
	<div id="tab_rightmenu" class="easyui-menu" style="width: 120px;">
		<!-- 		<div name="tab_menu-tabclose">关闭当前</div> -->
		<div name="tab_menu-tabcloseall">关闭全部</div>
		<div name="tab_menu-tabcloseother">关闭其他</div>
		<div class="menu-sep"></div>
		<div name="tab_menu-tabcloseright">关闭右侧</div>
		<div name="tab_menu-tabcloseleft">关闭左侧</div>
	</div>
	<!-- 标签右键菜单 -->
</body>
</html>