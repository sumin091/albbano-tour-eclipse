<%@page import="dao.NoticeDAO"%>
<%@page import="vo.NoticeVO"%>
<%@page import="java.sql.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info="공지사항 작성"%>
<%
request.setCharacterEncoding("UTF-8");

String doc_No= request.getParameter("doc_No");
String title= request.getParameter("title");
String img_Name= request.getParameter("img_Name");
String id= request.getParameter("id");
String doc_cont= request.getParameter("doc_cont");
String del_yn= request.getParameter("del_Yn");

NoticeVO ntVO= new NoticeVO();
NoticeDAO ntDAO= NoticeDAO.getInstance();
%>
<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link rel="icon"  href="../favicon.png"/>
<!-- include libraries(bootstrap) -->
<link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet">
	<!--jQuery CDN 시작-->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
	<!--jQuery CDN 끝-->
<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<!-- include summernote css/js -->

	<link rel="stylesheet" href="http://192.168.10.225/html_prj/common/css/main.css" type="text/css" media="all" />
	<link rel="stylesheet" href="http://192.168.10.225/html_prj/common/css/board.css" type="text/css" media="all" />


	<!-- include summernote css/js -->
	<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
	<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/lang/summernote-ko-KR.min.js"></script>
	
	<style type="text/css">

	</style>
	<script type="text/javascript">
		$(function () {
			$('#summernote').summernote({
				height: 300,
				width: 600,
				focus: true,
				lang: 'ko-KR',
				toolbar: [
						    // [groupName, [list of button]]
						    ['style', ['bold', 'clear']],
						    ['font', ['strikethrough', 'superscript', 'subscript']],
						    ['fontsize', ['fontsize']],
						    ['para', ['ul', 'ol']],
						    ['table', ['table']],
						  	['insert', [ 'picture']],
						  	['view', ['fullscreen', 'codeview', 'help']],
						  ]
			});//summernote
		});//ready
	</script>
</head>

<body>
	<form method="post">
		<textarea id="summernote" name="ta"></textarea>
		<input type="button" value="작성완료" class="btn btn-dark"/>
		<input type="button" value="취소" class="btn btn-light" />
	</form>
</body>

</html>