<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<%@include file="../../../../resource/mfm_include.jsp" %>
<html>
<head>
<title>入库查询</title>
</head>
<style type="text/css">
div{float:left }

</style>
<body class="easyui-layout">
	<div id="cc">
		<div data-options="region:'west'"  style="display:none">
			<div id="tb" >
				<div id="buttonDiv"></div>
			</div>
			<div class="easyui-panel" closed="true"><!--  将这个表格隐藏  -->
				<table id ="checiGrid">
					<thead>
						<tr>
							<th data-options="field:'ck',checkbox:true"></th>
							<th data-options="field:'id',width:100,hidden:true">id</th>
							<th data-options="field:'name',width:100">客户名称</th>
							<th data-options="field:'checi',width:60">车次</th>
							<th data-options="field:'wetMine',width:80">湿重</th>
							<th data-options="field:'darkMine',width:90">干重</th>	
							<th data-options="field:'tasteAu',width:60">金品位</th>
							<th data-options="field:'aresName',width:90">所在区域</th>	
						</tr>
					</thead>
				</table>
			</div>
		</div>	
		<div data-options="region:'east',title:'区域明细'" style="width:50%;">
			<div id="tb">
				<div id="buttonDiv"></div>
			</div>
			<table id ="checiGrid1" >
				<thead>
					<tr>
						<th data-options="field:'ck',checkbox:true"></th>
						<th data-options="field:'id',hidden:true" >id</th>
						<th data-options="field:'client',width:100,align:'center'">客户</th>	
						<th data-options="field:'checi',width:40,align:'center'">车次</th>	
						<th data-options="field:'property',width:100,align:'center'">性质</th>
						<th data-options="field:'aresName',width:100,align:'center'">区域</th>
						<th data-options="field:'jingzhong',width:100,align:'center'">重量</th>	
						<th data-options="field:'weighDate',width:200,align:'center'">时间</th>	
					</tr>
				</thead>
			</table>
			
		</div>	
		
		
		<div data-options="region:'center',title:'基本信息'" style="width:50%;">
			<div id="div2" data-options="region:'south',border:false" style='border:1px solid #000;height:20%;width:100%;overflow-y:scroll;'>
				<div id="resulttb">
					<div id="buttonDivCenter"></div>
				</div>
			<f:form id="resultForm" action="javascript:ajaxSubmit()" method="post">
				<div data-options="region:'north',border:false" style="height:33px">
			 		<input type="hidden" id="id" name="id"  />
					<input type="hidden" id="property" name="property" value=""/>
					
						<select name="aresName" id="aresName" class="combox-control combox-select"
							data-options="url:'${ctx }/mfm/Ares/getComboboxList.haze',
											valueField: 'aresName',    
			        						textField: 'aresName',
											loadFilter:function(data){
											     data.unshift({aresName:'',aresName:''});
											    return data;
											}
	        						"></select>
						<input id="jingzhong" name="jingzhong" readonly="readonly" value="123.45">
				</div>
		 		<input name="checiJson" id="checiJson" type="hidden" ><!--所选车辆的json  -->
			</f:form>
			<p></p>
  			<f:form id="resultForm1" action="javascript:ajaxSubmit()" method="post">
				<font size=3>
					<p></p>&emsp;湿重&emsp;：<input id='wetMine' size="10px" value="0" readonly></input>
    				<p></p>&emsp;干重&emsp;：<input id='darkMine' size="10px" value="0" readonly></input><p></p>
    				
   				</font>
				</f:form>

			</div>
			<div id="div1" data-options="region:'north',border:false" style='border:1px solid #000;height:80%;overflow-y:scroll;'>
			
			</div>
			
		</div>
	</div>
</body>
<script type="text/javascript">
var index = 0;
var selectRows = new Array();
document.onclick = function(e) {  
    var ele = e ? e.target : window.event.srcElement;  
    var id = ele.id;
    getClick(id.replace("d",""));
};


