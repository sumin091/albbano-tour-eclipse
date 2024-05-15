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
	
	public String selectMaxResvCode() throws SQLException {
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
	    String insertQuery = "INSERT INTO RESERVATION VALUES (?,?,?,'N',?,?,1,SYSDATE)";
	    DbConnection dbConnection = DbConnection.getInstance();
	    
	    try (Connection connection = dbConnection.getConn("jdbc/abn");
	        PreparedStatement preparedStatement = connection.prepareStatement(insertQuery)) {
	        
	        preparedStatement.setString(1, tourReservationVO.getResv_code());
	        preparedStatement.setString(2, tourReservationVO.getId());
	        preparedStatement.setString(3, tourReservationVO.getCrs_code());
	        preparedStatement.setInt(4, tourReservationVO.getFare());
	        preparedStatement.setInt(5, tourReservationVO.getPerson());
	        
	        count = preparedStatement.executeUpdate();
	    }
	    
	    return count;
	}
	
	public int updateTourReservation(TourReservationVO tourReservationVO) throws SQLException {
		int count = 0;
		String updateQuery = "UPDATE RESERVATION SET RESV_FLAG = ? WHERE RESV_CODE = ?";
		DbConnection dbConnection = DbConnection.getInstance();
		
		try (Connection connection = dbConnection.getConn("jdbc/abn");
			PreparedStatement preparedStatement = connection.prepareStatement(updateQuery)) {

			preparedStatement.setInt(1, tourReservationVO.getResv_flag());
			preparedStatement.setString(2, tourReservationVO.getResv_code());

			count = preparedStatement.executeUpdate();
		}
		
		return count;
	}
}
