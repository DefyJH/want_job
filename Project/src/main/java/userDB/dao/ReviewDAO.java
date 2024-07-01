package userDB.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import travelDB.util.ConvertDateUtil;
import travelDB.util.DBConnectionManager;
import userDB.dto.ReviewDTO;

public class ReviewDAO {
	
	Connection conn;
	PreparedStatement psmt;
	ResultSet rs;

	public int saveReview(int user_code, int contents_id, String review_text, String review_image, int review_rating) {
		
		int result = 0;

		try {
			conn = DBConnectionManager.connectDB();
			
			String query = " INSERT INTO REVIEW " +
						" VALUES(review_seq.NEXTVAL, ?, ?, ?, ?, ?, sysdate) ";

			psmt = conn.prepareStatement(query);
			
			psmt.setInt(1, user_code);
			psmt.setInt(2, contents_id);
			psmt.setString(3, review_text);
			psmt.setString(4, review_image);
			psmt.setInt(5, review_rating);

			result = psmt.executeUpdate();	//쿼리 DB전달 실행

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBConnectionManager.disconnectDB(conn, psmt, null);
		}

		return result;
	}

	
	public List<ReviewDTO> findReviewByContenId(int contents_id) {

		List<ReviewDTO> reviewList = null;

		try {
			conn = DBConnectionManager.connectDB();

			String query = " SELECT * FROM review "
					+ " WHERE contents_id = ? ";
			
			psmt = conn.prepareStatement(query);
			psmt.setInt(1, contents_id);

			rs = psmt.executeQuery(); // 쿼리 DB전달 실행

			while (rs.next()) { // 더이상 가져올 데이터가 없을때까지~
				
				if(reviewList == null)
					reviewList = new ArrayList<ReviewDTO>();
				
				ReviewDTO rv = new ReviewDTO();
				
				rv.setReview_code(rs.getInt("review_code"));
				rv.setUser_code(rs.getInt("user_code"));
				rv.setContents_id(rs.getInt("contents_id"));
				rv.setReview_text(rs.getString("review_text"));
				rv.setReview_image(rs.getString("review_image"));
				rv.setReview_rating(rs.getInt("review_rating"));
				rv.setReview_date(ConvertDateUtil.convertTimestampToLocalDateTime(rs.getTimestamp("review_date")));	
				
				reviewList.add(rv);
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			DBConnectionManager.disconnectDB(conn, psmt, rs);	//conn psmt rs
		}

		return reviewList;

	}

}
