package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import util.DbConnection;
import vo.AdminSearchVO;
import vo.UserInfoVO;


public class AdminUserInfoManagementDAO {

	private static AdminUserInfoManagementDAO aduiDAO;
	
	private AdminUserInfoManagementDAO() {
		
	}
	
	public static AdminUserInfoManagementDAO getInstance() {
		if(aduiDAO==null) {
			aduiDAO=new AdminUserInfoManagementDAO();
		}
		return aduiDAO;
	}//getInstance
	
	/**
	 * 총 레코드 수
	 * @param asVO
	 * @return
	 * @throws SQLException
	 */
	public int selectTotalCount(AdminSearchVO asVO) throws SQLException{
		int totalCnt=0;
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		DbConnection db = DbConnection.getInstance();
		
		try {
			con=db.getConn("jdbc/abn");
			StringBuilder selectCnt= new StringBuilder();
			selectCnt.append("select count(*) cnt from member");
			
			pstmt= con.prepareStatement(selectCnt.toString());
			rs=pstmt.executeQuery();
			if(rs.next()) {
				totalCnt=rs.getInt("cnt");
			}//end if
		}finally {
			db.closeCon(rs, pstmt, con);
		}//end finally
		
		return totalCnt;
	}//totalCount
	
	public List<UserInfoVO> selectInfo(AdminSearchVO asVO) throws SQLException{
		List<UserInfoVO> list = new ArrayList<UserInfoVO>();
		
		Connection con = null;
		PreparedStatement pstmt= null;
		ResultSet rs = null;
		
		DbConnection db=DbConnection.getInstance();
		
		try {
		//1. JNDI 사용객체 생성
		//2. DataSource 얻기
		//3. Connection 얻기
			con=db.getConn("jdbc/abn");
		//4. 쿼리문 생성객체 얻기(Dynamic Query)
			StringBuilder selectBoard=new StringBuilder();
			selectBoard
			.append("	select id, tel, email, rnum")
			.append("	from(select id, tel, email,")
			.append("		row_number() over(order by create_date desc) rnum")
			.append("		from member)")
			.append("	where rnum between ? and ?");
							
			pstmt=con.prepareStatement(selectBoard.toString());
			
		//5. 바인드 변수에 값 설정
			pstmt.setInt(1, asVO.getStartNum());
			pstmt.setInt(2, asVO.getEndNum());
		//6. 쿼리문 수행 후 결과 얻기
			
			rs=pstmt.executeQuery();
			UserInfoVO uiVO=null;
			while(rs.next()) {
				uiVO=new UserInfoVO(rs.getString("id"), null, null, rs.getString("tel"),
						rs.getString("email"), null, null,null,null,null);	
				list.add(uiVO);
			}
		}finally {
		//7. 연결끊기
			db.closeCon(rs, pstmt, con);
		}//end finally
		return list;
	}//selectBoard
	
}
