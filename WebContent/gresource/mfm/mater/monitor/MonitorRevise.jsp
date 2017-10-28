<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@include file="../../../../resource/mfm_include.jsp"%>
<title>称重</title>
</head>
<body>
	<div id="cc">

		<f:form id="mainform" action="${ctx }/mfm/Weigh/save.haze"
			method="post">
			<div data-options="region:'north',border:false" style="height: 33px">
				<div id="tb">
					<div id="buttonDiv"></div>
				</div>
			</div>
			<div data-options="region:'center',border:false"
				style="padding-top: 5px;">
				<f:form-item labelName="性质" labelSm="2" eleSm="4">
					<input type="text" class="form-control" placeholder="客户"
						validate="{notEmpty:{}}" id="property" name="property"
						value="${weigh.property }" readonly>
				</f:form-item>

				<f:form-item labelName="来源" labelSm="2" eleSm="4">
					<input type="text" class="form-control" placeholder="来源"
						validate="{notEmpty:{}}" id="source" name="source"
						value="${weigh.source }" readonly>
				</f:form-item>
				<f:form-item labelName="客户" labelSm="2" eleSm="4">
					<input type="text" class="form-control" placeholder="客户"
						validate="{notEmpty:{}}" id="client" name="client"
						value="${weigh.client }" readonly>
				</f:form-item>
				<f:form-item labelName="车号" labelSm="2" eleSm="4">
					<input type="text" class="form-control" placeholder="车号"
						validate="{notEmpty:{}}" id="carNum" name="carNum"
						value="${weigh.carNum }" readonly>
				</f:form-item>
				<f:form-item labelName="司机" labelSm="2" eleSm="4">
					<input type="text" class="form-control" placeholder="司机"
						validate="{notEmpty:{}}" id="driver" name="driver"
						value="${weigh.driver }" readonly>
				</f:form-item>
				<f:form-item labelName="车次" labelSm="2" eleSm="4">
					<input type="text" class="form-control" placeholder="点击获取"
						id="checi" name="checi" value="${weigh.checi }" readonly>
				</f:form-item>
				<f:form-item labelName="毛重" labelSm="2" eleSm="4">
					<input type="text" class="form-control" placeholder="毛重"
						validate="{numeric:{}}" id="maozhong" name="maozhong"
						value="${weigh.maozhong }" readonly>
				</f:form-item>
				<f:form-item labelName="皮重" labelSm="2" eleSm="4">
					<input type="text" class="form-control" placeholder="皮重"
						validate="{numeric:{}},{notEmpty:{}}" id="pizhong" name="pizhong"
						value="${weigh.pizhong }" onchange=getJingzhong()>
				</f:form-item>

				<f:form-item labelName="净重" labelSm="2" eleSm="4">
					<input type="text" class="form-control" placeholder="点击计算"
						validate="{numeric:{}},{notEmpty:{}}" id="jingzhong"
						name="jingzhong" value="${weigh.jingzhong }"
						onclick=getJingzhong() readonly>
				</f:form-item>

				<f:form-item labelName="监磅人" labelSm="2" eleSm="4">
					<input type="text" class="form-control" placeholder="过磅人"
						validate="{notEmpty:{}}" id="weigher" name="weigher"
						value="${weigh.weigher }" readonly>
				</f:form-item>
				<f:form-item labelName="审核人" labelSm="2" eleSm="4">
					<input type="text" class="form-control" placeholder="审核人"
						id="auditor" name="auditor" value="${weigh.auditor }">
				</f:form-item>
			</div>
			<input type="hidden" name="id" id="id" value="${weigh.id}" />

		</f:form>
	</div>

</body>
<script type="text/javascript">

function getJingzhong(){
	document.getElementById("jingzhong").value = document.getElementById("maozhong").value - document.getElementById("pizhong").value;
}

var dialog = frameElement.dialog;
$(document).ready(function(){
	$('#cc').layout({ fit:true});//页面布局
	$("#mainform").formValidator(function(){});
	 showMessageInit({
			dialog:dialog,
			grid:parent.grid,
			isParent:true
		 });
	$("#buttonDiv").buttonGroup([{
		type:'submit',
		useable:true,
		icon:'fa-save',
		text:'保存',
	},{
		useable:true,
		icon:'fa-times',
		text:'关闭',
		id:'btnBack',
		click:function(){
			dialog.close();
		}
	}]);
});

</script>
</html>