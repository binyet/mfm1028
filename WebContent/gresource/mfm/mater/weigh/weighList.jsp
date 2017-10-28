<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE html>
<html>
<head>
<title>区域管理列表</title>
<%@include file="../../../../resource/mfm_include.jsp" %>
<script type="text/javascript" src="${ctx }/resource/lodop/js/LodopFuncs.js"></script>
<script type="text/javascript" src="${ctx }/gresource/mis/sample/sampleBase/printMakeCode.js"></script>
<style type="text/css">
.tableFootInput{
	height:25px;
	line-height:25px;
	width: 90%;
}
.tableFootInputErr{
	    border: #a94442 solid 1px;
	    outline: #a94442 solid 1px;
}
</style>
</head>
<body>
	<div id="tb">
		<div id="buttonDiv"></div>
		要使用的打印机：<select id="printSelect" name="printSelect"></select>
		
	</div>
	<form id="form" action="javascript:ajaxSubmit()" method="post">
		<input type="hidden" id="id" name="id"  />
		<input type="hidden" id="property" name="property" value="" />
		<input type="hidden" id="carNum" name="carNum" value=""/>
		<input type="hidden" id="source" name="source" value="" />
		<input type="hidden" id="client" name="client" value=""/>
		<input type="hidden" id="driver" name="driver" value=""/>
		<input type="hidden" id="checi" name="checi" value=""/>
		<input type="hidden" id="maozhong" name="maozhong"  value=""/>
		<input type="hidden" id="pizhong" name="pizhong" value=""/>
		<input type="hidden" id="jingzhong" name="jingzhong" value=""/>
		<input type="hidden" id="aresName" name="aresName" value=""/>
		<input type="hidden" id="weigher" name="weigher" value=""/>
		<input type="hidden" id="auditor" name="auditor" value=""/>
		<input type="hidden" id="weighDate" name="weighDate" value=""/>
		<input type="hidden" id="maiduan" name="maiduan" value=""/>
		<input type="hidden" value="登录" type="submit" name="login" >
	</form>
	<table id="datagrid1" title="区域管理" class="easyui-datagrid">
		<thead>
			<tr>
				<th data-options="field:'ck',checkbox:true"></th>
				<th data-options="field:'id',hidden:true" >id</th>
				<th data-options="field:'property',width:90,formatter:function(value,row,index){return row.property},
					editor:{
						type:'combobox',
						options:{
							valueField:'propertyName',
							textField:'propertyName',
							editable:false,
							url:'${ctx }/mfm/Property/getComboboxList.haze'
							}
						}">性质</th>	
				<th data-options="field:'source',width:100,align:'center',formatter:function(value,row,index){return row.source},
					editor:{
						type:'combobox',
						options:{
							valueField:'sourceName',
							textField:'sourceName',
							editable:false,
							url:'${ctx }/mfm/Source/getComboboxList.haze'
							}
						}">来源</th>
				<th data-options="field:'client',width:80,align:'center', formatter:function(value,row,index){return row.client},
					editor:{
						type:'combobox',
						options:{
							valueField:'clientName',
							textField:'clientName',
							editable:false,
							url:'${ctx }/mfm/Client/getComboboxList.haze'
							}
						}" >客户</th>
				<th data-options="field:'carNum',width:60,align:'center'" editor="{type:'numberbox',options:{precision:0,required:true}}">车号</th>
				<th data-options="field:'driver',width:80,align:'center', formatter:function(value,row,index){return row.driver},
					editor:{
						type:'combobox',
						options:{
							valueField:'driverName',
							textField:'driverName',
							editable:false,
							url:'${ctx }/mfm/Driver/getComboboxList.haze'
							}
						}">司机</th>
				<th data-options="field:'checi',width:60,align:'center'">车次</th>
				<th data-options="field:'maozhong',width:80,align:'center'" editor="{type:'numberbox',options:{precision:3}}">毛重</th>
				<th data-options="field:'pizhong',width:60,align:'center'" editor="{type:'numberbox',options:{precision:3}}">皮重</th>
				<th data-options="field:'jingzhong',width:80,align:'center'">净重</th>
				
				<th data-options="field:'aresName',width:80,align:'center', formatter:function(value,row,index){return row.aresName},
					editor:{
						type:'combobox',
						options:{
							valueField:'aresName',
							textField:'aresName',
							editable:false,
							url:'${ctx }/mfm/Ares/getComboboxList.haze'
						}
					}">卸料区域</th>
				<th data-options="field:'weigher',width:80,align:'center', formatter:function(value,row,index){return row.weigher},
					editor:{
						type:'combobox',
						options:{
							valueField:'weigherName',
							textField:'weigherName',
							editable:false,
							url:'${ctx }/mfm/Weigher/getComboboxList.haze'
							}
						}">过磅人</th>
				<th data-options="field:'auditor',width:60,align:'center'" editor="{type:'numberbox',options:{precision:3}}">审核人</th>
				<th data-options="field:'weighDate',width:200,align:'center'">时间</th>
				<th data-options="field:'maiduan',width:80,align:'center', formatter:function(value,row,index){return row.maiduan},
					editor:{
						type:'combobox',
						options:{
							valueField:'value',
							textField:'text',
							editable:false,
							value:0,
							data:[{
									'value':'买断',
									'text':'买断'
								},{
									'value':'买单',
									'text':'买单'
								}]
							}
						}">买断</th>
				
			</tr>
		</thead>
	</table>
	<form action="javascript:ajaxSubmit()" id="form1" >
		<input type="hidden" id="ids" name="ids">
	</form><!--删除用  已经存放过原料的区域不可删除-->
