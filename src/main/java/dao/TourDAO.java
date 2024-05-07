package dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import util.DbConnection;

public class TourDAO {

    private static TourDAO tourDAO;

    public static TourDAO getInstance() {
        if (tourDAO == null) {
            tourDAO = new TourDAO();
        }
        return tourDAO;
    }

    public List<String> selectAllTourList() throws SQLException {
        List<String> list = new ArrayList<>();

        try (Connection connection = DbConnection.getInstance().getConn("jdbc/abn");
             PreparedStatement preparedStatement = connection.prepareStatement("SELECT CRS_NAME FROM COURSE");
             ResultSet resultSet = preparedStatement.executeQuery()) {

            while (resultSet.next()) {
                list.add(resultSet.getString("crs_name"));
            }

        } catch (SQLException e) {
            throw new SQLException("DB 접속 오류", e);
        }

        return list;
    }
}
