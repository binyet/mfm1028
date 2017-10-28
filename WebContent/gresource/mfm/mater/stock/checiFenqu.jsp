<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html">
<html>
<head>
<%@include file="../../../../resource/mfm_include.jsp" %>
<title>车次分区</title>
</head>
<body>
	<div id="cc">
		<div data-options="region:'west',title:'车次信息',split:true" style="width:48%;">
			<div id="tb">
				<form id="searchForm" method="post" class="form-horizontal" >
					<div class="form-group form-group-sm"></div>
					<div class="form-group form-group-sm">
						<label class="col-sm-2 control-label">客户名称</label>
						    <div class="col-sm-4">
						    	<select name="name" id="name" class="form-control combox-select"></select>
						    </div>
						    <label class="col-sm-2 control-label">车次</label>
						    <div class="col-sm-4">
						    	<input type="text" class="form-control" id="vehicleTime" name="vehicleTime" />
						    </div>
						</div>
						<div class="form-group form-group-sm">
						    <label class="col-sm-2 control-label">过磅时间</label>
							    <div class="col-sm-4">
							    	<input type="text" class="form-control" id="ltCreatetime_str" name="ltCreatetime_str" value="${getTime }"  onClick="WdatePicker({dateFmt:'yyyy-MM-dd'})">    	
							    </div>
						     <label class="col-sm-2 control-label">至</label>
							    <div class="col-sm-4">
							    	<input type="text" class="form-control" id="gtCreatetime_str" name="gtCreatetime_str" value="${getTime }"  onClick="WdatePicker({dateFmt:'yyyy-MM-dd'})">
							    </div>  
					 	</div>
				 	</form>
				<div id="buttonDiv"></div>
			</div>
			<table id ="checiGrid">
				<thead>
					<tr>
						<th data-options="field:'ck',checkbox:true"></th>
						<th data-options="field:'name',width:120,formatter:linkName">客户名称</th>
						<th data-options="field:'vtNumber',width:100">车牌号</th>
						<th data-options="field:'checi',width:80">车次</th>
<!-- 						<th data-options="field:'vehicleTime',width:80">车次</th> -->
<!-- 						<th data-options="field:'zonghecheci',width:90">综合车次</th> -->
						<th data-options="field:'mineStr',width:90">矿类</th>	
						<th data-options="field:'mine',width:90,hidden:true">矿类</th>	
						<th data-options="field:'meterDate_Str',width:100">过磅日期</th>
						<th data-options="field:'zonghecheciBh',hidden:true">综合车次编号</th>
					</tr>
				</thead>
			</table>
		</div>
		<div data-options="region:'center',title:'基本信息',split:true">
			<f:form id="mainform" action="javascript:ajaxSubmit()" method="post">
				<div data-options="region:'north',border:false" style="height:33px">
		 		<div id="tb">
					<div id="buttonDivCenter"></div>
				</div>
		 	</div>
			<div data-options="region:'center',border:false" style="padding-top: 5px;">
				<f:form-item labelName="存放区域" labelSm="2" eleSm="4">
					<select name="aresId" id="aresId" class="form-control combox-select" validate="{notEmpty:{}}" 
						data-options="url:'${ctx }/mfm/Ares/getComboboxList.haze',
										valueField: 'id',    
		        						textField: 'aresName'"
					>
					</select>
				</f:form-item>
				
				<f:form-item labelName="性质" labelSm="2" eleSm="4">
					<select name="xingzhi" id="xingzhi" class="form-control combox-select" validate="{notEmpty:{}}"
						data-options="url:'${ctx }/platform/misc/dictionary/getMapByNodeKeyByCache.haze?nodeKey=meterXingzhi',
										valueField: 'itemKey',    
		        						textField: 'name'"
					>
					</select>
				</f:form-item>
				
				<f:form-item labelName="备注" labelSm="2" eleSm="4">
					<input type="text" class="form-control" placeholder="备注" id="remark" name="remark" value="">
				</f:form-item>
			</div>
			<input name="checiJson" id="checiJson" type="hidden" ><!--所选车辆的json  -->
			</f:form>
		</div>
	</div>
	
