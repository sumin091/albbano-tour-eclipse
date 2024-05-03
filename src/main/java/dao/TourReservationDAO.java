package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import util.DbConnection;
import vo.TourReservationVO;

public class TourReservationDAO {
	
	private static TourReservationDAO tourReserDAO;
	
	
	public static TourReservationDAO getInstance() {
		if (tourReserDAO == null) {
			tourReserDAO = new TourReservationDAO();
		}
		return tourReserDAO;
	}
	
	public List<TourReservationVO> selectTourReservationList(String id) throws ClassNotFoundException, SQLException {
		List<TourReservationVO> list = new ArrayList<TourReservationVO>();
		TourReservationVO trVO = null;
		DbConnection dbCon = DbConnection.getInstance();
		
		Connection con =null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			Class.forName("oracle.jdbc.OracleDriver");
            con = dbCon.getConn("jdbc/abn");

            String sql = "select * from RESERVATION where id = ? " ;
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1, id);
            rs=pstmt.executeQuery();
            while(rs.next()) {
            	trVO = new TourReservationVO();
            	trVO.setResv_code(rs.getString("resv_code"));  
            	trVO.setCrs_code(rs.getString("crs_code"));
            	trVO.setLogic(rs.getString("logic"));
            	trVO.setFare(rs.getInt("fare"));
            	trVO.setPerson(rs.getInt("person"));
            	trVO.setResv_flag(rs.getInt("resv_flag"));
            	trVO.setCreate_date(rs.getDate("create_date"));
            	
     	
            	list.add(trVO);
            }}finally{
    			dbCon.closeCon(rs, pstmt, con);
    		}
			
    		return list;
    		}
	
	
	
}
