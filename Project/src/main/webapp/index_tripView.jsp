<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@ page import="travelDB.dao.LocalCodeDAO"%>
<%@ page import="travelDB.dao.TravelDestinationDAO"%>

<%@ page import="travelDB.dto.LocalCodeDTO"%>
<%@ page import="travelDB.dto.TravelDestinationDTO"%>

<%@ page import="java.util.List"%>
<%@ page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="./css/index_tripView.css">
</head>
<body>
	<%
	request.setCharacterEncoding("UTF-8"); //문자인코딩 설정 한글깨짐 방지

	int areaCode = Integer.parseInt(request.getParameter("areaCode"));
	int viewList = Integer.parseInt(request.getParameter("viewList"));

	//Local DB 적용하면 됨
	LocalCodeDAO localCodeDAO = new LocalCodeDAO();
	List<LocalCodeDTO> localList = localCodeDAO.getLocalCodeList();

	
	TravelDestinationDAO tdDAO = new TravelDestinationDAO();

	List<TravelDestinationDTO> tdList = null;
	
	if(areaCode > 0) {
		tdList = tdDAO.findTravelDestinationByAreacode(areaCode);
	} else { //areacode가 0(전체)일 경우 여행지 전체 리스트 출력
		tdList = tdDAO.getTravelDestinationList();
	}
	
	//tdList가 viewList보다 적을 경우 값 tdList.size로 받음
	int viewListLength = tdList.size();
	
	if(viewListLength >= viewList) {
		viewListLength = viewList;
	}

	// 세션에서 닉네임과 코드 가져오기
	String nickname = (String) session.getAttribute("user_nickname");
    Integer code = (Integer) session.getAttribute("user_code");
	%>


	<div id="topNav">
		<a id="gotoMain" href="index.jsp">메인화면</a>
		<div id=login>
		<%if (nickname != null && code != null) { %>
			<a href="myPage.jsp"> <span id='nicname'><%=nickname %></span> 님</a> | <a href="myPage.jsp">마이페이지</a> | <a href="logout_action.jsp">로그아웃</a>
		<%} else { %>
			<a href="login.jsp">로그인</a> | <a href="signup.jsp">회원가입</a> | <a href="">마이페이지</a>
		<% } %>
		</div>
	</div>

	<div>
		<div id="localSelectBar" class="selectbar">
			<button type="submit" class="selectlocal" value="0">전체</button>
			<% for (LocalCodeDTO lc : localList) { %>
			<button type="submit" class="selectlocal" value="<%=lc.getCode()%>"><%=lc.getName()%></button>
			<% } %>
		</div>
	</div>

	<div id="mapContainer">
		<div id="map"></div>
	</div>

	<div id="tripView">
		<%
		for (int i = 0; i<viewListLength; i++) {
			//where = 지역코드에 해당하는 여행지 size()로 반복
		%>
		<button class="tripbox" value="<%=tdList.get(i).getContentid()%>">
			<%
			//Firstimage가 없는 경우 NoImge로 대체
			if (tdList.get(i).getFirstimage() == null) {
			%>

			<div class="img"
				style="background-image: url('https://access.visitkorea.or.kr/resources/images/temp/base_img.png')"></div>


			<%
			} else { //Firstimage가 있으면 해당 이미지 링크로
			%>

			<div class="img"
				style="background-image:url('<%=tdList.get(i).getFirstimage()%>')"></div>

			<%
			}
			%>
			<%-- <p><%=localList.get(areaCode-1).getName() %></p> --%>
			<div id="tripTitle">
				<h3><%=tdList.get(i).getTitle()%></h3>
			</div>
		</button>
		<%
		}

		if(tdList.size() > 20) {
		%>

		<button id="add" onclick="addList()">더보기 +</button>

		<% } %>

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
		
		for (let sl of selectedLocal) {
		    if (sl.value == "<%= areaCode %>") {
		        sl.style.backgroundColor = "rgb(252, 200, 150)";
		    }
		}
		
		for(let sl of selectedLocal) {
			sl.addEventListener('click', ()=>{
				location.href = "index_tripView.jsp?areaCode="+sl.value+"&viewList="+20;
			});
		}
		
		//.tripbox 클릭 시 해당 detail 페이지로 이동
		let tripbox = document.querySelectorAll('.tripbox');
		
		for(let tb of tripbox) {
			tb.addEventListener('click', ()=>{
				location.href = "detail.jsp?contentId="+tb.value;
			});
		}
		
		//더보기 클릭 시 파라미터로 viewList 값 변경해서 목록 더 보여주기
		function addList() {
			location.href = "index_tripView.jsp?areaCode="+<%=areaCode%>+"&viewList="+<%=viewList+20%>;
		}
		
		//ajax 활용해서 더보기 클릭시 목록 더 보여주기
		//보류
		
	</script>

</body>
</html>