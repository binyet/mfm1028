<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<%@include file="../../../../resource/mfm_include.jsp" %>
<title>投料单位编辑页面</title>
</head>
<body>
	<div id="cc">
		<f:form id="mainform" action="${ctx }/mfm/Dept/save.haze" method="post">
			<div data-options="region:'north',border:false" style="height:33px">
		 		<div id="tb">
					<div id="buttonDiv"></div>
				</div>
		 	</div>
			<div data-options="region:'center',border:false" style="padding-top: 5px;">
				<f:form-item labelName="名称" labelSm="2" eleSm="3">
					<input type="text" class="form-control" placeholder="名称" validate="{notEmpty:{}}" id="deptName" name="deptName" value="${dept.deptName }">
				</f:form-item>
				
				<f:form-item labelName="组织" labelSm="2" eleSm="3">
					<input type="text" class="form-control" placeholder="组织" id="orgName" name="orgName" value="${dept.orgName }">
					<input id="orgId" name="orgId" value="${dept.orgId }" type="hidden"/>
				</f:form-item>
				
				<f:form-item labelName="系统" labelSm="2" eleSm="3">
					<select name="xiTong" id="xiTong" class="form-control combox-select" validate="{notEmpty:{}}" 
						data-options="url:'${ctx }/platform/misc/dictionary/getMapByNodeKeyByCache.haze?nodeKey=xiTong',
										valueField: 'itemKey',    
		        						textField: 'name',
		        						onLoadSuccess: function () { //数据加载完毕事件
				                            $('#xiTong').combobox('select', '${dept.xiTong }');
				                        }"
					>
					</select>
<%-- 					<div class="dicCombos" nodeKey="xiTong" placeholder="系统" dicPut="xiTongID" hidName="xiTong" dicHeight="20" isTree（是否树形）="false" isMore（是否可以多选）="false" backValue="${dept.xiTong }"></div> --%>
<%-- 					<input type="text" class="form-control" placeholder="系统" validate="{numeric:{}}" id="xiTong" name="xiTong" value="${dept.xiTong }"> --%>
				</f:form-item>
				
				<f:form-item labelName="描述" labelSm="2" eleSm="3">
					<input type="text" class="form-control" placeholder="描述"  id="remark" name="remark" value="${dept.remark }">
				</f:form-item>
			</div>
			<input type="hidden" name="id" id="id" value="${dept.id}" />

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
	
	//组织的自定义对话框
	 $("#orgName").click(function(){
			$.gsWindow.customDialog({
				alias:"orgTree",
				params:{PATH:'1445823442579'},//动态传入参数
				onSuccess:function(data){
					$('#orgId').val(data.orgId);
					$('#orgName').val(data.名称);
					$('#orgName').change();
					if($('#xiTong').combobox('getText')){//如果已经选择系统 名称是系统和组织的组合
						$('#deptName').val(data.名称+$('#xiTong').combobox('getText'));
					}
				}
			})
	 });
	
	//系统的选择
	$('#xiTong').combobox({
		onSelect:function(record){
			if($('#orgName').val()){//如果已经选择组织 名称是系统和组织的组合
				$('#deptName').val($('#orgName').val()+record.name);
			}
		}
	});
})

</script>
</html>