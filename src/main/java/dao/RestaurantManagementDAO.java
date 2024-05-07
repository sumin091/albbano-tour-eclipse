package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import util.DbConnection;
import vo.ResListVO;

/**
 * 맛집 추가,삭제,수정을 하는 DAO 클래스
 */
public class RestaurantManagementDAO {
	private static RestaurantManagementDAO rdDAO;

	private RestaurantManagementDAO() {

	}

	
	public static RestaurantManagementDAO getInstance() {
		if (rdDAO == null) {
			rdDAO = new RestaurantManagementDAO();
		}
		return rdDAO;
	}
	/**
	 * 맛집을 추가하는 method
	 * 24.05.06 김일신
	 * @return int
	 */
	public int insertRest(ResListVO rVO) throws SQLException {
		int cnt = 0;
		DbConnection dbCon = DbConnection.getInstance();
		Connection con = null;
		PreparedStatement pstmt = null;
		try {
			con = dbCon.getConn("jdbc/abn");
			StringBuilder sb = new StringBuilder();
			sb.append("insert into RESTAURANT ").append(
					"RES_CODE, RES_CAT, RES_NAME, INTRO, HOLIDAY, BUSI_HOUR, RES_LOC, IMG_NAME, CREATE_DATE, LONGITUDE, LATITUDE, DEL_YN, SPT_LOC")
					.append("values(?,?,?,?,?,?,?,?,sysdate,?,?,'N',?) ");
			pstmt = con.prepareStatement(sb.toString());
			pstmt.setString(1, rVO.getRes_code());
			pstmt.setString(2, rVO.getRes_cat());
			pstmt.setString(3, rVO.getRes_name());
			pstmt.setString(4, rVO.getIntro());
			pstmt.setString(5, rVO.getHoliday());
			pstmt.setString(6, rVO.getBusi_hour());
			pstmt.setString(7, rVO.getRes_loc());
			pstmt.setString(8, rVO.getImg_name());
			pstmt.setDouble(9, rVO.getLongitude());
			pstmt.setDouble(10,rVO.getLatitude());
			pstmt.setString(11, rVO.getRes_loc());
			
			pstmt.executeUpdate();
			

		} finally {
			dbCon.closeCon(null, pstmt, con);
		}
		return cnt;

	}
	/**
	 * 관리자 화면에 맛집 리스트를 출력하는 method 
	 * 24.05.07 김일신
	 * @return List<ResListVO>
	 * @throws SQLException
	 */
	public List<ResListVO> selectAllRes() throws SQLException{
		List<ResListVO> list = new ArrayList<ResListVO>();
		ResListVO rVO = null;
		DbConnection dbCon = DbConnection.getInstance();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			con = dbCon.getConn("jdbc/abn");
			String select ="select * from RESTAURANT ";
			pstmt = con.prepareStatement(select);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				rVO = new ResListVO();
				//RES_CODE , RES_CAT, RES_NAME, HOLIDAY, BUSI_HOUR, RES_LOC, 
				//IMG_NAME, EDIT_DATE, LONGITUDE, LATITUDE, INTRO
				rVO.setRes_code(rs.getString("RES_CODE"));
				rVO.setRes_cat(rs.getString("RES_CAT"));
				rVO.setRes_name(rs.getString("RES_NAME"));
				rVO.setHoliday (rs.getString("HOLIDAY"));
				rVO.setBusi_hour(rs.getString("BUSI_HOUR"));
				rVO.setRes_loc(rs.getString("RES_LOC"));
				rVO.setImg_name(rs.getString("IMG_NAME"));
				rVO.setEdit_date(rs.getDate("EDIT_DATE"));
				rVO.setLongitude(rs.getDouble("LONGITUDE"));
				rVO.setLatitude(rs.getDouble("LATITUDE"));
				rVO.setIntro(rs.getString("INTRO"));
				
				list.add(rVO);
			}
			
		}finally {
			
		}
		return list;
		
	}
}