<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<%@include file="../../../../resource/mfm_include.jsp" %>
<html>
<head>
<title>入库查询</title>
</head>
<body>

	<div id="cc">
		 <div data-options="region:'north',split:true" style="height:150px;">
			 <form id="searchForm" method="post" class="form-horizontal" action="javascript:ajaxSubmit()">
		 		<input type="hidden" id="id" name="id"  />
				<input type="hidden" id="carNum" name="carNum" value=""/>
				<input type="hidden" id="checi" name="checi" value=""/>
				<input type="hidden" id="maozhong" name="maozhong"  value=""/>
				<input type="hidden" id="pizhong" name="pizhong" value=""/>
				<input type="hidden" id="jingzhong" name="jingzhong" value=""/>
				<input type="hidden" id="auditor" name="auditor" value=""/>
				<input type="hidden" id="driver" name="driver" value=""/>
				<input type="hidden" id="weighDate" name="weighDate" value=""/>
			 
			 	<div class="form-group form-group-sm form-horizontal" style="margin-top:20px;">
					 <label class="col-sm-2 control-label">客户</label>
					    <div class="col-sm-2">
					    
					    	<select name="client" id="client" class="form-control combox-select"
							data-options="url:'${ctx }/mfm/Client/getComboboxList.haze',
											valueField: 'id',    
			        						textField: 'clientName',
											loadFilter:function(data){
											     data.unshift({clientName:'',clientName:''});
											    return data;
											}
			        						">
							</select>
						</div>
						<label class="col-sm-2 control-label">性质</label>
						 <div class="col-sm-2"> 
							<select name="property" id="property" class="form-control combox-select" 
							data-options="url:'${ctx }/mfm/Property/getComboboxList.haze',
											valueField: 'id',    
			        						textField: 'propertyName',
											loadFilter:function(data){
											     data.unshift({propertyName:'',propertyName:''});
											    return data;
											}">
							</select>
					    </div>
					 </div>
					 <div class="form-group form-group-sm form-horizontal">
					    <label class="col-sm-2 control-label">过磅人</label>
						 <div class="col-sm-2"> 
							<select name="weigher" id="weigher" class="form-control combox-select" 
							data-options="url:'${ctx }/mfm/Weigher/getComboboxList.haze',
											valueField: 'id',    
			        						textField: 'weigherName',
											loadFilter:function(data){
											     data.unshift({weigherName:'',weigherName:''});
											    return data;
											}">
							</select>
					    </div>
					    <label class="col-sm-2 control-label">来源</label>
						 <div class="col-sm-2"> 
							<select name="source" id="source" class="form-control combox-select" 
								data-options="url:'${ctx }/mfm/Source/getComboboxList.haze',
											valueField: 'id',    
			        						textField: 'sourceName',
											loadFilter:function(data){
											     data.unshift({sourceName:'',sourceName:''});
											    return data;
											}">
							</select>					    
						</div>
					</div>
					 <div class="form-group form-group-sm form-horizontal">
					 	<label class="col-sm-2 control-label">开始时间</label>
						 <div class="col-sm-2"> 
							<input type="text"  class="form-control" id="startDate" name="startDate" onClick="WdatePicker()" value="">
					    </div>
   					 	<label class="col-sm-2 control-label">终止时间</label>
					    <div class="col-sm-2"> 
							<input type="text"  class="form-control" id="endDate" name="endDate" onClick="WdatePicker()" value="">
					    </div>
   					    <div  class="col-sm-2" id="northButton"></div>
					    
				    </div>
			</form>
		 </div> 
		 <div data-options="region:'center'" style="padding:5px;">
			<div id="tb">
				<div id="buttonDiv"></div>
			</div>
			<table id="datagrid" title="称重记录">
				<thead>
					<tr>
						<th data-options="field:'ck',checkbox:true"></th>
						<th data-options="field:'id',hidden:true" >id</th>
						<th data-options="field:'client',width:120,align:'center'">客户</th>
						<th data-options="field:'property',width:100,align:'center'">性质</th>
						<th data-options="field:'checi',width:100,align:'center'">车次</th>
						<th data-options="field:'source',width:100,align:'center'">来源</th>
				<!-- 	<th data-options="field:'pkWetMine',width:100,align:'center'">湿矿</th> -->	
						<th data-options="field:'weigher',width:100,align:'center'">过磅人</th>
						<th data-options="field:'weighDate',width:140,align:'center'">称重时间</th>
					<!-- 	<th data-options="field:'remark',width:140,align:'y'">描述</th> -->
					</tr>
				</thead>
			</table>

		</div>
		
	</div>
</body>
<script type="text/javascript">



var grid;
	$(document).ready(function(){
		$('#cc').layout({
			fit:true
		});
			//从后台获取列表数据
		grid = $('#datagrid').datagrid({
	//	 view: detailview,
		 fit:true,
		 toolbar:'#tb',
		 rownumbers : true,
		 pagination : true,
		 striped : true,
		 url:'${ctx }/mfm/Weigh/getReportList.haze',	
		 detailFormatter: function(rowIndex, rowData){ 
			 return '<div style="padding:2px"><table class="ddv"></table></div>';
			 },
		 onLoadSuccess:function(){
			 var rows = $('#datagrid').datagrid('getRows');
			 for(var i = 0;i < rows.length; i++){
				 if(rows[i].state == '0'){
					  $(this).datagrid('getExpander',i).hide();
	                }
			 	}
           }
		 });
	//分页
	grid.datagrid('getPager').pagination({
	pageSize:20,
	pageNumber:1,
	onSelectPage:function(pageNumber, pageSize){
		var opts = grid.datagrid("options");
		var queryObj = opts.queryParams || {};
		queryObj['pageBean.pageSize']=pageSize;
		queryObj['pageBean.pageNumber']=pageNumber;
		grid.datagrid('reload',queryObj);
// 		console.log(grid.datagrid('getData'));
	}
});
			//消息弹框
			showMessageInit();
			$('#northButton').buttonGroup([{
				useable:true,
				text:'查询',
				icon:'fa-search',
				
				click:function(){
					$.ajax({
						type:'post',
						url:'${ctx }/mfm/Weigh/getReportList.haze',
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
			}, {
				useable:true,
				text:'重置',
				icon:'fa-search',
				
				click:function(){
					 var clients = $('#client').combobox('getData');
					 //alert($('#client').combobox('getValue'));
					 $('#client').combobox('select', clients[0].id);
					 var propertys = $('#property').combobox('getData');
					 $('#property').combobox('select', propertys[0].id);
					 var weighers = $('#weigher').combobox('getData');
					 $('#weigher').combobox('select', weighers[0].id);
					 var sources = $('#source').combobox('getData');
					 $('#source').combobox('select', sources[0].id);
					 
					 $('#startDate').val('');
					 $('#endDate').val('');
				}
			}]);
	});
	//按钮
	$('#buttonDiv').buttonGroup([{
		useable:true,
		text:'导出Excel',
		icon:'fa-share',
		click:function(){
			var rows = $("#datagrid").datagrid("getRows");
			//alert(rows.length);
			if(rows.length == 0){
				$.msgtip({text:"没有要导出的数据",type:'warning'});
			}else{
				$("#searchForm").attr("action","${ctx }/mfm/Weigh/toTasteQueryExcelTaste.haze");
				$("#searchForm").submit();
			}
		}
	}]);


</script>
</html>