</body>
<object id="LODOP_OB" classid="clsid:2105C259-1E0C-4534-8141-A753534CB4CA" width=0 height=0> 
	<embed id="LODOP_EM" type="application/x-print-lodop" width=0 height=0 pluginspage="install_lodop.exe"></embed>
</object>
<script type="text/javascript">

//当用户选中或者取消选中的车次时 右边的基本信息会发生变化
function updateJb(){//更新到隐藏的form中
	var Id = "";
	var Property = "";
	var Source = "";
	var Client = "";
	var CarNum = "";
	var Driver = "";
	var Checi = "";
	var Maozhong = "";
	var Pizhong = "";
	var Jingzhong = "";
	var Weigher = "";
	var Auditor = "";
	var WeighDate = "";
	var AresName = "";
	var Maiduan = "";
	var rows = grid.datagrid('getSelections');//获取所有的选中行
	 if(null != rows && rows.length >0){
		 for (var i = 0; i < rows.length; i++) {
			 var row = rows[i];
			 
			 Id = row.id;
			 Property = row.property;
			 Source = row.source;
			 Client = row.client;
			 CarNum = row.carNum;
			 Driver = row.driver;
			 Checi = row.checi;
			 Maozhong = row.maozhong;
			 Pizhong = row.pizhong;
			 Jingzhong = row.jingzhong;
			 Weigher = row.weigher;
			 Auditor = row.auditor;
			 WeighDate = row.weighDate;
			 AresName = row.aresName;
			 Maiduan = row.maiduan;
		}
	 }
	$('#id').val(Id);
	$('#property').val(Property);
	$('#source').val(Source);
	$('#client').val(Client);
	$('#carNum').val(CarNum);
	$('#driver').val(Driver);
	$('#checi').val(Checi);
	$('#maozhong').val(Maozhong);
	$('#pizhong').val(Pizhong);
	$('#jingzhong').val(Jingzhong);
	$('#weigher').val(Weigher);
	$('#auditor').val(Auditor);
	$('#weighDate').val(WeighDate);
	$('#aresName').val(AresName);
	$('#maiduan').val(Maiduan);
}



$("#form").formValidator({
	 onSubmit:function(){
		var flag = red.submitCheck();
		var rows = $('#datagrid1').datagrid('getRows');
		$('#property').val(JSON.stringify(rows));
		return flag;
	 }
});

