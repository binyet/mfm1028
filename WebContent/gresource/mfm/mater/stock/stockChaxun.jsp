<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@include file="../../../../resource/mfm_include.jsp" %>
<html>
<head>
<title>库存查询折线图</title>
</head>
<body>
<div id="cc">
		 <div data-options="region:'north',title:'时间段',split:true" style="height:100px;">
		 	<div class="form-group form-group-sm form-horizontal" style="margin-top:20px;">
				 <label class="col-sm-1 control-label" style="width: 80px;">开始时间</label>
				    <div class="col-sm-2">
				    	<input type="text"  class="form-control" id="beginDate" name="beginDate" onClick="WdatePicker()" value="">
				    </div>
				     <label class="col-sm-1 control-label" style="width: 80px;">结束时间</label>
				    <div class="col-sm-2">
				    	<input type="text"  class="form-control" id="endDate" name="endDate" onClick="WdatePicker()" value="">
				    </div>
				    <div  class="col-sm-1" id="northButton"></div>
			</div>
		 </div>  
		 <div data-options="region:'center',title:'库存查询'" style="padding:5px;background:#eee;">
		 	<div id="main" style="width: 100%;height:100%;"></div>
		 </div>   
	</div>
</body>
<script type="text/javascript">
$(document).ready(function(){
	$('#cc').layout({
		fit:true
	});    
	var darkMine = [];//入库干矿
	var stockMine = [];//库存干矿干矿
	var pkMine = [];//配矿干矿
	var xAres = [];//区域横轴
	//基于准备好的dom，初始化echarts实例
	var myChart = echarts.init(document.getElementById('main'));
    option = {
	    title: {
	        text: '库存查询',
	        subtext: '每个区域库存的变化曲线'
	    },
	    tooltip: {
	        trigger: 'axis'
	    },
	    legend: {
	        data:['入库量','库存量','配矿量']
	    },
	    toolbox: {
	        show: true,
	        feature: {
	            dataZoom: {},
	            dataView: {readOnly: false},
	            magicType: {type: ['line', 'bar']},
	            restore: {},
	            saveAsImage: {}
	        }
	    },
	    xAxis:  {
	        type: 'category',
	        boundaryGap: false,
	        data: xAres
	    },
	    yAxis: {
	        type: 'value',
	        axisLabel: {
	            formatter: '{value}'
	        }
	    },
	    series: [
	        {
	            name:'入库量',
	            type:'line',
	            data:darkMine,
	            markPoint: {
	                data: [
	                    {type: 'max', name: '最大值'},
	                    {type: 'min', name: '最小值'}
	                ]
	            },
	            markLine: {
	                data: [
	                    {type: 'average', name: '平均值'}
	                ]
	            }
	        },
	        {
	            name:'库存量',
	            type:'line',
	            data:stockMine,
	            markPoint: {
	                data: [
	                       {type: 'max', name: '最大值'},
		                    {type: 'min', name: '最小值'}
// 	                    {name: '周最低', value: -2, xAxis: 1, yAxis: -1.5}
	                ]
	            },
	            markLine: {
	                data: [
	                    {type: 'average', name: '平均值'},
// 	                    [{
// 	                        symbol: 'arrow',
// 	                        label: {
// 	                            normal: {
// 	                                formatter: '最大值'
// 	                            }
// 	                        },
// 	                        type: 'max',
// 	                        name: '最大值'
// 	                    }, {
// 	                        symbol: 'circle',
// 	                        x: '60%',
// 	                        y: '50%'
// 	                    }]
	                ]
	            }
	        },
	        {
	            name:'配矿量',
	            type:'line',
	            data:pkMine,
	            markPoint: {
	                data: [
	                    {type: 'max', name: '最大值'},
	                    {type: 'min', name: '最小值'}
	                ]
	            },
	            markLine: {
	                data: [
	                    {type: 'average', name: '平均值'}
	                ]
	            }
	        }
	    ]
	};
    $('#northButton').buttonGroup([{
		useable:true,
		text:'查询',
		icon:'fa-search',
		click:function(){
			var beginDate = $('#beginDate').val();
			var endDate = $('#endDate').val();
			$.ajax({
				type:'post',
				url:'${ctx}/mfm/Stock/getKuchaxun.haze',
				data:{
					beginDate:beginDate,
					endDate:endDate
				},
				success:function(data){
					darkMine.splice(0,darkMine.length);//入库量
					stockMine.splice(0,stockMine.length);//库存量
					pkMine.splice(0,pkMine.length);//配矿量
					xAres.splice(0,xAres.length);//区域横轴
					if(data.length>0){
						for (var i = 0; i < data.length; i++) {
							var obj = data[i];
							darkMine.push(obj.darkMine);
							stockMine.push(obj.stockMine);
							pkMine.push(obj.pkMine);
							xAres.push(obj.aresName);
						}
					}else{
						$.msgtip({
							type:'warning',
							text:'本时间段没有库存信息',
							timeout:3000
						});
					}
					myChart.setOption(option);	
				},
				error:function(){
					$.msgtip({
						type:'danger',
						text:'连接出错',
						timeout:3000
					});
				}
			});
		}
	}]);

})
</script>
</html>