package travelDB.localcode;

import travelDB.dao.LocalCodeDAO;
import travelDB.dto.LocalCodeDTO;

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
			LocalCodeDAO localcodeDAO = new LocalCodeDAO();
			ArrayList<LocalCodeDTO> list = new ArrayList<LocalCodeDTO>();
			
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
	
				int code = Integer.parseInt((String)obj.get("code"));	//주소
				String name = (String)obj.get("name");	//상세주소
			
				list.add(new LocalCodeDTO(code, name));

			}
			
			localcodeDAO.saveLocalCode(list);

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

}
