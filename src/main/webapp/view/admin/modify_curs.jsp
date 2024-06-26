<%@page import="vo.CourseManagementVO"%>
<%@page import="vo.SpotListVO"%>
<%@page import="java.util.List"%>
<%@page import="dao.CourseManagementDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
     info=""%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>

<%
request.setCharacterEncoding("UTF-8");
CourseManagementDAO cmDAO = CourseManagementDAO.getInstance();
List<SpotListVO> list = cmDAO.selectAllSpotNames();
pageContext.setAttribute("list", list);

String crsCode= (String)request.getParameter("crsCode");
CourseManagementDAO cDAO = CourseManagementDAO.getInstance();
CourseManagementVO cVO= cDAO.selectCourseDetail(crsCode);
String spots = cDAO.selectAdminDetailSpot(crsCode);
pageContext.setAttribute("cVO", cVO);
pageContext.setAttribute("spots", spots);

%>
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
	var rowCount = 0; // 추가된 행의 개수를 추적하기 위한 변수

    function addSpotToList(spotCode) {
        var isDuplicate = false;

        $(".spotList td").each(function() {
            if ($(this).text() === spotCode) {
                isDuplicate = true;
                return false; // 중복이 발견되면 강제 반복 종료
            }});
        if (isDuplicate) {
            alert("중복된 값이 이미 추가되었습니다.");
            return;
        }
        var currentRowCount = $(".spotList tr").length;

        var maxRowCount = 5;

        if (currentRowCount >= maxRowCount) {
            alert("최대 5개까지만 추가할 수 있습니다.");
            return;
        }

        var newRow = $("<tr>").attr("id", "row_" + rowCount).append($("<td>").text(spotCode));
        $(".spotList").append(newRow);

        rowCount++;
    }
	
    function resetTable() {
        $(".spotList tr").remove();
        rowCount = 0;
    }
    
    function sendToProcessPage() {
        var form = document.createElement("form");
        form.setAttribute("method", "post"); 
        form.setAttribute("action", "modifyCurs_process.jsp");
        

        
        addInputToForm(form, "crsCode", $("input[name='crsCode']").val());
        addInputToForm(form, "crsName", $("input[name='crsName']").val());
        addInputToForm(form, "crsDesc", $("input[name='crsDesc']").val());
        addInputToForm(form, "fare", $("input[name='fare']").val());
        
        var spotValues = [];
        $(".spotList td").each(function() {
            spotValues.push($(this).text());
        });
        addInputToForm(form, "spotValues", spotValues.join(","));

        document.body.appendChild(form);
    	 var currentRowCount = $(".spotList tr").length;

         var maxRowCount = 5;
         var flag =false;
         if(currentRowCount!=maxRowCount){
        	 flag = true;
        	 alert("관광지의 개수는 5개가 모두 선택되어야 합니다.")
        	 return;
         }
        form.submit();
        
    }
    function addInputToForm(form, name, value) {
        var input = document.createElement("input");
        input.setAttribute("type", "hidden");
        input.setAttribute("name", name);
        input.setAttribute("value", value);
        form.appendChild(input);
    }
    function addInputToForm1(form, id, value) {
        var input = document.createElement("input");
        input.setAttribute("type", "hidden");
        input.setAttribute("id", id);
        input.setAttribute("value", value);
        form.appendChild(input);
    }
</script>
</head>
<body>
<div> 
<h3>투어 수정</h3>
</div>
<form>
<div>
<table>
<thead>
<tr>
<th>코스코드</th>
<th>코스이름</th>
<th>코스설명</th>
<th>코스 요금</th>
<th>해당 코스 관광지</th>
</tr>
</thead>
<tbody>
<tr>
<td><input type="text" value="${ cVO.crsCode}" name ="crsCode"/></td>
<td><input type="text" value="${ cVO.crsName}" name ="crsName"/></td>
<td><input type="text"  name ="crsDesc" value="${ cVO.crsDesc}" /></td>
<td><input type="text" value="${ cVO.fare}" name ="fare"/></td>
<td>코스 관광지 : 
        <select id="spotSelect" name="crsSpots"> 
            <c:forEach var="spt" items="${list}">
                <option value="${spt.spot_code}">${spt.spot_name}</option>
            </c:forEach>
        </select>
        <input type="button" value="추가" onclick="addSpotToList($('#spotSelect').val())"/>
   </tr>
</tbody>
</table>
</div>
<div>
선택 된 관광지 리스트
<table class="spotList">
</table>
<input type="button" onclick="resetTable()" value="테이블 리셋"/> 
</div>
<div>
<input type="button" onclick="sendToProcessPage()" value="코스 수정">
</div>
</form>
   
