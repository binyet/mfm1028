<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html">
<html>
<head>
<%@include file="../../../../resource/mfm_include.jsp" %>
<title>给矿统计页面</title>
</head>
<body>
	<div id="cc">
		 <div data-options="region:'north',title:'投料单位',split:true" style="height:100px;">
		 	<div class="form-group form-group-sm form-horizontal" style="margin-top:20px;">
				 <label class="col-sm-1 control-label" style="width: 80px;">投料单位</label>
				    <div class="col-sm-2">
				    	<select name="touliaoDept" id="touliaoDept" class="form-control combox-select"
						data-options="url:'${ctx }/mfm/Dept/getComboboxList.haze',
										valueField: 'id',    
		        						textField: 'deptName'
		        						"
					>
					</select>
				    </div>
			</div>
		 </div>  
		 <div data-options="region:'center',title:'给矿统计'" style="padding:5px;background:#eee;">
		 	<div id="main" style="width: 100%;height:100%;"></div>
		 </div>   
	</div>
</body>
<script type="text/javascript">
$(document).ready(function(){
	$('#cc').layout({
		fit:true
	});    
	var pkDate = [];//日期
	var pxDarkMine = [];//干矿
	var pkTasteAu = [];//金品位
	var pkTasteAg = [];//银品位
	var pkConS = [];//硫含量
	var pkHaoyao = [];//耗药
// 	<c:forEach items="${pkxxList}" var='pkxx'>
// 		pkDate.push('${pkxx.pkDate}');
// 		pxDarkMine.push('${pkxx.pxDarkMine}');
// 		pkTasteAu.push('${pkxx.pkTasteAu}');
		
// 	</c:forEach>
	//基于准备好的dom，初始化echarts实例
	var myChart = echarts.init(document.getElementById('main'));
    option = {
	    title: {
	        text: '给矿统计',
	        subtext: '每个车间的配矿记录的变化曲线'
	    },
	    tooltip: {
	        trigger: 'axis'
	    },
	    legend: {
	        data:['干矿量','金品位','银品位','硫含量','耗药']
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
	        data: pkDate
	    },
	    yAxis: {
	        type: 'value',
	        axisLabel: {
	            formatter: '{value}'
	        }
	    },
	    series: [
	        {
	            name:'干矿量',
	            type:'line',
	            data:pxDarkMine,
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
	            name:'金品位',
	            type:'line',
	            data:pkTasteAu,
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
	            name:'银品位',
	            type:'line',
	            data:pkTasteAg,
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
	            name:'硫含量',
	            type:'line',
	            data:pkConS,
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
	            name:'耗药',
	            type:'line',
	            data:pkHaoyao,
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
  //每次选择投料单位时 折线图都会发生变化
	$('#touliaoDept').combobox({
		onSelect:function(record){
			$.ajax({
				type:'post',
				url:'${ctx}/mfm/Pkxx/getPkxxListUseGktj.haze',
				data:{
					touliaoDept:record.id
				},
				success:function(data){
					//每选择一次投料单位现将原数据清空
					pkDate.splice(0,pkDate.length);
					pxDarkMine.splice(0,pxDarkMine.length);
					pkTasteAu.splice(0,pkTasteAu.length);
					pkTasteAg.splice(0,pkTasteAg.length);//银品位
					pkConS.splice(0,pkConS.length);//硫含量
					pkHaoyao.splice(0,pkHaoyao.length);//耗药
					if(data.length>0){
						for (var i = 0; i <data.length; i++) {
							var pkxx = data[i];
							pkDate.push(pkxx.pkDate);
							pxDarkMine.push(pkxx.pxDarkMine);
					 		pkTasteAu.push(pkxx.pkTasteAu);
					 		pkTasteAg.push(pkxx.pkTasteAg);
					 		pkConS.push(pkxx.pkConS);
					 		pkHaoyao.push(pkxx.pkHaoyao);
						}
					}else{
						$.msgtip({
							type:'warning',
							text:record.deptName+'没有投矿记录',
							timeout:3000,
						});
					}
					// 使用刚指定的配置项和数据显示图表。
					myChart.setOption(option);
				}
			});
		}
	});
	
})
</script>
</html>