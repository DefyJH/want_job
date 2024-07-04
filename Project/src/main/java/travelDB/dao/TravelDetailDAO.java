package travelDB.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import travelDB.dto.TravelDestinationDTO;
import travelDB.dto.TravelDetailDTO;
import travelDB.util.DBConnectionManager;

public class TravelDetailDAO {
	Connection conn;
	PreparedStatement psmt;
	ResultSet rs;
	
	public TravelDetailDTO findTravelDetailByContentId(int contentId) {

		TravelDetailDTO td = null;

		try {
			conn = DBConnectionManager.connectDB();

			String query = " SELECT * FROM TRAVEL_DETAIL WHERE contentid = ? ";
			
			psmt = conn.prepareStatement(query);
			psmt.setInt(1, contentId);

			rs = psmt.executeQuery(); // 쿼리 DB전달 실행

			while (rs.next()) { // 더이상 가져올 데이터가 없을때까지~
				
				td = new TravelDetailDTO(
							rs.getInt("contentid"),
							rs.getString("homepage"),
							rs.getString("overview"));
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBConnectionManager.disconnectDB(conn, psmt, rs);	//conn psmt rs
		}

		return td;

	}

}
