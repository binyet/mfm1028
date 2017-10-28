<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>区域管理列表</title>
<%@include file="../../../../resource/mfm_include.jsp" %>
</head>
<body>
		 <div data-options="region:'north',split:true" style="height:100px;">
			 <form id="searchForm" method="post" class="form-horizontal" action="javascript:ajaxSubmit()">
		 		<input type="hidden" id="id" name="id"  />
				<input type="hidden" id="remark" name="remark" value=""/>
			 
			 	<div class="form-group form-group-sm form-horizontal" style="margin-top:20px;">
					 <label class="col-sm-2 control-label">客户</label>
					    <div class="col-sm-3">
					    
					    	<select name="clientName" id="clientName" class="form-control combox-select"
							data-options="url:'${ctx }/mfm/Client/getComboboxList.haze',
											valueField: 'clientName',    
			        						textField: 'clientName',
											loadFilter:function(data){
											     data.unshift({clientName:'',clientName:''});
											    return data;
											}
			        						">
							</select>
						</div>
					 </div>
			 	<div class="form-group form-group-sm form-horizontal" style="margin-top:20px;">
					 <label class="col-sm-2 control-label">司机名称</label>
					    <div class="col-sm-3">
					    
					    	<select name="driverName" id="driverName" class="form-control combox-select"
							data-options="url:'${ctx }/mfm/Driver/getComboboxList.haze',
											valueField: 'driverName',    
			        						textField: 'driverName',
											loadFilter:function(data){
											     data.unshift({driverName:'',driverName:''});
											    return data;
											}"></select>
						</div>
					 </div>
			    <div  class="col-sm-1" id="northButton"></div>
					 
			</form>
		 </div> 



	<div id="tb">
		<div id="buttonDiv"></div>
	</div>
	<table id="datagrid" title="区域管理">
		<thead>
			<tr>
				<th data-options="field:'ck',checkbox:true"></th>
				<th data-options="field:'id',hidden:true" >id</th>
				<th data-options="field:'driverName',width:100,align:'left'">司机名称</th>
				<th data-options="field:'clientName',width:100,align:'left'">所属客户</th>
				<th data-options="field:'remark',width:100,align:'right'">描述</th>
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
			grid = datagrid('#datagrid','${ctx }/mfm/Driver/getList.haze','#tb',true);
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
						url:'${ctx }/mfm/Driver/edit.haze',
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
							url:'${ctx }/mfm/Driver/edit.haze?id='+id,
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
			
			$('#northButton').buttonGroup([{
				useable:true,
				text:'查询',
				icon:'fa-search',
				
				click:function(){
					$.ajax({
						type:'post',
						url:'${ctx }/mfm/Driver/getList.haze',
						data:$("#searchForm").serialize(),     //{queryVtListStart:queryVtListStart,queryVtListEnd:queryVtListEnd,property:$("#property").val(),element:$("#element").val(),vtIdsStr:vtIdsStr},
						
						success:function(data){
							//alert($("#searchForm").serialize());
							var queryObj = grid.datagrid("options").queryParams;
							var formArray = $("#searchForm").serializeArray();
							for(var i=0;i<formArray.length;i++){
								queryObj[formArray[i].name] = formArray[i].value;
							}
							grid.datagrid('reload',queryObj);

						},
						error:function(data){
						}
					});
				}
			}]);
	});
	
	//删除的ajax提交
	function ajaxSubmit(){
		$.ajax({
			url:'${ctx }/mfm/Driver/del.haze',
			data:$("#form").serialize(),
			success:function(data){
				$.msgtip({
					type:'success',
					text:"删除成功！",
					timeout:3000,
				});
				grid.datagrid("reload");
				
			},
			error:function(){
				//alert("test");
			}
			
		});
	}
</script>
</html>