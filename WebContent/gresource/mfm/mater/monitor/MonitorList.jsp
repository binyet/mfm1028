<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>区域管理列表</title>
<%@include file="../../../../resource/mfm_include.jsp"%>
</head>
<body>
	<div id="tb">
		<div id="buttonDiv"></div>
	</div>
	<table id="datagrid" title="区域管理">
		<thead>
			<tr>
				<th data-options="field:'ck',checkbox:true"></th>
				<th data-options="field:'id',hidden:true">id</th>
				<th data-options="field:'property',width:100,align:'center'">性质</th>
				<th data-options="field:'source',width:100,align:'center'">来源</th>
				<th data-options="field:'client',width:80,align:'center'">客户</th>
				<th data-options="field:'carNum',width:60,align:'center'">车号</th>
				<th data-options="field:'driver',width:80,align:'center'">司机</th>
				<th data-options="field:'checi',width:60,align:'center'">车次</th>
				<th data-options="field:'maozhong',width:80,align:'center'">毛重</th>
				<th data-options="field:'pizhong',width:60,align:'center'">皮重</th>
				<th data-options="field:'jingzhong',width:80,align:'center'">净重</th>
				<th data-options="field:'weigher',width:100,align:'center'">监磅人</th>
				<th data-options="field:'auditor',width:80,align:'center'">审核人</th>
				<th data-options="field:'weighDate',width:200,align:'center'">时间</th>
			</tr>
		</thead>
	</table>
	<form action="javascript:ajaxSubmit()" id="form">
		<input type="hidden" id="ids" name="ids">
	</form>
	<!--删除用  已经存放过原料的区域不可删除-->
</body>
<script type="text/javascript">
	var grid;
	$(document).ready(
			function() {
				//从后台获取列表数据
				grid = datagrid('#datagrid',
						'${ctx }/mfm/Monitor/getList.haze', '#tb', true);
				//消息弹框
				showMessageInit();
				//按钮
				$('#buttonDiv').buttonGroup([ {
					useable : true,
					text : '新建',
					icon : 'fa-plus',
					click : function() {
						//打开弹窗
						$.gsWindow({
							url : '${ctx }/mfm/Monitor/edit.haze',
							title : '新建'
						});
					}
				}, {
					useable : true,
					text : "修改",
					icon : "fa-pencil-square-o",
					click : function() {
						getId(grid, 'id', function(id) {
							$.gsWindow({
								url : '${ctx }/mfm/Monitor/edit.haze?id=' + id,
								title : '修改区域'
							});
						});
					}
				} ]);
			});
</script>
</html>