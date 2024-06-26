package travelDB.travel_destination;

import travelDB.dao.TravelDestinationDAO;
import travelDB.dto.TravelDestinationDTO;

import java.util.ArrayList;
import java.util.List;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject; // JSON객체 생성
import org.json.simple.parser.JSONParser; // JSON객체 파싱
//import org.json.simple.parser.ParseException; // 예외처리

public class JSONparse {

	public void parseJSON(String json) {
		
		try {
			// 
			TravelDestinationDAO travleDAO = new TravelDestinationDAO();
			ArrayList<TravelDestinationDTO> list = new ArrayList<TravelDestinationDTO>();
			
			// JSON 파싱 객체 생성
			JSONParser parser = new JSONParser();
			JSONObject jObject = (JSONObject)parser.parse(json);

			// JSON 구조에 따라서 파싱 다르게 적용 필요
			JSONObject parseResponse = (JSONObject)jObject.get("response");	   //reponse
            JSONObject parseBody = (JSONObject) parseResponse.get("body");	   //body			
            JSONObject parseItems = (JSONObject) parseBody.get("items");       //Items
			JSONArray jArray = (JSONArray)(parseItems.get("item"));            //Array
			
			// 배열의 모든 아이템을 출력합니다.
			for (int i = 0; i < jArray.size(); i++) {
				
				
				JSONObject obj = (JSONObject) jArray.get(i);
				
				String areacodeStr = (String)obj.get("areacode");
				String contentidStr = (String)obj.get("contentid");
				String contenttypeidStr = (String)obj.get("contenttypeid");
				String sigungucodeStr = (String)obj.get("sigungucode");

				if(areacodeStr.equals("") == false && sigungucodeStr.equals("") == false) {
					
					
					
		
					String addr1 = (String)obj.get("addr1");	//주소
					String addr2 = (String)obj.get("addr2");	//상세주소
					int areacode = Integer.parseInt(areacodeStr.trim());	//지역코드
					int contentid = Integer.parseInt(contentidStr.trim());	//콘텐츠ID
					int contenttypeid = Integer.parseInt(contenttypeidStr.trim());	//콘텐츠타입
					String firstimage = (String)obj.get("firstimage");	//이미지1
					String firstimage2 = (String)obj.get("firstimage2");	//이미지2
					String mapX = (String)obj.get("mapx");	//맵X축
					String mapY = (String)obj.get("mapy");	//맵Y축
					String mlevel = (String)obj.get("mlevel");		//맵레벨?
					int sigungucode = Integer.parseInt(sigungucodeStr.trim());	//시군구 코드
					String tel = (String)obj.get("tel");	//전화번호
					String title = (String)obj.get("title");	//여행지 이름

					list.add(new TravelDestinationDTO(addr1, addr2, areacode, contentid, contenttypeid, firstimage, firstimage2, mapX, mapY, mlevel, sigungucode, tel, title));
				} else {
					
				}
			}
			
			travleDAO.saveTravleDestination(list);

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

}
