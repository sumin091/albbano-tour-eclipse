package dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import util.DbConnection;
import vo.SpotListVO;
import vo.TourReservationVO;

public class TourReservationManagementDAO {
    private static TourReservationManagementDAO instance;
    
    private TourReservationManagementDAO() {}
    
    public static TourReservationManagementDAO getInstance() {
        if (instance == null) {
            synchronized (TourReservationManagementDAO.class) {
                if (instance == null) {
                    instance = new TourReservationManagementDAO();
                }
            }
        }
        return instance;
    }
	
	public String createResvCode() throws SQLException {
        String prefix = "RESV_";
        String query = "SELECT MAX(RESV_CODE) AS RESV_CODE FROM RESERVATION";
        String code = "";
        
        DbConnection dbConnection = DbConnection.getInstance();
        try (Connection connection = dbConnection.getConn("jdbc/abn");
             PreparedStatement preparedStatement = connection.prepareStatement(query);
             ResultSet resultSet = preparedStatement.executeQuery()) {
            
            if (resultSet.next()) {
                code = resultSet.getString("RESV_CODE");
            }

            int num = Integer.parseInt(code.substring(prefix.length()));
            code = prefix + String.format("%05d", num + 1);
        }
        
        return code;
    }
	
	public int insertTourReservation(TourReservationVO tourReservationVO) throws SQLException {
	    int count = 0;
	    String insertQuery = "INSERT INTO RESERVATION VALUES (?,?,?,?,?,?,0,SYSDATE,'N')";
	    DbConnection dbConnection = DbConnection.getInstance();
	    
	    java.sql.Date sqlTourDate = new java.sql.Date(tourReservationVO.getTour_date().getTime());

	    if (!isDuplicateReservation(tourReservationVO.getId(), tourReservationVO.getCrs_code(), sqlTourDate)) {
	        try (Connection connection = dbConnection.getConn("jdbc/abn");
	             PreparedStatement preparedStatement = connection.prepareStatement(insertQuery)) {

	            preparedStatement.setString(1, tourReservationVO.getResv_code());
	            preparedStatement.setString(2, tourReservationVO.getId());
	            preparedStatement.setString(3, tourReservationVO.getCrs_code());
	            preparedStatement.setInt(4, tourReservationVO.getFare());
	            preparedStatement.setInt(6, tourReservationVO.getPerson());
	            preparedStatement.setDate(5, sqlTourDate);

	            count = preparedStatement.executeUpdate();
	        }
	    }

	    return count;
	}
	
	public int updateTourReservation(int resvFalg, String resvCode) throws SQLException {
		int count = 0;
		String updateQuery = "UPDATE RESERVATION SET RESV_FLAG = ? WHERE RESV_CODE = ?";
		DbConnection dbConnection = DbConnection.getInstance();
		
		try (Connection connection = dbConnection.getConn("jdbc/abn");
			PreparedStatement preparedStatement = connection.prepareStatement(updateQuery)) {

			preparedStatement.setInt(1, resvFalg);
			preparedStatement.setString(2, resvCode);

			count = preparedStatement.executeUpdate();
		}
		
		return count;
	}
	
	public String selectCourseCode(String courseName) throws SQLException {
	    String courseCode = "";
	    String selectQuery = "SELECT CRS_CODE FROM COURSE WHERE CRS_NAME=?";

	    DbConnection dbConnection = DbConnection.getInstance();
	    try (Connection connection = dbConnection.getConn("jdbc/abn");
	         PreparedStatement preparedStatement = connection.prepareStatement(selectQuery)) {
	        
	        preparedStatement.setString(1, courseName);
	        try (ResultSet resultSet = preparedStatement.executeQuery()) {
	            if (resultSet.next()) {
	            	courseCode = resultSet.getString("CRS_CODE");
	            }
	        }
	    }
	    return courseCode;
	}
	
	public boolean isDuplicateReservation(String userId, String courseCode, Date tourDate) throws SQLException {
	    boolean isDuplicate = false;
	    String query = "SELECT COUNT(*) FROM RESERVATION WHERE ID = ? AND CRS_CODE = ? AND TOUR_DATE = ?";
	    
	    DbConnection dbConnection = DbConnection.getInstance();
	    try (Connection connection = dbConnection.getConn("jdbc/abn");
	         PreparedStatement preparedStatement = connection.prepareStatement(query)) {
	        
	        preparedStatement.setString(1, userId);
	        preparedStatement.setString(2, courseCode);
	        preparedStatement.setDate(3, tourDate);
	        
	        try (ResultSet resultSet = preparedStatement.executeQuery()) {
	            if (resultSet.next() && resultSet.getInt(1) > 0) {
	                isDuplicate = true;
	            }
	        }
	    }
	    return isDuplicate;
	}

}
