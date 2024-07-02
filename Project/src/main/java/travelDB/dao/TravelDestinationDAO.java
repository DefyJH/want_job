package travelDB.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import travelDB.dto.LocalCodeDTO;
import travelDB.dto.TravelDestinationDTO;
import travelDB.util.DBConnectionManager;

public class TravelDestinationDAO {

	Connection conn;
	PreparedStatement psmt;
	ResultSet rs;

	public TravelDestinationDAO() {
		this.conn = null;
		this.psmt = null;
		this.rs = null;
	}

	public int saveTravleDestination (String addr1, String addr2, int areacode, int contentid, int contenttypeid, String firstimage,
			String firstimage2, String mapX, String mapY, String mlevel, int sigungucode, String tel, String title) {
		
		int result = 0;

		try {
			conn = DBConnectionManager.connectDB();
			
			String query = " INSERT INTO travel_destination VALUES ( ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ? )";

			psmt = conn.prepareStatement(query);

			psmt.setString(1, addr1);
			psmt.setString(2, addr2);
			psmt.setInt(3, areacode);
			psmt.setInt(4, contentid);
			psmt.setInt(5, contenttypeid);
			psmt.setString(6, firstimage);
			psmt.setString(7, firstimage2);
			psmt.setString(8, mapX);
			psmt.setString(9, mapY);
			psmt.setString(10, mlevel);
			psmt.setInt(11, sigungucode);
			psmt.setString(12, tel);
			psmt.setString(13, title);
			
			result = psmt.executeUpdate();	//쿼리 DB전달 실행

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnectionManager.disconnectDB(conn, psmt, null);
		}

		return result;
	}
	
	public int saveTravleDestination(ArrayList<TravelDestinationDTO> list) {
		
		int result = 0;

		try {
			conn = DBConnectionManager.connectDB();
			
			String query = " INSERT INTO travel_destination VALUES ( ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?  )";

			psmt = conn.prepareStatement(query);

			for(int i=0; i < list.size(); i++) {
				psmt.setString(1, list.get(i).getAddr1());
				psmt.setString(2, list.get(i).getAddr2());
				psmt.setInt(3, list.get(i).getAreacode());
				psmt.setInt(4, list.get(i).getContentid());
				psmt.setInt(5, list.get(i).getContenttypeid());
				psmt.setString(6, list.get(i).getFirstimage());
				psmt.setString(7, list.get(i).getSecondimage());
				psmt.setString(8, list.get(i).getMapX());
				psmt.setString(9, list.get(i).getMapY());
				psmt.setString(10, list.get(i).getMlevel());
				psmt.setInt(11, list.get(i).getSigungucode());
				psmt.setString(12, list.get(i).getTel());
				psmt.setString(13, list.get(i).getTitle());
				
				result = psmt.executeUpdate();	//쿼리 DB전달 실행
			}

			System.out.println("정상적으로 완료");
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBConnectionManager.disconnectDB(conn, psmt, null);
		}

		return result;
	}
	
