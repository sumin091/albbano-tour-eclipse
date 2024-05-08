package dao;

public class RestaurantReviewManagementDAO {

	
	private static RestaurantReviewManagementDAO resMangeDAO;
	
	private RestaurantReviewManagementDAO() {
		
	}
	
	public static RestaurantReviewManagementDAO getInstance() {
		if(resMangeDAO == null) {
			resMangeDAO = new RestaurantReviewManagementDAO();
		}
		return resMangeDAO;
		
		
	}
	
	
	
	
	
	
	
	
	
	
	
	
}
