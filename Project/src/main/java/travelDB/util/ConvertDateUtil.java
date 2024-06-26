package travelDB.util;

import java.sql.Timestamp;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

public class ConvertDateUtil {

	// Timestamp -> LocalDateTime
	public static LocalDateTime convertTimestampToLocalDateTime(Timestamp ts) {
		return ts.toLocalDateTime();
	}
	
	// LocalDateTime -> Timestamp
	public static Timestamp convertLocalDateTimeToTimestamp(LocalDateTime ldt) {
		return Timestamp.valueOf(ldt);
	}

	// String -> LocalDateTime
	public static LocalDateTime convertStringToLocalDateTime(String str) {
        if(str.contains("-")) {			// 2024-06-01
            DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy-MM-dd");
            LocalDate ld = LocalDate.parse(str, dtf);
            LocalDateTime ldt = ld.atStartOfDay();
            return ldt;
        } else if(str.contains("/")) {	// 2024/06/01
        	DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy/MM/dd");
        	return LocalDate.parse(str, dtf).atStartOfDay();
        } else { 						// 20240601
        	DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyyMMdd");
        	return LocalDate.parse(str, dtf).atStartOfDay();	
        }
	}
	
	public static LocalDateTime convertStringToLocalDateTime2(String str) {
        DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        LocalDate ld = LocalDate.parse(str, dtf);
        LocalDateTime ldt = ld.atStartOfDay();
        return ldt;
	}
	
	// LocalDateTime -> String
	public static String convertLocalDateTimeToString(LocalDateTime ldt) {
        DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        String result = ldt.format(dtf);
        return result;
	}
	
	// LocalDateTime -> String
	public static String convertLocalDateTimeToString2(LocalDateTime ldt) {
        DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy/MM/dd");
        String result = ldt.format(dtf);
        return result;
	}
	
	// LocalDateTime -> String
	public static String convertLocalDateTimeToString3(LocalDateTime ldt) {
        DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy-MM-dd hh:mm:ss");
        String result = ldt.format(dtf);
        return result;
	}
}
