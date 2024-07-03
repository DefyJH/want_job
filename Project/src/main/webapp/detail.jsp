<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="travelDB.dao.LocalCodeDAO"%>
<%@ page import="travelDB.dao.TravelDestinationDAO"%>
<%@ page import="travelDB.dao.ContentTypeDAO"%>
<%@ page import="travelDB.dao.TravelDetailDAO"%>
<%@ page import="travelDB.dao.DisabilityInfoDAO"%>
<%@ page import="userDB.dao.ReviewDAO"%>
<%@ page import="userDB.dao.UserDateDAO"%>


<%@ page import="travelDB.dto.LocalCodeDTO"%>
<%@ page import="travelDB.dto.TravelDestinationDTO"%>
<%@ page import="travelDB.dto.ContentTypeDTO"%>
<%@ page import="travelDB.dto.TravelDetailDTO"%>
<%@ page import="travelDB.dto.DisabilityInfoDTO"%>
<%@ page import="userDB.dto.ReviewDTO"%>
<%@ page import="userDB.dto.UserDateDTO"%>

<%@ page import="travelDB.util.ConvertDateUtil"%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.ArrayList"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Travel For All</title>
<link rel="stylesheet" href="./css/detail.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css"
	integrity="sha512-SnH5WK+bZxgPHs44uWIX+LLJAJ9/2PkPKZ5QiAj6Ta86w+fsb2TkcmfRyVX3pBnMFcV7oQPJkl9QevSCWr3W6A=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
