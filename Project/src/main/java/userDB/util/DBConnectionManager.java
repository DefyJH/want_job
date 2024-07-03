package userDB.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class DBConnectionManager {

	// DB 연결
	public static Connection connectDB() {

		Connection conn = null;

		// 1. ojdbc8.jar DB연결용 라이브러리
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");

			// 2. DB Connection 연결정보
//			String dbUrl = "jdbc:oracle:thin:@localhost:1521:orcl";
//			String dbId = "scott";
//			String dbPw = "tiger";
			
	         String dbUrl = "jdbc:oracle:thin:@192.168.0.53:1521:orcl";
	         String dbId = "scott2";
	         String dbPw = "scott2";

			conn = DriverManager.getConnection(dbUrl, dbId, dbPw);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return conn;
	}

	// DB 연결 종료
	public static void disconnectDB(Connection conn, PreparedStatement psmt, ResultSet rs) {
		try {
			
			if(rs != null)
				rs.close();

			if(psmt != null)
				psmt.close();
			
			if (conn != null)
				conn.close();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

}
