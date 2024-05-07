package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLClientInfoException;
import java.sql.SQLException;

import util.DbConnection;

public class RestaurantReviewDAO {
	
	private static RestaurantReviewDAO resRevDAO;
	
	private RestaurantReviewDAO() {
		

	}
	
	public static RestaurantReviewDAO getinstance() {
		if(resRevDAO==null) {
			resRevDAO = new RestaurantReviewDAO();
		}
		return resRevDAO;
		
	}
	
	public int insertResReview(
		 String re_code, String res_title, String res_contents, String id) throws SQLException {
		
		int flag = 0;
		
		int num = setNom();
		//코드번호 순차적으로 증가 
		String numString = String.format("%05d", num);
		String resultNum = "RES_V" + numString;
		
		DbConnection dbCon = DbConnection.getInstance();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try{
			con =dbCon.getConn("jdbc/abn");
			String insert_resReview =
			"insert into RESTAURANT_REVIEW  (RES_DOC_NO, RES_CODE, RES_TITLE, RES_CONTENTS, ID, CREATE_DATE)  values(?,?,?,?,?,sysdate) ";
			pstmt= con.prepareStatement(insert_resReview);
			pstmt.setString(1, resultNum);	
			pstmt.setString(2, re_code);	
			pstmt.setString(3, res_title);
			pstmt.setString(4, res_contents);
			pstmt.setString(5, id);
			pstmt.executeUpdate();
		
			
        } catch (Exception e) {
            e.printStackTrace();
            flag = 1;
        } finally {
			dbCon.closeCon(rs, pstmt, con);
		}
		

		return flag;
	}
	
	
	public int setNom() throws SQLException {
		DbConnection dbCon = DbConnection.getInstance();
		int docNum = 0;
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try{
			con =dbCon.getConn("jdbc/abn");
			String select =
			"SELECT COUNT(*) AS count FROM RESTAURANT_REVIEW ";
			pstmt= con.prepareStatement(select);
			rs = pstmt.executeQuery();
			if(rs.next()) {
       		 docNum = rs.getInt("count");
			}
			
        } catch (Exception e) {
            e.printStackTrace();;
        } finally {
			dbCon.closeCon(rs, pstmt, con);
		}
		
		return docNum;
	}
	
	
	
	
	
	

}
