package userDB.dto;

public class loginDTO {

	int user_code;
	String user_id;
	String user_pw;
	
	
	public loginDTO() {
		super();
	}
	

	public loginDTO(String user_id, String user_pw) {
		super();
		this.user_id = user_id;
		this.user_pw = user_pw;
	}




	public loginDTO(int user_code, String user_id, String user_pw) {
		super();
		this.user_code = user_code;
		this.user_id = user_id;
		this.user_pw = user_pw;
	}


	public int getUser_code() {
		return user_code;
	}


	public void setUser_code(int user_code) {
		this.user_code = user_code;
	}


	public String getUser_id() {
		return user_id;
	}


	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}


	public String getUser_pw() {
		return user_pw;
	}


	public void setUser_pw(String user_pw) {
		this.user_pw = user_pw;
	}
	
	
	
}
