<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="inc/top.jsp"%>
<script src="https://code.highcharts.com/highcharts.js"></script>
<script src="https://code.highcharts.com/modules/data.js"></script>
<script src="https://code.highcharts.com/modules/drilldown.js"></script>
<script src="https://code.highcharts.com/modules/exporting.js"></script>
<script src="https://code.highcharts.com/modules/export-data.js"></script>
<script src="https://code.highcharts.com/modules/accessibility.js"></script>


<style>
#navSideBar{
	background-color: #383941;
}
.mainContainer{
	width: 100%;
	background: white;
	padding: 20px;
}
.chartContainer{
	text-align: center;
}
.infoTable tr{
	padding: 10px;
}
td:nth-child(1){
	font-weight: bold;
}
td:nth-child(4){
	font-weight: bold;
}
.divHeader{
	font-weight: bold;
	font-size: 1.1em;
}
.sub1{
font-size: 1.1em;
font-weight: 300;
}
.bg-gradient-info {
  background-color: #0b1819;
  background-image: linear-gradient(180deg, #642ec5, 50%, #161b1c 100%);
  background-size: cover;
}
	/*차트 Age 스타일 시작*/
.ageDiv{
	display: inline-block;
	padding-right: 20px;
}
.highcharts-figure-age, .highcharts-figure-age .highcharts-data-table table {
 min-width: 600px; 
 max-width: 600px;
 margin: 1em;
}

#container {
  height: 400px;
}

.highcharts-figure-age .highcharts-data-table table {
	font-family: Verdana, sans-serif;
	border-collapse: collapse;
	border: 1px solid #EBEBEB;
	margin: 10px auto;
	text-align: center;
	width: 100%;
	max-width: 500px;
}
.highcharts-figure-age .highcharts-data-table caption {
  padding: 1em 0;
  font-size: 1.2em;
  color: #555;
}
.highcharts-figure-age .highcharts-data-table th {
	font-weight: 600;
  padding: 0.5em;
}
.highcharts-figure-age .highcharts-data-table td, .highcharts-figure-age .highcharts-data-table th, .highcharts-figure-age .highcharts-data-table caption {
  padding: 0.5em;
}
.highcharts-figure-age .highcharts-data-table thead tr, .highcharts-figure-age .highcharts-data-table tr:nth-child(even) {
  background: #f8f8f8;
}
.highcharts-figure-age .highcharts-data-table tr:hover {
  background: #f1f7ff;
}
.highcharts-figure-age .highcharts-credits{
	display: none;
}
	/*차트 Age 스타일 끝*/
	/*차트 JL 스타일 끝*/
.jlDiv{
	display: inline-block;
	padding-left: 20px;
}
.highcharts-figure-jl, .highcharts-figure-jl .highcharts-data-table table {
  min-width: 600px; 
  max-width: 600px;
  margin: 1em auto;
}

.highcharts-figure-jl .highcharts-data-table table {
	font-family: Verdana, sans-serif;
	border-collapse: collapse;
	border: 1px solid #EBEBEB;
	margin: 10px auto;
	text-align: center;
	width: 100%;
	max-width: 500px;
}
.highcharts-figure-jl .highcharts-data-table caption {
  padding: 1em 0;
  font-size: 1.2em;
  color: #555;
}
.highcharts-figure-jl .highcharts-data-table th {
	font-weight: 600;
  padding: 0.5em;
}
.highcharts-figure-jl .highcharts-data-table td, .highcharts-figure-jl .highcharts-data-table th, .highcharts-figure-jl .highcharts-data-table caption {
  padding: 0.5em;
}
.highcharts-figure-jl .highcharts-data-table thead tr, .highcharts-figure-jl .highcharts-data-table tr:nth-child(even) {
  background: #f8f8f8;
}
.highcharts-figure-jl .highcharts-data-table tr:hover {
  background: #f1f7ff;
}
	/*차트 JL 스타일 끝*/

