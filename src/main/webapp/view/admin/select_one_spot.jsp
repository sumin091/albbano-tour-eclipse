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
<!--jQuery CDN 시작-->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<!--jQuery CDN 끝-->
<style type="text/css">
	
</style>
<script type ="text/javascript">
function submitModify(spot_code) {
	var form = document.createElement('form');
	form.method = 'POST';
	form.action = 'modify_spot.jsp';

	var input = document.createElement('input');
	input.type = 'hidden';
	input.name = 'spot_code';
	input.value = spot_code;

	form.appendChild(input);
	document.body.appendChild(form);
	form.submit();
	}
function submitDelete(spot_code) {
	var form = document.createElement('form');
	form.method = 'POST';
	form.action = 'delete_spot.jsp';

	var input = document.createElement('input');
	input.type = 'hidden';
	input.name = 'spot_code';
	input.value = spot_code;

	form.appendChild(input);
	document.body.appendChild(form);
	form.submit();
	}
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
<form >
<div id="wrap">
<div id ="left" style="float: left">
<jsp:include page ="design1.jsp"/>
</div>
<div style="margin-top: 100px; padding: 50px" class="_payment-table-container_2hrxu_23"data-testid="paymnet-history-table-container">
	<table  style="table-layout: fixed ;width: 100%" data-testid="table"class="_table_2bzgi_1 _fullWidth_2bzgi_5 _payment-table_8ouzs_4"
								aria-live="polite" aria-busy="false">
<thead data-testid="tableHead"class=" _payment-table-head_8ouzs_8">
<tr data-testid="payment-info-row-header"class="_tableRow_1tqkb_4 _table-direction--vertical_1tqkb_10   _payment-info-row-header_8ouzs_29 _payment-table-header-row_2hrxu_38">
<th style="width: 80%;" data-testid="payment-status-column-header"class="_tableCell_1fpie_7 _align--center_1fpie_217 _variant--head--vertical--normal_1fpie_19 _font--pretendard_1fpie_24 _column-status_1lui6_10 _column_1lui6_4"><span
		class="_typography_1uzvq_4 _font--pretendard_1uzvq_9 _type--b3_1uzvq_40 _weight--bold_1uzvq_84 "
		data-testid="typography">관광지 상세
		</span></th>
</tr>
</thead>
<tbody>
<tr data-testid="payment-info-row" class="_tableRow_1tqkb_4 _table-direction--vertical_1tqkb_10   _payment-table-row_8ouzs_17 ">
<td style="text-align: left" data-testid="iamport-merchant-id-column"class="_tableCell_1fpie_7 _align--center_1fpie_217 _variant--body--vertical--normal_1fpie_104 _font--pretendard_1fpie_24 _column-iamport-merchant-id_1lui6_19 _column_1lui6_4"><div class="_container_1aijn_7">
	<span>관광지 코드 :${ sVO.spot_code }</span></div></td></tr>
<tr data-testid="payment-info-row" class="_tableRow_1tqkb_4 _table-direction--vertical_1tqkb_10   _payment-table-row_8ouzs_17 ">
<td  style="text-align: left"  data-testid="iamport-merchant-id-column"class="_tableCell_1fpie_7 _align--center_1fpie_217 _variant--body--vertical--normal_1fpie_104 _font--pretendard_1fpie_24 _column-iamport-merchant-id_1lui6_19 _column_1lui6_4"><div class="_container_1aijn_7">
	<span>관광지 이름 :${ sVO.spot_name }</span></div></td></tr>
<tr data-testid="payment-info-row" class="_tableRow_1tqkb_4 _table-direction--vertical_1tqkb_10   _payment-table-row_8ouzs_17 ">
<td style="text-align: left"  data-testid="iamport-merchant-id-column"class="_tableCell_1fpie_7 _align--center_1fpie_217 _variant--body--vertical--normal_1fpie_104 _font--pretendard_1fpie_24 _column-iamport-merchant-id_1lui6_19 _column_1lui6_4"><div class="_container_1aijn_7">
	<span>관광지 설명: ${ sVO.spot_desc }</span></div></td></tr>
<tr data-testid="payment-info-row" class="_tableRow_1tqkb_4 _table-direction--vertical_1tqkb_10   _payment-table-row_8ouzs_17 ">
<td style="text-align: left"  data-testid="iamport-merchant-id-column"class="_tableCell_1fpie_7 _align--center_1fpie_217 _variant--body--vertical--normal_1fpie_104 _font--pretendard_1fpie_24 _column-iamport-merchant-id_1lui6_19 _column_1lui6_4"><div class="_container_1aijn_7">
	<span>관광지 이미지<img src ="http://127.0.0.1/upload/${ sVO.img_name }" width="200px" height="200px"/></span></div></td></tr>
<tr data-testid="payment-info-row" class="_tableRow_1tqkb_4 _table-direction--vertical_1tqkb_10   _payment-table-row_8ouzs_17 ">
<td style="text-align: left"  data-testid="iamport-merchant-id-column"class="_tableCell_1fpie_7 _align--center_1fpie_217 _variant--body--vertical--normal_1fpie_104 _font--pretendard_1fpie_24 _column-iamport-merchant-id_1lui6_19 _column_1lui6_4"><div class="_container_1aijn_7">
	<span>관광지 경도 : ${ sVO.longitude }</span></div></td></tr>
<tr data-testid="payment-info-row" class="_tableRow_1tqkb_4 _table-direction--vertical_1tqkb_10   _payment-table-row_8ouzs_17 ">
<td style="text-align: left"  data-testid="iamport-merchant-id-column"class="_tableCell_1fpie_7 _align--center_1fpie_217 _variant--body--vertical--normal_1fpie_104 _font--pretendard_1fpie_24 _column-iamport-merchant-id_1lui6_19 _column_1lui6_4"><div class="_container_1aijn_7">
	<span>관광지 위도 : ${ sVO.latitude }</span></div></td></tr>
<tr data-testid="payment-info-row" class="_tableRow_1tqkb_4 _table-direction--vertical_1tqkb_10   _payment-table-row_8ouzs_17 ">
<td style="text-align: left"  data-testid="iamport-merchant-id-column"class="_tableCell_1fpie_7 _align--center_1fpie_217 _variant--body--vertical--normal_1fpie_104 _font--pretendard_1fpie_24 _column-iamport-merchant-id_1lui6_19 _column_1lui6_4"><div class="_container_1aijn_7">
	<span>관광지 위치 : ${ sVO.spt_loc }</span></div></td></tr>
</table>
</div>
</div>
</form>
<input type ="button" value ="관광지 수정" onclick="submitModify('${sVO.spot_code}')"/>
<input type ="button" value ="관광지 삭제" onclick="submitDelete('${sVO.spot_code}')"/>
</body>
</html>