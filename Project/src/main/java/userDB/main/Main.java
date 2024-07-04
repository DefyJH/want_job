package userDB.main;

import java.util.ArrayList;
import java.util.List;

import userDB.dao.ReviewDAO;
import userDB.dao.UserDateDAO;
import userDB.dto.ReviewDTO;
import userDB.dto.UserDateDTO;

public class Main {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
//   		UserDateDAO udDAO = new UserDateDAO();
   		
//   		int user_code = 1;
//   		String user_nickname = "테스트닉네임";
//   		String user_name = "테스트이름";
//   		String user_tel = "01000000000";
//   		String user_email = "temp1@naver.com";
//   		String user_address = "충청남도 천안시 동남구";
//   		String user_pw = "temp1";
//   		
//   		int result = udDAO.updateUserInfo(user_nickname, user_name, user_tel, user_email,
//   				user_address, user_pw, user_code);
//   		
//   		if(result > 0) {
//   			System.out.println("성공");
//   		}
   		
//   		UserDateDTO ud = udDAO.findUserDataByUserCode(1);
//   		
//   		System.out.println(ud.getUser_code() + " " + ud.getUser_name());
   		
//   		UserDateDAO uDAO = new UserDateDAO();
//   		UserDateDTO ud = uDAO.findOtherDataByUserCode(5);
//   		
//   		System.out.println(ud.getPhone_num() + " " + ud.getUser_birthdate() + " " + ud.getUser_gender());
		
		ReviewDAO reviewDAO = new ReviewDAO();
		List<ReviewDTO> reviewList = reviewDAO.findReviewByContenId(131988);
		
		List<Integer> rating = new ArrayList<Integer>();
		
		for(ReviewDTO rv : reviewList) {
			rating.add(rv.getReview_rating());
		}
		

	}

}
