<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<%@include file="../../../../resource/mfm_include.jsp" %>
<html>
<head>
<title>库存查询</title>
</head>
<body>
	<div id="cc">
		 <div data-options="region:'north',split:true" style="height:120px;">
			 <form id="searchForm" method="post" class="form-horizontal" >
			 	<div class="form-group form-group-sm form-horizontal" style="margin-top:20px;">
			 	
			 		&emsp;&emsp;id:<input style="hidden" id="id" name="id"  />
			 		类型:<input id="type" name="type" />
			 		浓度:<input id="nongdu" name="nongdu" />
			 		细度:<input id="xidu" name="xidu" />
			 		PH:<input id="PH" name="PH" />
					
			 	</div>
			</form>
		 </div> 
		 <div data-options="region:'center'" style="padding:5px;">
			<div id="tb">
				<div id="buttonDiv"></div>
			</div>
			<table id ="checiGrid">
				<thead>
					<tr>
						<th data-options="field:'ck',checkbox:true"></th>
						<th data-options="field:'id',width:100,hidden:true">id</th>
						<th data-options="field:'taskId',width:100">任务ID</th>
						<th data-options="field:'type',width:60">类型</th>
						<th data-options="field:'nongdu',width:80">浓度</th>
						<th data-options="field:'xidu',wkidth:90">细度</th>	
						<th data-options="field:'PH',width:60">PH</th>
						<th data-options="field:'huangyao',width:90">黄药</th>
						<th data-options="field:'heiyao',width:90">黑药</th>	
						<th data-options="field:'oil',width:90">浮选油</th>
						<th data-options="field:'zhaAu',width:90">Au渣品位</th>
						<th data-options="field:'zhaAg',width:90">Ag渣品味</th>
						<th data-options="field:'consumeNaCN',width:90">NaCN药剂耗量</th>
						<th data-options="field:'consumeCaO',width:90">CaO药剂耗量</th>
						<th data-options="field:'state',width:90">状态</th>
						<th data-options="field:'banci',width:90">班次</th>
						<th data-options="field:'train',width:90">车次</th>
						<th data-options="field:'aresName',width:90">区域名</th>
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
		
		 grid = $('#checiGrid').datagrid({
			 toolbar:'#tb',
			 rownumbers : true,
			 pagination : true,
			 fit : true,
			 pageList:[100,200,500],
			 queryParams:{
				 'pageBean.pageSize':200
			 },
			 url:'${ctx }/mfm/Report/getList.haze',
		 });
			//消息弹框
		showMessageInit();
	});
	
	//删除入库记录的车次
	function delPkxxDetail(id,pkxxId,wetMine,darkMine,tasteAu,conAu,tasteAg,
			conAg,tasteS,conS,jinzhaAu,jinzhaAg,haoyao,cu,pb,zn,arsenic,sb){
		$.ajax({
			url:'${ctx }/mfm/Pkxx/delPkxxDetail.haze',
			data:{
				ids:id,
				pkxxId:pkxxId,
				wetMine:wetMine,
				darkMine:darkMine,
				tasteAu:tasteAu,
				conAu:conAu,
				tasteAg:tasteAg,
				conAg:conAg,
				tasteS:tasteS,
				conS:conS,
				jinzhaAu:jinzhaAu,
				jinzhaAg:jinzhaAg,
				haoyao:haoyao,
				cu:cu,
				pb:pb,
				zn:zn,
				arsenic:arsenic,
				sb:sb
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
			 		grid.datagrid('reload');
			 		$('.ddv').datagrid({url:"${ctx }/mfm/Pkxx/getPkxxDetailList.haze?pkxxId="+pkxxId});
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