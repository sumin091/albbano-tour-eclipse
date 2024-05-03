package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import util.DbConnection;
import vo.QnaVO;

public class QnaDAO {
	
	private static QnaDAO qDAO;
	
	private QnaDAO() {
		
	}
	
	public static QnaDAO getInstance() {
		if (qDAO == null) {
			qDAO = new QnaDAO();
		}
		return qDAO;
	}
	
	
	public List<QnaVO> selectAllQna()throws SQLException{
		
		List<QnaVO> list = new ArrayList<QnaVO>();
		QnaVO qVO = null;
		DbConnection dbCon = DbConnection.getInstance();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			con = dbCon.getConn("jdbc/abn");
			String selectQuery = "select* from qna";
			pstmt = con.prepareStatement(selectQuery);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				qVO = new QnaVO();
				qVO.setASK_DOC_NO(rs.getString("ASK_DOC_NO"));
				qVO.setID(rs.getString("ID"));
				qVO.setASK_TITLE(rs.getString("ASK_TITLE"));
				qVO.setASK_CONTENTS(rs.getString("ASK_CONTENTS"));
				qVO.setCREATE_DATE(rs.getDate("CREATE_DATE"));
				qVO.setANSWER_DATE(rs.getDate("ANSWER_DATE"));
				qVO.setDEL_YN(rs.getString("DEL_YN"));
				qVO.setANSWER_CONTENTS(rs.getString("ANSWER_CONTENTS"));
				
				list.add(qVO);
			
			}
		}finally {
			dbCon.closeCon(rs, pstmt, con);
		}
		
		
		return list;
	}
	

}
