<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="travelDB.dao.LocalCodeDAO" %>
<%@ page import="travelDB.dao.TravelDestinationDAO"%>
<%@ page import="travelDB.dto.LocalCodeDTO"%>
<%@ page import="travelDB.dto.TravelDestinationDTO"%>
<%@ page import="java.util.List"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="./css/index.css">
</head>
<body>
	<%
	//Local DB 적용하면 됨
	LocalCodeDAO localCodeDAO = new LocalCodeDAO();
	List<LocalCodeDTO> localList = localCodeDAO.getLocalCodeList();

	TravelDestinationDAO tdDAO = new TravelDestinationDAO();
	List<TravelDestinationDTO> tdList = tdDAO.findTravelDestinationByAreacode(1);
	
	// 세션에서 닉네임과 코드 가져오기
	String nickname = (String) session.getAttribute("user_nickname");
    Integer code = (Integer) session.getAttribute("user_code");
	%>


	<div id="topNav">
		<a id="gotoMain" href="index.jsp">메인화면</a>
		<div id=login>
		<%if (nickname != null && code != null) { %>
			<a href=""> <span id='nicname'><%=nickname %></span> 님</a> | <a href="">마이페이지</a> | <a href="logout_action.jsp">로그아웃</a>
		<%} else { %>
			<a href="login.jsp">로그인</a> | <a href="signup.jsp">회원가입</a> | <a href="">마이페이지</a>
		<% } %>
		</div>
	</div>

	<div>
		<div id="localSelectBar" class="selectbar">
			<button type="submit" class="selectlocal" value="0">전체</button>
			<%
			for (LocalCodeDTO lc : localList) {
			%>
			<button type="submit" class="selectlocal" value="<%=lc.getCode()%>"><%=lc.getName()%></button>
			<%
			}
			%>
		</div>
	</div>

	<div id="mapContainer">
		<div id="map"></div>
	</div>

	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=32134b127e6bd83f533ecf2b330d74ee"></script>

	<script>
		var container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
		var options = { //지도를 생성할 때 필요한 기본 옵션
			center: new kakao.maps.LatLng(37.5535, 126.969), //지도의 중심좌표.
			level: 10 //지도의 레벨(확대, 축소 정도)
		};

		var map = new kakao.maps.Map(container, options); //지도 생성 및 객체 리턴
		
		// 일반 지도와 스카이뷰로 지도 타입을 전환할 수 있는 지도타입 컨트롤을 생성합니다
		var mapTypeControl = new kakao.maps.MapTypeControl();

		// 지도에 컨트롤을 추가해야 지도위에 표시됩니다
		// kakao.maps.ControlPosition은 컨트롤이 표시될 위치를 정의하는데 TOPRIGHT는 오른쪽 위를 의미합니다
		map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);

		// 지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다
		var zoomControl = new kakao.maps.ZoomControl();
		map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);
		
		
		//selectBar 클릭시 해당 areacode를 가진 tripbox를 보여줌
		let selectedLocal = document.querySelectorAll('.selectlocal');
		
		for(let sl of selectedLocal) {
			sl.addEventListener('click', ()=>{
				//해당 버튼의 value값을 받아서 전달
				location.href = "index_tripView.jsp?areaCode="+sl.value+"&viewList="+20;
			});
		}
	</script>
</body>
</html>