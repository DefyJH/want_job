package travelDB.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import travelDB.dto.DisabilityInfoDTO;
import travelDB.util.DBConnectionManager;

public class DisabilityInfoDAO {

	Connection conn;
	PreparedStatement psmt;
	ResultSet rs;
	
	public DisabilityInfoDTO findDisabilityInfoByContentId(int contentId) {

		DisabilityInfoDTO di = null;

		try {
			conn = DBConnectionManager.connectDB();

			String query = " SELECT * FROM DISABILITY_ACCOMMODATION_INFO WHERE contentid = ? ";
			
			psmt = conn.prepareStatement(query);
			psmt.setInt(1, contentId);

			rs = psmt.executeQuery(); // 쿼리 DB전달 실행

			while (rs.next()) { // 더이상 가져올 데이터가 없을때까지~
				
				di = new DisabilityInfoDTO(
							rs.getInt("contentid"),
							
							//지체장애
							rs.getString("parking"),
							rs.getString("route"),
							rs.getString("public_transport"),
							rs.getString("ticket_office"),
							rs.getString("promotion"),
							rs.getString("wheelchair"),
							rs.getString("exit"),
							rs.getString("elevator"),
							rs.getString("restroom"),
							rs.getString("auditorium"),
							rs.getString("room"),
							rs.getString("handicap_etc"),
							
							//시각장애
							rs.getString("braileblock"),
							rs.getString("helpdog"),
							rs.getString("guide_human"),
							rs.getString("guide_audio"),
							rs.getString("bigprint"),
							rs.getString("brailepromotion"),
							rs.getString("guidesystem"),
							rs.getString("blindhandicap_etc"),
							
							//청각장애
							rs.getString("guide_sign"),
							rs.getString("guide_video"),
							rs.getString("hearingroom"),
							rs.getString("hearinghandicapetc"),
							
							//영유아가족
							rs.getString("stroller"),
							rs.getString("lactationroom"),
							rs.getString("babysparechair"),
							rs.getString("infantsfamily_etc"));
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBConnectionManager.disconnectDB(conn, psmt, rs);	//conn psmt rs
		}

		return di;

	}

}
