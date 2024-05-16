<%@page import="vo.SpotListVO"%>
<%@page import="dao.SpotManagementDAO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
     info=""%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="http://127.0.0.1/front_util/css/index.css">

<title>관광지 관리</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<style type="text/css">

</style>
<script type ="text/javascript">
function submitForm(spot_code) {
var form = document.createElement('form');
form.method = 'POST';
form.action = 'select_one_spot.jsp';

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
<div id="wrap">
<div id ="left" style="float: left">
<jsp:include page ="design1.jsp"/>
</div>
<%
SpotManagementDAO sDAO = SpotManagementDAO.getInstance();
List<SpotListVO> sList = new ArrayList<SpotListVO>();
sList = sDAO.selectAlSpot();
pageContext.setAttribute("sList", sList);
%>
<div class="_payment-table-container_2hrxu_23"
							data-testid="paymnet-history-table-container">
							<table style="table-layout: fixed ;width: 100%" data-testid="table"
								class="_table_2bzgi_1 _fullWidth_2bzgi_5 _payment-table_8ouzs_4"
								aria-live="polite" aria-busy="false">
<thead data-testid="tableHead"
									class=" _payment-table-head_8ouzs_8">
<tr data-testid="payment-info-row-header"class="_tableRow_1tqkb_4 _table-direction--vertical_1tqkb_10   _payment-info-row-header_8ouzs_29 _payment-table-header-row_2hrxu_38">
	<th style="width: 5%" data-testid="payment-status-column-header"class="_tableCell_1fpie_7 _align--center_1fpie_217 _variant--head--vertical--normal_1fpie_19 _font--pretendard_1fpie_24 _column-status_1lui6_10 _column_1lui6_4"><span
		class="_typography_1uzvq_4 _font--pretendard_1uzvq_9 _type--b3_1uzvq_40 _weight--bold_1uzvq_84 "
		data-testid="typography">번호</span></th>
										<th style="width: 5%" data-testid="iamport-merchant-id-column-header"
											class="_tableCell_1fpie_7 _align--center_1fpie_217 _variant--head--vertical--normal_1fpie_19 _font--pretendard_1fpie_24 _column-iamport-merchant-id_1lui6_19 _column_1lui6_4"><span
											class="_typography_1uzvq_4 _font--pretendard_1uzvq_9 _type--b3_1uzvq_40 _weight--bold_1uzvq_84 "
											data-testid="typography">관광지 코드</span></th>
										<th style="width: 10%"  data-testid="order-name-column-header"
											class="_tableCell_1fpie_7 _align--center_1fpie_217 _variant--head--vertical--normal_1fpie_19 _font--pretendard_1fpie_24 _column-order-name_1lui6_22 _column_1lui6_4"><span
											class="_typography_1uzvq_4 _font--pretendard_1uzvq_9 _type--b3_1uzvq_40 _weight--bold_1uzvq_84 "
											data-testid="typography">관광지 이름</span></th>
										<th style="width: 50%"  data-testid="buyer-column-header"
											class="_tableCell_1fpie_7 _align--center_1fpie_217 _variant--head--vertical--normal_1fpie_19 _font--pretendard_1fpie_24 _column-buyer_1lui6_26 _column_1lui6_4"><span
											class="_typography_1uzvq_4 _font--pretendard_1uzvq_9 _type--b3_1uzvq_40 _weight--bold_1uzvq_84 "
											data-testid="typography">관광지 설명</span></th>
										<th style="width: 7% ; text-align: center;" data-testid="buyer-person-header"
											class="_tableCell_1fpie_7 _align--center_1fpie_217 _variant--head--vertical--normal_1fpie_19 _font--pretendard_1fpie_24 _column-buyer_1lui6_26 _column_1lui6_4"><span
											class="_typography_1uzvq_4 _font--pretendard_1uzvq_9 _type--b3_1uzvq_40 _weight--bold_1uzvq_84 "
											data-testid="typography">이미지</span></th>
										<th style="width: 10%" data-testid="cancel-payment-column-header"
											class="_tableCell_1fpie_7 _align--center_1fpie_217 _variant--head--vertical--normal_1fpie_19 _font--pretendard_1fpie_24 _column-cancel-payment_1lui6_50 _column_1lui6_4">
											위치</th>
										
									</tr>
</thead>
<tbody data-testid="tableBody"class=" _payment-table-body_8ouzs_13">
<c:forEach var ="spt" items="${sList}" varStatus="i">
<tr height="300px" data-testid="payment-info-row" class="_tableRow_1tqkb_4 _table-direction--vertical_1tqkb_10   _payment-table-row_8ouzs_17 ">
	<td data-testid="payment-status-column"
											class="_tableCell_1fpie_7 _align--center_1fpie_217 _variant--body--vertical--normal_1fpie_104 _font--pretendard_1fpie_24 _column-status_1lui6_10 _column_1lui6_4"><span
											class="_tag_vwbjt_7 _variant--text-normal_vwbjt_13 _color--red_vwbjt_74 _fill--solid_vwbjt_38 "
											data-testid="tag"><c:out value ="${ i.count }"/> </span></td>
	<td data-testid="iamport-merchant-id-column"
											class="_tableCell_1fpie_7 _align--center_1fpie_217 _variant--body--vertical--normal_1fpie_104 _font--pretendard_1fpie_24 _column-iamport-merchant-id_1lui6_19 _column_1lui6_4"><div
												class="_container_1aijn_7">
												<span><c:out value ="${ spt.spot_code }"/></span>
											</div></td>
	<td onclick="submitForm('${spt.spot_code}')" data-testid="iamport-merchant-id-column"
											class="_tableCell_1fpie_7 _align--center_1fpie_217 _variant--body--vertical--normal_1fpie_104 _font--pretendard_1fpie_24 _column-iamport-merchant-id_1lui6_19 _column_1lui6_4"><div
												class="_container_1aijn_7">
												<span><c:out value ="${spt.spot_name}"/></span>
											</div></td>
	<td style="text-align: left" data-testid="iamport-merchant-id-column" class="_tableCell_1fpie_7 _align--center_1fpie_217 _variant--body--vertical--normal_1fpie_104 _font--pretendard_1fpie_24 _column-iamport-merchant-id_1lui6_19 _column_1lui6_4"><div
												class="_container_1aijn_7">
												<span><c:out value ="${ spt.spot_desc }"/></span>
											</div></td>
	<td data-testid="iamport-merchant-id-column" class="_tableCell_1fpie_7 _align--center_1fpie_217 _variant--body--vertical--normal_1fpie_104 _font--pretendard_1fpie_24 _column-iamport-merchant-id_1lui6_19 _column_1lui6_4"><div
												class="_container_1aijn_7">
												<span><img src ="http://127.0.0.1/upload/${ spt.img_name }" width="100px" height="100px" style="text-align: center;"/></span>
											</div></td>
	<td data-testid="iamport-merchant-id-column" class="_tableCell_1fpie_7 _align--center_1fpie_217 _variant--body--vertical--normal_1fpie_104 _font--pretendard_1fpie_24 _column-iamport-merchant-id_1lui6_19 _column_1lui6_4"><div
												class="_container_1aijn_7">
												<span><c:out value ="${ spt.spt_loc }"/></span>
											</div></td>
</tr>
</c:forEach>
</tbody>
<tfoot>
</tfoot>
</table>
<div>
<a href ="insertSpot.jsp"> 관광지 추가</a>
</div>
</div>
</div>
</body>
</html>