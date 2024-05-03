package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import util.DbConnection;

public class AdminLoginDAO {

	private static AdminLoginDAO alDAO;
	
	private AdminLoginDAO() {
	}
	
	public static AdminLoginDAO getInstance() {
		if(alDAO == null) {
			alDAO = new AdminLoginDAO();
		}
		return alDAO;
	}
	
public boolean loginRegister(String id, String password) throws SQLException {
		
		DbConnection dbCon = DbConnection.getInstance();
		
		Connection con=null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		boolean loginCon = false;
		
		try {
			con = dbCon.getConn("jdbc/abn");
			String query = "select count(*) from admin where id = ? and password = ?";
			
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, id);
			pstmt.setString(2, password);
			rs = pstmt.executeQuery();
			
			//if(rs.next())
				//loginCon = true;
			
			loginCon=rs.next();//true-조회결과 있음, false-조회결과 없음
		}catch(Exception ex) {
			System.out.println("Exception" + ex);
		}finally {
			dbCon.closeCon(rs, pstmt, con);
		}
		return loginCon;
	}
}//class
