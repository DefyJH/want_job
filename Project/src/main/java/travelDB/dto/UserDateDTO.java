package travelDB.dto;

import java.time.LocalDateTime;

public class UserDateDTO {

	int user_code;
	String user_id;
	String user_pw;
	String user_nickname;
	String user_name;
	String user_regnos;
	String user_tel;
	String user_email;
	String user_address;
	LocalDateTime user_signdate;
	String user_status;
	
	public UserDateDTO() {}
	
	public UserDateDTO(int user_code, String user_id, String user_pw, String user_nickname, String user_name,
			String user_regnos, String user_tel, String user_email, String user_address, LocalDateTime user_signdate,
			String user_status) {
		super();
		this.user_code = user_code;
		this.user_id = user_id;
		this.user_pw = user_pw;
		this.user_nickname = user_nickname;
		this.user_name = user_name;
		this.user_regnos = user_regnos;
		this.user_tel = user_tel;
		this.user_email = user_email;
		this.user_address = user_address;
		this.user_signdate = user_signdate;
		this.user_status = user_status;
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

	public String getUser_nickname() {
		return user_nickname;
	}

	public void setUser_nickname(String user_nickname) {
		this.user_nickname = user_nickname;
	}

	public String getUser_name() {
		return user_name;
	}

	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}

	public String getUser_regnos() {
		return user_regnos;
	}

	public void setUser_regno(String user_regnos) {
		this.user_regnos = user_regnos;
	}

	public String getUser_tel() {
		return user_tel;
	}

	public void setUser_tel(String user_tel) {
		this.user_tel = user_tel;
	}

	public String getUser_email() {
		return user_email;
	}

	public void setUser_email(String user_email) {
		this.user_email = user_email;
	}

	public String getUser_address() {
		return user_address;
	}

	public void setUser_address(String user_address) {
		this.user_address = user_address;
	}

	public LocalDateTime getUser_signdate() {
		return user_signdate;
	}

	public void setUser_signdate(LocalDateTime user_signdate) {
		this.user_signdate = user_signdate;
	}

	public String getUser_status() {
		return user_status;
	}

	public void setUser_status(String user_status) {
		this.user_status = user_status;
	}
	
}
