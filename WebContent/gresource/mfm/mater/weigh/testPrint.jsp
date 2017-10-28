<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<%@include file="../../../../resource/mfm_include.jsp" %>
<script type="text/javascript" src="${ctx }/resource/lodop/js/LodopFuncs.js"></script>
<script type="text/javascript" src="${ctx }/gresource/mis/sample/sampleBase/printMakeCode.js"></script>
<title>化验单打印页面</title>
<style type="text/css">

</style>
</head>
<body>
	<table id="datagrid">
		<thead>
			<tr> 
				<th data-options="field:'property',width:80,align:'center'">性质</th>
				<th data-options="field:'source',width:60,align:'center'">来源</th>
			</tr>
		</thead>
	</table>
	<div id="datagridToTable" style="display: none"></div>
	<input type="hidden" id="printType" name="printType" value="${printType }">
</body>  
<object id="LODOP_OB" classid="clsid:2105C259-1E0C-4534-8141-A753534CB4CA" width=0 height=0> 
	<embed id="LODOP_EM" type="application/x-print-lodop" width=0 height=0 pluginspage="install_lodop.exe"></embed>
</object>
<script type="text/javascript">
var grid;
var dialog = frameElement.dialog;
var rows = dialog.opt.rows;
var printSelect = dialog.opt.printSelect;
$(document).ready(function() {
	print();
	
	setTimeout(function(){
		parent.$.messager.watting("close");
		dialog.close();
// 		var opts = parent.grid.datagrid("options");
// 		var queryObj = opts.queryParams || {};
// 		parent.grid.datagrid('reload',queryObj);
		//parent.grid.datagrid("unselectAll");
	},100);
});

