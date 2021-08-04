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
.ageDiv{
	float: left;
	padding-right: 20px;
}
.jlDiv{
	float:right;
	padding-left: 20px;
}
.mainContainer{
	width: 100%;
	background: white;
	padding: 20px;
}
.chartContainer{
min-height: 500px;
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

.highcharts-figure-age, .highcharts-figure-age .highcharts-data-table table {
 min-width: 600px; 
 max-width: 600px;
 margin: 1em;
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
.highcharts-figure-jl .highcharts-credits{
	display: none;
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
					<td >${empCount }명</td>
					<td ></td>
					<td >현재관리자인원</td>
					<td >${adminCount }명</td>
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
		<div class="card-header py-3">
			<h5 class="m-0 font-weight-bold">차트</h5>
		</div>
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
$.ajax({
	type: 'GET',
	url: "chartList",
	dataType: "json",
	success: function(charts) {
		Highcharts.chart('containerAge', {
		  chart: {
		    type: 'column'
		  },
		  title: {
		    text: '회사 연령대별 통계'
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
		      text: '연령대별 총합 퍼센트'
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
		      name: "연령대",
		      colorByPoint: true,
		      data: charts.ageEmpGroup
		    }
		  ],
		  drilldown: {
		    series: charts.ageDetailList
		  }
		});
		console.log(charts.ageDetailList);
		
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
			    data: charts.comJL
			  }]
			});
	}
});

	

</script>
<%@ include file="inc/bottom.jsp"%>