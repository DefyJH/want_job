package travelDB.dto;

public class LocalCodeDTO {
	int code;
	String name;
	String mapX;	//맵X축
	String mapY;	//맵Y축
	int mLevel;	//맵레벨
	
	public LocalCodeDTO() {}
	
	public LocalCodeDTO(int code, String name) {
		super();
		this.code = code;
		this.name = name;
		this.mapX = null;
		this.mapY = null;
		this.mLevel = 10;
	}

	
	public LocalCodeDTO(int code, String name, String mapX, String mapY, int mLevel) {
		super();
		this.code = code;
		this.name = name;
		this.mapX = mapX;
		this.mapY = mapY;
		this.mLevel = mLevel;
	}

	public int getCode() {
		return code;
	}

	public void setCode(int code) {
		this.code = code;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
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
	
	public int getMLevel() {
		return mLevel;
	}

	public void setMLevel(int mLevel) {
		this.mLevel = mLevel;
	}
}
