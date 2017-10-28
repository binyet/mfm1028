<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@include file="../../../../resource/mfm_include.jsp" %>
<title>称重</title>
</head>
<body>
	<div id="cc">
	
		<f:form id="mainform" action="${ctx }/mfm/Monitor/save.haze" method="post">
			<div data-options="region:'north',border:false" style="height:33px">
		 		<div id="tb">
					<div id="buttonDiv"></div>
				</div>
		 	</div>
			<div data-options="region:'center',border:false" style="padding-top: 5px;">
				<f:form-item labelName="性质" labelSm="2" eleSm="4">
					<select name="property" id="property" class="form-control combox-select" validate="{notEmpty:{}}" 
						data-options="url:'${ctx }/mfm/Property/getComboboxList.haze',
										valueField: 'propertyName',    
		        						textField: 'propertyName'"
					>
					</select>
				</f:form-item>
				
		 		<f:form-item labelName="来源" labelSm="2" eleSm="4">
						<!--	<input type="text" class="form-control" placeholder="来源" validate="{notEmpty:{}}" id="source" name="source" value="${weigh.source }">
		 		 -->
					<select name="source" id="source" class="form-control combox-select" validate="{notEmpty:{}}" 
						data-options="url:'${ctx }/mfm/Source/getComboboxList.haze',
										valueField: 'sourceName',    
		        						textField: 'sourceName'"
					>
					</select>
				</f:form-item>
				<f:form-item labelName="客户" labelSm="2" eleSm="4">
			<!-- 	<input type="text" class="form-control" placeholder="客户" validate="{notEmpty:{}}" id="client" name="client" value="${weigh.client }">
			 -->	
			 		<select name="client" id="client" class="form-control combox-select" validate="{notEmpty:{}}" 
						data-options="url:'${ctx }/mfm/Client/getComboboxList.haze',
										valueField: 'clientName',    
		        						textField: 'clientName'"
					>
					</select>
				</f:form-item>
				<f:form-item labelName="车号" labelSm="2" eleSm="4">
					<input type="text" class="form-control" placeholder="车号" validate="{notEmpty:{}}" id="carNum" name="carNum" value="${weigh.carNum }"  onchange="getCheci()">
				</f:form-item>
				<f:form-item labelName="司机" labelSm="2" eleSm="4">
				<!-- 	<input type="text" class="form-control" placeholder="司机" validate="{notEmpty:{}}" id="driver" name="driver" value="${weigh.driver }">
				-->
				<select name="driver" id="driver" class="form-control combox-select" validate="{notEmpty:{}}" 
						data-options="url:'${ctx }/mfm/Driver/getComboboxList.haze',
										valueField: 'driverName',    
		        						textField: 'driverName'"
					>
					</select>
				</f:form-item>
				<f:form-item labelName="车次" labelSm="2" eleSm="4" >
			 	 	<input type="text" class="form-control" placeholder="点击获取" id="checi" name="checi" value="${weigh.checi }" onclick="getCheci()" readonly>
			 
					</select>
				</f:form-item>
				<f:form-item labelName="毛重" labelSm="2" eleSm="4">
					<input type="text" class="form-control" placeholder="毛重" validate="{numeric:{}}" id="maozhong" name="maozhong" value="${weigh.maozhong }">
				</f:form-item>
				<f:form-item labelName="皮重" labelSm="2" eleSm="4">
					<input type="text" class="form-control" placeholder="皮重" validate="{numeric:{}}" id="pizhong" name="pizhong" value="${weigh.pizhong }">
				</f:form-item>
				
				<f:form-item labelName="净重" labelSm="2" eleSm="4">
					<input type="text" class="form-control" placeholder="点击计算" id="jingzhong" name="jingzhong" value="${weigh.jingzhong }" onclick=getJingzhong() readonly>
				</f:form-item>
				
				<f:form-item labelName="监磅人" labelSm="2" eleSm="4">
				<!--	<input type="text" class="form-control" placeholder="过磅人" validate="{notEmpty:{}}" id="weigher" name="weigher" value="${weigh.weigher }">
				-->
					<select name="weigher" id="weigher" class="form-control combox-select" validate="{notEmpty:{}}" 
						data-options="url:'${ctx }/mfm/Weigher/getComboboxList.haze',
										valueField: 'monitorName',    
		        						textField: 'monitorName'"
					>
					</select>
				</f:form-item>
				<f:form-item labelName="审核人" labelSm="2" eleSm="4">
					<input type="text" class="form-control" placeholder="审核人" id="auditor" name="auditor" value="${weigh.auditor }">
				</f:form-item>
			</div>
			<input type="hidden" name="id" id="id" value="${ares.id}" />

		</f:form>
	</div>

</body>
<script type="text/javascript">

function getJingzhong(){
	document.getElementById("jingzhong").value = document.getElementById("maozhong").value - document.getElementById("pizhong").value;
}

function getCheci(){  
    $.ajax({  
    data:"carNum="+$("#carNum").val(),  
    type:"GET",  
    dataType: 'json',  
    url:'${ctx }/mfm/Monitor/getOne.haze',  
    error:function(data){  
       // alert("出错了！！:"+data.msg);  
    },  
    success:function(data){  
      //  alert("success:"+data.msg);  
        
        $("#checi").val(data.msg);
        $("#result").html(data.msg) ;  
    }  
    });
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