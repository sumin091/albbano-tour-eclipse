<%@page import="dao.SpotReviewDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info=""%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="icon" href="http://192.168.10.229/jsp_prj/common/favicon.ico"/>
<!--bootstrap 시작-->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
<!--bootstrap 끝-->
<lick rel="stylesheet" href="http://192.168.10.229/jsp_prj/common/css/main.css" type="text/css" media="all"/>
<lick rel="stylesheet" href="http://192.168.10.229/jsp_prj/common/css/board.css" type="text/css" media="all"/>
<!--jQuert CDN 시작-->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<!--jQuert CDN 끝-->


<style type="text/css">
	
</style>
<script type="text/javascript">
	
	
</script>
</head>
<body>
	<% request.setCharacterEncoding("UTF-8");
		
		String spt_name = request.getParameter("spt_name");
		String spt_code = request.getParameter("spt_code");
		String spot_doc_no = request.getParameter("spot_doc_no");
		
		
		
		SpotReviewDAO srDAO = SpotReviewDAO.getInstance();
		
		int flag = srDAO.deleteSpotReview(spot_doc_no);
		String result = "문제가 발생하여 리뷰를 삭제하는데 실패했습니다.";
		if(flag == 1 ){
			result = "리뷰 삭제에 성공했습니다.";
		}
		
	%>
	
	<script>
	alert("<%=result%>");
	location.href = "review_spot.jsp?spt_code=<%=spt_code %>&spt_name=<%=spt_name %>";
	
	</script>
	


</body>
</html>