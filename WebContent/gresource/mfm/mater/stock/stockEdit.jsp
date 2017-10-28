<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<%@include file="../../../../resource/mfm_include.jsp" %>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>修改入库记录</title>
</head>
<body>
	<div id="cc">
		<f:form id="mainform" action="${ctx }/mfm/Stock/saveEdit.haze" method="post">
			<div data-options="region:'north',border:false" style="height:33px">
		 		<div id="tb">
					<div id="buttonDiv"></div>
				</div>
		 	</div>
			<div data-options="region:'center',border:false" style="padding-top: 5px;">
			<f:form-item labelName="存放区域" labelSm="2" eleSm="4">
					<select name="aresId" id="aresId" class="form-control combox-select" validate="{notEmpty:{}}" 
						data-options="url:'${ctx }/mfm/Ares/getComboboxList.haze',
										valueField: 'id',    
		        						textField: 'aresName',
		        						onLoadSuccess: function () { //数据加载完毕事件
				                            $('#aresId').combobox('select', ${stock.aresId });
				                        }"
					>
					</select>
				</f:form-item>
				
				<f:form-item labelName="性质" labelSm="2" eleSm="4">
					<select name="xingzhi" id="xingzhi" class="form-control combox-select" validate="{notEmpty:{}}" 
						data-options="url:'${ctx }/platform/misc/dictionary/getMapByNodeKeyByCache.haze?nodeKey=meterXingzhi',
										valueField: 'itemKey',    
		        						textField: 'name',
		        						onLoadSuccess: function () { //数据加载完毕事件
				                            $('#xingzhi').combobox('select', '${stock.xingzhi }');
				                        }"
					>
					</select>
				</f:form-item>
				
				<f:form-item labelName="备注" labelSm="2" eleSm="4">
					<input type="text" class="form-control" placeholder="备注" id="remark" name="remark" value="${stock.remark }">
				</f:form-item>
			</div>
			<input type="hidden" name="id" id="id" value="${stock.id}" />

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