<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<%@include file="../../../../resource/mfm_include.jsp" %>
<title>车次的详细信息页面</title>
<style type="text/css">
	#table{
		width: 50%;
		border: 0px;
		border-width: 1px;
		border-color: black;
		text-align: center
	}
	#table tr{
		width:50%;
		height:30px;
		border: 3px;
		border-width: 1px;
		border-color: red;
	}
 #table tr td{
       text-align: center;
        width:25%;
		font-size: 14px;
		border: 0px;
		border-width: 1px;
		border-color: red;
	} 
</style>
</head>
<body>
	<div id="cc">
		<div data-options="region:'north',border:false" style="height:30px">
			<div id="buttonDiv"></div>
		</div>
		<div data-options="region:'center',split:true">
			<table id='table'>
				<tr>
					<td>客户名称</td>
					<td><div id='name'></div></td>
					<td>司机</td>
					<td></td>
				</tr>
				<tr>
					<td>车牌号</td>
					<td></td>
				</tr>
			</table>
		</div>
	</div>
</body>
<script charset="Shift_JIS" src="http://chabudai.sakura.ne.jp/blogparts/honehoneclock/honehone_clock_tr.js"></script>

<script type="text/javascript">
var dialog = frameElement.dialog;//获取打开的窗口
var mine = dialog.opt.mine;//矿类
var name = dialog.opt.name;//客户名称
var cbId = dialog.opt.cbId;//客户id
var checi = dialog.opt.checi;//车次
var meterDate_Str = dialog.opt.meterDate_Str;//过磅日期
	$(document).ready(function(){
		//进入页面ajax加载车次详细信息
		$.ajax({
			url:path+'MapController/InterfaceCheciGet.haze',
			dataType:'jsonp',
			data:{
				mine:mine,
				cbId:cbId,
				checi:checi,
				meterDate_Str:meterDate_Str
			},
			jsonpCallback:'jsonCb',
			success:function(jdata){
// 				success(jdata);
				$('#name').append(jdata.name);
			},
			error:function(xhr){
				$.msgtip({
					type:'danger',
					text:'连接出现错误!',
					timeout:3000,
				});
			}
		});
		$('#cc').layout({fit:true});//页面布局
		//关闭按钮
		$('#buttonDiv').buttonGroup([{
				useable:true,
				icon:'fa-times',
				text:'关闭',
				id:'btnBack',
				click:function(){
				  dialog.close();
				}
			}]);
	});
</script>
</html>