<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="./css/detail.css">
</head>
<body>
	<div id="topNav">
		<div id=login>
			<a>로그인</a> <a>회원가입</a> <a>마이페이지</a>
		</div>
	</div>

	<div id="title">
		<!-- TRAVEL_DESTINATION의 title 출력 -->
		<h1>더 레드 하우스</h1>
		<!-- TRAVEL_DESTINATION의 LOCAL 지역코드+시군구코드 기반으로 주소 출력 -->
		<p>강원특별자치도 속초시</p>
	</div>

	<div>
		<ul id="detailNav">
			<li>사진</li>
			<li>기본정보</li>
			<li>무장애편의정보</li>
			<li>지도</li>
		</ul>
	</div>

	<div id="detailInfo">
		<img id="travelImg"
			src="http://tong.visitkorea.or.kr/cms/resource/11/2042111_image2_1.JPG"
			style="width:100%; background-position:center;">


		<div id="tag">
			<h2>태그</h2>
			<hr />
			<span>#강원도</span> <span>#문화시설</span>
		</div>

		<div id="travelInfo">
			<h2>상세정보</h2>
			<hr />
			<p>
				근 30년간 아름다운 외설악의 풍경을 한눈에 담을 수 있는 곳에서 심신의 휴양처가 되어온 (구)락토장이 '더 레드
				하우스'의 이름으로 새롭게 개장하였다. 더 레드 하우스는 가족이나 단체 숙박이 가능한 넓은 객실부터 합리적인 숙박을
				원하시는 분께 적합한 도미토리까지 다양한 형태의 객실을 갖추고 있다.<br>특히 성수기 숙박시설의 비싼 가격에
				여행이 부담스러우셨던 분들에게 더 레드 하우스는 최선의 선택이다. 더 레드 하우스는 동해안의 바닷가와 설악산 어느 곳으로도
				편리하게 이동 가능한 요지에 있으며, 여럿이든 다정한 연인이든 사계절 설악과 동해안을 모두 만끽하고 갈 수 있다.
			</p>
			<hr />
			<ul>
				<li>✅ 주소 : 강원특별자치도 속초시 설악산로836번길 17</li>
				<li>✅ 홈페이지 : <a
					href="https://www.hsg.go.kr/tour/contents.do?key=1363&">
						https://www.hsg.go.kr/tour/contents.do?key=1363&</a></li>
				<li>✅ 이용시간 : 상시 이용 가능, 미사 시간에는 조용히 관람할 것 *풍수원성당 관광객 참여 가능 미사 시간
					월요일 07:00, 화~금요일 11:00, 토요일 11:00,19:30 일요일 09:00 / 순례자 미사 11:00</li>
				<li>✅ 이용요금 : <유물전시관> 일반 : 2,000원 / 횡성군민, 국가유공자 : 1,000원
					/ 장애인, 경로(만 65세 이상) 1,000원</li>
				<!-- TRAVEL_INTRODUCTION에서 반복문 돌려서 정렬 -->
			</ul>
		</div>

		<div>
			<h2>무장애 편의정보</h2>
			<hr />
			<div id="facInfo">
				<div>
					<div class="facBox">지체장애</div>
					<ul>
						<li>✅ 안내요원 : 안내요원있음(매표소)</li>
						<li>✅ 유도안내설비 : 핸드레잎 촉지판 있음(산책로)</li>
						<li>✅ 시각장애 기타상세 : 3D 촉각모형 있음</li>
						<!-- TRAVEL_INTRODUCTION에서 반복문 돌려서 정렬 -->
					</ul>
				</div>

				<div>
					<div class="facBox">시각장애</div>
					<ul>
						<li>✅ 주차여부 : 장애인 주차장 있음(3대/풍수원 성당 인근)_무장애 편의시설</li>
						<li>✅ 핵심동선 : 출입구까지 경사로가 설치되어 있음(완만함)</li>
						<li>✅ 매표소 : 매표소 있음</li>
						<li>✅ 홍보물 : 열린관광지 리플렛 있음</li>
						<li>✅ 화장실 : 장애인 화장실 있음(유현유물전시관 인근, 문화해설사의집 인근)</li>
						<li>✅ 지체장애 기타 상세 : 일부 흙(돌) 구간 있음 / 교통약자를 위한 이동수단(전기관람차) 있음</li>
						<!-- TRAVEL_INTRODUCTION에서 반복문 돌려서 정렬 -->
					</ul>
				</div>

				<div>
					<div class="facBox">영유아가족</div>
					<ul>
						<li>✅ 안내요원 : 안내요원있음(매표소)</li>
						<li>✅ 유도안내설비 : 핸드레잎 촉지판 있음(산책로)</li>
						<li>✅ 시각장애 기타상세 : 3D 촉각모형 있음</li>
						<!-- TRAVEL_INTRODUCTION에서 반복문 돌려서 정렬 -->
					</ul>
				</div>
			</div>
		</div>

		<div>
			<h2>지도</h2>
			<hr />
			<div id="map"></div>

		</div>
	</div>

	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=32134b127e6bd83f533ecf2b330d74ee"></script>

	<script>
		var container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
		var options = { //지도를 생성할 때 필요한 기본 옵션
			center : new kakao.maps.LatLng(38.1696183575, 128.5164548310), //지도의 중심좌표.
			//mapx+mapy String으로 되어있는 것을 double로 변경해서 가져오기
			level : 3
		//지도의 레벨(확대, 축소 정도)
		};

		var map = new kakao.maps.Map(container, options); //지도 생성 및 객체 리턴
		
		//마커를 표시할 위치 (지도 중심좌표와 동일하게 적용)
		var markerPosition  = new kakao.maps.LatLng(38.1696183575, 128.5164548310); 

		// 마커 생성
		var marker = new kakao.maps.Marker({
		    position: markerPosition
		});

		// 마커가 지도 위에 표시되도록 설정합니다
		marker.setMap(map);
	</script>
</body>
</html>