	public List<TravelDestinationDTO> findTravelDestinationByAreacode(int areaCode) {

		List<TravelDestinationDTO> tdList = null;

		try {
			conn = DBConnectionManager.connectDB();
			
			String query = " SELECT * FROM travel_destination "
					+ " WHERE areaCode = ?"
					+ " AND contentid IN (SELECT contentid FROM TRAVEL_DETAIL) "
					+ " AND contentid IN (SELECT contentid FROM DISABILITY_ACCOMMODATION_INFO) ";
			
			psmt = conn.prepareStatement(query);
			psmt.setInt(1, areaCode);

			rs = psmt.executeQuery(); // 쿼리 DB전달 실행

			while (rs.next()) { // 더이상 가져올 데이터가 없을때까지~
				
				if(tdList == null)
					tdList = new ArrayList<TravelDestinationDTO>();
				
				TravelDestinationDTO td = new TravelDestinationDTO(
							rs.getString("addr1"),
							rs.getString("addr2"),
							rs.getInt("areacode"),
							rs.getInt("contentid"),
							rs.getInt("contenttypeid"),
							rs.getString("firstimage"),
							rs.getString("secondimage"),
							rs.getString("mapX"),
							rs.getString("mapY"),
							rs.getString("mlevel"),
							rs.getInt("sigungucode"),
							rs.getString("tel"),
							rs.getString("title"));
				
				tdList.add(td);
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBConnectionManager.disconnectDB(conn, psmt, rs);	//conn psmt rs
		}

		return tdList;

	}
	
	
	public List<TravelDestinationDTO> findOtherTravelDestination(int areaCode, int sigungucode, int contentid) {

		List<TravelDestinationDTO> otdList = null;

		try {
			conn = DBConnectionManager.connectDB();

			String query = " SELECT * FROM travel_destination "
							+ " WHERE areacode = ? AND sigungucode = ?  AND NOT contentid = ?  AND contentId IN (SELECT contentid FROM travel_detail WHERE overview IS NOT NULL) ";
			
			psmt = conn.prepareStatement(query);
			psmt.setInt(1, areaCode);
			psmt.setInt(2, sigungucode);
			psmt.setInt(3, contentid);

			rs = psmt.executeQuery(); // 쿼리 DB전달 실행

			while (rs.next()) { // 더이상 가져올 데이터가 없을때까지~
				
				if(otdList == null)
					otdList = new ArrayList<TravelDestinationDTO>();
				
				TravelDestinationDTO td = new TravelDestinationDTO(
							rs.getString("addr1"),
							rs.getString("addr2"),
							rs.getInt("areacode"),
							rs.getInt("contentid"),
							rs.getInt("contenttypeid"),
							rs.getString("firstimage"),
							rs.getString("secondimage"),
							rs.getString("mapX"),
							rs.getString("mapY"),
							rs.getString("mlevel"),
							rs.getInt("sigungucode"),
							rs.getString("tel"),
							rs.getString("title"));
				
				otdList.add(td);
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBConnectionManager.disconnectDB(conn, psmt, rs);	//conn psmt rs
		}

		return otdList;

	}

	public TravelDestinationDTO findTravelDestinationByContentId(int contentId) {

		TravelDestinationDTO td = null;

		try {
			conn = DBConnectionManager.connectDB();

			String query = " SELECT * FROM travel_destination "
							+ " WHERE contentid = ? ";
			
			psmt = conn.prepareStatement(query);
			psmt.setInt(1, contentId);

			rs = psmt.executeQuery(); // 쿼리 DB전달 실행

			while (rs.next()) { // 더이상 가져올 데이터가 없을때까지~
				
				td = new TravelDestinationDTO(
							rs.getString("addr1"),
							rs.getString("addr2"),
							rs.getInt("areacode"),
							rs.getInt("contentid"),
							rs.getInt("contenttypeid"),
							rs.getString("firstimage"),
							rs.getString("secondimage"),
							rs.getString("mapX"),
							rs.getString("mapY"),
							rs.getString("mlevel"),
							rs.getInt("sigungucode"),
							rs.getString("tel"),
							rs.getString("title"));
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBConnectionManager.disconnectDB(conn, psmt, rs);	//conn psmt rs
		}

		return td;

	}

	public List<TravelDestinationDTO> getTravelDestinationList() {

		List<TravelDestinationDTO> tdList = null;

		try {
			conn = DBConnectionManager.connectDB();
			
			String query = " SELECT * FROM travel_destination "
					+ " WHERE contentid IN (SELECT contentid FROM TRAVEL_DETAIL) "
					+ " AND contentid IN (SELECT contentid FROM DISABILITY_ACCOMMODATION_INFO) ";

			psmt = conn.prepareStatement(query);

			rs = psmt.executeQuery(); // 쿼리 DB전달 실행

			while (rs.next()) { // 더이상 가져올 데이터가 없을때까지~
				
				if(tdList == null)
					tdList = new ArrayList<TravelDestinationDTO>();
				
				TravelDestinationDTO td = new TravelDestinationDTO(
							rs.getString("addr1"),
							rs.getString("addr2"),
							rs.getInt("areacode"),
							rs.getInt("contentid"),
							rs.getInt("contenttypeid"),
							rs.getString("firstimage"),
							rs.getString("secondimage"),
							rs.getString("mapX"),
							rs.getString("mapY"),
							rs.getString("mlevel"),
							rs.getInt("sigungucode"),
							rs.getString("tel"),
							rs.getString("title"));
				
				tdList.add(td);
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBConnectionManager.disconnectDB(conn, psmt, rs);	//conn psmt rs
		}

		return tdList;

	}

}