function print(){

	$('#datagrid').datagrid({
		rownumbers : true,
		fit : true,
		method:'post',
		data:rows,
		onLoadSuccess:function(){
			datagridToTable(12,30);
		//	var data = $('#tt').datagrid('getData').rows[rowIndex];  
			//alert(JSON.stringify(rows[0]));
			//alert(rows[0].id);
			var producer = '';//审核者
			LODOP=getLodop();  
	//		LODOP.PRINT_INITA(22,20,800,308,"打印控件功能演示_Lodop功能_获得程序代码");
	//		LODOP.SET_PRINT_MODE("PROGRAM_CONTENT_BYVAR",true);
			LODOP.ADD_PRINT_TEXT(21,231,294,38,"金翅岭矿业有限公司过磅单");
			LODOP.SET_PRINT_STYLEA(0,"FontSize",17);
			LODOP.ADD_PRINT_LINE(60,185,61,578,0,1);
			LODOP.ADD_PRINT_LINE(64,185,65,578,0,1);
			LODOP.ADD_PRINT_TEXT(79,73,91,21,"托运单位:");
			LODOP.SET_PRINT_STYLEA(0,"FontSize",12);
			LODOP.ADD_PRINT_TEXT(79,362,50,18,"车号:");
			LODOP.SET_PRINT_STYLEA(0,"FontSize",13);
			LODOP.ADD_PRINT_TEXT(80,557,47,25,"司机:");
			LODOP.SET_PRINT_STYLEA(0,"FontSize",13);
			LODOP.ADD_PRINT_RECT(108,68,87,28,0,1);
			LODOP.ADD_PRINT_TEXT(116,83,65,15,"货物名称");
			LODOP.SET_PRINT_STYLEA(0,"FontSize",11);
			LODOP.ADD_PRINT_RECT(108,154,100,28,0,1);
			LODOP.ADD_PRINT_TEXT(116,174,65,15,"装货地点");
			LODOP.SET_PRINT_STYLEA(0,"FontSize",11);
			LODOP.ADD_PRINT_RECT(108,253,88,28,0,1);
			LODOP.ADD_PRINT_TEXT(117,269,65,15,"卸货地点");
			LODOP.SET_PRINT_STYLEA(0,"FontSize",11);
			LODOP.ADD_PRINT_RECT(108,340,72,28,0,1);
			LODOP.ADD_PRINT_TEXT(116,357,45,15,"车次");
			LODOP.SET_PRINT_STYLEA(0,"FontSize",11);
			LODOP.ADD_PRINT_RECT(108,411,97,28,0,1);
			LODOP.ADD_PRINT_TEXT(116,424,75,15,"毛重(t)");
			LODOP.SET_PRINT_STYLEA(0,"FontSize",11);
			LODOP.ADD_PRINT_RECT(108,507,95,28,0,1);
			LODOP.ADD_PRINT_TEXT(116,522,75,15,"皮重(t)");
			LODOP.SET_PRINT_STYLEA(0,"FontSize",11);
			LODOP.ADD_PRINT_RECT(108,601,97,28,0,1);
			LODOP.ADD_PRINT_TEXT(116,621,75,15,"净重(t)");
			LODOP.SET_PRINT_STYLEA(0,"FontSize",11);
			LODOP.ADD_PRINT_RECT(135,68,87,28,0,1);
			LODOP.ADD_PRINT_RECT(135,154,100,28,0,1);
			LODOP.ADD_PRINT_RECT(135,253,88,28,0,1);
			LODOP.ADD_PRINT_RECT(135,340,72,28,0,1);
			LODOP.ADD_PRINT_RECT(135,411,97,28,0,1);
			LODOP.ADD_PRINT_RECT(135,507,95,28,0,1);
			LODOP.ADD_PRINT_RECT(135,601,97,28,0,1);
			LODOP.ADD_PRINT_RECT(162,68,87,30,0,1);
			LODOP.ADD_PRINT_TEXT(167,87,55,20,"备注");
			LODOP.SET_PRINT_STYLEA(0,"FontSize",13);
			LODOP.ADD_PRINT_RECT(162,154,544,30,0,1);
			LODOP.ADD_PRINT_TEXT(203,73,65,20,"过磅人:");
			LODOP.SET_PRINT_STYLEA(0,"FontSize",13);
			LODOP.ADD_PRINT_TEXT(208,511,72,18,"监称人:");
			LODOP.SET_PRINT_STYLEA(0,"FontSize",13);
			LODOP.ADD_PRINT_TEXT(81,162,65,20,rows[0].client);
			LODOP.SET_PRINT_STYLEA(0,"FontSize",12);
			LODOP.ADD_PRINT_TEXT(79,418,65,20,rows[0].carNum);
			LODOP.SET_PRINT_STYLEA(0,"FontSize",12);
			LODOP.ADD_PRINT_TEXT(82,607,65,20,rows[0].driver);
			LODOP.SET_PRINT_STYLEA(0,"FontSize",11);
			LODOP.ADD_PRINT_TEXT(140,81,65,20,rows[0].property);
			LODOP.SET_PRINT_STYLEA(0,"FontSize",11);
			LODOP.ADD_PRINT_TEXT(140,169,65,20,rows[0].source);
			LODOP.SET_PRINT_STYLEA(0,"FontSize",11);
			LODOP.ADD_PRINT_TEXT(139,265,65,20,"");
			LODOP.SET_PRINT_STYLEA(0,"FontSize",11);
			LODOP.ADD_PRINT_TEXT(140,358,40,20,rows[0].checi);
			LODOP.SET_PRINT_STYLEA(0,"FontSize",11);
			LODOP.ADD_PRINT_TEXT(140,422,81,20,rows[0].maozhong);
			LODOP.SET_PRINT_STYLEA(0,"FontSize",11);
			LODOP.ADD_PRINT_TEXT(140,516,81,20,rows[0].pizhong);
			LODOP.SET_PRINT_STYLEA(0,"FontSize",11);
			LODOP.ADD_PRINT_TEXT(140,609,81,20,rows[0].jingzhong);
			LODOP.SET_PRINT_STYLEA(0,"FontSize",11);
			LODOP.ADD_PRINT_TEXT(201,139,65,20,rows[0].weigher);
			LODOP.SET_PRINT_STYLEA(0,"FontSize",12);
			LODOP.ADD_PRINT_TEXT(206,582,65,20,rows[0].auditor);
			LODOP.SET_PRINT_STYLEA(0,"FontSize",12);

			LODOP.PRINT();
		}
	});
}


</script>
</html>