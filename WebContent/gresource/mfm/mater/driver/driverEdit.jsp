<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<%@include file="../../../../resource/mfm_include.jsp" %>
<title>区域管理的编辑页面</title>
</head>
<body>
	<div id="cc" >
		<f:form id="mainform" action="${ctx }/mfm/Driver/save.haze" method="post">
			<div data-options="region:'north',border:false" style="height:33px">
		 		<div id="tb">
					<div id="buttonDiv"></div>
				</div>
		 	</div>
			<div data-options="region:'center',border:false" style="padding-top: 5px;">
				<input type="hidden" name="id" id="id" value="${driver.id}" />
			
				<f:form-item labelName="所属客户" labelSm="2" eleSm="3">
				<!-- 	<input type="text" class="form-control" placeholder="所属客户" validate="{notEmpty:{}}" id="clientName" name="clientName" value="${driver.clientName }"> -->
					<select name="clientName" id="clientName" class="form-control combox-select" validate="{notEmpty:{}}" 
						data-options="url:'${ctx }/mfm/Client/getComboboxList.haze',
										valueField: 'clientName',    
		        						textField: 'clientName',
		        						onLoadSuccess: function () { //数据加载完毕事件
				                            $('#clientName').combobox('select', '${driver.clientName }');
				                        }"
					>
					</select>
				</f:form-item>
				<f:form-item labelName="司机名称" labelSm="2" eleSm="3">
					<input type="text" class="form-control" placeholder="司机名称"  id="driverName" name="driverName" value="${driver.driverName }">
				</f:form-item>
				<f:form-item labelName="描述" labelSm="2" eleSm="3">
					<input type="text" class="form-control" placeholder="描述"  id="remark" name="remark" value="${driver.remark }">
				</f:form-item>
			</div>

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