package userDB.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import userDB.util.DBConnectionManager;

public class loginDAO {

    Connection conn = null;
    PreparedStatement psmt = null;
    ResultSet rs = null;

    public String[] loginMove(String user_id, String user_pw) {
        conn = DBConnectionManager.connectDB();

        String query = "SELECT user_nickname, user_code FROM user_data WHERE user_id = ? AND user_pw = ?";

        try {
            psmt = conn.prepareStatement(query);
            psmt.setString(1, user_id);
            psmt.setString(2, user_pw);

            rs = psmt.executeQuery();

            if (rs.next()) {
                String[] userInfo = new String[2];
                userInfo[0] = rs.getString("user_nickname");
                userInfo[1] = Integer.toString(rs.getInt("user_code"));
                return userInfo; // 로그인 성공 시 닉네임과 코드 반환
            } else {
                return null; // 로그인 실패 시 null 반환
            }
        } catch (SQLException e) {
            e.printStackTrace();
            return null; // 오류 발생 시 null 반환
        } finally {
            DBConnectionManager.disconnectDB(conn, psmt, rs);
        }
    }
}