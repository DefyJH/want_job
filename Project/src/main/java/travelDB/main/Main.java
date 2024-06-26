package travelDB.main;

import java.util.List;

import travelDB.dao.LocalCodeDAO;
import travelDB.dao.TravelDestinationDAO;
import travelDB.dto.LocalCodeDTO;
import travelDB.dto.TravelDestinationDTO;

public class Main {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		LocalCodeDAO localDAO = new LocalCodeDAO();
		
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
		
	}

}
