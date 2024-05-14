<%@page import="java.sql.SQLException"%>
<%@page import="vo.UserInfoVO"%>
<%@page import="dao.UserInfoManagementDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info="회원정보수정"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	
	
</style>
<% request.setCharacterEncoding("UTF-8");
String userId=(String)session.getAttribute("idKey");


%>
<jsp:useBean id="uiVO" class="vo.UserInfoVO" scope="page"/>
<jsp:setProperty property="*" name="uiVO"/>
<script type="text/javascript">
	<%
		UserInfoManagementDAO uiDAO = UserInfoManagementDAO.getInstance();
		uiVO.setId(userId);
	
	try{
		
		//System.out.println("---uiVO---------"+uiVO);
		int cnt=uiDAO.updateInfo(uiVO);
		String newPass= uiVO.getNewPass();
		int cnt2=uiDAO.updatePass(uiVO, newPass);
		if(cnt==1 && cnt2==1){
			//System.out.println("=======================33");	
		%>
		alert("회원정보 수정이 완료되었습니다.");
		location.href="http://192.168.10.223/albbano-tour-eclipse/albbanotour.co.kr/view/index_user.jsp";
		<%
		}else{
		%>
		alert("문제가 발생하여, 회원정보 수정에 실패하였습니다.");
		history.back();
		<%
		}//end else
		
	}catch(SQLException se){
		se.printStackTrace();
		%>
		location.href="http://192.168.10.223/albbano-tour-eclipse/albbanotour.co.kr/view/index_user.jsp";
	<%}//end catch
	%>
	
	
	
	
</script>
</head>
<body>
<div>

</div>
</body>
</html>