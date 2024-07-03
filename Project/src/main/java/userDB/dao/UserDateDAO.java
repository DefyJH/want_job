package userDB.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import travelDB.dto.LocalCodeDTO;
import travelDB.util.ConvertDateUtil;
import travelDB.util.DBConnectionManager;
import userDB.dto.UserDateDTO;

public class UserDateDAO {

	Connection conn;
	PreparedStatement psmt;
	ResultSet rs;

	public List<UserDateDTO> getUserDataList() {

		List<UserDateDTO> suList = null;

		try {
			conn = DBConnectionManager.connectDB();

			String query = " SELECT * FROM user_info "
					+ " WHERE user_status = 1 ";

			psmt = conn.prepareStatement(query);

			rs = psmt.executeQuery(); // 쿼리 DB전달 실행

			while (rs.next()) { // 더이상 가져올 데이터가 없을때까지~

				if(suList == null)
					suList = new ArrayList<UserDateDTO>();

				UserDateDTO su = new UserDateDTO();

				su.setUser_code(rs.getInt("user_code"));
				su.setUser_id(rs.getString("user_id"));
				su.setUser_pw(rs.getString("user_pw"));
				su.setUser_nickname(rs.getString("user_nickname"));
				su.setUser_name(rs.getString("user_name"));
				su.setUser_regno(rs.getString("user_regno"));
				su.setUser_tel(rs.getString("user_tel"));
				su.setUser_email(rs.getString("user_email"));
				su.setUser_address(rs.getString("user_address"));
				su.setUser_signdate(ConvertDateUtil.convertTimestampToLocalDateTime(rs.getTimestamp("user_signdate")));
				su.setUser_status(rs.getString("user_status"));

				suList.add(su);
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBConnectionManager.disconnectDB(conn, psmt, rs);	//conn psmt rs
		}

		return suList;

	}

	public UserDateDTO findUserDataByUserCode(int user_code) {

		UserDateDTO ui = null;

		try {
			conn = DBConnectionManager.connectDB();

			String query = " SELECT * FROM user_info "
					+ " WHERE user_code = ? ";
			
			psmt = conn.prepareStatement(query);
			
			psmt.setInt(1, user_code);
			
			rs = psmt.executeQuery(); // 쿼리 DB전달 실행

			while (rs.next()) { // 더이상 가져올 데이터가 없을때까지~

				ui = new UserDateDTO(rs.getInt("user_code"),
						rs.getString("user_id"),
						rs.getString("user_pw"),
						rs.getString("user_nickname"),
						rs.getString("user_name"),
						rs.getString("user_regno"),
						rs.getString("user_tel"),
						rs.getString("user_email"),
						rs.getString("user_address"),
						ConvertDateUtil.convertTimestampToLocalDateTime(rs.getTimestamp("user_signdate")),
						rs.getString("user_status")
						);
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBConnectionManager.disconnectDB(conn, psmt, rs);	//conn psmt rs
		}

		return ui;

	}

	
	public int updateUserInfo(String user_nickname, String user_name, String user_tel, String user_email,
			String user_address, String user_pw, int user_code) {

		int result = 0;

		try {
			conn = DBConnectionManager.connectDB();

			String query = " UPDATE user_info "
					+ " SET user_nickname = ?, "
					+ " user_name = ?, "
					+ " user_tel = ?, "
					+ " user_email = ?, "
					+ " user_address = ?, "
					+ " user_pw = ? "
					+ " WHERE user_code = ? ";

			psmt = conn.prepareStatement(query);
			
			long uCode = (long)user_code;
			
			psmt.setString(1, user_nickname);
			psmt.setString(2, user_name);
			psmt.setString(3, user_tel);
			psmt.setString(4, user_email);
			psmt.setString(5, user_address);
			psmt.setString(6, user_pw);
			psmt.setInt(7, user_code);

			result = psmt.executeUpdate();	//쿼리 DB전달 실행
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnectionManager.disconnectDB(conn, psmt, null);
		}

		return result;
	}

	public int updateUserStatus(int user_code) {

		int result = 0;

		try {
			conn = DBConnectionManager.connectDB();

			String query = " UPDATE user_info "
					+ " SET user_status = 0 "
					+ " WHERE user_code = ? ";

			psmt = conn.prepareStatement(query);

			psmt.setInt(1, user_code);

			result = psmt.executeUpdate();	//쿼리 DB전달 실행

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnectionManager.disconnectDB(conn, psmt, null);
		}

		return result;
	}

}
