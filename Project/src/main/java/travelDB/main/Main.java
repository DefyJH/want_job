package travelDB.main;

import java.util.List;

import travelDB.dao.ContentTypeDAO;
import travelDB.dao.LocalCodeDAO;
import travelDB.dao.TravelDestinationDAO;
import travelDB.dao.TravelDetailDAO;
import travelDB.dto.ContentTypeDTO;
import travelDB.dto.LocalCodeDTO;
import travelDB.dto.TravelDestinationDTO;
import travelDB.dto.TravelDetailDTO;
import travelDB.util.ConvertDateUtil;
import userDB.dao.ReviewDAO;
import userDB.dao.UserDateDAO;
import userDB.dto.ReviewDTO;
import userDB.dto.UserDateDTO;

public class Main {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		LocalCodeDAO localDAO = new LocalCodeDAO();
		
		System.out.println("localList");
		List<LocalCodeDTO> localList = localDAO.getLocalCodeList();
		
		for(LocalCodeDTO lc : localList) {
			System.out.println(lc.getCode() + " " + lc.getName());
		}
		
		
		TravelDestinationDAO tdDAO = new TravelDestinationDAO();
		
		System.out.println("tdDAO.findTravelDestinationByAreacode(1)");
		List<TravelDestinationDTO> tdList = tdDAO.findTravelDestinationByAreacode(1);
		for(int i=0; i<10; i++) {
			System.out.println(tdList.get(i).getAreacode() + " " + tdList.get(i).getTitle());
		}
		
		System.out.println("getTravelDestinationList()");
		List<TravelDestinationDTO> tdList2 = tdDAO.getTravelDestinationList();
		for(int i=0; i<10; i++) {
			System.out.println(tdList.get(i).getAreacode() + " " + tdList.get(i).getTitle());
		}
		
		
		ContentTypeDAO ctDAO = new ContentTypeDAO();
		
		List<ContentTypeDTO> ctList = ctDAO.getContentTypeList();
		
		System.out.println("findContentTypeList()");
		
		for(int i=0; i<ctList.size(); i++) {
			System.out.println(ctList.get(i).getType_code() + " " + ctList.get(i).getType_name());
		}
		
		
		TravelDestinationDTO td = tdDAO.findTravelDestinationByContentId(970636);

		List<TravelDestinationDTO> otdList = tdDAO.findOtherTravelDestination(td.getAreacode(), td.getContenttypeid(),
				td.getSigungucode());
		
		System.out.println("findOtherTravelDestination");
		for(TravelDestinationDTO tdl : otdList) {
			System.out.println(tdl.getAreacode()+ " " + tdl.getTitle());
		}
		
		TravelDetailDAO tddDAO = new TravelDetailDAO();
		
		System.out.println("findTravelDetailByContentId");
		TravelDetailDTO tdd = tddDAO.findTravelDetailByContentId(1390147);
		System.out.println(tdd.getContentid() + " " + tdd.getHomepage());
		
		
		ReviewDAO reviewDAO = new ReviewDAO();
		List<ReviewDTO> reviewList = reviewDAO.findReviewByContenId(1390147);
		
		System.out.println("findReviewByContenId");
		for(ReviewDTO rv : reviewList) {
			System.out.println(rv.getReview_code() + " " + rv.getReview_text() + " " + ConvertDateUtil.convertLocalDateTimeToString4(rv.getReview_date()));
		}
		
		UserDateDAO uDAO = new UserDateDAO();
		List<UserDateDTO> uList = uDAO.getUserDataList();
		
		System.out.println("getUserDataList()");
		for(UserDateDTO u : uList) {
			System.out.println(u.getUser_code() + " " + u.getUser_nickname() + " " + ConvertDateUtil.convertLocalDateTimeToString4(u.getUser_signdate()));
		}
		
	}

}
