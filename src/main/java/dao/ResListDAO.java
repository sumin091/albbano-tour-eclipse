package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import util.DbConnection;
import vo.ResListVO;


public class ResListDAO {
	
	private static ResListDAO rDAO;
	
	
	public static ResListDAO getInstance() {
		
		if(rDAO ==null) {
			rDAO =new ResListDAO();
		}
		return rDAO;
	}
	
	public List<ResListVO> matjipList() throws SQLException, ClassNotFoundException {
		List<ResListVO> list = new ArrayList<ResListVO>();
		ResListVO rVO = null;
		DbConnection dbCon = DbConnection.getInstance();

	    Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
  
        try {
            Class.forName("oracle.jdbc.OracleDriver");
            con = dbCon.getConn("jdbc/abn");

            String sql = "select * from RESTAURANT" ;
            pstmt = con.prepareStatement(sql);
            rs=pstmt.executeQuery();
            while(rs.next()) {
            	rVO = new ResListVO();
            	rVO.setRes_code(rs.getString("res_code"));
            	rVO.setRes_cat(rs.getString("res_cat"));
            	rVO.setRes_name(rs.getString("res_name"));
            	rVO.setHoliday(rs.getString("holiday"));
            	rVO.setBusi_hour(rs.getString("busi_hour"));
            	rVO.setRes_loc(rs.getString("res_loc"));
            	rVO.setImg_name(rs.getString("img_name"));
            	rVO.setCreate_date(rs.getDate("create_date"));
            	rVO.setEdit_date(rs.getDate("edit_date"));
            	rVO.setLongitude(rs.getInt("longitude"));
            	rVO.setLatitude(rs.getInt("latitude"));
            	rVO.setDel_yn(rs.getString("del_yn"));
            	rVO.setIntro(rs.getString("intro"));
            	
     	
            	list.add(rVO);
            }}finally{
    			dbCon.closeCon(rs, pstmt, con);
    		}
    		return list;
    		}
	

}














