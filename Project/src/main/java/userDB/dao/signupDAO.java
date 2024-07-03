package userDB.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import userDB.dto.signupDTO;
import userDB.util.DBConnectionManager;

public class signupDAO {

	public int saveUsers(signupDTO signup) {

		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		int result = 0;

		try {
			conn = DBConnectionManager.connectDB();
			
			String query = " INSERT INTO user_data "
					+ "(user_code, "
					+ "user_id , "
					+ "user_pw, "
					+ "user_nickname, "
					+ "user_name , "
					+ "user_regno, "
					+ "user_tel, "
					+ "user_email, "
					+ "user_address, "
					+ "user_signdate, "
					+ "user_status)"
					+ "VALUES "
					+ "( user_seq.NEXTVAL, "
					+ "?, ? ,? ,? ,? ,? ,? ,? "
					+ ",TRUNC(SYSDATE) "
					+ ",1 )";

			psmt = conn.prepareStatement(query);
			
			psmt.setString(1, signup.getUser_id() );
			psmt.setString(2, signup.getUser_pw() );
			psmt.setString(3, signup.getUser_nickname() );
			psmt.setString(4, signup.getUser_name() );
			psmt.setString(5, signup.getUser_regno() );
			psmt.setString(6, signup.getUser_tel() );
			psmt.setString(7, signup.getUser_email() );
			psmt.setString(8, signup.getUser_address() );
			
			//psmt.executeQuery -> return Resultset
			result = psmt.executeUpdate();	//쿼리 DB전달 실행

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBConnectionManager.disconnectDB(conn, psmt, null);
		}

		return result;
	}
	

}
	
/*
	public int confirmID(String userid) {
		
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		int result = -1;
		String sql = "select user_id from user_data where user_id = ?";
		
		try {
			
			conn = DBConnectionManager.connectDB();
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, userid);
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				
				result=1;
			
			}else {
			result=-1;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				DBConnectionManager.disconnectDB(conn, psmt, null);
			} catch(Exception e) {
				e.printStackTrace();
			}
		} return result; 
	}
	
}
*/
// 아이디가 있을때는 1 없을때는 -1을 전달