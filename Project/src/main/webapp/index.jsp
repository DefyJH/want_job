<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="./css/index.css">
</head>
<body>
	<div id="topNav">
		<div id=login>
			<a>로그인</a>
			<a>회원가입</a>
			<a>마이페이지</a>
		</div>
	</div>

	<div>
		<ul id="selectBar">
		<!-- DB 완성 시 LOCAL - local_code로 변경 -->
			<li>전체</li>
			<li>서울</li>
			<li>인천</li>
			<li>대전</li>
			<li>대구</li>
			<li>광주</li>
			<li>부산</li>
			<li>울산</li>
			<li>세종</li>
			<li>경기</li>
			<li>강원</li>
			<li>충북</li>
			<li>층남</li>
			<li>경북</li>
			<li>경남</li>
			<li>전북</li>
			<li>전남</li>
			<li>제주</li>
			<!-- onclick 시 지역코드 tripveiw에 전달 -->
		</ul>
	</div>

	<div id="tripView">
	<% for(int i=0; i<10; i++) { //where = 지역코드에 해당하는 여행지 size()로 반복 %>
		<form class="tripbox">
			<!-- TRAVEL_DESTINATION - firstimage -->
			<img src="http://tong.visitkorea.or.kr/cms/resource/11/2042111_image2_1.JPG" width="85%">
			<!-- TRAVEL_DESTINATION의 LOCAL 지역코드+시군구코드 기반으로 주소 출력 -->
			<p>강원특별자치도 속초시</p>
			<!-- TRAVEL_DESTINATION의 title 출력 -->
			<h2>더 레드 하우스</h2>
		</form>
	<% } %>
	</div>
</body>
</html>