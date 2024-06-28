package travelDB.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import travelDB.dto.LocalCodeDTO;
import travelDB.dto.UserDateDTO;
import travelDB.util.ConvertDateUtil;
import travelDB.util.DBConnectionManager;

public class UserDateDAO {

	Connection conn;
	PreparedStatement psmt;
	ResultSet rs;
	
	public List<UserDateDTO> getUserDataList() {

		List<UserDateDTO> suList = null;

		try {
			conn = DBConnectionManager.connectDB();

			String query = " SELECT * FROM USER_INFO ";
			
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


}