</head>
<body>
	<%
	request.setCharacterEncoding("UTF-8"); //문자인코딩 설정 한글깨짐 방지

	//콘텐츠ID 파라미터로 전달받음
	int contentId = Integer.parseInt(request.getParameter("contentId"));

	//콘텐츠ID 기반 travel_destination DB정보 출력
	TravelDestinationDAO tdDAO = new TravelDestinationDAO();
	TravelDestinationDTO td = tdDAO.findTravelDestinationByContentId(contentId);

	//콘텐츠ID 기반 travel_detail DB정보 받음
	TravelDetailDAO tddDAO = new TravelDetailDAO();
	TravelDetailDTO tdd = tddDAO.findTravelDetailByContentId(contentId);

	//주소 addr2가 null인 경우
	String address = null;

	if (td.getAddr2() != null) {
		address = td.getAddr1() + td.getAddr2();
	} else {
		address = td.getAddr1();
	}

	List<TravelDestinationDTO> otdList = tdDAO.findOtherTravelDestination(td.getAreacode(), td.getSigungucode(),
			td.getContentid());

	//otherTrip 리스트는 4개만 보여줄 예정
	int otdListLegnth;

	//otherTrip 리스트가 4개보다 작을 경우 otdList Length를 otdList.size()로 설정
	if (otdList.size() >= 5) {
		otdListLegnth = 5;
	} else {
		otdListLegnth = otdList.size();
	}

	//local DB정보 받음(여행 태그 작성용)
	LocalCodeDAO localCodeDAO = new LocalCodeDAO();
	List<LocalCodeDTO> localList = localCodeDAO.getLocalCodeList();

	//태그용 지역이름
	String areaName = null;

	for (LocalCodeDTO lc : localList) {
		if (td.getAreacode() == lc.getCode())
			areaName = "#" + lc.getName();
	}

	//content_type DB 정보 받음(여행 태그 작성용2)
	ContentTypeDAO ctDAO = new ContentTypeDAO();
	List<ContentTypeDTO> ctList = ctDAO.getContentTypeList();

	//태그용 관광타입이름
	String contentName = null;

	for (ContentTypeDTO ct : ctList) {
		if (td.getContenttypeid() == ct.getType_code())
			contentName = "#" + ct.getType_name();
	}

	//리뷰 DB 가져오기
	ReviewDAO reviewDAO = new ReviewDAO();
	List<ReviewDTO> reviewList = reviewDAO.findReviewByContenId(contentId);

	//유저 DB 가져오기

	UserDateDAO userDAO = new UserDateDAO();
	List<UserDateDTO> userList = userDAO.getUserDataList();

	List<String> reviewNickname = new ArrayList<String>();

	if (reviewList != null) {
		for (ReviewDTO rv : reviewList) {
			for (UserDateDTO us : userList) {
		if (us.getUser_code() == rv.getUser_code())
			reviewNickname.add(us.getUser_nickname());
			}
		}
	}

	//리뷰 리스트 표시 내용
	//otherTrip 리스트는 4개만 보여줄 예정
	int reviewListLegnth = 0;

	//otherTrip 리스트가 4개보다 작을 경우 otdList Length를 otdList.size()로 설정
	if (reviewList == null) {
		reviewListLegnth = 0;
	} else if (reviewList.size() >= 5) {
		reviewListLegnth = 5;
	} else {
		reviewListLegnth = reviewList.size();
	}

	// 세션에서 닉네임과 코드 가져오기
	String nickname = (String) session.getAttribute("user_nickname");
	Integer code = (Integer) session.getAttribute("user_code");

	//무장애정보 리스트
	DisabilityInfoDAO diDAO = new DisabilityInfoDAO();
	DisabilityInfoDTO di = diDAO.findDisabilityInfoByContentId(contentId);
	
	%>

	<div id="topNav">
		<a id="gotoMain" href="index.jsp">Travel For All</a>
		<div id=login>
			<%
			if (nickname != null && code != null) {
			%>
			<a href="my_page.jsp"> <span id='nicname'><%=nickname %></span> 님
			</a> | <a href="my_page.jsp">마이페이지</a> | <a href="logout_action.jsp">로그아웃</a>
			<%
			} else {
			%>
			<a href="login.jsp">로그인</a> | <a href="signup.jsp">회원가입</a>
			<%
			}
			%>
		</div>
	</div>

	<div id="title">
		<h1><%=td.getTitle()%></h1>
		<!-- <!-- TRAVEL_DESTINATION의 LOCAL 지역코드+시군구코드 기반으로 주소 출력
		<p>강원특별자치도 속초시</p> 잠시 보류-->
	</div>

	<div>
		<div id="detailNav">
			<button type="button" onclick="moveImg()">사진</button>
			<button type="button" onclick="moveInfo()">기본정보</button>
			<button type="button" onclick="moveFacInfo()">무장애편의정보</button>
			<button type="button" onclick="moveMap()">지도</button>
			<button type="button" onclick="moveReview()">여행후기</button>
			<button type="button" onclick="moveOther()">다른여행지</button>
		</div>
	</div>

	<div id="detailInfo">
		<div id="imaContainer">
			<img id="travelImg" src="<%=td.getFirstimage()%>"
				style="width: 100%; background-position: center;">
			<%-- <hr />
			<%if(td.getFirstimage().equals(td.getSecondimage()) == false) { %>
			<img class="preview" src="<%=td.getFirstimage()%>"><img
				class="preview" src="<%=td.getSecondimage()%>">
			<%} else { %>
			<img class="preview" src="<%=td.getFirstimage()%>">
			<% } %> --%>
		</div>


		<div id="tag">
			<h2>태그</h2>
			<hr />
			<span onclick="moveSelectArea()"><%=areaName%></span> <span
				onclick="moveSelectContent()"><%=contentName%></span>
		</div>

		<div id="travelInfo">
			<h2>상세정보</h2>
			<hr />
			<p><%=tdd.getOverview()%></p>
			<hr />
			<ul>
				<li>✅ 주소 : <%=address%></li>
				<%
				if (tdd.getHomepage() != null) {
				%>
				<li>✅ 홈페이지 : <%=tdd.getHomepage()%></li>
				<%
				}
				%>
				<!-- 
				잠시 보류(개선사항...)
				<li>✅ 이용시간 : 상시 이용 가능, 미사 시간에는 조용히 관람할 것 *풍수원성당 관광객 참여 가능 미사 시간
					월요일 07:00, 화~금요일 11:00, 토요일 11:00,19:30 일요일 09:00 / 순례자 미사 11:00</li>
				<li>✅ 이용요금 : <유물전시관> 일반 : 2,000원 / 횡성군민, 국가유공자 : 1,000원
					/ 장애인, 경로(만 65세 이상) 1,000원</li> -->
				<!-- TRAVEL_INTRODUCTION에서 반복문 돌려서 정렬 -->
			</ul>
		</div>

		<div id="facInfoTop">
			<h2>무장애 편의정보</h2>
			<hr />
			<div id="facInfo">

				<%if(di.getParking() != null || di.getRoute() != null || di.getPublic_transport() != null
						|| di.getTicket_office() != null || di.getPromotion() != null || di.getWheelchair() != null
						|| di.getExit() != null || di.getElevator() != null || di.getRestroom() != null
						|| di.getAuditorium() != null || di.getRoom() != null || di.getHandicap_etc() != null) { %>
				<div>
					<div class="facBox">지체장애</div>
					<ul>
						<%if(di.getParking() != null) { %>
						<li>✅<%=di.getParking()%></li>
						<% } %>
						<%if(di.getRoute() != null) { %>
						<li>✅<%=di.getRoute()%></li>
						<% } %>
						<%if(di.getPublic_transport() != null) { %>
						<li>✅<%=di.getPublic_transport()%></li>
						<% } %>
						<%if(di.getTicket_office() != null) { %>
						<li>✅<%=di.getTicket_office()%></li>
						<% } %>
						<%if(di.getPromotion() != null) { %>
						<li>✅<%=di.getPromotion()%></li>
						<% } %>
						<%if(di.getWheelchair() != null) { %>
						<li>✅<%=di.getWheelchair()%></li>
						<% } %>
						<%if(di.getExit() != null) { %>
						<li>✅<%=di.getExit()%></li>
						<% } %>
						<%if(di.getElevator() != null) { %>
						<li>✅<%=di.getElevator()%></li>
						<% } %>
						<%if(di.getRestroom() != null) { %>
						<li>✅<%=di.getRestroom()%></li>
						<% } %>
						<%if(di.getAuditorium() != null) { %>
						<li>✅<%=di.getAuditorium()%></li>
						<% } %>
						<%if(di.getRoom() != null) { %>
						<li>✅<%=di.getRoom()%></li>
						<% } %>
						<%if(di.getHandicap_etc() != null) { %>
						<li>✅<%=di.getHandicap_etc()%></li>
						<% } %>
					</ul>
				</div>
				<%} %>


				<%if(di.getBraileblock() != null || di.getHelpdog() != null || di.getGuide_human() != null
						|| di.getGuide_audio() != null || di.getBigprint() != null || di.getBrailepromotion() != null
						|| di.getGuidesystem() != null || di.getBlindhandicap_etc() != null) { %>
				<div>
					<div class="facBox">시각장애</div>
					<ul>
						<%if(di.getBraileblock() != null) { %>
						<li>✅<%=di.getBraileblock()%></li>
						<% } %>
						<%if(di.getHelpdog() != null) { %>
						<li>✅<%=di.getHelpdog()%></li>
						<% } %>
						<%if(di.getGuide_human() != null) { %>
						<li>✅<%=di.getGuide_human()%></li>
						<% } %>
						<%if(di.getGuide_audio() != null) { %>
						<li>✅<%=di.getGuide_audio()%></li>
						<% } %>
						<%if(di.getBigprint() != null) { %>
						<li>✅<%=di.getBigprint()%></li>
						<% } %>
						<%if(di.getBrailepromotion() != null) { %>
						<li>✅<%=di.getBrailepromotion()%></li>
						<% } %>
						<%if(di.getGuidesystem() != null) { %>
						<li>✅<%=di.getGuidesystem()%></li>
						<% } %>
						<%if(di.getBlindhandicap_etc() != null) { %>
						<li>✅<%=di.getBlindhandicap_etc()%></li>
						<% } %>
					</ul>
				</div>
				<%} %>


				<%if(di.getGuide_sign() != null || di.getGuide_video() != null
						|| di.getHearingroom() != null || di.getHearinghandicapetc() != null) { %>
				<div>
					<div class="facBox">청각장애</div>
					<ul>
						<%if(di.getGuide_sign() != null) { %>
						<li>✅<%=di.getGuide_sign()%></li>
						<% } %>
						<%if(di.getGuide_video() != null) { %>
						<li>✅<%=di.getGuide_video()%></li>
						<% } %>
						<%if(di.getHearingroom() != null) { %>
						<li>✅<%=di.getHearingroom()%></li>
						<% } %>
						<%if(di.getHearinghandicapetc() != null) { %>
						<li>✅<%=di.getHearinghandicapetc()%></li>
						<% } %>
					</ul>
				</div>
				<% } %>

				<%if(di.getStroller() != null || di.getLactationroom() != null
						|| di.getBabysparechair() != null || di.getInfantsfamily_etc() != null) { %>
				<div>
					<div class="facBox">영유아가족</div>
					<ul>
						<%if(di.getStroller() != null) { %>
						<li>✅<%=di.getStroller()%></li>
						<% } %>
						<%if(di.getLactationroom() != null) { %>
						<li>✅<%=di.getLactationroom()%></li>
						<% } %>
						<%if(di.getBabysparechair() != null) { %>
						<li>✅<%=di.getBabysparechair()%></li>
						<% } %>
						<%if(di.getInfantsfamily_etc() != null) { %>
						<li>✅<%=di.getInfantsfamily_etc()%></li>
						<% } %>
					</ul>
				</div>
				<% } %>

			</div>
		</div>

		<div id="maptop">
			<h2>지도</h2>
			<hr />
			<div id="map"></div>

		</div>
	</div>

	<div id="review">
		<h2>이용자 리뷰</h2>
		<hr />
		<%
		if (nickname != null && code != null) {
		%>
		<form class="reviewBox" action="reviewAdd_action.jsp" method="post">
			<input type="hidden" name="user_code" value="<%=code%>"> <input
				type="hidden" name="contents_id" value="<%=contentId%>">
			<textarea placeholder="여행 후기를 남겨주세요." name="review_text"></textarea>
			<div class="registerBox">

				<button type="submit" class="register">등록</button>
				<label for="fileUp">
					<div class="registerPhoto">
						<i class="fa-solid fa-camera"></i>
					</div>
				</label> <input type="file" accept="image/*" name="review_image" id="fileUp">
			</div>
			<div class="rating">
				평점 : <span class="star star1" onmouseover="highlightStar(1)"
					onmouseout="resetStars(1)" onclick="rating(1)">&#9733;</span> <span
					class="star star2" onmouseover="highlightStar(2)"
					onmouseout="resetStars(2)" onclick="rating(2)">&#9733;</span> <span
					class="star star3" onmouseover="highlightStar(3)"
					onmouseout="resetStars(3)" onclick="rating(3)">&#9733;</span> <span
					class="star star4" onmouseover="highlightStar(4)"
					onmouseout="resetStars(4)" onclick="rating(4)">&#9733;</span> <span
					class="star star5" onmouseover="highlightStar(5)"
					onmouseout="resetStars(5)" onclick="rating(5)">&#9733;</span> <input
					type="hidden" name="review_rating" id="ratingInput">
			</div>
		</form>

		<%
		} else {
		%>
		<div class="reviewBox">
			<textarea placeholder="로그인 후 여행 후기를 작성해주세요." onclick="movelogin()"></textarea>
			<div class="registerBox">
				<button type="submit" class="register" onclick="movelogin()">등록</button>
				<div class="registerPhoto" onclick="movelogin()">
					<i class="fa-solid fa-camera"></i>
				</div>
			</div>
			<div class="rating">
				평점 : <span class="star1" onclick="movelogin()">&#9733;</span> <span
					class="star2" onclick="movelogin()">&#9733;</span> <span
					class="star3" onclick="movelogin()">&#9733;</span> <span
					class="star4" onclick="movelogin()">&#9733;</span> <span
					class="star5" onclick="movelogin()">&#9733;</span>
			</div>
		</div>
		<%
		}
		%>
		<%
		if (reviewList == null) {
		%>
		<div id="noReview">
			<p>등록된 리뷰가 없습니다. 리뷰를 등록해주세요.</p>
		</div>

		<%
		} else {

		for (int i = 0; i < reviewListLegnth; i++) {
		%>

		<div class="userReview">
			<% if(reviewList.get(i).getReview_image() != null) { %>
			<img src="./image/<%=reviewList.get(i).getReview_image()%>"
				width="50%">
			<% } %>
			<p class="inlineBlock"><%=reviewList.get(i).getReview_text()%></p> <p class="inlineBlock gray font-size08">   |   </p>
			<%
				//리뷰 평점 100일 때
				if (reviewList.get(i).getReview_rating() == 100) {
				%>
			<div class="reviewRating">
				<span class="gold">&#9733;</span> <span class="gold">&#9733;</span>
				<span class="gold">&#9733; </span> <span class="gold">&#9733;</span>
				<span class="gold">&#9733;</span>
			</div>
			<%
				//리뷰 평점 80일 때
				} else if (reviewList.get(i).getReview_rating() == 80) {
				%>
			<div class="reviewRating">
				<span class="gold">&#9733;</span> <span class="gold">&#9733;</span>
				<span class="gold">&#9733; </span> <span class="gold">&#9733;</span>
				<span class="gray">&#9733;</span>
			</div>
			<%
				//리뷰 평점 60일 때
				} else if (reviewList.get(i).getReview_rating() == 60) {
				%>
			<div class="reviewRating">
				<span class="gold">&#9733;</span> <span class="gold">&#9733;</span>
				<span class="gold">&#9733; </span> <span class="gray">&#9733;</span>
				<span class="gray">&#9733;</span>
			</div>
			<%
				//리뷰 평점 40일 때
				} else if (reviewList.get(i).getReview_rating() == 40) {
				%>
			<div class="reviewRating">
				<span class="gold">&#9733;</span> <span class="gold">&#9733;</span>
				<span class="gray">&#9733; </span> <span class="gray">&#9733;</span>
				<span class="gray">&#9733;</span>
			</div>
			<%
				//리뷰 평점 20일 때
				} else {
				%>
			<div class="reviewRating">
				<span class="gold">&#9733;</span> <span class="gray">&#9733;</span>
				<span class="gray">&#9733; </span> <span class="gray">&#9733;</span>
				<span class="gray">&#9733;</span>
			</div>
			<%
				}
				%>
			<div>
				<span class="reviewSub"><%=reviewNickname.get(i)%></span> <span class="reviewSub"> | </span> <span class="reviewSub"><%=ConvertDateUtil.convertLocalDateTimeToString4(reviewList.get(i).getReview_date())%></span>
			</div>
		</div>
		<hr />

		<%
		}

		}
		%>


	</div>

	<div id="otherTrip">
		<h2>인근 무장애여행지</h2>
		<hr />
		<div id="otherTripContainer">
			<%
			for (int i = 0; i < otdListLegnth; i++) {
				//where = 지역코드에 해당하는 여행지 size()로 반복
			%>
			<button class="tripbox" value="<%=otdList.get(i).getContentid()%>">
				<%
				//Firstimage가 없는 경우 NoImge로 대체
				if (otdList.get(i).getFirstimage() == null) {
				%>
				<div class="img"
					style="background-image: url('https://access.visitkorea.or.kr/resources/images/temp/base_img.png')"></div>
				<%
				} else { //Firstimage가 있으면 해당 이미지 링크로
				%>
				<div class="img"
					style="background-image:url('<%=otdList.get(i).getFirstimage()%>')"></div>
				<%
				}
				%>
				<%-- <p><%=localList.get(areaCode-1).getName() %></p> --%>
				<div id="tripTitle">
					<h3><%=otdList.get(i).getTitle()%></h3>
				</div>
			</button>
			<%
			}
			%>
		</div>
	</div>

	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=32134b127e6bd83f533ecf2b330d74ee"></script>

	<script>
		//카카오 MAP API 스크립트
		var container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스

		var mapX =
	<%=Double.parseDouble(td.getMapX())%>
		;
		var mapY =
	<%=Double.parseDouble(td.getMapY())%>
		;

		var options = { //지도를 생성할 때 필요한 기본 옵션
			center : new kakao.maps.LatLng(mapY, mapX), //지도의 중심좌표.
			//mapx+mapy String으로 되어있는 것을 double로 변경해서 가져오기
			level : 3
		//지도의 레벨(확대, 축소 정도)
		};

		var map = new kakao.maps.Map(container, options); //지도 생성 및 객체 리턴

		//마커를 표시할 위치 (지도 중심좌표와 동일하게 적용)
		var markerPosition = new kakao.maps.LatLng(mapY, mapX);

		// 마커 생성
		var marker = new kakao.maps.Marker({
			position : markerPosition
		});

		// 마커가 지도 위에 표시되도록 설정합니다
		marker.setMap(map);
		
		// 일반 지도와 스카이뷰로 지도 타입을 전환할 수 있는 지도타입 컨트롤을 생성합니다
		var mapTypeControl = new kakao.maps.MapTypeControl();

		// 지도에 컨트롤을 추가해야 지도위에 표시됩니다
		// kakao.maps.ControlPosition은 컨트롤이 표시될 위치를 정의하는데 TOPRIGHT는 오른쪽 위를 의미합니다
		map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);

		// 지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다
		var zoomControl = new kakao.maps.ZoomControl();
		map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);

		
		
		//NAV바 상시 띄우기
		let detailNav = document.querySelector('#detailNav');
		
		let detailNavTop = document.querySelector('#detailNav').offsettop;
		let detailNavHeight = document.querySelector('#detailNav').offsetHeight;
		
		function handleScroll() {
			// 현재 스크롤 위치 계산
		    let scrollTop = window.pageYOffset || document.documentElement.scrollTop;

		    // 객체가 화면 하단에 도달했는지 여부 확인
		    let isStickyReachedBottom = (scrollTop + window.innerHeight) >= (detailNavTop + detailNavHeight);

		    // 객체가 하단에 도달하면 위치를 고정
		    if (isStickyReachedBottom) {
		    	detailNav.classList.add('sticky'); // 필요한 경우 클래스를 추가하여 스타일을 적용할 수도 있습니다.
		    } else {
		    	detailNav.classList.remove('sticky'); // 하단에 도달하지 않으면 고정 해제
		    }
		}
		
		// 스크롤 이벤트 리스너 등록
		window.addEventListener('scroll', handleScroll);

		//NAV 이벤트 설정
		//이동할 위치
		let imgTop = document.querySelector('#detailInfo');
		let tagTop = document.querySelector('#tag');
		let facInfoTop = document.querySelector('#facInfoTop');
		let mapTop = document.querySelector('#maptop');
		let reviewTop = document.querySelector('#review');
		let otherTripTop = document.querySelector('#otherTrip');

		//이미지로 이동
		function moveImg() {
			imgTop.scrollIntoView({
				behavior : 'smooth',
				block : 'start'
			});
		}

		function moveInfo() {
			tagTop.scrollIntoView({
				behavior : 'smooth',
				block : 'start'
			});
		}

		function moveFacInfo() {
			facInfoTop.scrollIntoView({
				behavior : 'smooth',
				block : 'start'
			});
		}

		function moveMap() {
			mapTop.scrollIntoView({
				behavior : 'smooth',
				block : 'start'
			});
		}
		
		function moveReview() {
			reviewTop.scrollIntoView({
				behavior : 'smooth',
				block : 'start'
			});
		}
		
		function moveOther() {
			otherTripTop.scrollIntoView({
				behavior : 'smooth',
				block : 'start'
			});
		}
		
		////.tripbox 클릭 시 해당 detail 페이지로 이동
		let tripbox = document.querySelectorAll('.tripbox');
		
		for(let tb of tripbox) {
			tb.addEventListener('click', ()=>{
				location.href = "detail.jsp?contentId="+tb.value;
			});
		}
		
		//태그 클릭시 각자에 해당하는 콘텐츠 정보를 보여줌
		function moveSelectArea() {
			location.href = "index_tripView.jsp?areaCode="+<%=td.getAreacode()%>+"&viewList="+20;
		}
		
		//로그인하지 않고 textarea로 클릭했을 시 login 페이지로 이동
		function movelogin() {
			alert('로그인 창으로 이동합니다.')
			location.href = "login.jsp";
		}
		
		//저장될 평점
		let selectedRating = 0;
		
		//평점 클릭 시 이벤트
		function rating(ratingratingValue) {
			
			selectedRating = ratingratingValue*20;
			document.getElementById('ratingInput').value = selectedRating; // 별점 값을 hidden input에 설정
        }
		
	    // 별점에 마우스를 올렸을 때 실행될 함수
	    function highlightStar(ratingValue) {
	        for (var i = 1; i <= ratingValue; i++) {
	            var star = document.querySelector('.star' + i);
	            star.classList.add('gold');
	        }
	    }
		
		function resetStars(ratingValue) {
	        for (var i = 1; i <= 5; i++) {
	            var star = document.querySelector('.star' + i);
	            star.classList.remove('gold');
	        }
	        // 선택된 별점만 다시 gold로 표시
	        for (var i = 1; i <= ratingValue; i++) {
	            var star = document.querySelector('.star' + i);
	            star.classList.add('gold');
	        }
	    }
		
	</script>
</body>
</html>