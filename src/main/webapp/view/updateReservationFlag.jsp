<%@ page import="dao.TourReservationManagementDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    String flag = request.getParameter("flag");
    String resvCode = request.getParameter("resvCode");

    TourReservationManagementDAO tourReservationManagementDAO = TourReservationManagementDAO.getInstance();

    int updateCount = tourReservationManagementDAO.updateTourReservation(Integer.parseInt(flag), resvCode);

    if (updateCount > 0) {
        response.getWriter().write("success");
    } else {
        response.getWriter().write("failure");
    }
%>