var grid;
$(document).ready(function(){

	//打印机设置
	var printCount = 0;
	try{
		LODOP = getLodop();
		printCount = LODOP.GET_PRINTER_COUNT();
		//设置可以选择的打印机
		for(var i=0;i<printCount;i++){
			$("#printSelect").append('<option value="' + i + '">' + LODOP.GET_PRINTER_NAME(i) + '</option>');
		}
		var defaultPrintName = LODOP.GET_PRINTER_NAME(-1);
		$("#printSelect option").each(function(){
			if($(this).text() == defaultPrintName){
				$(this).attr("selected","selected");
			}
		});
	}catch(e){
		
	}
	
	//从后台获取列表数据
	//grid = datagrid('#datagrid1','${ctx }/mfm/Weigh/getList.haze','#tb',false);
	grid = $("#datagrid1").datagrid({
		rownumbers : true,
		striped : true,
		toolbar:'#tb1',
		url:'${ctx }/mfm/Weigh/getList.haze',
		singleSelect:true,
		nowrap:true,
	});

	//table可编辑
	$("#datagrid1").datagridEdit({

		onBeforeCellEdit:function(){
			return false;
		},
		onSelect:function(index, row){//当用户选择一行时 右边的数据就会变化
			//alert(index);
			//alert(row.property);
			 updateJb();
			 
			 //选中行后，判断各个单元格的editor是否删除或创建
			 if(row.property == undefined || row.property == ""){
				 $("#datagrid1").datagrid('addEditor',[ {field:'property',editor:{
                              type:'combobox',
                              options:{
      							valueField:'propertyName',
      							textField:'propertyName',
      							editable:false,
      							required:true,
      							url:'${ctx }/mfm/Property/getComboboxList.haze'
      							}
                          }
                      }]);
			 }
			 else{
				 	$("#datagrid1").datagrid('removeEditor','property');
			 }
			 
			 if(row.source == undefined||row.source == ""){
				 $("#datagrid1").datagrid('addEditor',[ {field:'source',editor:{
                     type:'combobox',
                     options:{
							valueField:'sourceName',
							textField:'sourceName',
							editable:false,
							required:true,
							url:'${ctx }/mfm/Source/getComboboxList.haze'
							}
                 }
             	}]);
			 }
			 else{
				 	$("#datagrid1").datagrid('removeEditor','source');
				 
			 }
			 if(row.client == undefined || row.client == ""){
				 $("#datagrid1").datagrid('addEditor',[ {field:'client',editor:{
                     type:'combobox',
                     options:{
							valueField:'clientName',
							textField:'clientName',
							editable:false,
							required:true,
							url:'${ctx }/mfm/Client/getComboboxList.haze'
							}
                 }
             	}]);
			 }else
				 	$("#datagrid1").datagrid('removeEditor','client');
			 
			 
			 if(row.driver == undefined || row.driver == ""){
				 $("#datagrid1").datagrid('addEditor',[ {field:'driver',editor:{
                     type:'combobox',
                     options:{
							valueField:'driverName',
							textField:'driverName',
							editable:false,
							required:true,
							url:'${ctx }/mfm/Driver/getComboboxList.haze'
							}
                 }
             	}]);
			 }else
				 $("#datagrid1").datagrid('removeEditor','driver');
			 if(row.carNum == undefined || row.carNum == ""){
				 $("#datagrid1").datagrid('addEditor',[ {field:'carNum',editor:{
                     type:'textbox',
                     options:{
                    	 precision:0,
                    	 required:true
                     }
                 }
             	}]);
			 }
			 else
				 	$("#datagrid1").datagrid('removeEditor','carNum');
			 
			 if(row.maozhong == undefined || row.maozhong == ""){
				 $("#datagrid1").datagrid('addEditor',[ {field:'maozhong',editor:{
					 type:'textbox',
                     options:{
                    	 precision:3,
                    	 required:true
                     }
                 }
             	}]);
			 }
			 else
				 	$("#datagrid1").datagrid('removeEditor','maozhong');
			 
			 /*
			 if(row.aresName == undefined || row.aresName == ""){
				 $("#datagrid1").datagrid('addEditor',[ {field:'aresName',editor:{
                     type:'combobox',
                     options:{
							valueField:'aresName',
							textField:'aresName',
							editable:false,
							required:true,
							url:'${ctx }/mfm/Ares/getComboboxList.haze'
							}
                 }
             	}]);
			 }else
				 $("#datagrid1").datagrid('removeEditor','aresName');
			 
			 if(row.pizhong == undefined || row.pizhong == ""){
				 $("#datagrid1").datagrid('addEditor',[ {field:'pizhong',editor:{
					 type:'textbox',
                     options:{
                    	 precision:3
                     }
                 }
             	}]);
			 }
			 else
				 	$("#datagrid1").datagrid('removeEditor','pizhong');
			 */
			 if(row.weigher == undefined || row.weigher ==""){
				 $("#datagrid1").datagrid('addEditor',[ {field:'weigher',editor:{
                     type:'combobox',
                     options:{
							valueField:'weigherName',
							textField:'weigherName',
							editable:false,
							required:true,
							url:'${ctx }/mfm/Weigher/getComboboxList.haze'
							}
                 }
             	}]);
			 }else
				 	$("#datagrid1").datagrid('removeEditor','weigher');

		 },
		onUnselect:function(index, row){
		//可编辑下拉框 继续显示text
			if ($('#datagrid1').datagrid('validateRow', index)){
				var state = $('#datagrid1').datagrid('getEditor', {index:index,field:'property'});
			}
		},
		onBeforeEdit:function(index, row){
			//alert("before");
			
		}
	});


	//消息弹框
	showMessageInit();
	//按钮
var editRow = undefined;
	$('#buttonDiv').buttonGroup([{
		useable:true,
		text:'新建',
		icon:'fa-plus',
		click:function(){//在数据表前添加一行空数据
			if (editRow != undefined) {

                $("#datagrid").datagrid('endEdit', editRow);
            }

            if (editRow == undefined) {

                $("#datagrid1").datagrid('insertRow', {
                    index: 0,
                    row: {}
                });

                $("#datagrid1").datagrid('beginEdit', 0);
                editRow = 0;
            }
		}
	},
	{
		text:'保存',
		useable:true,
		icon:'fa-save',
		click:function(){
			var rows = $('#datagrid1').datagrid('getSelections');

			for(var i=0;i<rows.length;i++){
				grid.datagrid("endEdit",grid.datagrid("getRowIndex",rows[i]));
				
			}
			 updateJb();
			if(rows.length == 0){
				$.msgtip({text:'还没有选择要保存的数据！',type:'warning'});
				return false;
			}
			var flag = true;
			
			$.ajax({
				type:'post',
				url:'${ctx }/mfm/Weigh/subsave.haze',
				data:$("#form").serialize(),     //{queryVtListStart:queryVtListStart,queryVtListEnd:queryVtListEnd,property:$("#property").val(),element:$("#element").val(),vtIdsStr:vtIdsStr},
				
				success:function(data){
					//alert($("#form").serialize());
					window.location.reload();
					//alert("succ");
				},
				error:function(data){
					//alert(data.value);
				}
			});
		}
	},
	{
		text:'取消',
		useable:true,
		icon:'fa-eraser',
		click:function(){
			window.location.reload();
		}
	},{
		useable:true,
		text:'打印',
		icon:'fa-print',
		click:function(){
			var gridData = $('#datagrid1').datagrid('getSelections');

			if($("#printSelect").val() == ""){
				$.messager.alert('没有选择打印机！');
				return false;
			}
			if(gridData.length == 0){
				$.messager.alert('没有要打印的数据！');
				return false;
			}
			$.messager.confirm('确定要打印化验报告单吗<br>当前选择的打印机为：' + $("#printSelect option:selected").text() + '？', function(r){
				if(r){
					if(r){
						$.messager.watting({
				  			title:'提示',
				  			msg:'正在准备打印数据，请稍后...'
				  		});
						$.gsWindow({
							title:'化验报告单打印',
							url:'${ctx }/mfm/Weigh/testPrint.haze',
							rows:gridData,
							data:$("#form").serialize(), 
							width:1,
							height:1,
							printSelect:$("#printSelect").val()
						});
					}
				}
			});
		}
	}
	]);
});

//扩展datagrid:动态添加删除editor
$.extend($.fn.datagrid.methods, {  
	 addEditor : function(jq, param) {   
         if (param instanceof Array) {   
             $.each(param, function(index, item) {  
                 var e = $(jq).datagrid('getColumnOption', item.field); 
                 e.editor = item.editor; }); 
             } else {    
                 var e = $(jq).datagrid('getColumnOption', param.field);    
                 e.editor = param.editor;    
             }   
         },
    removeEditor : function(jq, param) {    
        if (param instanceof Array) {   
            $.each(param, function(index, item) {  
                var e = $(jq).datagrid('getColumnOption', item);   
                e.editor = {};  
                }); 
        } else {    
            var e = $(jq).datagrid('getColumnOption', param);
            e.editor = {};  
        }   
    }
});
</script>
</html>