function getClick(name){//点击事件的处理

	var n = name;
   	var state = document.getElementById("kk"+n).value;
   	var num = 0;
    if(state == "1"){
    	document.getElementById("kk"+n).value = "0";

        document.getElementById("d"+n).style.backgroundColor='#FFFFFF';
    }
    else{
        document.getElementById("kk"+n).value = "1";

        document.getElementById("d"+n).style.backgroundColor='#99FF00';
    }
    document.getElementById("id").value = document.getElementById("ID"+n).value;
    getResult();
    /*
    grid1 = $('#checiGrid1').datagrid({
		 toolbar:'#tb',
		 rownumbers : true,
		 pagination : true,
		 fit : true,
		 pageList:[100,200,500],
		 url:"${ctx }/mfm/CheciHB/getList.haze?id=3",
		 queryParams:{
			 'pageBean.pageSize':200
		 }
	 });
    */
}
function getResult(){//点击事件后，处理结果
	var i = 0;
	var selectIndex = 0;
	var rr = $('#checiGrid').datagrid('getRows');
	var rr1 = $('#checiGrid1').datagrid('getRows');
	var WetMine = 0;
	var DarkMine = 0;
	var Ares = "";
	//$("#checiGrid1").datagrid('clearRows');
	for(i=rr1.length-1;i>=0;i--){//清空表中数据
		$('#checiGrid1').datagrid('deleteRow', i);
	}
	for(i=0;i<index;i++){
		if(document.getElementById("kk"+i).value == "1"){
	    	WetMine = WetMine + parseFloat(document.getElementById("wetMine"+i).value);
	    	
	    	DarkMine = DarkMine + parseFloat(document.getElementById("darkMine"+i).value);
	   		$("#checiGrid1").datagrid('appendRow', rr[i]);
	    	Ares = Ares + document.getElementById("aresName"+i).value+",";
		}
	}
	document.getElementById("wetMine").value = WetMine.toFixed(4);
	document.getElementById("darkMine").value = DarkMine.toFixed(4);
	document.getElementById("jingzhong").value = WetMine.toFixed(4);
}
function addRows(row){
	//alert(JSON.stringify(row));
	var fileDiv = document.all['div1'];
	var r = row.checi;
    var strHtml1 = "<div id='d"+index+"' style='margin-top:10px;margin-left:10px;width:25%;height:55%;border:1px solid #000'>"+
    				"<p></p> &emsp;<font size=4>"+row.aresName+"</font> <p></p>"+
    				
    				"<input type='hidden' id='ID"+index+"' readonly></input>"+
    				"<p></p><font size=2>&emsp;客户名：<input id='name"+index+"' size=\"10%\" readonly></input><p></p>"+
    				"&emsp;车次&emsp;：<input id='checi"+index+"' size=\"10%\" readonly></input><p></p>"+
    				"&emsp;湿重&emsp;：<input id='wetMine"+index+"' size=\"10%\" readonly></input><p></p>"+
    				"&emsp;干重&emsp;：<input id='darkMine"+index+"' size=\"10%\" readonly></input><p></p>"+
    				"&emsp;金品位：<input id='tasteAu"+index+"' size=\"10%\" readonly></input><p></p>"+
    				"&emsp;区域名：<input id='aresName"+index+"' size=\"10%\" readonly></input></font><p></p>"+
    				"&emsp;<input type='hidden' id='kk"+index+"' value='0' >"+ 
    				"</div>";
    				//直接把索引值设置为button的id
    
    				
    fileDiv.innerHTML += strHtml1;
    index+=1;

}

var grid;
var grid1;
var grid2;

	$(document).ready(function(){
		$('#cc').layout({
			fit:true
		});
			//从后台获取列表数据
		grid = $('#checiGrid').datagrid({
		 view: detailview,	//是否可以点开
		 fit:true,
		 toolbar:'#tb',
		 rownumbers : true,
		 pagination : true,
		 striped : true,
		 singleSelect:true,
		 url:'${ctx }/mfm/Stock/getStockDetailList.haze?isTouliao=0&isPinwei=1',
		 detailFormatter: function(rowIndex, rowData){
			 return '<div  style="padding:2px"><table class="ddv"></table></div>';
			 },

			 onSelect:function(index, row){//当用户选择一行时 右边的数据就会变化
				 updateJb();
			 
				 /*
				 document.getElementById("areatest[0]").value = "性质:"+row.property+"\r\n"
				 			+"区域："+row.aresName+"\r\n"
				 			+"重量："+row.jingzhong+"\r\n";
				 
				 */
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
		        onLoadSuccess:function(data){  //加载完成后，获取到有几个区域，动态添加textarea
					var rr = $('#checiGrid').datagrid('getRows');
		            var it = 0;
		            for(it = 1;it<rr.length;it++){
		            	addRows(rr[it-1]);
		            }
		            for(it=0;it<rr.length;it++){//循环将表格中的信息显示在div中
		            	document.getElementById("ID"+it).value = rr[it].id;
		            	document.getElementById("name"+it).value = rr[it].name;
		            	document.getElementById("checi"+it).value = rr[it].checi;
		            	document.getElementById("wetMine"+it).value = rr[it].wetMine;
		            	document.getElementById("darkMine"+it).value = rr[it].darkMine;
		            	document.getElementById("tasteAu"+it).value = rr[it].tasteAu;
		            	document.getElementById("aresName"+it).value = rr[it].aresName;
		            }
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
	                        {field:'property',title:'性质',width:60,align:'left'},
	                        {field:'aresName',title:'区域',width:50,align:'center'},
	                        {field:'client',title:'客户',width:50,align:'left'},
	                        {field:'checi',title:'车次',width:40,align:'right'},
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
			
		 grid1 = $('#checiGrid1').datagrid({
			 toolbar:'#tb',
			 rownumbers : true,
			 pagination : true,
			 fit : true,
			 pageList:[100,200,500]
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
			text:'配矿',
			icon:'fa-search',
			
			click:function(){
				var rows = $('#checiGrid1').datagrid('getRows')
				$("#checiJson").val(JSON.stringify(rows));
				alert($("#checiJson").val());
				
				//$("#checiJson").val(JSON.stringify(rows));
				//$("#resultForm").submit();
				$.gsWindow({
					data:$("#resultForm").serialize(),
					url:'${ctx }/mfm/AresWeigh/checiNew.haze',
					title:'修改区域'	
				});
			}
		}]);
	});
	//按钮

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


</script>

</html>