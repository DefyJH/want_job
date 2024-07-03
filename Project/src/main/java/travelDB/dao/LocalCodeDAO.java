package travelDB.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import travelDB.dto.LocalCodeDTO;
import travelDB.util.DBConnectionManager;

public class LocalCodeDAO {

	Connection conn;
	PreparedStatement psmt;
	ResultSet rs;

	public LocalCodeDAO() {
		this.conn = null;
		this.psmt = null;
		this.rs = null;
	}

	public int saveLocalCode(int code, String name) {
		
		int result = 0;

		try {
			conn = DBConnectionManager.connectDB();
			
			String query = " INSERT INTO local VALUES ( ?, ?, ?  )";

			psmt = conn.prepareStatement(query);
			
			psmt.setInt(1, code);
			psmt.setString(2, name);

			result = psmt.executeUpdate();	//쿼리 DB전달 실행

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnectionManager.disconnectDB(conn, psmt, null);
		}

		return result;
	}
	
	   public List<LocalCodeDTO> getLocalCodeList() {

      List<LocalCodeDTO> localList = null;

      try {
         conn = DBConnectionManager.connectDB();

         String query = " SELECT * FROM local ";

         psmt = conn.prepareStatement(query);

         rs = psmt.executeQuery(); // 쿼리 DB전달 실행

         while (rs.next()) { // 더이상 가져올 데이터가 없을때까지~

            if (localList == null)
               localList = new ArrayList<LocalCodeDTO>();

            LocalCodeDTO localCode = new LocalCodeDTO(rs.getInt("local_code"), rs.getString("local_name"),
                  rs.getString("mapX"), rs.getString("mapY"), rs.getInt("mlevel"));

            localList.add(localCode);
         }

      } catch (SQLException e) {
         // TODO Auto-generated catch block
         e.printStackTrace();
      } finally {
         DBConnectionManager.disconnectDB(conn, psmt, rs); // conn psmt rs
      }

      return localList;

   }

   public LocalCodeDTO getLocalCode(int areaCode) {

      LocalCodeDTO local = null;

      try {
         conn = DBConnectionManager.connectDB();

         String query = " SELECT * FROM local where local_code = ? ";

         psmt = conn.prepareStatement(query);
         psmt.setInt(1, areaCode);
         
         rs = psmt.executeQuery(); // 쿼리 DB전달 실행

         while (rs.next()) { // 더이상 가져올 데이터가 없을때까지~

            local = new LocalCodeDTO(rs.getInt("local_code"), rs.getString("local_name"), rs.getString("mapX"),
                  rs.getString("mapY"), rs.getInt("mlevel"));
         }

      } catch (SQLException e) {
         // TODO Auto-generated catch block
         e.printStackTrace();
      } finally {
         DBConnectionManager.disconnectDB(conn, psmt, rs); // conn psmt rs
      }

      return local;
   }
}
