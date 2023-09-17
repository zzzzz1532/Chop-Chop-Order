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
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
        integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js"
        integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
        crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.3/Chart.min.js"></script>
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
        .highcharts-figure,
        .highcharts-data-table table {
            min-width: 310px;
            max-width: 800px;
            margin: 1em auto;
        }

        #container {
            height: 400px;
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

        .highcharts-data-table td,
        .highcharts-data-table th,
        .highcharts-data-table caption {
            padding: 0.5em;
        }

        .highcharts-data-table thead tr,
        .highcharts-data-table tr:nth-child(even) {
            background: #f8f8f8;
        }

        .highcharts-data-table tr:hover {
            background: #f1f7ff;
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
    <div>
        <!-- 按鈕 -->
        <div class="d-grid gap-2 d-md-flex justify-content-md-end" id="dataRange">
            <button class="btn btn-primary" type="button">日</button> &nbsp;
            <button class="btn btn-primary me-md-2" type="button">週</button>&nbsp;
            <button class="btn btn-primary me-md-2" type="button">月</button>
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
        chart: {
            zoomType: 'xy'
        },
        title: {
            text: 'OO早餐店週營業額 & 訂單變化',
            align: 'center'
        },

        xAxis: [{
            categories: ['星期一', '星期二', '星期三', '星期四', '星期五', '星期六',
                '星期日'],
            crosshair: true
        }],
        yAxis: [{ // Primary yAxis
            labels: {
                format: '{value} 元',
                style: {
                    color: Highcharts.getOptions().colors[1]
                }
            },
            title: {
                text: '營業額',
                style: {
                    color: Highcharts.getOptions().colors[1]
                }
            }
        }, { // Secondary yAxis
            title: {
                text: '訂單數',
                style: {
                    color: Highcharts.getOptions().colors[0]
                }
            },
            labels: {
                format: '{value} 筆',
                style: {
                    color: Highcharts.getOptions().colors[0]
                }
            },
            opposite: true
        }],
        tooltip: {
            shared: true
        },
        legend: {
            align: 'left',
            x: 80,
            verticalAlign: 'top',
            y: 60,
            floating: true,
            backgroundColor:
                Highcharts.defaultOptions.legend.backgroundColor || // theme
                'rgba(255,255,255,0.25)'
        },
        series: [{
            name: '訂單數',
            type: 'column',
            yAxis: 1,
            data: [87, 200, 105, 145, 64, 150, 155],
            tooltip: {
                valueSuffix: ' 筆'
            }

        }, {
            name: '營業額',
            type: 'spline',
            data: [12000, 16000, 13000, 15000, 11000, 14800, 15000],
            tooltip: {
                valueSuffix: ' 元'
            }
        }]
    });


    //外帶內用圖
    Highcharts.chart('tdChart', {
        chart: {
            plotBackgroundColor: null,
            plotBorderWidth: 0,
            plotShadow: false
        },
        title: {
            text: '外帶內用比例',
            align: 'center',
            verticalAlign: 'middle',
            y: 60
        },
        tooltip: {
            pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
        },
        accessibility: {
            point: {
                valueSuffix: '%'
            }
        },
        plotOptions: {
            pie: {
                dataLabels: {
                    enabled: true,
                    distance: -50,
                    style: {
                        fontWeight: 'bold',
                        color: 'white'
                    }
                },
                startAngle: -90,
                endAngle: 90,
                center: ['50%', '75%'],
                size: '110%'
            }
        },
        series: [{
            type: 'pie',
            name: '比例',
            innerSize: '50%',
            data: [
                ['外帶', 523],
                ['內用', 383],
            ]
        }]
    });

    // 類別銷量圖
    Highcharts.chart('cateChart', {
        chart: {
            type: 'pie',
            options3d: {
                enabled: true,
                alpha: 45
            }
        },
        title: {
            text: '月類別銷量',
            align: 'center'
        },
        plotOptions: {
            pie: {
                innerSize: 100,
                depth: 45
            }
        },
        series: [{
            name: '銷量',
            data: [
                ['漢堡', 160],
                ['吐司', 102],
                ['蛋餅', 80],
                ['果醬', 84],
                ['麵類', 88],
                ['點心', 56],
                ['飲料', 172],
            ]
        }]
    });



</script>


</html>

<!-- .custom-list {
    display: flex;
    flex-wrap: wrap;
    list-style: decimal;
}

.custom-list li {
    flex-basis: 20%;
    一行5個項目，每個項目佔20%的寬度
    margin-top: 2%;
    font-size: 20px;
}  -->

<!-- <ol class="custom-list">
    <li>鮪魚蛋餅</li>
    <li>大冰奶</li>
    <li>培根蛋堡</li>
    <li>花枝蛋堡</li>
    <li>九層塔蛋餅</li>
    <li>炒麵</li>
    <li>鐵板麵</li>
    <li>小肉豆</li>
    <li>雞塊</li>
    <li>薯條</li>
</ol> -->

<!-- <canvas id="omChart" width="400" height="400">
    <script>
        var ctx = document.getElementById('omChart').getContext('2d');
        var omChart = new Chart(ctx, {

            // 各式圖表的屬性設定
            type: 'bar',
            data: {
                labels: ['Mon', 'Tue', 'Wed', 'Thur', 'Friday', 'Sta', 'Sun'],
                datasets: [{
                    label: '營業額',
                    data: [12000, 19000, 13000, 15000, 21000, 13000, 15000],
                    backgroundColor: [
                        'rgba(255, 99, 132, 0.2)',
                        'rgba(54, 162, 235, 0.2)',
                        'rgba(255, 206, 86, 0.2)',
                        'rgba(75, 192, 192, 0.2)',
                        'rgba(153, 102, 255, 0.2)',
                        'rgba(54, 102, 255, 0.2)',
                        'rgba(255, 159, 64, 0.2)'
                    ],
                    borderColor: [
                        'rgba(255, 99, 132, 1)',
                        'rgba(54, 162, 235, 1)',
                        'rgba(255, 206, 86, 1)',
                        'rgba(75, 192, 192, 1)',
                        'rgba(153, 102, 255, 1)',
                        'rgba(54, 102, 255, 1)',
                        'rgba(255, 159, 64, 1)'
                    ],
                    borderWidth: 1
                }]
            },
            options: {
                scales: {
                    yAxes: [{
                        ticks: {
                            beginAtZero: true
                        }
                    }]
                }
            }

        });

    </script>

</canvas> -->