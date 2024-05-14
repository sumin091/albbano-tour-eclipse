<%@page import="dao.LoginDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info="테이블에 아이디, 비번이 존재하는지의 여부를 체크하는 페이지"%>
<%-- <jsp:useBean id="loginDAO" class="dao.LoginDAO"/> --%>
<%
LoginDAO loginDAO = LoginDAO.getInstance();


	String id="";//""- empty
	String password="";
	
	/* if(request.getParameter("id")!=null) */
		id = request.getParameter("mb_id");
	
	/* if(request.getParameter("password")!=null) */
		password = request.getParameter("mb_password");
	
	//System.out.println("-----------------"+id+", "+password+" ");
	if(loginDAO.loginRegister(id, password)){
		session.setAttribute("idKey",id);
%>
	<script>
	alert("로그인 되었습니다.");
	location.href="index_user.jsp";
	</script>
<% } else{ %>
	<script>
	alert("로그인에 실패하였습니다. ");
	location.href="login.jsp";
	</script>
<%}%>


