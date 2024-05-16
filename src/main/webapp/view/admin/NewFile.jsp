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
<link rel="stylesheet" type="text/css" href="http://127.0.0.1/front_util/css/index.css">
<style type="text/css">
	
	
</style>
<script type ="text/javascript">
	$(function(){
	
	});//ready
</script>
</head>
<body>
<div>
<div class="_payment-table-container_2hrxu_23"
							data-testid="paymnet-history-table-container">
							<table data-testid="table"
								class="_table_2bzgi_1 _fullWidth_2bzgi_5 _payment-table_8ouzs_4"
								aria-live="polite" aria-busy="false">
								<thead data-testid="tableHead"
									class=" _payment-table-head_8ouzs_8">
									<tr data-testid="payment-info-row-header"
										class="_tableRow_1tqkb_4 _table-direction--vertical_1tqkb_10   _payment-info-row-header_8ouzs_29 _payment-table-header-row_2hrxu_38">
										<th data-testid="payment-status-column-header"
											class="_tableCell_1fpie_7 _align--center_1fpie_217 _variant--head--vertical--normal_1fpie_19 _font--pretendard_1fpie_24 _column-status_1lui6_10 _column_1lui6_4"><span
											class="_typography_1uzvq_4 _font--pretendard_1uzvq_9 _type--b3_1uzvq_40 _weight--bold_1uzvq_84 "
											data-testid="typography">결제상태</span></th>
										<th data-testid="iamport-merchant-id-column-header"
											class="_tableCell_1fpie_7 _align--center_1fpie_217 _variant--head--vertical--normal_1fpie_19 _font--pretendard_1fpie_24 _column-iamport-merchant-id_1lui6_19 _column_1lui6_4"><span
											class="_typography_1uzvq_4 _font--pretendard_1uzvq_9 _type--b3_1uzvq_40 _weight--bold_1uzvq_84 "
											data-testid="typography">예약번호</span></th>
										<th data-testid="order-name-column-header"
											class="_tableCell_1fpie_7 _align--center_1fpie_217 _variant--head--vertical--normal_1fpie_19 _font--pretendard_1fpie_24 _column-order-name_1lui6_22 _column_1lui6_4"><span
											class="_typography_1uzvq_4 _font--pretendard_1uzvq_9 _type--b3_1uzvq_40 _weight--bold_1uzvq_84 "
											data-testid="typography">주문명</span></th>
										<th data-testid="buyer-column-header"
											class="_tableCell_1fpie_7 _align--center_1fpie_217 _variant--head--vertical--normal_1fpie_19 _font--pretendard_1fpie_24 _column-buyer_1lui6_26 _column_1lui6_4"><span
											class="_typography_1uzvq_4 _font--pretendard_1uzvq_9 _type--b3_1uzvq_40 _weight--bold_1uzvq_84 "
											data-testid="typography">고객ID</span></th>
										<th data-testid="buyer-person-header"
											class="_tableCell_1fpie_7 _align--center_1fpie_217 _variant--head--vertical--normal_1fpie_19 _font--pretendard_1fpie_24 _column-buyer_1lui6_26 _column_1lui6_4"><span
											class="_typography_1uzvq_4 _font--pretendard_1uzvq_9 _type--b3_1uzvq_40 _weight--bold_1uzvq_84 "
											data-testid="typography">인원</span></th>
										<th data-testid="payment-amount-column-header"
											class="_tableCell_1fpie_7 _align--center_1fpie_217 _variant--head--vertical--normal_1fpie_19 _font--pretendard_1fpie_24 _column-amount_1lui6_36 _column_1lui6_4"><span
											class="_typography_1uzvq_4 _font--pretendard_1uzvq_9 _type--b3_1uzvq_40 _weight--bold_1uzvq_84 "
											data-testid="typography">결제금액</span></th>
										<th data-testid="event-time-column-header"
											class="_tableCell_1fpie_7 _align--center_1fpie_217 _variant--head--vertical--normal_1fpie_19 _font--pretendard_1fpie_24 _column-event-time_1lui6_43 _column-event-time-header_1lui6_47 _column_1lui6_4">
											승인 시각</th>
										<th data-testid="cancel-payment-column-header"
											class="_tableCell_1fpie_7 _align--center_1fpie_217 _variant--head--vertical--normal_1fpie_19 _font--pretendard_1fpie_24 _column-cancel-payment_1lui6_50 _column_1lui6_4"></th>
										
									</tr>
								</thead>
								<tbody data-testid="tableBody"
									class=" _payment-table-body_8ouzs_13">
									<tr data-testid="date-row"
										class="_tableRow_1tqkb_4 _table-direction--vertical_1tqkb_10   _date-row_8027u_4 _started-date-row_8ouzs_23 _payment-table-date-row_2hrxu_43">
										<td data-testid="tableCell"
											class="_tableCell_1fpie_7 _align--center_1fpie_217 _variant--body--vertical--normal_1fpie_104 _font--pretendard_1fpie_24 _date-cell_8027u_10"></td>
										<td data-testid="tableCell"
											class="_tableCell_1fpie_7 _align--center_1fpie_217 _variant--body--vertical--normal_1fpie_104 _font--pretendard_1fpie_24 _date-cell_8027u_10"></td>
										<td data-testid="tableCell"
											class="_tableCell_1fpie_7 _align--center_1fpie_217 _variant--body--vertical--normal_1fpie_104 _font--pretendard_1fpie_24 _date-cell_8027u_10"></td>
										<td data-testid="tableCell"
											class="_tableCell_1fpie_7 _align--center_1fpie_217 _variant--body--vertical--normal_1fpie_104 _font--pretendard_1fpie_24 _date-cell_8027u_10"></td>
										<td data-testid="tableCell"
											class="_tableCell_1fpie_7 _align--center_1fpie_217 _variant--body--vertical--normal_1fpie_104 _font--pretendard_1fpie_24 _date-cell_8027u_10"></td>
										<td data-testid="tableCell"
											class="_tableCell_1fpie_7 _align--center_1fpie_217 _variant--body--vertical--normal_1fpie_104 _font--pretendard_1fpie_24 _date-cell_8027u_10"></td>
										<td data-testid="tableCell"
											class="_tableCell_1fpie_7 _align--center_1fpie_217 _variant--body--vertical--normal_1fpie_104 _font--pretendard_1fpie_24 _date-cell_8027u_10"><span
											class="_tag_vwbjt_7 _variant--number_vwbjt_26 _color--black_vwbjt_38 _fill--solid_vwbjt_38 _date-tag_8027u_19"
											data-testid="date-tag">2024.05.14</span></td>
									</tr>
									<tr data-testid="payment-info-row"
										class="_tableRow_1tqkb_4 _table-direction--vertical_1tqkb_10   _payment-table-row_8ouzs_17 ">
										<td data-testid="payment-status-column"
											class="_tableCell_1fpie_7 _align--center_1fpie_217 _variant--body--vertical--normal_1fpie_104 _font--pretendard_1fpie_24 _column-status_1lui6_10 _column_1lui6_4"><span
											class="_tag_vwbjt_7 _variant--text-normal_vwbjt_13 _color--red_vwbjt_74 _fill--solid_vwbjt_38 "
											data-testid="tag">결제취소</span></td>
										<td data-testid="iamport-merchant-id-column"
											class="_tableCell_1fpie_7 _align--center_1fpie_217 _variant--body--vertical--normal_1fpie_104 _font--pretendard_1fpie_24 _column-iamport-merchant-id_1lui6_19 _column_1lui6_4"><div
												class="_container_1aijn_7">
												<span>RESV_00005</span>
											</div></td>
										<td data-testid="order-name-column"
											class="_tableCell_1fpie_7 _align--center_1fpie_217 _variant--body--vertical--normal_1fpie_104 _font--pretendard_1fpie_24 _column-order-name_1lui6_22 _column_1lui6_4"><span
											class="_ellipsis-two-line_a7yez_1">알빠노-가출투어</span></td>
										<td data-testid="buyer-column"
											class="_tableCell_1fpie_7 _align--center_1fpie_217 _variant--body--vertical--normal_1fpie_104 _font--pretendard_1fpie_24 _column-buyer_1lui6_26 _column_1lui6_4"><span
											class="_ellipsis-two-line_a7yez_1" data-testid="buyer-info">감자탕</span></td>
										<td data-testid="buyer-person-column"
											class="_tableCell_1fpie_7 _align--center_1fpie_217 _variant--body--vertical--normal_1fpie_104 _font--pretendard_1fpie_24 _column-buyer_1lui6_26 _column_1lui6_4">
											<div class="_wrapper_39jul_7">	
												<span class="_container_t52sn_7" data-testid="amount-content">
												<span class="_amount_t52sn_13 ">1</span>
												<span class="_currency_t52sn_35">명</span>
												</span>
											</div>
											</td>
										<td data-testid="payment-amount-column"
											class="_tableCell_1fpie_7 _align--center_1fpie_217 _variant--body--vertical--normal_1fpie_104 _font--pretendard_1fpie_24 _column-amount_1lui6_36 _column_1lui6_4">
											<div class="_wrapper_39jul_7">
												<span class="_container_t52sn_7" data-testid="amount-content">
												<span class="_amount_t52sn_13 ">100</span>
												<span class="_currency_t52sn_35">KRW</span>
												</span>
											</div>
										</td>
										
										<td data-testid="event-time-column"
											class="_tableCell_1fpie_7 _align--center_1fpie_217 _variant--body--vertical--normal_1fpie_104 _font--pretendard_1fpie_24 _column-event-time_1lui6_43 _column_1lui6_4"><span
											class="_typography_1uzvq_4 _font--gotham_1uzvq_12 _type--b2_1uzvq_36 _weight--regular_1uzvq_87 "
											data-testid="typography">17:15:25</span></td>
										<td data-testid="cancel-payment-column"
											class="_tableCell_1fpie_7 _align--center_1fpie_217 _variant--body--vertical--normal_1fpie_104 _font--pretendard_1fpie_24  _column_1lui6_4"><span
											class="_cancel-text_1h0fb_7">취소</span></td>
									</tr>
									<tr data-testid="payment-info-row"
										class="_tableRow_1tqkb_4 _table-direction--vertical_1tqkb_10   _payment-table-row_8ouzs_17 ">
										<td data-testid="payment-status-column"
											class="_tableCell_1fpie_7 _align--center_1fpie_217 _variant--body--vertical--normal_1fpie_104 _font--pretendard_1fpie_24 _column-status_1lui6_10 _column_1lui6_4"><span
											class="_tag_vwbjt_7 _variant--text-normal_vwbjt_13 _color--grey_vwbjt_47 _fill--solid_vwbjt_38 "
											data-testid="tag">결제실패</span></td>
										<td data-testid="iamport-merchant-id-column"
											class="_tableCell_1fpie_7 _align--center_1fpie_217 _variant--body--vertical--normal_1fpie_104 _font--pretendard_1fpie_24 _column-iamport-merchant-id_1lui6_19 _column_1lui6_4"><div
												class="_container_1aijn_7">
												<span>RESV_00004</span>
											</div></td>
										<td data-testid="order-name-column"
											class="_tableCell_1fpie_7 _align--center_1fpie_217 _variant--body--vertical--normal_1fpie_104 _font--pretendard_1fpie_24 _column-order-name_1lui6_22 _column_1lui6_4"><span
											class="_ellipsis-two-line_a7yez_1">알빠노-출가투어</span></td>
										<td data-testid="buyer-column"
											class="_tableCell_1fpie_7 _align--center_1fpie_217 _variant--body--vertical--normal_1fpie_104 _font--pretendard_1fpie_24 _column-buyer_1lui6_26 _column_1lui6_4"><span
											class="_ellipsis-two-line_a7yez_1" data-testid="buyer-info">참치스님</span></td>
										
										<td data-testid="buyer-person-column"
											class="_tableCell_1fpie_7 _align--center_1fpie_217 _variant--body--vertical--normal_1fpie_104 _font--pretendard_1fpie_24 _column-buyer_1lui6_26 _column_1lui6_4">
											<div class="_wrapper_39jul_7">	
												<span class="_container_t52sn_7" data-testid="amount-content">
												<span class="_amount_t52sn_13 ">1</span>
												<span class="_currency_t52sn_35">명</span>
												</span>
											</div>
											</td>
										<td data-testid="payment-amount-column"
											class="_tableCell_1fpie_7 _align--center_1fpie_217 _variant--body--vertical--normal_1fpie_104 _font--pretendard_1fpie_24 _column-amount_1lui6_36 _column_1lui6_4">
											<div class="_wrapper_39jul_7">
												<span class="_container_t52sn_7" data-testid="amount-content">
												<span class="_amount_t52sn_13 ">100</span>
												<span class="_currency_t52sn_35">KRW</span>
												</span>
											</div>
										</td>
										
										<td data-testid="event-time-column"
											class="_tableCell_1fpie_7 _align--center_1fpie_217 _variant--body--vertical--normal_1fpie_104 _font--pretendard_1fpie_24 _column-event-time_1lui6_43 _column_1lui6_4"><span
											class="_typography_1uzvq_4 _font--gotham_1uzvq_12 _type--b2_1uzvq_36 _weight--regular_1uzvq_87 "
											data-testid="typography">17:12:24</span></td>
										<td data-testid="cancel-payment-column"
											class="_tableCell_1fpie_7 _align--center_1fpie_217 _variant--body--vertical--normal_1fpie_104 _font--pretendard_1fpie_24  _column_1lui6_4"><span
											class="_cancel-text_1h0fb_7">취소</span></td>
										
									</tr>
									<tr data-testid="payment-info-row"
										class="_tableRow_1tqkb_4 _table-direction--vertical_1tqkb_10   _payment-table-row_8ouzs_17 ">
										<td data-testid="payment-status-column"
											class="_tableCell_1fpie_7 _align--center_1fpie_217 _variant--body--vertical--normal_1fpie_104 _font--pretendard_1fpie_24 _column-status_1lui6_10 _column_1lui6_4"><span
											class="_tag_vwbjt_7 _variant--text-normal_vwbjt_13 _color--green_vwbjt_83 _fill--solid_vwbjt_38 "
											data-testid="tag">결제완료</span></td>
										<td data-testid="iamport-merchant-id-column"
											class="_tableCell_1fpie_7 _align--center_1fpie_217 _variant--body--vertical--normal_1fpie_104 _font--pretendard_1fpie_24 _column-iamport-merchant-id_1lui6_19 _column_1lui6_4"><div
												class="_container_1aijn_7">
												<span>RESV_00003</span>
											</div></td>
										<td data-testid="order-name-column"
											class="_tableCell_1fpie_7 _align--center_1fpie_217 _variant--body--vertical--normal_1fpie_104 _font--pretendard_1fpie_24 _column-order-name_1lui6_22 _column_1lui6_4"><span
											class="_ellipsis-two-line_a7yez_1">알빠노-동해안투어</span></td>
										<td data-testid="buyer-column"
											class="_tableCell_1fpie_7 _align--center_1fpie_217 _variant--body--vertical--normal_1fpie_104 _font--pretendard_1fpie_24 _column-buyer_1lui6_26 _column_1lui6_4"><span
											class="_ellipsis-two-line_a7yez_1" data-testid="buyer-info">제육볶음</span></td>
										
										<td data-testid="buyer-person-column"
											class="_tableCell_1fpie_7 _align--center_1fpie_217 _variant--body--vertical--normal_1fpie_104 _font--pretendard_1fpie_24 _column-buyer_1lui6_26 _column_1lui6_4">
											<div class="_wrapper_39jul_7">	
												<span class="_container_t52sn_7" data-testid="amount-content">
												<span class="_amount_t52sn_13 ">1</span>
												<span class="_currency_t52sn_35">명</span>
												</span>
											</div>
											</td>
										<td data-testid="payment-amount-column"
											class="_tableCell_1fpie_7 _align--center_1fpie_217 _variant--body--vertical--normal_1fpie_104 _font--pretendard_1fpie_24 _column-amount_1lui6_36 _column_1lui6_4">
											<div class="_wrapper_39jul_7">
												<span class="_container_t52sn_7" data-testid="amount-content">
												<span class="_amount_t52sn_13 ">100</span>
												<span class="_currency_t52sn_35">KRW</span>
												</span>
											</div>
										</td>
										
										<td data-testid="event-time-column"
											class="_tableCell_1fpie_7 _align--center_1fpie_217 _variant--body--vertical--normal_1fpie_104 _font--pretendard_1fpie_24 _column-event-time_1lui6_43 _column_1lui6_4"><span
											class="_typography_1uzvq_4 _font--gotham_1uzvq_12 _type--b2_1uzvq_36 _weight--regular_1uzvq_87 "
											data-testid="typography">17:10:17</span></td>
										<td data-testid="cancel-payment-column"
											class="_tableCell_1fpie_7 _align--center_1fpie_217 _variant--body--vertical--normal_1fpie_104 _font--pretendard_1fpie_24  _column_1lui6_4"><span
											class="_cancel-text_1h0fb_7">취소</span></td>
										
									</tr>
									<tr data-testid="payment-info-row"
										class="_tableRow_1tqkb_4 _table-direction--vertical_1tqkb_10   _payment-table-row_8ouzs_17 ">
										<td data-testid="payment-status-column"
											class="_tableCell_1fpie_7 _align--center_1fpie_217 _variant--body--vertical--normal_1fpie_104 _font--pretendard_1fpie_24 _column-status_1lui6_10 _column_1lui6_4"><span
											class="_tag_vwbjt_7 _variant--text-normal_vwbjt_13 _color--green_vwbjt_83 _fill--solid_vwbjt_38 "
											data-testid="tag">결제완료</span></td>
										<td data-testid="iamport-merchant-id-column"
											class="_tableCell_1fpie_7 _align--center_1fpie_217 _variant--body--vertical--normal_1fpie_104 _font--pretendard_1fpie_24 _column-iamport-merchant-id_1lui6_19 _column_1lui6_4"><div
												class="_container_1aijn_7">
												<span>RESV_00002</span>
											</div></td>
										<td data-testid="order-name-column"
											class="_tableCell_1fpie_7 _align--center_1fpie_217 _variant--body--vertical--normal_1fpie_104 _font--pretendard_1fpie_24 _column-order-name_1lui6_22 _column_1lui6_4"><span
											class="_ellipsis-two-line_a7yez_1">알빠노-동해안투어</span></td>
										<td data-testid="buyer-column"
											class="_tableCell_1fpie_7 _align--center_1fpie_217 _variant--body--vertical--normal_1fpie_104 _font--pretendard_1fpie_24 _column-buyer_1lui6_26 _column_1lui6_4"><span
											class="_ellipsis-two-line_a7yez_1" data-testid="buyer-info">김치찌개</span></td>
										
										<td data-testid="buyer-person-column"
											class="_tableCell_1fpie_7 _align--center_1fpie_217 _variant--body--vertical--normal_1fpie_104 _font--pretendard_1fpie_24 _column-buyer_1lui6_26 _column_1lui6_4">
											<div class="_wrapper_39jul_7">	
												<span class="_container_t52sn_7" data-testid="amount-content">
												<span class="_amount_t52sn_13 ">1</span>
												<span class="_currency_t52sn_35">명</span>
												</span>
											</div>
											</td>
										<td data-testid="payment-amount-column"
											class="_tableCell_1fpie_7 _align--center_1fpie_217 _variant--body--vertical--normal_1fpie_104 _font--pretendard_1fpie_24 _column-amount_1lui6_36 _column_1lui6_4">
											<div class="_wrapper_39jul_7">
												<span class="_container_t52sn_7" data-testid="amount-content">
												<span class="_amount_t52sn_13 ">100</span>
												<span class="_currency_t52sn_35">KRW</span>
												</span>
											</div>
										</td>
										
										<td data-testid="event-time-column"
											class="_tableCell_1fpie_7 _align--center_1fpie_217 _variant--body--vertical--normal_1fpie_104 _font--pretendard_1fpie_24 _column-event-time_1lui6_43 _column_1lui6_4"><span
											class="_typography_1uzvq_4 _font--gotham_1uzvq_12 _type--b2_1uzvq_36 _weight--regular_1uzvq_87 "
											data-testid="typography">16:38:04</span></td>
										<td data-testid="cancel-payment-column"
											class="_tableCell_1fpie_7 _align--center_1fpie_217 _variant--body--vertical--normal_1fpie_104 _font--pretendard_1fpie_24  _column_1lui6_4"><span
											class="_cancel-text_1h0fb_7">취소</span></td>
										
									</tr>
									<tr data-testid="payment-info-row"
										class="_tableRow_1tqkb_4 _table-direction--vertical_1tqkb_10   _payment-table-row_8ouzs_17 ">
										<td data-testid="payment-status-column"
											class="_tableCell_1fpie_7 _align--center_1fpie_217 _variant--body--vertical--normal_1fpie_104 _font--pretendard_1fpie_24 _column-status_1lui6_10 _column_1lui6_4"><span
											class="_tag_vwbjt_7 _variant--text-normal_vwbjt_13 _color--green_vwbjt_83 _fill--solid_vwbjt_38 "
											data-testid="tag">결제완료</span></td>
										<td data-testid="iamport-merchant-id-column"
											class="_tableCell_1fpie_7 _align--center_1fpie_217 _variant--body--vertical--normal_1fpie_104 _font--pretendard_1fpie_24 _column-iamport-merchant-id_1lui6_19 _column_1lui6_4"><div
												class="_container_1aijn_7">
												<span>RESV_00001</span>
											</div></td>
										<td data-testid="order-name-column"
											class="_tableCell_1fpie_7 _align--center_1fpie_217 _variant--body--vertical--normal_1fpie_104 _font--pretendard_1fpie_24 _column-order-name_1lui6_22 _column_1lui6_4"><span
											class="_ellipsis-two-line_a7yez_1">알빠노-동해안투어</span></td>
										<td data-testid="buyer-column"
											class="_tableCell_1fpie_7 _align--center_1fpie_217 _variant--body--vertical--normal_1fpie_104 _font--pretendard_1fpie_24 _column-buyer_1lui6_26 _column_1lui6_4"><span
											class="_ellipsis-two-line_a7yez_1" data-testid="buyer-info">부대찌개</span></td>
										
										<td data-testid="buyer-person-column"
											class="_tableCell_1fpie_7 _align--center_1fpie_217 _variant--body--vertical--normal_1fpie_104 _font--pretendard_1fpie_24 _column-buyer_1lui6_26 _column_1lui6_4">
											<div class="_wrapper_39jul_7">	
												<span class="_container_t52sn_7" data-testid="amount-content">
												<span class="_amount_t52sn_13 ">1</span>
												<span class="_currency_t52sn_35">명</span>
												</span>
											</div>
											</td>
										<td data-testid="payment-amount-column"
											class="_tableCell_1fpie_7 _align--center_1fpie_217 _variant--body--vertical--normal_1fpie_104 _font--pretendard_1fpie_24 _column-amount_1lui6_36 _column_1lui6_4">
											<div class="_wrapper_39jul_7">
												<span class="_container_t52sn_7" data-testid="amount-content">
												<span class="_amount_t52sn_13 ">100</span>
												<span class="_currency_t52sn_35">KRW</span>
												</span>
											</div>
										</td>
										
										<td data-testid="event-time-column"
											class="_tableCell_1fpie_7 _align--center_1fpie_217 _variant--body--vertical--normal_1fpie_104 _font--pretendard_1fpie_24 _column-event-time_1lui6_43 _column_1lui6_4"><span
											class="_typography_1uzvq_4 _font--gotham_1uzvq_12 _type--b2_1uzvq_36 _weight--regular_1uzvq_87 "
											data-testid="typography">16:08:40</span></td>
										<td data-testid="cancel-payment-column"
											class="_tableCell_1fpie_7 _align--center_1fpie_217 _variant--body--vertical--normal_1fpie_104 _font--pretendard_1fpie_24  _column_1lui6_4"><span
											class="_cancel-text_1h0fb_7">취소</span></td>
									</tr>
								</tbody>
							</table>
							<button
								class="_button_11kek_7 _height--40_11kek_43 _font--pretendard_11kek_28 _size--full-width_11kek_79 _height--40_scibe_11 _variant--secondary_scibe_27  _show-more-button_2hrxu_47">
								<span class="_content_scibe_51 ">10건 더보기</span>
							</button>
						</div>
</div>
</body>
</html>