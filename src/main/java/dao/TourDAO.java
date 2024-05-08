package dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import util.DbConnection;
import vo.CourseManagementVO;

public class TourDAO {

    private static TourDAO tourDAO;

    public static TourDAO getInstance() {
        if (tourDAO == null) {
            tourDAO = new TourDAO();
        }
        return tourDAO;
    }

    public List<CourseManagementVO> selectAllTourList() throws SQLException {
        List<CourseManagementVO> list = new ArrayList<>();
        CourseManagementVO courseManagementVO = null;

        try (Connection connection = DbConnection.getInstance().getConn("jdbc/abn");
             PreparedStatement preparedStatement = connection.prepareStatement("SELECT CRS_NAME FROM COURSE");
             ResultSet resultSet = preparedStatement.executeQuery()) {

            while (resultSet.next()) {
            	courseManagementVO = new CourseManagementVO();
            	courseManagementVO.setCrsName(resultSet.getString("CRS_NAME"));
                list.add(courseManagementVO);
            }

        } catch (SQLException e) {
            throw new SQLException("DB 접속 오류", e);
        }

        return list;
    }
}
