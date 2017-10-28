<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html 	>
<html>
<head>
<title>投料单位列表</title>
<%@include file="../../../../resource/mfm_include.jsp" %>
</head>
<body>
	<div id="tb">
		<div id="buttonDiv"></div>
	</div>
	<table id="datagrid" title="投料单位列表">
		<thead>
			<tr>
				<th data-options="field:'ck',checkbox:true"></th>
				<th data-options="field:'id',hidden:true" >id</th>
				<th data-options="field:'deptName',width:140,align:'left'">名称</th>
				<th data-options="field:'orgName',width:100,align:'center'">组织</th>
				<th data-options="field:'xiTong_str',width:100,align:'center'">系统</th>
				<th data-options="field:'remark',width:140,align:'left'">描述</th>
			</tr>
		</thead>
	</table>
	<form action="${ctx }/mfm/Dept/del.haze" id="form" >
		<input type="hidden" id="ids" name="ids">
	</form><!--删除用  已经存放过原料的区域不可删除-->
</body>
<script type="text/javascript">
var grid;
$(document).ready(function(){
	//从后台获取列表数据
	grid = datagrid('#datagrid','${ctx }/mfm/Dept/getList.haze','#tb',true);
	//消息弹框
	showMessageInit();
	//按钮
	$('#buttonDiv').buttonGroup([{
		useable:true,
		text:'新增',
		icon:'fa-plus',
		click:function(){
			//打开弹窗
			$.gsWindow({
				url:'${ctx }/mfm/Dept/edit.haze',
				title:'新增投料单位'
			});
		}
	},{
		useable:true,
		text:"修改",
		icon:"fa-pencil-square-o",
		click:function(){
			getId(grid,'id',function(id){
				$.gsWindow({
					url:'${ctx }/mfm/Dept/edit.haze?id='+id,
					title:'修改投料单位'
				});
			});	
		}
	},{
		useable:true,
		text:'删除',
		icon:'fa-trash-o',
		click:function(){
			//getId方法，返回选中的一行的对象ID
			getIds(grid,'id',function(ids){
				$.messager.confirm('确定要删除吗？', function(r){
		            if (r){
						$('#ids').val(ids);
		            	  $("#form").submit();
		            	}
				});
			});
		}
	}]);
	
});
</script>
</html>