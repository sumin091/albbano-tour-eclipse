package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import util.DbConnection;
import vo.NoticeVO;

public class NoticeDAO {

	private static NoticeDAO NoticeDAO;
	
	private NoticeDAO() {
		
	}
	
	
	
	public static NoticeDAO getInstance() {
		if(NoticeDAO == null) {
			NoticeDAO = new NoticeDAO();
		}
		return NoticeDAO;
	}
	
	public List<NoticeVO> selectAll() throws SQLException{
		List<NoticeVO> list= new ArrayList<NoticeVO>();
		NoticeVO noticeVO=null;
		
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;

		DbConnection dbCon= DbConnection.getInstance();
		
		try {
			con =dbCon.getConn("jdbc/abn");
			
			String selectNotice=" select * from notice ";
			
			pstmt=con.prepareStatement(selectNotice);
			
			rs=pstmt.executeQuery();			
			
			while(rs.next()) {
				NoticeVO ntVO= new NoticeVO();
				ntVO.setDoc_No(rs.getString("doc_No"));
				ntVO.setTitle(rs.getString("title"));
				ntVO.setImg_Name(rs.getString("img_Name"));
				ntVO.setCreate_Date(rs.getDate("create_date"));
				ntVO.setId(rs.getString("id"));
				ntVO.setDoc_Cont(rs.getString("doc_Cont"));
				ntVO.setDel_yn(rs.getString("del_yn"));
				
				list.add(ntVO);
			}
			
		}finally {
			dbCon.closeCon(rs, pstmt, con);
		}
		return list;
	}
	
	public NoticeVO selectOne(String title) throws SQLException {
		NoticeVO ntVO=null;
		
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs= null;
		
		DbConnection dbCon= DbConnection.getInstance();
		
		try {
			
			con =dbCon.getConn("jdbc/abn");			
			String selectOne=(" select * from notice where doc_No=? ");
			
			
			pstmt=con.prepareStatement(selectOne);
			
			pstmt.setString(1, title);
			
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				ntVO= new NoticeVO();
				ntVO.setDoc_No(rs.getString("doc_No"));
				ntVO.setTitle(rs.getString("title"));
				ntVO.setImg_Name(rs.getString("img_Name"));
				ntVO.setCreate_Date(rs.getDate("create_date"));
				ntVO.setId(rs.getString("id"));
				ntVO.setDoc_Cont(rs.getString("doc_Cont"));
				ntVO.setDel_yn(rs.getString("del_yn"));
			}
			
		}finally {
			dbCon.closeCon(rs, pstmt, con);
		}
		return ntVO;
	}
	/*
	public int updateMenu(NoticeVO NoticeVO) throws SQLException {
		NoticeVO ntVO=null;
		
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		int result=0;
		
		DbConnection dbCon= DbConnection.getInstance();
		
		try {
			
			String updateMenu= " update notice set =? where title=? ";
			
			
			pstmt=con.prepareStatement(updateMenu);
			pstmt.setString(1, "title");
			
			result=pstmt.executeUpdate();
		}finally {
			dbCon.closeCon(rs, pstmt, con);
		}
		return result;
		
	}
	
	public void deleteMenu(String del_yn) throws SQLException {
		
		Connection con=null;
		PreparedStatement pstmt=null;
		
		DbConnection dbCon= DbConnection.getInstance();
		try {
			
			String deleteMenu=" delete from notice where del_yn=? ";
			
			pstmt=con.prepareStatement(deleteMenu);
			
			pstmt.setString(1, "del_yn");
			
			
			
		}finally {
			if(pstmt != null) {pstmt.close();}
			if(con != null) {con.close();}
		}
	}
	*/

}
