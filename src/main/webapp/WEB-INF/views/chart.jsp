<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core'%>
<%@ taglib prefix='fmt' uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="zh">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>報表分析</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js"
	integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
	crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.3/Chart.min.js"></script>
<style>
#dataRange {
	padding-top: 10%;
}

table {
	table-layout: fixed;
	text-align: center;
}

th {
	font-size: 36px;
}

td {
	font-size: 20px;
	padding-top: 2%;
}

/* HighCharts CSS */
.highcharts-figure, .highcharts-data-table table {
	min-width: 310px;
	max-width: 800px;
	margin: 1em auto;
}

#container {
	height: 400px;
}

.container { 
 			max-width: 800px; 
 			margin: auto; 
			padding: 20px; 
			background-color: white; 
 			box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1); 
 			border-radius: 5px; 
 			margin-top: 20px; 
 		} 
		

.highcharts-data-table table {
	font-family: Verdana, sans-serif;
	border-collapse: collapse;
	border: 1px solid #ebebeb;
	margin: 10px auto;
	text-align: center;
	width: 100%;
	max-width: 500px;
}

.highcharts-data-table caption {
	padding: 1em 0;
	font-size: 1.2em;
	color: #555;
}

.highcharts-data-table th {
	font-weight: 600;
	padding: 0.5em;
}

.highcharts-data-table td, .highcharts-data-table th,
	.highcharts-data-table caption {
	padding: 0.5em;
}

.highcharts-data-table thead tr, .highcharts-data-table tr:nth-child(even)
	{
	background: #f8f8f8;
}

.highcharts-data-table tr:hover {
	background: #f1f7ff;
}

.form-container {
    display: flex;
    justify-content: space-between;
    align-items: flex-end;
}

.right-form {
    float: right;
}

.left-form {
    float: left;
}


</style>

<script src="https://code.highcharts.com/highcharts.js"></script>
<script src="https://code.highcharts.com/modules/exporting.js"></script>
<script src="https://code.highcharts.com/modules/export-data.js"></script>
<script src="https://code.highcharts.com/modules/accessibility.js"></script>
<script src="https://code.highcharts.com/highcharts-3d.js"></script>

</head>



<body>
	<!-- 報表分析子容器 -->
	<div class="container">
		<!-- 選擇日期 -->
			<div class="form-container">
			    <form action="/queryDataStandard" method="post" class="right-form">
			        <label for="dateRange">選擇日期：</label>
					 <select id="dateRange" name="dateRange" required>
				       	<option value="today">今天</option>
				        <option value="last7days">過去 7 天</option>
				        <option value="last30days">過去 30 天</option>
				    </select>
				    <input type="submit" value="查詢">
			    </form>
			
			    <form action="/queryDataCustom" method="post" class="left-form">
			       <label for="startDate">開始日期：</label>
					<input type="date" id="startDate" name="startDate" required>
					<label for="endDate">結束日期：</label>
					<input type="date" id="endDate" name="endDate" required>
					<input style="float:right" type="submit" value="查詢">
			    </form>
			</div>
			
			<hr class="my-4">

		<!-- 營業額訂單欄 -->
		<table style="width: 100%; border-collapse: collapse;">
			<tr>
				<th>營業額</th>
				<th>訂單量</th>
			</tr>
			<tr>
				<td>54,321 元</td>
				<td>87筆</td>
			</tr>
		</table>

		<hr class="my-4">

		<!-- 營業額 & 訂單分析圖 -->
		<table style="width: 100%; border-collapse: collapse;">
			<tr>
				<th>營業額 & 訂單分析圖</th>
			</tr>
			<tr>
				<td>
					<figure class="highcharts-figure">
						<div id="soChart"></div>
					</figure>
				</td>
		</table>

		<hr class="my-4">

		<!-- 外帶內用 & 類別銷量 -->
		<table style="width: 100%; border-collapse: collapse;">
			<tr>
				<th>外帶內用比例</th>
				<th>類別銷量</th>
			</tr>
			<tr>
				<td>
					<figure class="highcharts-figure">
						<div id="tdChart"></div>
					</figure>
				</td>
				<td>
					<figure class="highcharts-figure">
						<div id="cateChart"></div>
					</figure>
				</td>
			</tr>
		</table>

		<hr class="my-4">
		<!-- 熱賣餐點排行欄 -->
		<table style="width: 100%; border-collapse: collapse;">
			<tr>
				<th>熱賣餐點排行</th>
			</tr>
		</table>

		<!-- 熱賣餐點排行 -->
		<div class="table-responsive small" style="padding-top: 3%;">
			<table class="table table-striped table-sm">
				<thead>
					<tr>
						<th scope="col">排名</th>
						<th scope="col">品名</th>
						<th scope="col">銷售數量</th>
						<th scope="col">銷售金額</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>1</td>
						<td>鮪魚蛋餅</td>
						<td>100</td>
						<td>4,000</td>
					</tr>
					<tr>
						<td>2</td>
						<td>大冰奶</td>
						<td>90</td>
						<td>2,700</td>
					</tr>
					<tr>
						<td>3</td>
						<td>培根蛋堡</td>
						<td>85</td>
						<td>3,400</td>
					</tr>
					<tr>
						<td>4</td>
						<td>鐵板麵</td>
						<td>75</td>
						<td>3,375</td>
					</tr>
					<tr>
						<td>5</td>
						<td>薯條</td>
						<td>70</td>
						<td>1,750</td>
					</tr>

				</tbody>
			</table>
		</div>
	</div>
