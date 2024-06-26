package travelDB.dto;

public class TravelDestinationDTO {

	String addr1;	//주소
	String addr2;	//상세주소
	int areacode;	//지역코드
	int contentid;	//콘텐츠ID
	int contenttypeid;	//콘텐츠타입
	String firstimage;	//이미지1
	String firstimage2;	//이미지2
	String mapX;	//맵X축
	String mapY;	//맵Y축
	String mlevel;		//맵레벨?
	int sigungucode;	//시군구 코드
	String tel;	//전화번호
	String title;	//여행지 이름

	//	String addr1;	//주소
	//	String addr2;	//상세주소
	//	String areacode;	//지역코드
	//	String contentid;	//콘텐츠ID
	//	String contenttypeid;	//콘텐츠타입
	//	String firstimage;	//이미지1
	//	String firstimage2;	//이미지2
	//	String mapX;	//맵X축
	//	String mapY;	//맵Y축
	//	String mlevel;		//맵레벨?
	//	String sigungucode;	//시군구 코드
	//	String tel;	//전화번호
	//	String title;	//여행지 이름

	public TravelDestinationDTO() {}

	public TravelDestinationDTO(String addr1, String addr2, int areacode, int contentid, int contenttypeid, String firstimage,
			String firstimage2, String mapX, String mapY, String mlevel, int sigungucode, String tel, String title) {
		super();
		this.addr1 = addr1;
		this.addr2 = addr2;
		this.areacode = areacode;
		this.contentid = contentid;
		this.contenttypeid = contenttypeid;
		this.firstimage = firstimage;
		this.firstimage2 = firstimage2;
		this.mapX = mapX;
		this.mapY = mapY;
		this.mlevel = mlevel;
		this.sigungucode = sigungucode;
		this.tel = tel;
		this.title = title;
	}

	public String getAddr1() {
		return addr1;
	}

	public void setAddr1(String addr1) {
		this.addr1 = addr1;
	}

	public String getAddr2() {
		return addr2;
	}

	public void setAddr2(String addr2) {
		this.addr2 = addr2;
	}

	public int getAreacode() {
		return areacode;
	}

	public void setAreacode(int areacode) {
		this.areacode = areacode;
	}

	public int getContentid() {
		return contentid;
	}

	public void setContentid(int contentid) {
		this.contentid = contentid;
	}

	public int getContenttypeid() {
		return contenttypeid;
	}

	public void setContenttypeid(int contenttypeid) {
		this.contenttypeid = contenttypeid;
	}

	public String getFirstimage() {
		return firstimage;
	}

	public void setFirstimage(String firstimage) {
		this.firstimage = firstimage;
	}

	public String getFirstimage2() {
		return firstimage2;
	}

	public void setFirstimage2(String firstimage2) {
		this.firstimage2 = firstimage2;
	}

	public String getMapX() {
		return mapX;
	}

	public void setMapX(String mapX) {
		this.mapX = mapX;
	}

	public String getMapY() {
		return mapY;
	}

	public void setMapY(String mapY) {
		this.mapY = mapY;
	}

	public String getMlevel() {
		return mlevel;
	}

	public void setMlevel(String mlevel) {
		this.mlevel = mlevel;
	}

	public int getSigungucode() {
		return sigungucode;
	}

	public void setSigungucode(int sigungucode) {
		this.sigungucode = sigungucode;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}




}
