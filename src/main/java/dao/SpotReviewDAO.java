package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import util.DbConnection;
import vo.SpotReviewVO;


public class SpotReviewDAO {
	
	
	private static SpotReviewDAO sptRevDAO;

	private SpotReviewDAO() {
		
	}
	
	public static SpotReviewDAO getInstance() {
		if(sptRevDAO==null) {
			sptRevDAO = new SpotReviewDAO();
		}
		return sptRevDAO;
		
	}
	
	public List<SpotReviewVO> selectSptAllReview(String spotcode)throws SQLException {
		List<SpotReviewVO> list = new ArrayList<SpotReviewVO>();
		SpotReviewVO sVO = null;
		DbConnection dbCon = DbConnection.getInstance();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try{
		
		con =dbCon.getConn("jdbc/abn");
		String selectspot =
		"select * from SPOT_REVIEW where spot_code = ? ";
		pstmt= con.prepareStatement(selectspot);
		pstmt.setString(1, spotcode);
		rs = pstmt.executeQuery();
		while(rs.next()) {
			sVO = new SpotReviewVO();
        	sVO.setSpot_doc_no(rs.getString("spot_doc_no"));
        	sVO.setImg_name(rs.getString("img_name"));
        	sVO.setCreate_date(rs.getDate("create_date"));
        	sVO.setSpot_title(rs.getString("spot_title"));
        	sVO.setSpot_doc_no(rs.getString("spot_doc_no"));
        	sVO.setSpot_contents(rs.getString("spot_contents"));
        	sVO.setId(rs.getString("id"));
        	
        	list.add(sVO);
		}
		}finally {
			dbCon.closeCon(rs, pstmt, con);
		}
		return list;
		
	}
	
	
	
	
	
	
	
	
	
	
	
	
}