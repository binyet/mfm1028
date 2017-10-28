<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<%@include file="../../../../resource/mfm_include.jsp" %>
<title>数据录入 增加配矿信息</title>
</head>
<body>
	<div id="cc">
		<div data-options="region:'west',title:'车次信息',split:true" style="width:48%;">
			<div id="tb">
				<form id="searchForm" method="post" class="form-horizontal" >
					<div class="form-group form-group-sm"></div>
					<div class="form-group form-group-sm">
						<label class="col-sm-2 control-label">客户名称</label>
						    <div class="col-sm-2">
						    	<select name="cbId" id="cbId" class="form-control combox-select"></select>
						    </div>
						    <label class="col-sm-2 control-label">车次</label>
						    <div class="col-sm-2">
						    	<input type="text" class="form-control" id="checi" name="checi" />
						    </div>
						     <label class="col-sm-2 control-label">存放区域</label>
						    <div class="col-sm-2">
						    	<select name="aresId" id="aresId" class="form-control combox-select" 
										data-options="url:'${ctx }/mfm/Ares/getComboboxList.haze',
										valueField: 'id',    
		        						textField: 'aresName'"
					>
					</select>
						    </div>
						</div>
				 	</form>
				<div id="buttonDiv"></div>
			</div>
			<table id ="checiGrid">
				<thead>
					<tr>
						<th data-options="field:'ck',checkbox:true"></th>
						<th data-options="field:'id',width:100,hidden:true">id</th>
						<th data-options="field:'name',width:100,formatter:linkName">客户名称</th>
						<th data-options="field:'checi',width:60">车次</th>
						<th data-options="field:'wetMine',width:80">湿重</th>
						<th data-options="field:'darkMine',width:90">干重</th>	
						<th data-options="field:'tasteAu',width:60">金品位</th>
						<th data-options="field:'aresName',width:90">所在区域</th>	
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
			<div data-options="region:'center',border:false" style="padding-top: 5px;" >
				<f:form-item labelName="投料单位" labelSm="2" eleSm="3" singleCol="false">
					<select name="touliaoDept" id="touliaoDept" class="form-control combox-select" validate="{notEmpty:{}}" 
						data-options="url:'${ctx }/mfm/Dept/getComboboxList.haze',
										valueField: 'id',    
		        						textField: 'deptName'"
					>
					</select>
				</f:form-item>
				
				<f:form-item labelName="投料性质" labelSm="2" eleSm="3">
					<select name="touliaoXz" id="touliaoXz" class="form-control combox-select" validate="{notEmpty:{}}"
						data-options="url:'${ctx }/platform/misc/dictionary/getMapByNodeKeyByCache.haze?nodeKey=touliaoXz',
										valueField: 'itemKey',    
		        						textField: 'name'"
					>
					</select>
				</f:form-item>
				
				<f:form-item labelName="湿矿" labelSm="2" eleSm="3" singleCol="false">
					<input type="text" class="form-control" placeholder="湿矿" id="pkWetMine" name="pkWetMine" readonly="readonly" value="">
				</f:form-item>
				
				<f:form-item labelName="干矿" labelSm="2" eleSm="3">
					<input type="text" class="form-control" placeholder="干矿" id="pxDarkMine" name="pxDarkMine" readonly="readonly" value="">
				</f:form-item>
				
				<f:form-item labelName="金品位" labelSm="2" eleSm="3" singleCol="false">
					<input type="text" class="form-control" placeholder="金品位" id="pkTasteAu" name="pkTasteAu" readonly="readonly" value="">
				</f:form-item>
				
				<f:form-item labelName="金含量" labelSm="2" eleSm="3">
					<input type="text" class="form-control" placeholder="金含量" id="pkConAu" name="pkConAu" readonly="readonly" value="">
				</f:form-item>
				
				<f:form-item labelName="银品位" labelSm="2" eleSm="3" singleCol="false">
					<input type="text" class="form-control" placeholder="银品位" id="pkTasteAg" readonly="readonly" name="pkTasteAg" value="">
				</f:form-item>
				
				<f:form-item labelName="银含量" labelSm="2" eleSm="3">
					<input type="text" class="form-control" placeholder="银含量" id="pkConAg"  readonly="readonly"name="pkConAg" value="">
				</f:form-item>
				
				<f:form-item labelName="硫含量" labelSm="2" eleSm="3" singleCol="false">
					<input type="text" class="form-control" placeholder="硫含量" id="pkConS" readonly="readonly" name="pkConS" value="">
				</f:form-item>
				
				<f:form-item labelName="铜含量" labelSm="2" eleSm="3">
					<input type="text" class="form-control" placeholder="铜含量" id="pkConCu" readonly="readonly" name="pkConCu" value="">
				</f:form-item>
				
				<f:form-item labelName="铅含量" labelSm="2" eleSm="3" singleCol="false">
					<input type="text" class="form-control" placeholder="铅含量" id="pkConPb" readonly="readonly" name="pkConPb" value="">
				</f:form-item>
				
				<f:form-item labelName="锌含量" labelSm="2" eleSm="3">
					<input type="text" class="form-control" placeholder="锌含量" id="pkConZn" readonly="readonly" name="pkConZn" value="">
				</f:form-item>
				
				<f:form-item labelName="砷含量" labelSm="2" eleSm="3" singleCol="false">
					<input type="text" class="form-control" placeholder="砷含量" id="pkConAs" readonly="readonly" name="pkConAs" value="">
				</f:form-item>
				
				<f:form-item labelName="锑含量" labelSm="2" eleSm="3">
					<input type="text" class="form-control" placeholder="锑含量" id="pkConSb" readonly="readonly" name="pkConSb" value="">
				</f:form-item>
				
				<f:form-item labelName="金浸渣含量" labelSm="2" eleSm="3" singleCol="false">
					<input type="text" class="form-control" placeholder="金浸渣含量" id="pkJinzhaAu" readonly="readonly" name="pkJinzhaAu" value="">
				</f:form-item>
				
				<f:form-item labelName="银浸渣含量" labelSm="2" eleSm="3">
					<input type="text" class="form-control" placeholder="银浸渣含量" id="pkJinzhaAg" readonly="readonly" name="pkJinzhaAg" value="">
				</f:form-item>
				
				<f:form-item labelName="总耗药" labelSm="2" eleSm="3" singleCol="false">
					<input type="text" class="form-control" placeholder="总耗药" id="pkHaoyao" readonly="readonly" name="pkHaoyao" value="">
				</f:form-item>
				
				<f:form-item labelName="备注" labelSm="2" eleSm="3">
					<input type="text" class="form-control" placeholder="备注" id="remark" name="remark" value="">
				</f:form-item>
			</div>
			 	<input name="checiJson" id="checiJson" type="hidden" ><!--所选车辆的json  -->
			</f:form>
		</div>
	</div>
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
			 pageList:[100,200,500],
			 queryParams:{
				 'pageBean.pageSize':200
			 },
			 url:'${ctx }/mfm/Stock/getStockDetailList.haze?isTouliao=0&isPinwei=1',
			 onSelect:function(index, row){//当用户选择一行时 右边的数据就会变化
				 updateJb();
			 },
			 onUnselect:function(index, row){//用户取消选择一行时 右边的数据也会有变化
				 updateJb();
			 },
			 onSelectAll:function(index, row) {//用户全选时 右边的数据也会有变化
				 updateJb();
			 },
			 onUnselectAll:function(index, row){//用户取消全选时 右边的数据也会有变化
				 updateJb();
			 }
		 });
	  
	  //分页
	  grid.datagrid('getPager').pagination({
			pageSize:200,
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
	   $('#cbId').combobox({
		   valueField: 'cbId',    
		   textField: 'name',
		   loader:function(param,success,error){
				 $.ajax({
						url:path+'MapController/InterfaceCustomList.haze',
						dataType:'jsonp',
						jsonpCallback:'jsonCb1',
						success:function(jdata){
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
					 //传入分页参数和查询条件
					 var queryObj = grid.datagrid("options").queryParams;
					 var formArray = $("#searchForm").serializeArray();
						for(var i=0;i<formArray.length;i++){
							queryObj[formArray[i].name] = formArray[i].value;
					}
					grid.datagrid('reload',queryObj);
				}
		 },{
				useable:true,
				text:'刷新',
				icon:'fa-refresh',
				click:function(){
					 //完善品位信息
					 $.ajax({
						 async:false,
						 type:'post',
						 url:'${ctx }/mfm/Pkxx/saveTaste.haze',
						 success:function(data){
							 var opts = grid.datagrid("options");
							 var queryObj = grid.datagrid("options").queryParams;
							 var formArray = $("#searchForm").serializeArray();
								for(var i=0;i<formArray.length;i++){
									queryObj[formArray[i].name] = formArray[i].value;
							}
								grid.datagrid('reload',queryObj);
									$.msgtip({
										type:'success',
										text:'已刷新数据',
										timeout:3000,
									});
						 },
						 error:function(){
							 $.msgtip({
									type:'danger',
									text:'连接出错!',
									timeout:3000,
								});
						 }
					 });
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
		var tasteAu = row.tasteAu != null && row.tasteAu !=''?row.tasteAu:'';
		var conAu = row.conAu != null && row.conAu !=''?row.conAu:'';
		var tasteAg = row.tasteAg != null && row.tasteAg !=''?row.tasteAg:'';
		var conAg = row.conAg != null && row.conAg !=''?row.conAg:'';
		var tasteS = row.tasteS != null && row.tasteS !=''?row.tasteS:'';
		var conS = row.conS != null && row.conS !=''?row.conS:'';
		var cu = row.cu != null && row.cu !=''?row.cu:''; 
		var pb = row.pb != null && row.pb !=''?row.pb:''; 
		var zn = row.zn != null && row.zn !=''?row.zn:''; 
		var arsenic = row.arsenic != null && row.arsenic !=''?row.arsenic:''; 
		var sb = row.sb != null && row.sb !=''?row.sb:''; 
		var jinzhaAu = row.jinzhaAu != null && row.jinzhaAu !=''?row.jinzhaAu:''; 
		var jinzhaAg = row.jinzhaAg != null && row.jinzhaAg !=''?row.jinzhaAg:''; 
		var haoyao = row.haoyao != null && row.haoyao !=''?row.haoyao:''; 
		var aresName = row.aresName != null && row.aresName !=''?row.aresName:''; 
		return '<a style="text-decoration: underline" '
				+'Title = "金品位:'+tasteAu+'&#13金含量:'+conAu
				+'&#13银品位:'+tasteAg+'&#13银含量:'+conAg
				+'&#13硫品位:'+tasteS+'&#13硫含量:'+conS
				+'&#13铜:'+cu+'&#13铅:'+pb+'&#13锌:'+zn+'&#13砷:'+arsenic+'&#13锑:'+sb
				+'&#13金浸渣:'+jinzhaAu+'&#13银浸渣:'+jinzhaAg+'&#13耗药:'+haoyao+'&#13存放区域:'+aresName+'">'+val+'</a>';
	}
	//表单的异步保存
	function ajaxSubmit(){
		$.ajax({
			type:'post',
			url:'${ctx }/mfm/Pkxx/savePkxx.haze',
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
						$.msgtip({
							type:'success',
							text:'配矿成功！',
							timeout:3000,
						});
						$("#checiGrid").datagrid('reload');//刷新车次表
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
	
	//当用户选中或者取消选中的车次时 右边的基本信息会发生变化
	function updateJb(){
		var pkWetMine = 0;//湿矿
		var pxDarkMine = 0;//干矿
		var pkTasteAu = 0;//金品位
		var pkConAu = 0;//金含量
		var pkTasteAg = 0;//银品位
		var pkConAg = 0;//银含量
		var pkConS = 0;//硫含量
		var pkConCu = 0;//铜含量
		var pkConPb = 0;//铅含量
		var pkConZn = 0;//锌含量
		var pkConAs = 0;//砷含量
		var pkConSb = 0;//锑含量
		var pkJinzhaAu = 0;//金浸渣含量
		var pkJinzhaAg = 0;//银浸渣含量
		var pkHaoyao = 0;//总耗药
		//parseFloat将字符串转化为数字
		var rows = grid.datagrid('getSelections');//获取所有的选中行
		 if(null != rows && rows.length >0){
			 for (var i = 0; i < rows.length; i++) {
				 var row = rows[i];
				 pkWetMine = parseFloat(pkWetMine)+ parseFloat((row.wetMine != null && row.wetMine)?row.wetMine:0);//湿重的所有选中行的和
				 pxDarkMine = parseFloat(pxDarkMine)+parseFloat((row.darkMine != null && row.darkMine)?row.darkMine:0);//干重 
				 pkConAu = parseFloat(pkConAu)+parseFloat((row.conAu != null && row.conAu)?row.conAu:0);//金含量 
				 pkConAg = parseFloat(pkConAg)+parseFloat((row.conAg != null && row.conAg)?row.conAg:0);//银含量
				 pkConS = parseFloat(pkConS)+parseFloat((row.conS != null && row.conS)?row.conS:0);//硫含量
				 pkConCu = parseFloat(pkConCu)+parseFloat((row.cu != null && row.cu)?row.cu:0);//铜含量
				 pkConPb = parseFloat(pkConPb)+parseFloat((row.pb != null && row.pb)?row.pb:0);//铅含量
				 pkConZn = parseFloat(pkConZn)+parseFloat((row.zn != null && row.zn)?row.zn:0);//锌含量
				 pkConAs = parseFloat(pkConAs)+parseFloat((row.arsenic != null && row.arsenic)?row.arsenic:0);//砷含量
				 pkConSb = parseFloat(pkConSb)+parseFloat((row.sb != null && row.sb)?row.sb:0);//锑含量
				 pkJinzhaAu = parseFloat(pkJinzhaAu)+parseFloat((row.jinzhaAu != null && row.jinzhaAu)?row.jinzhaAu:0);//金浸渣
				 pkJinzhaAg = parseFloat(pkJinzhaAg)+parseFloat((row.jinzhaAg != null && row.jinzhaAg)?row.jinzhaAg:0);//银浸渣
				 pkHaoyao = parseFloat(pkHaoyao)+parseFloat((row.haoyao != null && row.haoyao)?row.haoyao:0);//耗药
			}
		 }
		$('#pkWetMine').val(parseFloat(fixed11(pkWetMine)));
		$('#pxDarkMine').val(parseFloat(fixed11(pxDarkMine)));
		$('#pkConAu').val(parseFloat(fixed11(pkConAu)));
		$('#pkConAg').val(parseFloat(fixed11(pkConAg)));
		if(pxDarkMine != 0){
			pkTasteAu = fixed(pkConAu/pxDarkMine);//金品位等于 金含量除以干重
			pkTasteAg = fixed(pkConAg/pxDarkMine);//银品位
		}
		$('#pkTasteAu').val(parseFloat(pkTasteAu));
		$('#pkTasteAg').val(parseFloat(pkTasteAg));
		$('#pkConS').val(parseFloat(fixed11(pkConS)));//硫含量
		$('#pkConCu').val(parseFloat(fixed11(pkConCu)));
		$('#pkConPb').val(parseFloat(fixed11(pkConPb)));
		$('#pkConZn').val(parseFloat(fixed11(pkConZn)));
		$('#pkConAs').val(parseFloat(fixed11(pkConAs)));
		$('#pkConSb').val(parseFloat(fixed11(pkConSb)));
		$('#pkJinzhaAu').val(parseFloat(fixed11(pkJinzhaAu)));
		$('#pkJinzhaAg').val(parseFloat(fixed11(pkJinzhaAg)));
		$('#pkHaoyao').val(parseFloat(fixed11(pkHaoyao)));
	}
	function fixed(num){
		  return num.toFixed(2);
		}
	function fixed11(num){
		  return num.toFixed(11);
		}
</script>
</html>