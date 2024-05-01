<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info="테이블에 아이디, 비번이 존재하는지의 여부를 체크하는 페이지"%>
<jsp:useBean id="loginDAO" class="dao.LoginDAO"/>
<%
	String id="";
	String password="";
	if(request.getParameter("id")!=null)
		id = request.getParameter("id");
	if(request.getParameter("password")!=null)
		password = request.getParameter("password");
	if(loginDAO.loginRegister(id, password)){
		session.setAttribute("idKey",id);
%>
	<script>
	alert("로그인 되었습니다.");
	location.href="index_user.jsp";
	</script>
<% } else{ %>
	<script>
	alert("로그인에 실패하였습니다. 회원가입 부탁드립니다.");
	location.href="join.jsp";
	</script>
<%}%>