</style>
	<div class="panel mainPanel">
		<div class="card-header py-3">
			<h5 class="m-0 font-weight-bold">관리자 메인페이지</h5>
		</div>
		<div class="mainContainer">
			<p class="divHeader">기본정보</p>
			<hr>
			<table class="infoTable">
				<colgroup>
					<col style="width: 15%" />
					<col style="width: 10%" />
					<col style="width: 25%" />
					<col style="width: 15%" />
					<col style="width: 10%" />
					<col style="width: 25%" />
				</colgroup>
				<tr>
					<td scope="col">사이트명</td>
					<td scope="col">IU그룹웨어</td>
					<td scope="col"></td>
					<td scope="col">담당자</td>
					<td scope="col">사이트관리자</td>
					<td scope="col"></td>
				</tr>
				<tr>
					<td >사이트URL</td>
					<td >http://localhost:9091/lylj</td>
					<td ></td>
					<td >도입날짜</td>
					<td >2021-07-20</td>
					<td ></td>
				</tr>
				<tr>
					<td >사용가능인원</td>
					<td >100명</td>
					<td ></td>
					<td >관리자가능인원</td>
					<td >20명</td>
					<td ></td>
				</tr>
				<tr>
					<td >현재사용인원</td>
					<td >67명</td>
					<td ></td>
					<td >현재관리자인원</td>
					<td >8명</td>
					<td ></td>
				</tr>
				<tr>
					<td >사용기간</td>
					<td >무제한</td>
					<td ></td>
					<td ></td>
					<td ></td>
					<td ></td>
				</tr>
			</table>
		</div>
		<h3>차트</h3>
		<div class="mainContainer chartContainer">
			<div class="ageDiv">
			<figure class="highcharts-figure-age">
  				<div id="containerAge"></div>
  
			</figure>
			</div>
			
			<div class="jlDiv">
			<figure class="highcharts-figure-jl">
			  <div id="containerJL"></div>
			  
			</figure>
			</div>
		</div>
	</div>


