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
		<div data-options="region:'west',title:'车次信息',split:true" style="width:48%;">
			<div id="tb">
				<div id="buttonDiv"></div>
			</div>
			<table id ="checiGrid">
				<thead>
					<tr>
						<th data-options="field:'ck',checkbox:true"></th>
						<th data-options="field:'id',hidden:true" >id</th>
						<th data-options="field:'property',width:200,align:'center'">性质</th>
						<th data-options="field:'aresName',width:240,align:'center'">区域</th>
						<th data-options="field:'jingzhong',width:240,align:'center'">重量</th>	
					</tr>
				</thead>
			</table>
		</div>	
		<div data-options="region:'center',title:'基本信息',split:true">
			<f:form id="searchForm" action="javascript:ajaxSubmit()" method="post">
				<div data-options="region:'north',border:false" style="height:33px">
					<div id="tb">
						<div id=buttonDivCenter></div>
					</div>
				</div>
				<div data-options="region:'north',border:false" style="height:33px">
			 		<input type="hidden" id="id" name="id"  />
					<input type="hidden" id="property" name="property" value=""/>
					
					<f:form-item labelName="区域" labelSm="2" eleSm="3" >
						<select name="aresName" id="aresName" class="form-control combox-select"
							data-options="url:'${ctx }/mfm/Ares/getComboboxList.haze',
											valueField: 'aresName',    
			        						textField: 'aresName',
											loadFilter:function(data){
											     data.unshift({aresName:'',aresName:''});
											    return data;
											}
	        						"></select>
					</f:form-item>
					<f:form-item labelName="重量" labelSm="2" eleSm="3">
						<input type="text" class="form-control" placeholder="重量" id="jingzhong" name="jingzhong" readonly="readonly" value="">
					</f:form-item>
				</div>
		 		<input name="checiJson" id="checiJson" type="hidden" ><!--所选车辆的json  -->
			</f:form>
			
		</div>
	</div>
</body>
<script type="text/javascript">
var grid;
	$(document).ready(function(){
		$('#cc').layout({
			fit:true
		});

		//默认是今天
		$('#pkDate').val(getDate());
			//从后台获取列表数据
		grid = $('#checiGrid').datagrid({
		 view: detailview,	//是否可以点开
		 fit:true,
		 toolbar:'#tb',
		 rownumbers : true,
		 pagination : true,
		 striped : true,
		 url:'${ctx }/mfm/AresWeigh/getList.haze',	
		 detailFormatter: function(rowIndex, rowData){
			 return '<div style="padding:2px"><table class="ddv"></table></div>';
			 },

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
			 },
			 onExpandRow: function(index,row){	//展开行明细查询
			//	 updateForm(row);
				 var ddv = $(this).datagrid('getRowDetail',index).find('table.ddv');
				 ddv.datagrid({
	                    url:"${ctx }/mfm/CheciHB/getList.haze?id="+row.id,
	                    fitColumns:true,
	                    rownumbers:true,
	                    //data:JSON.stringify(rows);
	                    height:'auto',
	                    columns:[[
	                        {field:'id',title:'id',width:80,align:'left',hidden:'true'},
	                        {field:'property',title:'性质',width:80,align:'left'},
	                        {field:'aresName',title:'区域',width:100,align:'center'},
	                        {field:'client',title:'客户',width:80,align:'left'},
	                        {field:'checi',title:'车次',width:80,align:'right'},
	                        {field:'jingzhong',title:'重量',width:80,align:'center'},//tasteAu,conAu,tasteAg,
	                        {field:'weighDate',title:'时间',width:100,align:'center'}
	                    ]],
	                    onResize:function(){
	                        $('#checiGrid').datagrid('fixDetailRowHeight',index);
	                    },
	                    onLoadSuccess:function(){
	                        setTimeout(function(){
	                            $('#checiGrid').datagrid('fixDetailRowHeight',index);
	                        },0);
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
// 		console.log(grid.datagrid('getData'));
	}
});
			//消息弹框
			showMessageInit();
			$('#buttonDivCenter').buttonGroup([{
				useable:true,
				text:'合并',
				icon:'fa-search',
				click:function(){
					 var aresname=$('#aresName').combobox('getValue');
					if(aresname == "" || aresname == null){
						$.msgtip({text:'请选择合并后的区域！',type:'warning'});
						return false;
					}
					
					
					var rows = $('#checiGrid').datagrid('getSelections');
					if(rows.length <= 1){
						$.msgtip({text:'请选择两个或两个以上区域进行合并！',type:'warning'});
						return false;
					}
					
					//alert(JSON.stringify(rows));
					$("#checiJson").val(JSON.stringify(rows));
					$("#searchForm").submit();
				}
			}]);
	});
	//按钮
	
	
	function ajaxSubmit(){
		$.ajax({
			type:'post',
			url:'${ctx }/mfm/AresWeigh/hebingAres.haze',
			data:$("#searchForm").serialize(),
	/*		beforeSend:function(){
				$.messager.watting({
		  			title:'提示',
		  			msg:'正在保存数据，请稍后...'
		  		});
			},
			*/
			success:function(data){
				window.location.reload();
				//alert($("#checiJson").val());
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
		
		var zhongliang = 0;//重量
		//parseFloat将字符串转化为数字
		var rows = grid.datagrid('getSelections');//获取所有的选中行
		 if(null != rows && rows.length >0){
			 for (var i = 0; i < rows.length; i++) {
				 var row = rows[i];
			//	pkHaoyao = parseFloat(pkHaoyao)+parseFloat((row.haoyao != null && row.haoyao)?row.haoyao:0);//耗药
				zhongliang += parseFloat(row.jingzhong);
			}
		 }
		$('#jingzhong').val(parseFloat(zhongliang));
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