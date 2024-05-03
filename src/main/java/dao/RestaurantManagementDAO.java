package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import util.DbConnection;
import vo.ResListVO;

public class RestaurantManagementDAO {
private static RestaurantManagementDAO rdDAO;
private RestaurantManagementDAO() {
	
}

public static RestaurantManagementDAO getInstance() {
	if(rdDAO==null) {
		rdDAO= new RestaurantManagementDAO();
	}
	return rdDAO;
}
public int insertRest(ResListVO rVO) throws SQLException {
	int cnt =0;
	DbConnection dbCon = DbConnection.getInstance();
	Connection con = null;
	PreparedStatement pstmt = null;
	try{
	con= dbCon.getConn("jdbc/abn");
	StringBuilder sb =new StringBuilder();
	/*sb.append("insert into RESTAURANT ")
	"(RES_CODE, RES_CAT, RES_NAME, INTRO, HOLIDAY, BUSI_HOUR, RES_LOC, IMG_NAME, CREATE_DATE, EDIT_DATE, LONGITUDE, LATITUDE, DEL_YN, SPT_LOC)\r\n"
	+ "values(?,?,?,?,?,?,?,?,sysdate,?,?,'N',?);";*/
	
	
	return cnt;
	
	
}finally {
	
}


}
}