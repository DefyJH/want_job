package travelDB.dto;

public class TravelDetailDTO {

	int contentid;	//콘텐츠ID
	String homepage; //홈페이지
	String overview; //상세정보
	
	public TravelDetailDTO() {}
	
	public TravelDetailDTO(int contentid, String homepage, String overview) {
		super();
		this.contentid = contentid;
		this.homepage = homepage;
		this.overview = overview;
	}

	public int getContentid() {
		return contentid;
	}

	public void setContentid(int contentid) {
		this.contentid = contentid;
	}

	public String getHomepage() {
		return homepage;
	}

	public void setHomepage(String homepage) {
		this.homepage = homepage;
	}

	public String getOverview() {
		return overview;
	}

	public void setOverview(String overview) {
		this.overview = overview;
	}
	
	
}
