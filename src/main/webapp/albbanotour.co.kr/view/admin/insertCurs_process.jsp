<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="dao.CourseManagementDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
     info=""%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="icon" href="http://192.168.10.221/jsp_prj/common/favicon.ico" type="image/x-icon">
<!--부트스트랩 시작-->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
<!--부트스트랩 끝-->
<link rel="stylesheet" href="https://192.168.10.221/jsp_prj/common/css/main.css" type="text/css" media="all" />
<link rel="stylesheet" href="https://192.168.10.221/jsp_prj/common/css/board.css" type="text/css" media="all" />
<!--jQuery CDN 시작-->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>

<!--jQuery CDN 끝-->
<style type="text/css">
	
	
</style>
<script type ="text/javascript">
	$(function(){
	
	});//ready
</script>
</head>
<body>
<div>
<!-- 값 받는거 확인까지만 해둠  -->
<%-- <%
request.setCharacterEncoding("UTF-8");
String crsCode = request.getParameter("crsCode"); 
String crsName = request.getParameter("crsName"); 
String crsDesc = request.getParameter("crsDesc"); 
String imgName = request.getParameter("imgName");
String fare = request.getParameter("fare");
%> --%>
 <%-- 
    <p>코스 코드: <%= crsCode %></p>
    <p>코스 이름: <%= crsName %></p>
    <p>코스 설명: <%= crsDesc %></p>
    <p>코스 이미지: <%= imgName %></p>
    <p>코스 요금: <%= fare %></p>
    <p>선택된 관광지:</p>
    <ul>
        <% for (String spotValue : crsSpots) { %>
            <li><%= spotValue %></li>
        <% } %>
    </ul> --%>
    <% request.setCharacterEncoding("UTF-8"); %>
    <jsp:useBean id="curVO" class="vo.CourseManagementVO" scope="page"/>
    <jsp:setProperty property="*" name="curVO"/>
    <%pageContext.setAttribute("curVO", curVO);
    String[] crsSpotsArray = request.getParameterValues("spotValues");

    List<String> crsSpotsList = new ArrayList<>();
    if (crsSpotsArray != null) {
        for (String spot : crsSpotsArray) {
            String[] spots = spot.split(",");
            for (String s : spots) {
                crsSpotsList.add(s.trim());
            }
        }
    }

    String[] crsSpots = crsSpotsList.toArray(new String[0]);

    curVO.setCrsSpots(crsSpots);
    CourseManagementDAO cDAO = CourseManagementDAO.getInstance();
    cDAO.insertCurs(curVO);
    out.print(crsSpots.length);

    for (int i = 0; i < crsSpots.length; i++) {
    cDAO.insertTourCurs(curVO.getCrsCode(), crsSpots[i]);
    }

    %>
    
</div>
</body>
</html>