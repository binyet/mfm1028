<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<%@include file="../../../../resource/mfm_include.jsp" %>
<title>区域管理的编辑页面</title>
</head>
<body>
	<div id="cc">
		<f:form id="mainform" action="${ctx }/mfm/Ares/save.haze" method="post">
			<div data-options="region:'north',border:false" style="height:33px">
		 		<div id="tb">
					<div id="buttonDiv"></div>
				</div>
		 	</div>
			<div data-options="region:'center',border:false" style="padding-top: 5px;">
				<f:form-item labelName="区域名称" labelSm="2" eleSm="3">
					<input type="text" class="form-control" placeholder="区域名称" validate="{notEmpty:{}}" id="aresName" name="aresName" value="${ares.aresName }">
				</f:form-item>
				
				<f:form-item labelName="面积(平方米)" labelSm="2" eleSm="3">
					<input type="text" class="form-control" placeholder="区域面积" validate="{numeric:{}}" id="aresMianji" name="aresMianji" value="${ares.aresMianji }">
				</f:form-item>
				
				<f:form-item labelName="容纳量(吨)" labelSm="2" eleSm="3">
					<input type="text" class="form-control" placeholder="容纳量" validate="{numeric:{}}" id="aresRongliang" name="aresRongliang" value="${ares.aresRongliang }">
				</f:form-item>
				
				<f:form-item labelName="描述" labelSm="2" eleSm="3">
					<input type="text" class="form-control" placeholder="描述"  id="remark" name="remark" value="${ares.remark }">
				</f:form-item>
			</div>
			<input type="hidden" name="id" id="id" value="${ares.id}" />

		</f:form>
	</div>
</body>
<script type="text/javascript">
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
		icon:'fa-eraser',
		text:'重置',
		click:function(){
			$.messager.confirm('确定要重置吗?',function(r){
				if(r){
					$('#mainform').form('reset');
				}
			})
		}
	},{
		useable:true,
		icon:'fa-times',
		text:'关闭',
		id:'btnBack',
		click:function(){
			dialog.close();
		}
	}]);
})

</script>
</html>