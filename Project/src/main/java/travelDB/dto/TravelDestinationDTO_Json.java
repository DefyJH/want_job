package travelDB.dto;

public class TravelDestinationDTO_Json {

	String title;	//이름
	double mapX;	//맵X축
	double mapY;	//맵Y축
	
	public TravelDestinationDTO_Json() {}
	
	public TravelDestinationDTO_Json(String title, double mapX, double mapY) {
		super();
		this.title = title;
		this.mapX = mapX;
		this.mapY = mapY;
	}
	
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public double getMapX() {
		return mapX;
	}
	public void setMapX(double mapX) {
		this.mapX = mapX;
	}
	public double getMapY() {
		return mapY;
	}
	public void setMapY(double mapY) {
		this.mapY = mapY;
	}
	
	
}
