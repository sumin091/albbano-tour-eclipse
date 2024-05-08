package vo;

import java.sql.Date;

public record TourVO(
		String resv_code, 
		String id, 
		String crs_code, 
		char logic, 
		int fare, 
		int person, 
		int resv_flag,
		Date create_date) {

}