<script type="text/javascript">
//Create the chart
Highcharts.chart('containerAge', {
  chart: {
    type: 'column'
  },
  title: {
    text: '회사 연령별 통계'
  },
  accessibility: {
    announceNewData: {
      enabled: true
    }
  },
  xAxis: {
    type: 'category'
  },
  yAxis: {
    title: {
      text: 'Total percent market share'
    }

  },
  legend: {
    enabled: false
  },
  plotOptions: {
    series: {
      borderWidth: 0,
      dataLabels: {
        enabled: true,
        format: '{point.y:.1f}%'
      }
    }
  },

  tooltip: {
    headerFormat: '<span style="font-size:11px">{series.name}</span><br>',
    pointFormat: '<span style="color:{point.color}">{point.name}</span>: <b>{point.y:.2f}%</b> of total<br/>'
  },

  series: [
    {
      name: "나이",
      colorByPoint: true,
      data: [
        {
          name: "20대",
          y: 100,
          drilldown: "Chrome"
        },
        {
          name: "30대",
          y: 10.57,
          drilldown: "Firefox"
        },
        {
          name: "40대",
          y: 7.23,
          drilldown: "Internet Explorer"
        },
        {
          name: "50대",
          y: 5.58,
          drilldown: "Safari"
        },
        {
          name: "60대",
          y: 4.02,
          drilldown: "Edge"
        },
        {
          name: "70대",
          y: 1.92,
          drilldown: "Opera"
        }
      ]
    }
  ],
  drilldown: {
    series: [
      {
        name: "Chrome",
        id: "Chrome",
        data: [
          [
            "v65.0",
            0.1
          ],
          [
            "v64.0",
            1.3
          ],
          [
            "v63.0",
            53.02
          ],
          [
            "v62.0",
            1.4
          ],
          [
            "v61.0",
            0.88
          ],
          [
            "v60.0",
            0.56
          ],
          [
            "v59.0",
            0.45
          ],
          [
            "v58.0",
            0.49
          ],
          [
            "v57.0",
            0.32
          ],
          [
            "v56.0",
            0.29
          ],
          [
            "v55.0",
            0.79
          ],
          [
            "v54.0",
            0.18
          ],
          [
            "v51.0",
            0.13
          ],
          [
            "v49.0",
            2.16
          ],
          [
            "v48.0",
            0.13
          ],
          [
            "v47.0",
            0.11
          ],
          [
            "v43.0",
            0.17
          ],
          [
            "v29.0",
            0.26
          ]
        ]
      },
      {
        name: "Firefox",
        id: "Firefox",
        data: [
          [
            "v58.0",
            1.02
          ],
          [
            "v57.0",
            7.36
          ],
          [
            "v56.0",
            0.35
          ],
          [
            "v55.0",
            0.11
          ],
          [
            "v54.0",
            0.1
          ],
          [
            "v52.0",
            0.95
          ],
          [
            "v51.0",
            0.15
          ],
          [
            "v50.0",
            0.1
          ],
          [
            "v48.0",
            0.31
          ],
          [
            "v47.0",
            0.12
          ]
        ]
      },
      {
        name: "Internet Explorer",
        id: "Internet Explorer",
        data: [
          [
            "v11.0",
            6.2
          ],
          [
            "v10.0",
            0.29
          ],
          [
            "v9.0",
            0.27
          ],
          [
            "v8.0",
            0.47
          ]
        ]
      },
      {
        name: "Safari",
        id: "Safari",
        data: [
          [
            "v11.0",
            3.39
          ],
          [
            "v10.1",
            0.96
          ],
          [
            "v10.0",
            0.36
          ],
          [
            "v9.1",
            0.54
          ],
          [
            "v9.0",
            0.13
          ],
          [
            "v5.1",
            0.2
          ]
        ]
      },
      {
        name: "Edge",
        id: "Edge",
        data: [
          [
            "v16",
            2.6
          ],
          [
            "v15",
            0.92
          ],
          [
            "v14",
            0.4
          ],
          [
            "v13",
            0.1
          ]
        ]
      },
      {
        name: "Opera",
        id: "Opera",
        data: [
          [
            "v50.0",
            0.96
          ],
          [
            "v49.0",
            0.82
          ],
          [
            "v12.1",
            0.14
          ]
        ]
      }
    ]
  }
});


Highcharts.setOptions({
	  colors: Highcharts.map(Highcharts.getOptions().colors, function (color) {
	    return {
	      radialGradient: {
	        cx: 0.5,
	        cy: 0.3,
	        r: 0.7
	      },
	      stops: [
	        [0, color],
	        [1, Highcharts.color(color).brighten(-0.3).get('rgb')] // darken
	      ]
	    };
	  })
	});

	// Build the chart
	Highcharts.chart('containerJL', {
	  chart: {
	    plotBackgroundColor: null,
	    plotBorderWidth: null,
	    plotShadow: false,
	    type: 'pie'
	  },
	  title: {
	    text: '이번달 입사/퇴사 통계'
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
	      allowPointSelect: true,
	      cursor: 'pointer',
	      dataLabels: {
	        enabled: true,
	        format: '<b>{point.name}</b>: {point.percentage:.1f} %',
	        connectorColor: 'silver'
	      }
	    }
	  },
	  series: [{
	    name: 'Share',
	    data: [
	      { name: 'Chrome', y: 61.41 },
	      { name: 'Internet Explorer', y: 11.84 },
	      { name: 'Firefox', y: 10.85 },
	      { name: 'Edge', y: 4.67 },
	      { name: 'Safari', y: 4.18 },
	      { name: 'Other', y: 7.05 }
	    ]
	  }]
	});
</script>
<%@ include file="inc/bottom.jsp"%>