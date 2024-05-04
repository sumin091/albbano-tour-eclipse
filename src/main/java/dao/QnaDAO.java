package dao;

import java.awt.geom.IllegalPathStateException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import util.DbConnection;
import vo.QnaVO;
import vo.QnasearchVO;

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
	
	public int selecttotalCount(QnasearchVO qsVO)throws SQLException{
		
		int totalCnt=0;
		List<QnaVO> list = new ArrayList<QnaVO>();
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs=null;
		
		DbConnection db=DbConnection.getInstance();
		try {
			con=db.getConn("jdbc/abn");
			StringBuilder selectCnt=new StringBuilder();
			selectCnt.append("select count(*) ASK_DOC_NO from qna");
			
			pstmt=con.prepareStatement(selectCnt.toString());
			rs=pstmt.executeQuery();
			if(rs.next()) {
				totalCnt=rs.getInt("ASK_DOC_NO");
			}
			
		}finally {
			db.closeCon(rs, pstmt, con);
		}
	
	
	
	
		return totalCnt;
	}
	
	
	public List<QnaVO> selectQna(QnasearchVO qsVO, String loginId) throws SQLException {

	    List<QnaVO> list = new ArrayList<QnaVO>();

	    Connection con = null;
	    PreparedStatement pstmt = null;
	    ResultSet rs = null;

	    DbConnection db = DbConnection.getInstance();

	    try {
	        con = db.getConn("jdbc/abn");

	        StringBuilder selectQna = new StringBuilder();
	        selectQna
	            .append("SELECT ASK_DOC_NO, ID, ASK_TITLE, ASK_CONTENTS, CREATE_DATE, ANSWER_DATE, DEL_YN, ANSWER_CONTENTS ")
	            .append("FROM (SELECT ASK_DOC_NO, ID, ASK_TITLE, ASK_CONTENTS, CREATE_DATE, ANSWER_DATE, DEL_YN, ANSWER_CONTENTS, ROW_NUMBER() OVER (ORDER BY CREATE_DATE DESC) RNUM FROM qna) ")
	            .append("WHERE RNUM BETWEEN ? AND ? ");

	        // 로그인 아이디와 작성자 아이디를 비교하는 조건 추가
	        selectQna.append("AND ID = ? ");

	        pstmt = con.prepareStatement(selectQna.toString());
	        pstmt.setInt(1, qsVO.getStartNum());
	        pstmt.setInt(2, qsVO.getEndNum());

	        // 로그인 아이디 설정
	        pstmt.setString(3, loginId);

	        rs = pstmt.executeQuery();
	        QnaVO qVO = null;
	        while (rs.next()) {
	            qVO = new QnaVO(rs.getString("ASK_DOC_NO"), rs.getString("ID"),
	                    rs.getString("ASK_TITLE"), rs.getString("ASK_CONTENTS"),
	                    rs.getString("DEL_YN"), rs.getString("ANSWER_CONTENTS"),
	                    rs.getDate("CREATE_DATE"), rs.getDate("ANSWER_DATE"));

	            list.add(qVO);
	        }

	    } finally {
	        db.closeCon(rs, pstmt, con);
	    }

	    return list;
	}
	
	
	
	public QnaVO selectmyQna(String ASK_DOC_NO, String ID)throws SQLException{
		QnaVO qVO = new QnaVO();
		DbConnection dbCon=DbConnection.getInstance();
		Connection con=null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			con =dbCon.getConn("jdbc/abn");
			String sql =
					"SELECT * FROM qna WHERE ASK_DOC_NO = ? AND ID = ?";
			pstmt= con.prepareStatement(sql);
			pstmt.setString(1, ASK_DOC_NO);
			pstmt.setString(2, ID); 
			rs=pstmt.executeQuery();
			
			while(rs.next()) {
				 qVO = new QnaVO();
				qVO.setASK_DOC_NO(rs.getString("ASK_DOC_NO"));
				qVO.setID(rs.getString("ID"));
				qVO.setASK_TITLE(rs.getString("ASK_TITLE"));
				qVO.setANSWER_CONTENTS(rs.getString("ASK_CONTENTS"));
				qVO.setCREATE_DATE(rs.getDate("CREATE_DATE"));
				qVO.setANSWER_DATE(rs.getDate("ANSWER_DATE"));
				qVO.setDEL_YN(rs.getString("DEL_YN"));
				qVO.setANSWER_CONTENTS(rs.getString("ANSWER_CONTENTS"));
				
				
			}
			
		}finally {
			dbCon.closeCon(rs, pstmt, con);
		}
		return qVO;
		
		
		
		
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	/*
	 * public List<QnaVO> selectAllQna()throws SQLException{
	 * 
	 * List<QnaVO> list = new ArrayList<QnaVO>(); QnaVO qVO = null; DbConnection
	 * dbCon = DbConnection.getInstance(); Connection con = null; PreparedStatement
	 * pstmt = null; ResultSet rs = null;
	 * 
	 * try { con = dbCon.getConn("jdbc/abn"); String selectQuery =
	 * "select* from qna"; pstmt = con.prepareStatement(selectQuery); rs =
	 * pstmt.executeQuery(); while(rs.next()) { qVO = new QnaVO();
	 * qVO.setASK_DOC_NO(rs.getString("ASK_DOC_NO")); qVO.setID(rs.getString("ID"));
	 * qVO.setASK_TITLE(rs.getString("ASK_TITLE"));
	 * qVO.setASK_CONTENTS(rs.getString("ASK_CONTENTS"));
	 * qVO.setCREATE_DATE(rs.getDate("CREATE_DATE"));
	 * qVO.setANSWER_DATE(rs.getDate("ANSWER_DATE"));
	 * qVO.setDEL_YN(rs.getString("DEL_YN"));
	 * qVO.setANSWER_CONTENTS(rs.getString("ANSWER_CONTENTS"));
	 * 
	 * list.add(qVO);
	 * 
	 * } }finally { dbCon.closeCon(rs, pstmt, con); }
	 * 
	 * 
	 * return list; }
	 */
	

}
