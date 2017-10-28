<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<html>
<head>
<%@include file="../../../../resource/mfm_include.jsp" %>
<title>修改配矿记录</title>
</head>
<body>
	<div id="cc">
		<f:form id="mainform" action="${ctx }/mfm/Pkxx/saveEdit.haze" method="post">
			<div data-options="region:'north',border:false" style="height:33px">
		 		<div id="tb">
					<div id="buttonDiv"></div>
				</div>
		 	</div>
			<div data-options="region:'center',border:false" style="padding-top: 5px;">
			<f:form-item labelName="投料单位" labelSm="2" eleSm="4">
<!-- 					<select name="touliaoDept" id="touliaoDept" class="form-control combox-select" validate="{notEmpty:{}}"  -->
<%-- 						data-options="url:'${ctx }/mfm/Dept/getComboboxList.haze', --%>
<!-- 										valueField: 'id',     -->
<!-- 		        						textField: 'deptName', -->
<!-- 		        						onLoadSuccess: function () { //数据加载完毕事件 -->
<%-- 				                            $('#touliaoDept').combobox('select', ${pkxx.touliaoDept }); --%>
<%-- 				                        }" --%>
<!-- 					> -->
<!-- 					</select> -->
					<select name="touliaoDept" id="touliaoDept" class="form-control" validate="{notEmpty:{}}">
						<c:forEach items="${deptList }" var="dept">
							<option value="${dept.id }" orgId="${dept.orgId }" 
								<c:if test="${pkxx.touliaoDept eq dept.id }">selected = 'selected'</c:if>
							>${dept.deptName }</option>
						</c:forEach>
					</select>
					<input type="hidden" id='orgId' name='orgId' value="${pkxx.orgId }">
				</f:form-item>
				
				<f:form-item labelName="投料性质" labelSm="2" eleSm="4">
					<select name="touliaoXz" id="touliaoXz" class="form-control combox-select" validate="{notEmpty:{}}" 
						data-options="url:'${ctx }/platform/misc/dictionary/getMapByNodeKeyByCache.haze?nodeKey=touliaoXz',
										valueField: 'itemKey',    
		        						textField: 'name',
		        						onLoadSuccess: function () { //数据加载完毕事件
				                            $('#touliaoXz').combobox('select', '${pkxx.touliaoXz }');
				                        }"
					>
					</select>
				</f:form-item>
				
				<f:form-item labelName="备注" labelSm="2" eleSm="4">
					<input type="text" class="form-control" placeholder="备注" id="remark" name="remark" value="${pkxx.remark }">
				</f:form-item>
			</div>
			<input type="hidden" name="id" id="id" value="${pkxx.id}" />

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
	
	//改变投料单位时
	 $('#touliaoDept').change(function(){
		 var orgId = $(this).children('option:selected').attr('orgId'); //组织Id
		 $('#orgId').val(orgId);
	 });
})

</script>