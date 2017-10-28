<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<%@include file="../../../../resource/mfm_include.jsp" %>
<html>
<head>
<title>库存查询</title>
</head>
<body>
	<div id='cc'>
		 <div data-options="region:'north',split:true" style="height:130px;">
			 <form id="searchForm" method="post" class="form-horizontal" >
			 	<div class="form-group form-group-sm form-horizontal" style="margin-top:20px;">
					 <label class="col-sm-2 control-label" >区域</label>
					    <div class="col-sm-3">
					    	<select name="aresId" id="aresId" class="form-control combox-select"
							data-options="url:'${ctx }/mfm/Ares/getComboboxList.haze',
											valueField: 'id',    
			        						textField: 'aresName',
											loadFilter:function(data){
											    data.unshift({id:'',aresName:'&nbsp'});
											    return data;
											}
			        						">
							</select>
						</div>
						<label class="col-sm-2 control-label">性质</label>
						 <div class="col-sm-3"> 
							<select name="xingzhi" id="xingzhi" class="form-control combox-select" 
							data-options="url:'${ctx }/platform/misc/dictionary/getMapByNodeKeyByCache.haze?nodeKey=meterXingzhi',
											valueField: 'itemKey',    
			        						textField: 'name',
											loadFilter:function(data){
											     data.unshift({itemKey:'',name:'&nbsp'});
											    return data;
											}">
							</select>
					    </div>
				    </div>
				    <div class="form-group form-group-sm form-horizontal" style="margin-top:20px;">
					    <label class="col-sm-2 control-label">操作人</label>
						 <div class="col-sm-3"> 
							<input type="text"  class="form-control" id="fullName" name="fullName" value="">
					    </div>
					    <label class="col-sm-2 control-label">时间</label>
						 <div class="col-sm-3"> 
							<input type="text"  class="form-control" id="stockDate" name="stockDate" onClick="WdatePicker()" value="">
					    </div>
					    <div  class="col-sm-1" id="northButton"></div>
					</div>
			</form>
		 </div>  
		  <div data-options="region:'center'" style="padding:5px;">
			<div id="tb">
				<div id="buttonDiv"></div>
			</div>
			<table id="datagrid" title="入库记录">
				<thead>
					<tr>
						<th data-options="field:'ck',checkbox:true"></th>
						<th data-options="field:'id',hidden:true" >id</th>
						<th data-options="field:'stockJilu',width:250,align:'left',
						formatter:function(value,row,index){
							return row.fullName+'在'+row.stockDate+'入'+row.aresName;
						}">入库记录</th>
						<th data-options="field:'aresName',width:100,align:'left'">区域名称</th>
						<th data-options="field:'xingzhi_str',width:100,align:'center'">性质</th>
						<th data-options="field:'stockDate',width:140,align:'right'">入库时间</th>
						<th data-options="field:'fullName',width:100,align:'right'">操作人</th>
						<th data-options="field:'remark',width:140,align:'left'">描述</th>
					</tr>
				</thead>
			</table>
			<form action="${ctx }/mfm/Stock/del.haze" id="form" >
				<input type="hidden" id="ids" name="ids">
			</form><!--删除用  已经存放过原料的区域不可删除-->
		</div>
	</div>
