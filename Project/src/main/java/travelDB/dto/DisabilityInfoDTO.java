package travelDB.dto;

public class DisabilityInfoDTO {

	int contentid; //콘텐츠ID
	
	//지체장애 관련 정보
	String parking; //주차여부
	String route; //대중교통
	String public_transport; //접근로정보
	String ticket_office; //매표소 정보
	String promotion; //홍보물 정보
	String wheelchair; //휠체어 정보
	String exit; //출입통로 정보
	String elevator; //엘리베이러 정보
	String restroom; //화장실 정보
	String auditorium; //관람석
	String room; //객실정보
	String handicap_etc; //지체장애 정보 기타 상세
	
	//시각장애 관련 정보
	String braileblock; //점자블록
	String helpdog; //보조견 동반 여부
	String guide_human; //안내요원
	String guide_audio; //오디오 가이드
	String bigprint; //큰 활자 홍보물
	String brailepromotion; //점자홍보물 및 점자표지판
	String guidesystem; //유도안내설비
	String blindhandicap_etc; //시각장애 정보 기타 상세
	
	//청각장애 관련 정보
	String guide_sign; //수화안내
	String guide_video; //자막 비디오가이드 및 영상자막안내
	String hearingroom; //청각장애 관련 개실 정보
	String hearinghandicapetc; //청각장애 정보 기타 상세
	
	//영유가 가족 관련 정보
	String stroller; //유모차 정보
	String lactationroom; //수유실
	String babysparechair; //유아용 보조의자
	String infantsfamily_etc; //영유아가족 정보 기타 상세
	
	public DisabilityInfoDTO() {}
	
	public DisabilityInfoDTO(int contentid, String parking, String route, String public_transport, String ticket_office,
			String promotion, String wheelchair, String exit, String elevator, String restroom, String auditorium,
			String room, String handicap_etc, String braileblock, String helpdog, String guide_human,
			String guide_audio, String bigprint, String brailepromotion, String guidesystem, String blindhandicap_etc,
			String guide_sign, String guide_video, String hearingroom, String hearinghandicapetc, String stroller,
			String lactationroom, String babysparechair, String infantsfamily_etc) {
		super();
		
		this.contentid = contentid;
		
		this.parking = parking;
		this.route = route;
		this.public_transport = public_transport;
		this.ticket_office = ticket_office;
		this.promotion = promotion;
		this.wheelchair = wheelchair;
		this.exit = exit;
		this.elevator = elevator;
		this.restroom = restroom;
		this.auditorium = auditorium;
		this.room = room;
		this.handicap_etc = handicap_etc;
		
		this.braileblock = braileblock;
		this.helpdog = helpdog;
		this.guide_human = guide_human;
		this.guide_audio = guide_audio;
		this.bigprint = bigprint;
		this.brailepromotion = brailepromotion;
		this.guidesystem = guidesystem;
		this.blindhandicap_etc = blindhandicap_etc;
		
		this.guide_sign = guide_sign;
		this.guide_video = guide_video;
		this.hearingroom = hearingroom;
		this.hearinghandicapetc = hearinghandicapetc;
		
		this.stroller = stroller;
		this.lactationroom = lactationroom;
		this.babysparechair = babysparechair;
		this.infantsfamily_etc = infantsfamily_etc;
	}

	public int getContentid() {
		return contentid;
	}

	public void setContentid(int contentid) {
		this.contentid = contentid;
	}

	public String getParking() {
		return parking;
	}

	public void setParking(String parking) {
		this.parking = parking;
	}

	public String getRoute() {
		return route;
	}

	public void setRoute(String route) {
		this.route = route;
	}

	public String getPublic_transport() {
		return public_transport;
	}

	public void setPublic_transport(String public_transport) {
		this.public_transport = public_transport;
	}

	public String getTicket_office() {
		return ticket_office;
	}

	public void setTicket_office(String ticket_office) {
		this.ticket_office = ticket_office;
	}

	public String getPromotion() {
		return promotion;
	}

	public void setPromotion(String promotion) {
		this.promotion = promotion;
	}

	public String getWheelchair() {
		return wheelchair;
	}

	public void setWheelchair(String wheelchair) {
		this.wheelchair = wheelchair;
	}

	public String getExit() {
		return exit;
	}

	public void setExit(String exit) {
		this.exit = exit;
	}

	public String getElevator() {
		return elevator;
	}

	public void setElevator(String elevator) {
		this.elevator = elevator;
	}

	public String getRestroom() {
		return restroom;
	}

	public void setRestroom(String restroom) {
		this.restroom = restroom;
	}

	public String getAuditorium() {
		return auditorium;
	}

	public void setAuditorium(String auditorium) {
		this.auditorium = auditorium;
	}

	public String getRoom() {
		return room;
	}

	public void setRoom(String room) {
		this.room = room;
	}

	public String getHandicap_etc() {
		return handicap_etc;
	}

	public void setHandicap_etc(String handicap_etc) {
		this.handicap_etc = handicap_etc;
	}

	public String getBraileblock() {
		return braileblock;
	}

	public void setBraileblock(String braileblock) {
		this.braileblock = braileblock;
	}

	public String getHelpdog() {
		return helpdog;
	}

	public void setHelpdog(String helpdog) {
		this.helpdog = helpdog;
	}

	public String getGuide_human() {
		return guide_human;
	}

	public void setGuide_human(String guide_human) {
		this.guide_human = guide_human;
	}

	public String getGuide_audio() {
		return guide_audio;
	}

	public void setGuide_audio(String guide_audio) {
		this.guide_audio = guide_audio;
	}

	public String getBigprint() {
		return bigprint;
	}

	public void setBigprint(String bigprint) {
		this.bigprint = bigprint;
	}

	public String getBrailepromotion() {
		return brailepromotion;
	}

	public void setBrailepromotion(String brailepromotion) {
		this.brailepromotion = brailepromotion;
	}

	public String getGuidesystem() {
		return guidesystem;
	}

	public void setGuidesystem(String guidesystem) {
		this.guidesystem = guidesystem;
	}

	public String getBlindhandicap_etc() {
		return blindhandicap_etc;
	}

	public void setBlindhandicap_etc(String blindhandicap_etc) {
		this.blindhandicap_etc = blindhandicap_etc;
	}

	public String getGuide_sign() {
		return guide_sign;
	}

	public void setGuide_sign(String guide_sign) {
		this.guide_sign = guide_sign;
	}

	public String getGuide_video() {
		return guide_video;
	}

	public void setGuide_video(String guide_video) {
		this.guide_video = guide_video;
	}

	public String getHearingroom() {
		return hearingroom;
	}

	public void setHearingroom(String hearingroom) {
		this.hearingroom = hearingroom;
	}

	public String getHearinghandicapetc() {
		return hearinghandicapetc;
	}

	public void setHearinghandicapetc(String hearinghandicapetc) {
		this.hearinghandicapetc = hearinghandicapetc;
	}

	public String getStroller() {
		return stroller;
	}

	public void setStroller(String stroller) {
		this.stroller = stroller;
	}

	public String getLactationroom() {
		return lactationroom;
	}

	public void setLactationroom(String lactationroom) {
		this.lactationroom = lactationroom;
	}

	public String getBabysparechair() {
		return babysparechair;
	}

	public void setBabysparechair(String babysparechair) {
		this.babysparechair = babysparechair;
	}

	public String getInfantsfamily_etc() {
		return infantsfamily_etc;
	}

	public void setInfantsfamily_etc(String infantsfamily_etc) {
		this.infantsfamily_etc = infantsfamily_etc;
	}

}