<!-- 	<div id="queryDiv" class="queryDiv" > -->
<!-- 		<form id="searchForm" method="post" class="form-horizontal" > -->
<!-- 		<div class="form-group form-group-sm"></div> -->
<!-- 		<div class="form-group form-group-sm"> -->
<!-- 			<label class="col-sm-2 control-label">客户名称</label> -->
<!-- 			    <div class="col-sm-4"> -->
<!-- 			    	<select name="name" id="name" class="form-control combox-select"></select> -->
<!-- 			    </div> -->
<!-- 			    <label class="col-sm-2 control-label">车次</label> -->
<!-- 			    <div class="col-sm-4"> -->
<!-- 			    	<input type="text" class="form-control" id="vehicleTime" name="vehicleTime" /> -->
<!-- 			    </div> -->
<!-- 			</div> -->
<!-- 			<div class="form-group form-group-sm"> -->
<!-- 			    <label class="col-sm-2 control-label">过磅时间</label> -->
<!-- 				    <div class="col-sm-4"> -->
<%-- 				    	<input type="text" class="form-control" id="ltCreatetime_str" name="ltCreatetime_str" value="${getTime }"  onClick="WdatePicker({dateFmt:'yyyy-MM-dd'})">    	 --%>
<!-- 				    </div> -->
<!-- 			     <label class="col-sm-2 control-label">至</label> -->
<!-- 				    <div class="col-sm-4"> -->
<%-- 				    	<input type="text" class="form-control" id="gtCreatetime_str" name="gtCreatetime_str" value="${getTime }"  onClick="WdatePicker({dateFmt:'yyyy-MM-dd'})"> --%>
<!-- 				    </div>   -->
<!-- 		 	</div> -->
<!-- 	 	</form> -->
<!-- 	</div> -->
</body>
<script type="text/javascript">
	var grid;
	var dialog = frameElement.dialog;
	var isAdd = ${isAdd};
	$(document).ready(function(){
		//布局
		$('#cc').layout({
			fit:true
		});
		$("#mainform").formValidator();//验证表格
		//车次表
		 grid = $('#checiGrid').datagrid({
			 toolbar:'#tb',
			 rownumbers : true,
			 pagination : true,
			 fit : true,
			 pageList:[10,20,50],
			 queryParams:{
				 'pageBean.pageSize':20
			 },
			 url:'http://124.128.29.66:8082/misSql/mis/MapController/InterfaceCheciList.haze',
			// url:'${ctx}/mis/bianmaguanli/combine/getcomList.haze',
			 loader:function(param,success,error){
				 //传入分页参数和查询条件
				 var queryObj = $(this).datagrid("options").queryParams;
				 var formArray = $("#searchForm").serializeArray();
					for(var i=0;i<formArray.length;i++){
						queryObj[formArray[i].name] = formArray[i].value;
				}
					//处理跨域数据
				 $.ajax({
						url:$(this).datagrid("options").url,
						type:'POST',
						data:queryObj,
						dataType:'jsonp',
						jsonpCallback:'jsonCb',
						success:function(jdata){
							success(jdata);
						},
						error:function(xhr){
							error(xhr.responseText);
						}
					});
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
			}
		}); 
	   //查询条件的弹窗
		var qd = initQueryDiv("#queryDiv",260,grid);
	   
	   //客户的下拉框
	   $('#name').combobox({
		   valueField: 'cbId',    
		   textField: 'name',
		   loader:function(param,success,error){
				 $.ajax({
						url:path+'/MapController/InterfaceCustomList.haze',
						dataType:'jsonp',
						jsonpCallback:'jsonCb1',
						success:function(jdata){
							console.log(jdata);
							success(jdata);
						},
						error:function(xhr){
							error(xhr.responseText);
						}
					});
			 }
	   });
	   
	    //车次列表的查询按钮
		 $("#buttonDiv").buttonGroup([{
			 	useable:true,
				text:'查询',
				icon:'fa-search',
				click:function(e){
// 					qd.window('move',{left:e.pageX,top:e.pageY});
// 					qd.window('open');
					grid.datagrid('reload');
				}
		 }])
		 //基本信息的保存按钮
		  $("#buttonDivCenter").buttonGroup([{
			 	useable:true,
				text:'保存',
				icon:'fa-save',
				click:function(e){
					var rows = $('#checiGrid').datagrid("getSelections");
					if(rows.length == 0){
						$.msgtip({
							type:'danger',
							text:'请选择车次',
							timeout:3000,
						});
						return false;
					}
					$("#checiJson").val(JSON.stringify(rows));
					$("#mainform").submit();
// 					qd.window('move',{left:e.pageX,top:e.pageY});
// 					qd.window('open');
				}
		 }])
	});
	
	//点击名称就是明细
	function linkName(val,row){
		return val;
// 		return '<a style="text-decoration: underline" href="javascript:dialog1(\''+row.name+'\','
// 				+row.checi+',\''+row.meterDate_Str+'\','+row.mine+',\''+row.cbId+'\')">'
// 		+val+'</a>';
	}
	//打开详细车次的窗口
	function dialog1(name,checi,meterDate_Str,mine,cbId){
		$.gsWindow({
			url:'${ctx}/mfm/Stock/checiGet.haze',
			title:name,
			mine:mine,//矿类  99是铅
			cbId:cbId,//客户id
			checi:checi,//车次
			meterDate_Str:meterDate_Str//过磅日期
		});
	}
	//表单的异步保存
	function ajaxSubmit(){
		$.ajax({
			type:'post',
			url:'${ctx }/mfm/Stock/saveCheciFenqu.haze',
			data:$("#mainform").serialize(),
			beforeSend:function(){
				$.messager.watting({
		  			title:'提示',
		  			msg:'正在保存数据，请稍后...'
		  		});
			},
			success:function(data){
				if(isAdd == '1'){
                   parent.$("#datagrid").datagrid('reload');//刷新父页面的表格
					dialog.close();
				}else{
					if(data == true){
						$.msgtip({
							type:'success',
							text:'入库成功！',
							timeout:3000,
						});
						$("#checiGrid").datagrid('reload');//刷新车次表
					}else{
						$.msgtip({
							type:'danger',
							text:'连接出现错误!',
							timeout:3000,
						});
					}
				}
				$.messager.watting("close");
			},
			error:function(){
				$.messager.watting("close");
				$.msgtip({
					type:'danger',
					text:'连接出现错误!',
					timeout:3000,
				});
			}
		});
	}
</script>
</html>