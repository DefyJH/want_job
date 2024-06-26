package travelDB.travel_destination;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;

public class APIExplorer {

	
	public String getTravleDestinationInfo() {
		
		StringBuilder sb = new StringBuilder();
		
    	// 1. URL을 만들기 위한 StringBuilder.        
		StringBuilder urlBuilder = new StringBuilder("https://apis.data.go.kr/B551011/KorWithService1/areaBasedList1?serviceKey=tiJTPvfW4NC4ed9%2BwQDxN8bmWLHARc0NZ7m2gGgVC9I656sZDIgp%2B4kuwkwIBFE0k%2Fkd2gAaj%2F%2BhCIwPRLE6uQ%3D%3D&numOfRows=7912&pageNo=1&MobileOS=ETC&MobileApp=AppTest&listYN=Y&arrange=C&_type=json");
		
		try {            
            // URL 객체 생성.
            URL url = new URL(urlBuilder.toString()); // 자바 20 이후부터 지원 x? << URL -> URI 변경 필요 여부 확인해야함
            
            // 2. 요청하고자 하는 URL과 통신하기 위한 Connection 객체 생성.
            HttpURLConnection conn = (HttpURLConnection)url.openConnection();
            conn.setRequestMethod("GET");            				     // 3. 통신을 위한 메소드 SET.          
            conn.setRequestProperty("Content-type", "application/json"); // 4. 통신을 위한 Content-type SET.
            
            // 5. 통신 응답 코드 확인.
            System.out.println("Response code: " + conn.getResponseCode());
            
            // 6. 전달받은 데이터를 BufferedReader 객체로 저장.
            BufferedReader rd;
            if(conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
                rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
            } else {
                rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
            }
            
            // 7. 저장된 데이터를 라인별로 읽어 StringBuilder 객체로 저장.
            String line;
            while ((line = rd.readLine()) != null) {
                sb.append(line);
            }
            
            // 8. 객체 해제.
            rd.close();
            conn.disconnect();
            
            // 9. 전달받은 데이터 확인.
//            System.out.println(sb.toString());     	
        } catch(Exception e) {
        	System.out.println("exception 발생");
        }
		
		return sb.toString();
		
	}

	
}
