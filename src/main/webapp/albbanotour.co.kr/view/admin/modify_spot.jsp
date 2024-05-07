<%@page import="vo.SpotListVO"%>
<%@page import="dao.SpotManagementDAO"%>
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
	textarea{width: 600px; height: 300px; }
	
</style>
<script type ="text/javascript">
	$(function(){
	
	});//ready
</script>
</head>
<body>
<%
request.setCharacterEncoding("UTF-8");


String spotcode = request.getParameter("spot_code");
SpotManagementDAO sDAO = SpotManagementDAO.getInstance();

SpotListVO sVO = sDAO.selectSpot(spotcode);
pageContext.setAttribute("sVO", sVO);
%>
<form action="modify_spot_process.jsp" method="post">
<div>
<table>
<thead>
<tr>
	<th style="width:100px">코드</th>
	<th style="width:100px">이름</th>
	<th style="width:600px">설명</th>
	<th style="width:100px">이미지이름</th>
	<th style="width:100px">경도</th>
	<th style="width:100px">위도</th>
	<th style="width:100px">위치</th>
</tr>
</thead>
<tbody>
<tr>
	<td><input type="text"  name ="spot_code" value ="${ sVO.spot_code }"/></td>
	<td><input type="text"  name ="spot_name" value ="${ sVO.spot_name }"/></td>
	<td><textarea  name ="spot_desc">"${ sVO.spot_desc }"</textarea></td>
	<td><input type="text" name ="img_name" value =" ${ sVO.img_name }"/></td>
	<td><input type="text" name ="longitude" value ="${ sVO.longitude }"/></td>
	<td><input type="text" name ="latitude" value ="${ sVO.latitude }"/></td>
	<td><input type="text" name ="spt_loc" value ="${ sVO.spt_loc }"/></td>
</tr>
</table>
</div>
<input type ="submit" value ="내용 수정" />
</form>
</body>
</html>