</body>
<script type="text/javascript">
var grid;
	$(document).ready(function(){
		$('#cc').layout({
			fit:true
		});  
		$('#stockDate').val(getDate());//默认今天
			//从后台获取列表数据
		grid = $('#datagrid').datagrid({
		 view: detailview,
		 fit:true,
		 toolbar:'#tb',
		 rownumbers : true,
		 pagination : true,
		 striped : true,
		 url:'${ctx }/mfm/Stock/getList.haze',	
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
           },
		  //展开行查询明细列表
		 onExpandRow: function(index,row){
               var ddv = $(this).datagrid('getRowDetail',index).find('table.ddv');
	                ddv.datagrid({
	                    url:'${ctx }/mfm/Stock/getStockDetailList.haze?stockId='+row.id,
	                    fitColumns:true,
	                    singleSelect:true,
	                    rownumbers:true,
	                    height:'auto',
	                    columns:[[
	                        {field:'id',title:'id',width:80,align:'left',hidden:'true'},
	                        {field:'name',title:'客户',width:80,align:'left'},
	                        {field:'checi',title:'车次',width:50,align:'right'},
	                        {field:'wetMine',title:'湿重',width:50,align:'right'},
	                        {field:'darkMine',title:'干重',width:30,align:'right'},
	                        {field:'wet',title:'水分',width:50,align:'right'},
	                        {field:'isTouliao',title:'是否投料',width:35,align:'center',
	                        	formatter:function(value,row,index){
	                        		if(row.isTouliao == '1'){
	                        			return "<span style='color: red;font-size:12px;'>是</span>"; 
	                        			} else{
	                        				return "否";
	                        				}
	                        		}
	                        }, 
	                        {field:'button',title:'删除',width:35,align:'center',
	                        	formatter:function(value,row,index){
	                        		if(row.isTouliao == 0){
	                        			return '<a onClick="delStockDetail('+row.id+','+row.stockId+')">删除</a>';
	                        		}else{
	                        			return '已投料';
	                        		}
	                        	}
	                        }
	                         
	                    ]],
	                    rowStyler:function(index,row){
	            			if(row.isTouliao == 1){//已投料
	            				return 'color:#e71f19';
	            			}
	            		},
	                    onResize:function(){
	                        $('#datagrid').datagrid('fixDetailRowHeight',index);
	                    },
	                    onLoadSuccess:function(){
	                        setTimeout(function(){
	                            $('#datagrid').datagrid('fixDetailRowHeight',index);
	                        },0);
	                	},
	                });
	                
               $('#datagrid').datagrid('fixDetailRowHeight',index);
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
		console.log(grid.datagrid('getData'));
			}
		});
			//消息弹框
			showMessageInit();
			$('#northButton').buttonGroup([{
				useable:true,
				text:'查询',
				icon:'fa-search',
				click:function(){
					 var queryObj = grid.datagrid("options").queryParams;
					 var formArray = $("#searchForm").serializeArray();
						for(var i=0;i<formArray.length;i++){
							queryObj[formArray[i].name] = formArray[i].value;
					}
					grid.datagrid('reload',queryObj);
				}
			}]);
			//按钮
			$('#buttonDiv').buttonGroup([{
				useable:true,
				text:'新增',
				icon:'fa-plus',
				click:function(){
					//打开弹窗
					$.gsWindow({
						url:'${ctx }/mfm/Stock/checiFenqu.haze?isAdd=1',//标记是从入库记录跳过去的
						title:'新增入库记录'
					});
				}
			},{
				useable:true,
				text:"修改",
				icon:"fa-pencil-square-o",
				click:function(){
					getId(grid,'id',function(id){
						$.gsWindow({
							url:'${ctx }/mfm/Stock/stockEdit.haze?id='+id,
							title:'修改入库记录'
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
						var rows = grid.datagrid('getSelections');
						for (var i = 0; i <rows.length; i++) {
							var row = rows[i];
							if(row.tlCount > 0){
								 $.msgtip({
										type:'warning',
										text:'第'+(i+1)+'次入库记录有车次已经投料，不可删除!',
										timeout:3000,
									});
								 return false;
							}
						}
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
	
	//删除入库记录的车次
	function delStockDetail(id,stockId){
		$.ajax({
			url:'${ctx }/mfm/Stock/delStockDetail.haze',
			data:{
				ids:id,
				stockId:stockId
				},
			type:'POST',
			success:function(data){
				$.msgtip({
					type:'success',
					text:'删除成功！',
					timeout:3000
				});
				if(data.total == 0){
					grid.datagrid('reload');
			 	}else{
			 		$('.ddv').datagrid({url:"${ctx }/mfm/Stock/getStockDetailList.haze?stockId="+stockId});
			 		$('.ddv').datagrid('reload');
			 	}
            },
			error:function(){
				$.msgtip({
					type:'danger',
					text:'连接出错！',
					timeout:3000
				});
			}
		});
	}
	
	//获取当前时间的yyyy-MM-dd格式
	function getDate(){
		var currentDate=new Date();
		var year = currentDate.getFullYear();
		var month = currentDate.getMonth() + 1;
		if(month >=1 && month <= 9){
			 month = "0" + month;
		}
		var day = currentDate.getDate();
		if(day >=1 && day <= 9 ){
			day = "0" + day;
		}
		var date = year + "-" + month + "-" + day;
		return date;
	}

</script>
</html>