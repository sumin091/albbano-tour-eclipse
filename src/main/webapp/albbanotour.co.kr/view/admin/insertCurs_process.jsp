<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="java.io.File"%>
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
    <% request.setCharacterEncoding("UTF-8"); %>
    <jsp:useBean id="curVO" class="vo.CourseManagementVO" scope="page"/>
    <jsp:setProperty property="*" name="curVO"/>
<div>
<!-- 값 받는거 확인까지만 해둠  -->
<%
//1. 업로드 된 파일이 저장 될 폴더를 얻기
File saveDir = new File("C:/dev/albbano-tour-eclipse/src/main/webapp/upload");

//2.업로드 파일의 크기 설정(5MByte) -크게 설정.
int maxSize =1024*1024*100;

try{
	
//3. 업로드 컴포넌트(cos.jar)를 생성 (파일이 업로드 된다.)
MultipartRequest mr = new MultipartRequest(request, saveDir.getAbsolutePath(),
		maxSize,"UTF-8", new DefaultFileRenamePolicy());

//4. 파라메터를 받을 때에는 업로드 컴포넌트를 사용한다.
//원본 파일명 :중복 파일명이 있더라도 원본의 이름이 반환.
String originName = mr.getOriginalFileName("upFile");
//새로운 파일명 : 중복 파일명이 있다면 새롭게 변경 된 이름이 반환
String newName = mr.getFilesystemName("upFile");

int limitSize =1024*1024*5;
File readFile = new File(saveDir.getAbsolutePath()+"/"+newName);
boolean flag = false;
if(readFile.length()>limitSize){
	flag =true;
	readFile.delete();
}//end if
if(!flag){
}else{
	out.println("파일은 5MByte까지만 가능합니다.");
}//end else
%>
    <%
    
    //curVO.setImgName(newName);
    //out.println(newName);
    String crsCode= mr.getParameter("crsCode");
    String crsName= mr.getParameter("crsName");
    String crsDesc= mr.getParameter("crsDesc");
    String imgName=  mr.getParameter("imgName");
    int fare =Integer.parseInt(mr.getParameter("fare"));
    
    curVO.setCrsCode(crsCode);
    curVO.setCrsName(crsName);
    curVO.setCrsDesc(crsDesc);
    curVO.setImgName(imgName);
    curVO.setFare(fare);
    String[] crsSpotsArray = mr.getParameterValues("spotValues");

    List<String> crsSpotsList = new ArrayList<>();
    if (crsSpotsArray != null) {
        for (String spot : crsSpotsArray) {
            String[] spots = spot.split(",");
            for (String s : spots) {
                crsSpotsList.add(s.trim());
            }
        }
    }
    String[] crsSpots = crsSpotsList.toArray(new String[5]);

    curVO.setCrsSpots(crsSpots);
    out.println(curVO.toString());
    CourseManagementDAO cDAO = CourseManagementDAO.getInstance();
    cDAO.insertCurs(curVO);

    for (int i = 0; i < 5; i++) {
   cDAO.insertTourCurs(curVO.getCrsCode(), crsSpots[i],i+1);
    }
}catch(Exception e){
	e.printStackTrace();
}

    %>
    
</div>
</body>
</html>