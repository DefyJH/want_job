package travelDB.util;

import java.sql.Timestamp;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

public class ConvertDateUtil {


	//Timestamp -> LocalDateTime
	public static LocalDateTime convertTimestampToLocalDateTime(Timestamp ts) {
		return ts.toLocalDateTime();
	}

	public static Timestamp convertLocalDateTimeToTimestamp(LocalDateTime ldt) {
		return Timestamp.valueOf(ldt);
	}

	//String -> LocalDateTime
	public static LocalDateTime convertStringToLocalDateTime(String str) {

		//2024-06-01
		//2024/06/01
		//20240601
		DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy-MM-dd");
		LocalDate ld = LocalDate.parse(str, dtf);
		LocalDateTime ldt = ld.atStartOfDay();
		return ldt;
	}


	public static LocalDateTime convertStringToLocalDateTime2(String str) {

		//2024-06-01
		//2024/06/01
		//20240601
		DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy/MM/dd");
		LocalDate ld = LocalDate.parse(str, dtf);
		LocalDateTime ldt = ld.atStartOfDay();
		return ldt;
	}
	
	public static LocalDateTime convertStringToLocalDateTime3(String str) {

		//2024-06-01
		//2024/06/01
		//20240601
		DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyyMMdd");
		LocalDate ld = LocalDate.parse(str, dtf);
		LocalDateTime ldt = ld.atStartOfDay();
		return ldt;
	}
	
	//LocalDateTime -> String
	public static String convertLocalDateTimeToString(LocalDateTime ldt) {
		DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy-MM-dd");
		String result = ldt.format(dtf);
		return result;
	}
	
	public static String convertLocalDateTimeToString2(LocalDateTime ldt) {
		DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy/MM/dd");
		String result = ldt.format(dtf);
		return result;
	}
	
	public static String convertLocalDateTimeToString3(LocalDateTime ldt) {
		DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
		String result = ldt.format(dtf);
		return result;
	}
	
	public static String convertLocalDateTimeToString4(LocalDateTime ldt) {
		DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy. MM. dd.");
		String result = ldt.format(dtf);
		return result;
	}
}