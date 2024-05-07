<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info="로그인 성공/실패 시 이동되는 페이지"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String id = (String)session.getAttribute("idKey");
	if(id == null){ %>
	<script>
	alert("로그인 되지 않았습니다.");
	location.href="login.jsp";
	</script>
	<% }%>
	
<div>
	<strong><%=id%></strong>님이 로그인 하셨습니다.
</div>
	