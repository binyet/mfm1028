<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>区域管理列表</title>
<%@include file="../../../../resource/mfm_include.jsp" %>
</head>
<body>
	<div id="tb">
		<div id="buttonDiv"></div>
	</div>
	<table id="datagrid" title="区域管理">
		<thead>
			<tr>
				<th data-options="field:'ck',checkbox:true"></th>
				<th data-options="field:'id',hidden:true" >id</th>
				<th data-options="field:'aresName',width:100,align:'left'">名称</th>
				<th data-options="field:'aresMianji',width:100,align:'right'">面积(平方米)</th>
				<th data-options="field:'aresRongliang',width:80,align:'right'">可容纳量(吨)</th>
				<th data-options="field:'remark',width:140,align:'left'">描述</th>
			</tr>
		</thead>
	</table>
	<form action="javascript:ajaxSubmit()" id="form" >
		<input type="hidden" id="ids" name="ids">
	</form><!--删除用  已经存放过原料的区域不可删除-->
</body>
<script type="text/javascript">
var grid;
	$(document).ready(function(){
			//从后台获取列表数据
			grid = datagrid('#datagrid','${ctx }/mfm/Ares/getList.haze','#tb',true);
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
						url:'${ctx }/mfm/Ares/edit.haze',
						title:'新增区域'
					});
				}
			},{
				useable:true,
				text:"修改",
				icon:"fa-pencil-square-o",
				click:function(){
					getId(grid,'id',function(id){
						$.gsWindow({
							url:'${ctx }/mfm/Ares/edit.haze?id='+id,
							title:'修改区域'
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
	
	//删除的ajax提交
	function ajaxSubmit(){
		$.ajax({
			url:'${ctx }/mfm/Ares/del.haze',
			data:$("#form").serialize(),
			success:function(data){
				if(data.flag){
					$.msgtip({
						type:'success',
						text:"删除成功！",
						timeout:3000,
					});
					grid.datagrid("reload");
				}else{
					$.msgtip({
						type:'warning',
						text:data.retList+"已经存放原料不可删除，请重新选择要删除的区域",
						timeout:3000,
					});
				}
			}
		});
	}
</script>
</html>