</body>

<script>
	//營業額 & 訂單圖
	Highcharts.chart('soChart', {
		chart : {
			zoomType : 'xy'
		},
		title : {
			text : 'OO早餐店週營業額 & 訂單變化',
			align : 'center'
		},

		xAxis : [ {
			categories : [
		        "2023/09/20 <br> 03:00",
		        "2023/09/20 <br> 07:00",
		        "2023/09/20 <br> 12:00",
		        "2023/09/20 <br> 17:00"
		    ],
			crosshair : true
		} ],
		yAxis : [ { // Primary yAxis
			labels : {
				format : '{value} 元',
				style : {
					color : Highcharts.getOptions().colors[1]
				}
			},
			title : {
				text : '營業額',
				style : {
					color : Highcharts.getOptions().colors[1]
				}
			}
		}, { // Secondary yAxis
			title : {
				text : '訂單數',
				style : {
					color : Highcharts.getOptions().colors[0]
				}
			},
			labels : {
				format : '{value} 筆',
				style : {
					color : Highcharts.getOptions().colors[0]
				}
			},
			opposite : true
		} ],
		tooltip : {
			shared : true
		},
		legend : {
			align : 'left',
			x : 80,
			verticalAlign : 'top',
			y : 60,
			floating : true,
			backgroundColor : Highcharts.defaultOptions.legend.backgroundColor
					|| // theme
					'rgba(255,255,255,0.25)'
		},
		series : [ {
			name : '訂單數',
			type : 'column',
			yAxis : 1,
			data : [
		        2,
		        1,
		        1,
		        1
		    ],
			tooltip : {
				valueSuffix : ' 筆'
			}

		}, {
			name : '營業額',
			type : 'spline',
			data : [
		        850,
		        500,
		        500,
		        210
		    ],
			tooltip : {
				valueSuffix : ' 元'
			}
		} ]
	});

	//外帶內用圖
	Highcharts.chart('tdChart', {
		chart : {
			plotBackgroundColor : null,
			plotBorderWidth : 0,
			plotShadow : false
		},
		title : {
			text : '外帶內用比例',
			align : 'center',
			verticalAlign : 'middle',
			y : 60
		},
		tooltip : {
			pointFormat : '{series.name}: <b>{point.percentage:.1f}%</b>'
		},
		accessibility : {
			point : {
				valueSuffix : '%'
			}
		},
		plotOptions : {
			pie : {
				dataLabels : {
					enabled : true,
					distance : -50,
					style : {
						fontWeight : 'bold',
						color : 'white'
					}
				},
				startAngle : -90,
				endAngle : 90,
				center : [ '50%', '75%' ],
				size : '110%'
			}
		},
		series : [ {
			type : 'pie',
			name : '比例',
			innerSize : '50%',
			data : [ [ '外帶', 523 ], [ '內用', 383 ],

			]
		} ]
	});

	// 類別銷量圖
	Highcharts.chart('cateChart', {
		chart : {
			type : 'pie',
			options3d : {
				enabled : true,
				alpha : 45
			}
		},
		title : {
			text : '月類別銷量',
			align : 'center'
		},
		plotOptions : {
			pie : {
				innerSize : 100,
				depth : 45
			}
		},
		series : [ {
			name : '銷量',
			data : [ [ '漢堡', 160 ], [ '吐司', 102 ], [ '蛋餅', 80 ], [ '果醬', 84 ],
					[ '麵類', 88 ], [ '點心', 56 ], [ '飲料', 172 ], ]
		} ]
	});
</script>


</html>