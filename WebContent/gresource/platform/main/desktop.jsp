<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>desktop</title>
<%@include file="../../../resource/mfm_include.jsp" %>
<script type="text/javascript" src="${ctx }/resource/easyui/js/gs.ui.portal.js"></script>
<style type="text/css">
body{
	background-repeat: no-repeat;
	background-position: top center;
	background-size:100%;
}
</style>
</head>
<body style="background-image: url('${ctx}/resource/resource/frame/image/bgi.jpg');">
<!-- 	<div id="pp" style="position:relative;"> -->
<!-- 		<div style="width:33%;"></div> -->
<!-- 		<div style="width:34%;"></div> -->
<!-- 		<div style="width:33%;"></div> -->
<!-- 	</div> -->
<%-- 	<input type="hidden" id="desklayout" name="desklayout" value="${desklayout }"/> --%>
</body>
<script type="text/javascript">
$(document).ready(function(){
// 	$('#pp').portal({border:false});
	
// 	var desklayout=$('#desklayout').val();
// 	if(desklayout != ""){
// 		if(desklayout.indexOf(",") != -1){
// 			//有多个栏目，用逗号隔开
// 			var layoutarr=desklayout.split(",");
// 			var j=0;
// 			for(var i=0;i<layoutarr.length;i++){
// 				add(layoutarr[i],j);
// 				if(j == 0){j=1;}else if(j == 1){j=2;}else if(j == 2){j=0;}
// 			}
// 		}else{
// 			//只有一个栏目
// 			add(desklayout,0);
// 		}
// 	}
// 	setInterval(function(){
// 		$.ajax({
// 			url:'${ctx}/mis/bianmaguanli/combine/keepSession.haze?ran=' + Math.random(),
// 			dataType:'json',
//             success:function(str){
//             	if("timeout"==str){
// 					self.location.href='/mis/logout';
// 				}                                    
//         	}
// 		});
// 	},60000 );
});
function add(layname,index){
	var p = $('<div/>').appendTo('body');
	$.ajax({
		type:'post',
		url:'${ctx}/platform/desktop/desktopColumn/getbyname.haze',
		data:{"name":layname},
		success:function(str){
			p.panel({
				title:str.name,
				href:'${ctx}'+str.datasource,
				height:str.content,
				closable:true,
				collapsible:true
			});
			$('#pp').portal('add', {panel:p,columnIndex:index});
			$('#pp').portal('resize');
		}
	});
}
</script>
</html>