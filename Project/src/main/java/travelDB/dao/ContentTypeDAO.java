package travelDB.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import travelDB.dto.ContentTypeDTO;
import travelDB.util.DBConnectionManager;

public class ContentTypeDAO {
	
	Connection conn;
	PreparedStatement psmt;
	ResultSet rs;
	
	public List<ContentTypeDTO> getContentTypeList() {

		List<ContentTypeDTO> ctList = null;

		try {
			conn = DBConnectionManager.connectDB();

			String query = " SELECT * FROM content_type ";
			
			psmt = conn.prepareStatement(query);

			rs = psmt.executeQuery(); // 쿼리 DB전달 실행

			while (rs.next()) { // 더이상 가져올 데이터가 없을때까지~
				
				if(ctList == null)
					ctList = new ArrayList<ContentTypeDTO>();
				
				ContentTypeDTO ct = new ContentTypeDTO(
							rs.getInt("type_code"),
							rs.getString("type_name"));
				
				ctList.add(ct);
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBConnectionManager.disconnectDB(conn, psmt, rs);	//conn psmt rs
		}

		return ctList;

	}

}