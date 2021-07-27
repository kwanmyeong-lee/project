<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<script type="text/javascript">
	$(function() {
		let weatherIcon = {
			'01' : 'fas fa-sun',
			'02' : 'fas fa-cloud-sun',
			'03' : 'fas fa-cloud',
			'04' : 'fas fa-cloud-meatball',
			'09' : 'fas fa-cloud-sun-rain',
			'10' : 'fas fa-cloud-showers-heavy',
			'11' : 'fas fa-poo-storm',
			'13' : 'far fa-snowflake',
			'50' : 'fas fa-smog'
		};

		var place = [ "incheon", "seoul", "Seongnam-si" ];
		for (var i = 0; i < place.length; i++) {

			$
					.ajax({
						url : "http://api.openweathermap.org/data/2.5/weather?q="
								+ place[i]
								+ "&APPID=b9f69884eda6b4ec8cc6527d4e2731e3&units=metric",
						dataType : 'json',
						type : 'GET',
						success : function(data) {
							var Icon = (data.weather[0].icon).substr(0, 2);
							var Temp = Math.floor(data.main.temp) + 'º';
							var city = data.name;
							var w_id = data.weather[0].id;
							var description = wDescEngToKor(w_id);

							var str = "<div class='col-3 mx-1 p-2  weather1'><div><i class='"+ weatherIcon[Icon]+"'></i></div><div>"
									+ description
									+ "</div><div>"
									+ Temp
									+ "'</div><div>" + city + "</div></div>";

							$('#weatherBox').append(str);
							/* 					$('.CurrIcon').append(
														'');
												$('.description').prepend(description);
												$('.CurrTemp').prepend(Temp);
												$('.City').append(city); */
						}
					})
		}
	});

	function wDescEngToKor(w_id) {
		var w_id_arr = [ 201, 200, 202, 210, 211, 212, 221, 230, 231, 232, 300,
				301, 302, 310, 311, 312, 313, 314, 321, 500, 501, 502, 503,
				504, 511, 520, 521, 522, 531, 600, 601, 602, 611, 612, 615,
				616, 620, 621, 622, 701, 711, 721, 731, 741, 751, 761, 762,
				771, 781, 800, 801, 802, 803, 804, 900, 901, 902, 903, 904,
				905, 906, 951, 952, 953, 954, 955, 956, 957, 958, 959, 960,
				961, 962 ];
		var w_kor_arr = [ "가벼운 비를 동반한 천둥구름", "비를 동반한 천둥구름", "폭우를 동반한 천둥구름",
				"약한 천둥구름", "천둥구름", "강한 천둥구름", "불규칙적 천둥구름", "약한 연무를 동반한 천둥구름",
				"연무를 동반한 천둥구름", "강한 안개비를 동반한 천둥구름", "가벼운 안개비", "안개비", "강한 안개비",
				"가벼운 적은비", "적은비", "강한 적은비", "소나기와 안개비", "강한 소나기와 안개비", "소나기",
				"악한 비", "중간 비", "강한 비", "매우 강한 비", "극심한 비", "우박", "약한 소나기 비",
				"소나기 비", "강한 소나기 비", "불규칙적 소나기 비", "가벼운 눈", "눈", "강한 눈",
				"진눈깨비", "소나기 진눈깨비", "약한 비와 눈", "비와 눈", "약한 소나기 눈", "소나기 눈",
				"강한 소나기 눈", "박무", "연기", "연무", "모래 먼지", "안개", "모래", "먼지", "화산재",
				"돌풍", "토네이도", "구름 한 점 없는 맑은 하늘", "약간의 구름이 낀 하늘",
				"드문드문 구름이 낀 하늘", "구름이 거의 없는 하늘", "구름으로 뒤덮인 흐린 하늘", "토네이도",
				"태풍", "허리케인", "한랭", "고온", "바람부는", "우박", "바람이 거의 없는", "약한 바람",
				"부드러운 바람", "중간 세기 바람", "신선한 바람", "센 바람", "돌풍에 가까운 센 바람", "돌풍",
				"심각한 돌풍", "폭풍", "강한 폭풍", "허리케인" ];
		for (var i = 0; i < w_id_arr.length; i++) {
			if (w_id_arr[i] == w_id) {
				return w_kor_arr[i];
				break;
			}
		}
		return "none";
	}
</script>
<style type="text/css">
.weather1 {
	background: #e0e0ff;
	color: black;
	border: 3px solid #c4c1ff;
}
</style>
<!-- 
{"coord":{"lon":126.5219,"lat":33.5097},"weather":[{"id":500,"main":"Rain","description":"light
rain","icon":"10n"}],"base":"stations","main":{"temp":25.76,"feels_like":26.72,"temp_min":25.76,"temp_max":25.76,"pressure":1003,"humidity":89,"sea_level":1003,"grnd_level":1000},"visibility":10000,"wind":{"speed":6.02,"deg":113,"gust":9.78},"rain":{"1h":0.11},"clouds":{"all":100},"dt":1627301236,"sys":{"country":"KR","sunrise":1627245707,"sunset":1627295927},"timezone":32400,"id":1846266,"name":"Jeju
City","cod":200} -->



<div class="row justify-content-center m-3 p-3 text-center"
	id="weatherBox" style="background-color: #e9f7ff; width: auto;"></div>
