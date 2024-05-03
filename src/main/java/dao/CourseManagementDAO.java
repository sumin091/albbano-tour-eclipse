package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import util.DbConnection;
import vo.CourseManagementVO;
import vo.SpotListVO;

public class CourseManagementDAO {
	private static CourseManagementDAO cmDAO;

	private CourseManagementDAO() {

	}

	public static CourseManagementDAO getInstance() {
		if (cmDAO == null) {
			cmDAO = new CourseManagementDAO();
		}
		return cmDAO;
	}

	/**
	 * 코스 소개 화면에서, 해당 코스의 관광지 리스트를 보여주는 method 현재 하나만 나오게 코딩되어있음. 수정필요
	 * 24.05.02 김일신
	 * @return List<SpotListVO>
	 * @throws SQLException
	 */
	public List<SpotListVO> selectAllSpot() throws SQLException {
		List<SpotListVO> list = new ArrayList<SpotListVO>();
		SpotListVO sVO = null;
		StringBuilder sb = new StringBuilder();
		DbConnection dbCon = DbConnection.getInstance();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			con = dbCon.getConn("jdbc/abn");

			sb.append("	select s.SPOT_NAME	").append("	from SPOT s , TOUR_COURSE t 	")
					.append("	where (s.SPOT_CODE=t.SPOT_CODE)	");
			pstmt = con.prepareStatement(sb.toString());
			rs = pstmt.executeQuery();
			while (rs.next()) {
				sVO = new SpotListVO();
				sVO.setSpot_name(rs.getString("spot_name"));
				list.add(sVO);
			}

		} finally {
			dbCon.closeCon(rs, pstmt, con);
		}
		return list;
	}

	/**
	 * 해당 창에서 선택한 코스의 상세 내역을 보여주는 method
	 * 24.05.02 김일신
	 * @param cur_code
	 * @return CourseManagementVO
	 * @throws SQLException
	 */
	public CourseManagementVO selectCourseDetail(String cur_code) throws SQLException {
		CourseManagementVO cmVO = null;
		DbConnection dbCon = DbConnection.getInstance();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {

			con = dbCon.getConn("jdbc/abn");
			String selectCurDetail = "select  * from course where  CRS_code= ? ";
			pstmt = con.prepareStatement(selectCurDetail);
			pstmt.setString(1, cur_code);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				cmVO = new CourseManagementVO();
				cmVO.setCrsCode(rs.getString("CRS_CODE"));
				cmVO.setCrsName(rs.getString("CRS_NAME"));
				cmVO.setCrsDesc(rs.getString("CRS_DESC"));
				cmVO.setImgName(rs.getString("IMG_NAME"));
				cmVO.setCreateDate(rs.getDate("CREATE_DATE"));
				cmVO.setFare(rs.getInt("FARE"));

			}
		} finally {
			dbCon.closeCon(rs, pstmt, con);
		}

		return cmVO;

	}
}
