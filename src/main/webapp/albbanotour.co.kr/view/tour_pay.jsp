<%--
  Created by IntelliJ IDEA.
  User: potatomoong
  Date: 2024-04-17
  Time: 오후 03:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <title>결제 | 알빠노관광</title>

    <script>
        // 자바스크립트에서 사용하는 전역변수 선언
        var g5_url       = "https://cmtour.co.kr";
        var g5_bbs_url   = "https://cmtour.co.kr/bbs";
        var g5_is_member = "";
        var g5_is_admin  = "";
        var g5_is_mobile = "";
        var g5_bo_table  = "booking";
        var g5_sca       = "";
        var g5_editor    = "smarteditor2";
        var g5_cookie_domain = "";
    </script>

    <script type="text/javascript" src="https://cmtour.co.kr/plugin/wz.bookingD.prm/js/jquery.magnific-popup.min.js"></script>
    <script type="text/javascript" src="https://cmtour.co.kr/plugin/wz.bookingD.prm/js/common.js"></script>

    <%@ include file="common_head.jsp" %>
</head>

<body>
<%@ include file="common_m_header.jsp" %>
<%@ include file="common_desktop_header.jsp" %>

<section id="sub_visual">
    <div class="backgroundimg">
        <div class="visual_area" style="background:url('https://cmtour.co.kr/theme/cmtour/html/image/sub_visual02.jpg') no-repeat top center;"></div>
    </div>
</section>


<section id="sub_wrapper">
    <div id="sub_menu">
        <div class="sub_location">
            <div>
                <div class="cen"><a href="index_user.jsp"><i class="fa fa-home" aria-hidden="true"></i></a></div>
                <ul class="">
                    <li>
                        <span>맛집</span>
                        <ul>
                            <li><a href="/theme/cmtour/html/business/new_01.php" target="_self">관광지</a></li>
                            <li><a href="/bbs/board.php?bo_table=booking" target="_self">맛집</a></li>
                            <li><a href="/theme/cmtour/html/business/map_info_01.php" target="_self">투어예약</a></li>
                            <li><a href="/bbs/board.php?bo_table=notice" target="_self">고객센터</a></li>

                        </ul>
                    </li>
                </ul>
                <ul class="dep2">
                    <li>
                        <span>맛집</span>
                        <ul>
                            <li><a href="/bbs/board.php?bo_table=booking" target="_self">맛집</a></li>



                        </ul>
                    </li>
                </ul>

            </div>
        </div>
    </div>

    <div id="sub_tit">
        <div class="path">
            <li><a href="index_user.jsp"><span class="ic-home"><i></i></span></a></li>
            <li></li>					<li>맛집</li>
        </div>
        <div class="title">맛집</div>
        <p class="normal_txt">	</p>
    </div>

    <div class="scontents">


        <div class="bg_vline"></div>
        <p class="eng"><em></em> 결제하기</p>
        <p class="stitle"></p>




        <script type="text/javascript"> var cp_code = ''; </script>

        <div class="wetoz">

            <div class="col-md-12">


                <script language="javascript" type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js" charset="UTF-8"></script>
                <script type="text/javascript">

                    function pg_pay(f) {



                        var payment = $(":input:radio[name=bk_payment]:checked").val();
                        switch(payment)
                        {
                            case "계좌이체":
                                paymentCode = "trans";
                                break;
                            case "가상계좌":
                                paymentCode = "vbank";
                                break;
                            case "휴대폰":
                                paymentCode = "phone";
                                break;
                            case "신용카드":
                                paymentCode = "Card";
                                f.acceptmethod.value = f.acceptmethod.value.replace(":useescrow", "");
                                break;
                            case "간편결제":
                                paymentCode = "Kpay";
                                break;
                            default:
                                paymentCode = "무통장";
                                break;
                        }

                        f.good_mny.value  = f.reserv_price.value;

                        f.price.value       = f.good_mny.value;
                        f.buyername.value   = f.bk_name.value;
                        f.buyeremail.value  = f.bk_email.value;
                        f.buyertel.value    = f.bk_hp.value;


                        var total_price = $("input[name=price]").val();
                        var bk_hp = $("input[name=bk_hp]").val();
                        var bk_email = $("input[name=bk_email]").val();
                        var bk_name = $("input[name=bk_name]").val();


                        if(f.gopaymethod.value != "무통장") {

                            // 주문 정보 임시저장
                            var order_data = $(f).serialize();
                            var save_result = "";
                            $.ajax({
                                type: "POST",
                                data: order_data,
                                url: "https://cmtour.co.kr/plugin/wz.bookingD.prm/gender/pg.pay_data.php",
                                cache: false,
                                async: false,
                                success: function(data) {
                                    save_result = data;
                                }
                            });

                            if(save_result) {
                                alert(save_result);
                                return false;
                            }

                        }

                        var IMP = window.IMP; // 생략가능
                        IMP.init('imp45925224'); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용

                        IMP.request_pay({
                            pg : 'inicis', // version 1.1.0부터 지원.
                            pay_method : paymentCode,
                            merchant_uid : '1240407010528352',
                            name : '신라역사투어',
                            amount : $('#pg_tot_price').val(),
                            buyer_email : bk_email,
                            buyer_name : bk_name,
                            buyer_tel : bk_hp,
                            buyer_addr : '',
                            buyer_postcode : '',
                            m_redirect_url : 'https://cmtour.co.kr/plugin/wz.bookingD.prm/gender/import/pg_mobile_return.php'
                        }, function(rsp) {
                            if ( rsp.success ) {


                                console.log(rsp);
                                console.log(rsp.imp_uid);

                                // jQuery로 HTTP 요청
                                jQuery.ajax({
                                    url: "https://cmtour.co.kr/plugin/wz.bookingD.prm/gender/import/return.php", // 가맹점 서버
                                    method: "GET",
                                    headers: { "Content-Type": "application/json" },
                                    data: {
                                        "imp_uid": rsp.imp_uid,
                                        "merchant_uid": rsp.merchant_uid
                                    }
                                }).done(function (data) {
                                    // 가맹점 서버 결제 API 성공시 로직
                                    console.log(data);

                                    if(data == "S"){

                                        f.card_name.value = rsp.card_name;

                                        f.action = "https://cmtour.co.kr/plugin/wz.bookingD.prm/step.2.update.php";
                                        f.target = "_self";
                                        f.submit();

                                    }else{
                                        alert("결제에 문제가 있습니다.");
                                        return false;
                                    }

                                });

                            } else {
                                var msg = '결제에 실패하였습니다.';
                                msg += rsp.error_msg;
                                alert(msg);
                            }
                            //alert(msg);
                        });


                    }



                    function pg_pay2(f) {



                        var payment = $(":input:radio[name=bk_payment]:checked").val();
                        switch(payment)
                        {
                            case "계좌이체":
                                paymentCode = "trans";
                                break;
                            case "가상계좌":
                                paymentCode = "vbank";
                                break;
                            case "휴대폰":
                                paymentCode = "phone";
                                break;
                            case "신용카드":
                            case "카카오페이":
                                paymentCode = "Card";
                                f.acceptmethod.value = f.acceptmethod.value.replace(":useescrow", "");
                                break;
                            case "간편결제":
                                paymentCode = "Kpay";
                                break;
                            default:
                                paymentCode = "무통장";
                                break;
                        }

                        f.good_mny.value  = f.reserv_price.value;

                        f.price.value       = f.good_mny.value;
                        f.buyername.value   = f.bk_name.value;
                        f.buyeremail.value  = f.bk_email.value;
                        f.buyertel.value    = f.bk_hp.value;


                        var total_price = $("input[name=price]").val();
                        var bk_hp = $("input[name=bk_hp]").val();
                        var bk_email = $("input[name=bk_email]").val();
                        var bk_name = $("input[name=bk_name]").val();


                        if(f.gopaymethod.value != "무통장") {

                            // 주문 정보 임시저장
                            var order_data = $(f).serialize();
                            var save_result = "";
                            $.ajax({
                                type: "POST",
                                data: order_data,
                                url: "https://cmtour.co.kr/plugin/wz.bookingD.prm/gender/pg.pay_data.php",
                                cache: false,
                                async: false,
                                success: function(data) {
                                    save_result = data;
                                }
                            });

                            if(save_result) {
                                alert(save_result);
                                return false;
                            }

                        }

                        var IMP = window.IMP; // 생략가능
                        IMP.init('imp45925224'); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용

                        IMP.request_pay({
                            pg : 'kakaopay', // version 1.1.0부터 지원.
                            pay_method : paymentCode,
                            merchant_uid : '1240407010528352',
                            name : '신라역사투어',
                            amount : $('#pg_tot_price').val(),
                            buyer_email : bk_email,
                            buyer_name : bk_name,
                            buyer_tel : bk_hp,
                            buyer_addr : '',
                            buyer_postcode : '',
                            m_redirect_url : 'https://cmtour.co.kr/plugin/wz.bookingD.prm/gender/import/pg_mobile_return.php'
                        }, function(rsp) {
                            if ( rsp.success ) {


                                console.log(rsp);
                                console.log(rsp.imp_uid);

                                // jQuery로 HTTP 요청
                                jQuery.ajax({
                                    url: "https://cmtour.co.kr/plugin/wz.bookingD.prm/gender/import/return.php", // 가맹점 서버
                                    method: "GET",
                                    headers: { "Content-Type": "application/json" },
                                    data: {
                                        "imp_uid": rsp.imp_uid,
                                        "merchant_uid": rsp.merchant_uid
                                    }
                                }).done(function (data) {
                                    // 가맹점 서버 결제 API 성공시 로직
                                    console.log(data);

                                    if(data == "S"){

                                        f.card_name.value = rsp.card_name;

                                        f.action = "https://cmtour.co.kr/plugin/wz.bookingD.prm/step.2.update.php";
                                        f.target = "_self";
                                        f.submit();

                                    }else{
                                        alert("결제에 문제가 있습니다.");
                                        return false;
                                    }

                                });

                            } else {
                                var msg = '결제에 실패하였습니다.';
                                msg += rsp.error_msg;
                                alert(msg);
                            }
                            //alert(msg);
                        });


                    }


                    function pg_pay3(f) {
                        f.good_mny.value  = f.reserv_price.value;

                        f.price.value       = f.good_mny.value;
                        f.buyername.value   = f.bk_name.value;
                        f.buyeremail.value  = f.bk_email.value;
                        f.buyertel.value    = f.bk_hp.value;


                        var total_price = $("input[name=price]").val();
                        var bk_hp = $("input[name=bk_hp]").val();
                        var bk_email = $("input[name=bk_email]").val();
                        var bk_name = $("input[name=bk_name]").val();


                        if(f.gopaymethod.value != "무통장") {

                            // 주문 정보 임시저장
                            var order_data = $(f).serialize();
                            var save_result = "";
                            $.ajax({
                                type: "POST",
                                data: order_data,
                                url: "https://cmtour.co.kr/plugin/wz.bookingD.prm/gender/pg.pay_data.php",
                                cache: false,
                                async: false,
                                success: function(data) {
                                    save_result = data;
                                }
                            });

                            if(save_result) {
                                alert(save_result);
                                return false;
                            }

                        }

                        var IMP = window.IMP; // 생략가능
                        IMP.init('imp45925224'); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용

                        IMP.request_pay({
                            pg : 'naverpay',
                            merchant_uid : 'merchant_1240407010528352', //상점에서 관리하시는 고유 주문번호를 전달
                            name : '신라역사투어',
                            amount : total_price,
                            //tax_free : 0, //면세공급가액(누락되면 0원으로 처리)
                            buyer_email : bk_email,
                            buyer_name : bk_name,
                            buyer_tel : bk_hp, //누락되면 이니시스 결제창에서 오류
                            buyer_addr : '',
                            buyer_postcode : '',
                            naverUseCfm : f.sch_day.value,
                            naverPopupMode : true, //리디렉션모드 vs 팝업모드
                            naverProducts : [{ //상품정보(필수전달사항) 네이버페이 매뉴얼의 productItems 파라메터와 동일합니다.
                                "categoryType": "TRAVEL",
                                "categoryId": "DOMESTIC",
                                "uid": "imp45925224",
                                "name": "신라역사투어",
                                "payReferrer": "cmtour",
                                "count": f.total_pcnt.value
                            }]
                        },function(rsp) {
                            if ( rsp.success ) {

                                console.log(rsp);
                                console.log(rsp.imp_uid);

                                f.card_name.value = rsp.apply_num;

                                f.action = "https://cmtour.co.kr/plugin/wz.bookingD.prm/step.2.update.php";
                                f.target = "_self";
                                f.submit();
                                window.close();

                            } else {
                                var msg = '결제에 실패하였습니다.';
                                msg += rsp.error_msg;
                                alert(msg);
                            }
                            //alert(msg);
                        });
                    }



                </script>



                <script type="text/javascript" src="//ajax.googleapis.com/ajax/libs/jqueryui/1.9.2/jquery-ui.min.js"></script>
                <script>
                    jQuery(function($){
                        $.datepicker.regional["ko"] = {
                            closeText: "닫기",
                            prevText: "이전달",
                            nextText: "다음달",
                            currentText: "오늘",
                            monthNames: ["1월(JAN)","2월(FEB)","3월(MAR)","4월(APR)","5월(MAY)","6월(JUN)", "7월(JUL)","8월(AUG)","9월(SEP)","10월(OCT)","11월(NOV)","12월(DEC)"],
                            monthNamesShort: ["1월","2월","3월","4월","5월","6월", "7월","8월","9월","10월","11월","12월"],
                            dayNames: ["일","월","화","수","목","금","토"],
                            dayNamesShort: ["일","월","화","수","목","금","토"],
                            dayNamesMin: ["일","월","화","수","목","금","토"],
                            weekHeader: "Wk",
                            dateFormat: "yymmdd",
                            firstDay: 0,
                            isRTL: false,
                            showMonthAfterYear: true,
                            yearSuffix: ""
                        };
                        $.datepicker.setDefaults($.datepicker.regional["ko"]);
                    });
                </script>

                <div class="navi-wrap">
                    <ul class="nav nav-tabs">
                        <li role="presentation" class="active"><a href="https://cmtour.co.kr/bbs/board.php?bo_table=booking&cp_code=">실시간예약</a></li>
                        <li role="presentation" class=""><a href="https://cmtour.co.kr/bbs/board.php?bo_table=booking&cp_code=&mode=orderlist">예약확인/취소</a></li>
                    </ul>
                    <p class="button-list">
                    </p>
                </div>

                <div class="clearfix" style="height:10px;"></div>
                <form method="post" name="wzfrm" id="wzfrm" autocomplete="off">
                    <input type="hidden" name="mode" id="mode" value="step3" />
                    <input type="hidden" name="rm_ix" id="rm_ix" value="3" />
                    <input type="hidden" name="sch_day" id="sch_day" value="2024-04-10" />
                    <input type="hidden" name="bo_table" id="bo_table" value="booking" />
                    <input type="hidden" name="od_id" id="od_id" value="1240407010528352" />
                    <input type="hidden" name="cp_code" id="cp_code" value="" />
                    <input type="hidden" name="card_name" id="card_name" value="" />

                    <div class="panel panel-default">

                        <div class="panel-heading"><strong><i class="fa fa-calculator fa-lg"></i> 이용서비스정보</strong>  </div>
                        <div class="table-responsive">
                            <table class="table form-group form-group-sm table-bordered font-color-gray">
                                <thead>
                                <tr>
                                    <th scope="col">예약서비스</th>
                                    <th scope="col">시간/장소</th>
                                    <th scope="col">인원</th>
                                    <th scope="col">요금</th>
                                    <th scope="col">합계</th>
                                </tr>
                                </thead>
                                <tbody>
                                <input type="hidden" name="rmt_ix[]"     value="70" />
                                <input type="hidden" name="rm_time[]" id="rm_time_0" value="08:56" />
                                <input type="hidden" name="rm_place[]" id="rm_place_0" value="The-K 경주호텔" />
                                <input type="hidden" name="total_pcnt" id="total_pcnt" value="">

                                <tr>
                                    <td data-title="예약서비스">신라역사투어<br>24/04/10(수)</td>
                                    <td data-title="예약시간/장소">08시56분<br>The-K 경주호텔</td>
                                    <td data-title="이용인원">
                                        성인
                                        <select name="rm_cnt[]" id="rm_cnt_0" data-price="25000" data-price-type="인당" class="form-control" style="width:40px;">
                                            <option value="1" >1</option><option value="2" >2</option><option value="3" >3</option><option value="4" >4</option><option value="5" >5</option><option value="6" >6</option><option value="7" >7</option><option value="8" >8</option><option value="9" >9</option><option value="10" >10</option><option value="11" >11</option><option value="12" >12</option><option value="13" >13</option><option value="14" >14</option><option value="15" >15</option><option value="16" >16</option><option value="17" >17</option><option value="18" >18</option><option value="19" >19</option><option value="20" >20</option><option value="21" >21</option><option value="22" >22</option><option value="23" >23</option><option value="24" >24</option><option value="25" >25</option><option value="26" >26</option><option value="27" >27</option><option value="28" >28</option><option value="29" >29</option><option value="30" >30</option>                        </select>

                                        청소년
                                        <select name="rm_cnt_teenager[]" id="rm_cnt_teenager_0" data-price="23000" data-price-type="인당" class="form-control" style="width:40px;">
                                            <option value="0" selected>0</option><option value="1" >1</option><option value="2" >2</option><option value="3" >3</option><option value="4" >4</option><option value="5" >5</option><option value="6" >6</option><option value="7" >7</option><option value="8" >8</option><option value="9" >9</option><option value="10" >10</option><option value="11" >11</option><option value="12" >12</option><option value="13" >13</option><option value="14" >14</option><option value="15" >15</option><option value="16" >16</option><option value="17" >17</option><option value="18" >18</option><option value="19" >19</option><option value="20" >20</option><option value="21" >21</option><option value="22" >22</option><option value="23" >23</option><option value="24" >24</option><option value="25" >25</option><option value="26" >26</option><option value="27" >27</option><option value="28" >28</option><option value="29" >29</option><option value="30" >30</option>                        </select>

                                        어린이
                                        <select name="rm_cnt_child[]" id="rm_cnt_child_0" data-price="23000" data-price-type="인당" class="form-control" style="width:40px;">
                                            <option value="0" selected>0</option><option value="1" >1</option><option value="2" >2</option><option value="3" >3</option><option value="4" >4</option><option value="5" >5</option><option value="6" >6</option><option value="7" >7</option><option value="8" >8</option><option value="9" >9</option><option value="10" >10</option><option value="11" >11</option><option value="12" >12</option><option value="13" >13</option><option value="14" >14</option><option value="15" >15</option><option value="16" >16</option><option value="17" >17</option><option value="18" >18</option><option value="19" >19</option><option value="20" >20</option><option value="21" >21</option><option value="22" >22</option><option value="23" >23</option><option value="24" >24</option><option value="25" >25</option><option value="26" >26</option><option value="27" >27</option><option value="28" >28</option><option value="29" >29</option><option value="30" >30</option>                        </select>
                                    </td>

                                    <td data-title="요금">
                                        성인<br>
                                        25,000<br>
                                        청소년<br>
                                        23,000<br>
                                        어린이<br>
                                        23,000                    </td>
                                    <td data-title="합계">
                                        <span id="time-total-0">25,000</span>원<br>
                                        <span id="time-total-teenager-0">23,000</span>원<br>
                                        <span id="time-total-child-0">23,000</span>원
                                    </td>
                                </tr>
                                </tbody>

                                <thead>
                                <tr>
                                    <th colspan="4">합계</th>
                                    <th><span id="all-total">71,000</span>원</th>
                                </tr>
                                </thead>

                            </table>
                        </div>
                    </div>


                    <!-- <div class="mobile_view" style="text-align: center; margin-bottom: 20px;">◀◀ 좌우로 움직여서 합계금액을 확인하세요 ▶▶</div>-->

                    <div class="row">
                        <div class="col-md-12">
                            <div class="panel panel-default">
                                <div class="panel-heading"><strong><i class="fa fa-user fa-lg"></i> 할인안내</strong></div>

                                <div class="panel-body form-horizontal">

                                    <div class="form-group form-group-sm">
                                        <label class="col-sm-2 control-label" for="bk_name">할인안내</label>
                                        <div class="col-sm-10">
                                            <small class="text-dotum">장애인,국가유공자<br>
                                                장애인 (1~6급), 국가유공자(당사자만 해당)되며 주간프로그램의 경우 신분증 지참 시 입장료는 면제됩니다. 투어요금과는 무관합니다.</small>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-12">
                            <div class="panel panel-default">
                                <div class="panel-heading"><strong><i class="fa fa-user fa-lg"></i> 예약자정보</strong></div>

                                <div class="panel-body form-horizontal">

                                    <div class="form-group form-group-sm">
                                        <label class="col-sm-2 control-label" for="bk_name">예약자명</label>
                                        <div class="col-sm-10">
                                            <div class="form-inline">
                                                <div id="helpblock_bk_name" class="help-block"><small class="text-dotum">실명으로 입력해주세요</small></div>
                                                <div class="input-group">
                                                    <input type="text" name="bk_name" value="" id="bk_name" required class="form-control" maxlength="20" aria-describedby="helpblock_bk_name">
                                                    <span class="fa fa-check form-control-feedback"></span>
                                                </div>

                                            </div>
                                        </div>
                                    </div>

                                    <div class="form-group form-group-sm">
                                        <label class="col-sm-2 control-label" for="bk_hp">핸드폰</label>
                                        <div class="col-sm-10">
                                            <div class="form-inline">
                                                <div class="input-group">
                                                    <input type="number" name="bk_hp" value="" id="bk_hp" required class="form-control" maxlength="20">
                                                    <span class="fa fa-phone form-control-feedback"></span>
                                                </div> <span>번호만 입력해주세요. 예) 01012345678 <br>
                                    입력한 번호로 알림톡이 전송됩니다. </span>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="form-group form-group-sm">
                                        <label class="col-sm-2 control-label" for="bk_email">이메일</label>
                                        <div class="col-sm-10">
                                            <div class="form-inline">
                                                <div class="input-group">
                                                    <input type="email" name="bk_email" id="bk_email" value="" required class="form-control email" size="35" maxlength="100">
                                                    <span class="fa fa-envelope form-control-feedback"></span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="form-group has-feedback form-group-sm">
                                        <label class="col-sm-2 control-label" for="bk_memo">요청사항(선택)</label>
                                        <div class="col-sm-10">
                                            <div class="form-inline">
                                                <textarea name="bk_memo" id="bk_memo" class="form-control" cols="50" rows="5" placeholder="예약자와 탑승자가 다를 경우 성함과 연락처를 꼭 기입해주세요"></textarea>
                                            </div>
                                        </div>
                                    </div>


                                    <div class="form-group form-group-sm">
                                        <label class="col-sm-2 control-label" for="bk_email">비밀번호</label>
                                        <div class="col-sm-10">
                                            <div class="form-inline">
                                                <div class="input-group">
                                                    <input type="password" name="bk_password" id="bk_password" value="" required class="form-control password" size="35" maxlength="100">
                                                    <span class="fa fa-envelope form-control-feedback"></span>
                                                </div> 예약조회와 취소시에 비밀번호를 조회합니다.
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>


                    <div class="panel panel-default">
                        <div class="panel-heading"><strong><i class="fa fa-credit-card fa-lg"></i> 결제정보</strong></div>

                        <div class="panel-body form-horizontal">
                            <div class="form-group form-group-sm">
                                <label class="col-xs-4 col-sm-2 control-label">총이용금액</label>
                                <label class="col-xs-8 col-sm-2 control-label">
                                    <span id="pg-price-all" class="price_red">71,000</span> 원
                                </label>
                            </div>
                            <div class="form-group form-group-sm">
                                <label class="col-xs-4 col-sm-2 control-label"><strong>예약금</strong></label>
                                <label class="col-xs-8 col-sm-2 control-label">
                                    <input type="hidden" name="pg_tot_price" id="pg_tot_price" value="" />
                                    <input type="hidden" name="reserv_price" id="reserv_price" value="" />
                                    <input type="hidden" name="org_bk_price" id="org_bk_price" value="" />
                                    <strong><span id="od_tot_price" class="price_red">0</span> 원</strong>
                                </label>
                                <div class="col-sm-7">
                                    <label class="control-label text-muted font-12">(결제/입금이 완료되어야 최종 예약이 완료됩니다.)</label>
                                </div>
                            </div>

                            <div class="form-group form-group-sm">
                                <label class="col-xs-4 col-sm-2 control-label">결제방법</label>
                                <div class="col-xs-8 col-sm-10 radio-line">
                                    <label><input type="radio" name="bk_payment" id="bk_payment_bank" class="payment_type" value="무통장" checked=checked /> 무통장입금</label><label><input type="radio" name="bk_payment" id="bk_payment_card" class="payment_type" value="신용카드" /> 신용카드</label><label><input type="radio" name="bk_payment" id="bk_payment_kakao" class="payment_type" value="카카오페이" /> 카카오페이</label>            </div>
                            </div>

                            <div id="bank_info_box" style="display:">
                                <div class="form-group form-group-sm">
                                    <label class="col-xs-4 col-sm-2 control-label" for="od_bank_account">입금계좌</label>
                                    <div class="col-xs-8 col-sm-4">
                                        <select name="bk_bank_account" id="bk_bank_account" class="form-control">
                                            <option value="카카오뱅크 3333-05-7297403 알빠노관광">카카오뱅크 3333-05-7297403 알빠노관광</option>
                                        </select>
                                    </div>
                                </div>

                                <div class="form-group form-group-sm">
                                    <label class="col-xs-4 col-sm-2 control-label" for="od_deposit_name">입금자명</label>
                                    <div class="col-xs-8 col-sm-2">
                                        <input type="text" name="bk_deposit_name" id="bk_deposit_name" class="form-control" value="" placeholder="입금자명" maxlength="20">
                                    </div>
                                </div>


                            </div>

                        </div>
                    </div>


                    <div class="panel panel-default">
                        <div class="panel-heading"><strong><i class="fa fa-file-text-o fa-lg"></i> 이용규정안내</strong></div>
                        <div class="panel-body">

                            <div class="bs-callout bs-callout-info">
                                <h4>기본예약안내</h4>
                                <p style="font-variant-numeric: inherit; font-variant-east-asian: inherit; font-stretch: inherit; line-height: inherit; border: 0px; vertical-align: baseline;">※&nbsp;여행자보험은 포함되어있지 않으니, 꼭 필요하다고 느끼시는 분들은 사전에 미리 직접 가입하시고 오시는 것을 추천해드립니다.<br>
                                </p>
                            </div>

                            <div class="bs-callout bs-callout-warning">
                                <h4>이용 안내</h4>
                                <div>● 예약변경<span style="white-space: pre;">						</span>&nbsp;
                                </div>
                                <div>&nbsp; - 예약변경은 탑승일 하루전 16시까지 1회 변경가능(단, 원하시는코스가 만석일 경우 불가능)<span style="white-space:pre">						</span></div>
                                <div>&nbsp; - 변경일 투어모객 미달 시, 취소나 환불 불가<span style="white-space:pre">						</span></div>
                                <div><br></div>
                                <div>● 예약취소 환불안내<span style="white-space:pre">						</span></div>
                                <div>&nbsp; - 환불요청은 영업일 (09~18시) 기준으로 적용됩니다.<span style="white-space:pre">						</span></div>
                                <div>&nbsp; - 투어 3일전까지 취소가능 : 100% 환불<span style="white-space:pre">						</span></div>
                                <div>&nbsp; -&nbsp;이후 환불불가<span style="white-space:pre">						</span></div>
                                <div>&nbsp; - 천재지변으로 운행불가 : 100%</div>
                                <div>&nbsp; - 카드결제 : 카드승인취소</div>
                                <div>&nbsp; - 무통장입금 : 환불 받을 계좌번호 고객센터로 전달, 환불 진행</div>
                            </div>
                        </div>
                        <div class="panel-footer">
                            <label><input type="checkbox" name="agree1" value="1" id="agree1" /> 상기의 내용을 숙지하고 예약 및 환불규정에 동의 합니다.</label>
                        </div>
                    </div>

                    <div class="panel panel-default">
                        <div class="panel-heading"><strong><i class="fa fa-file-text-o fa-lg"></i> 개인정보 활용 동의</strong></div>
                        <div class="panel-body">

                            귀하의 소중한 개인정보는 개인정보보호법의 관련 규정에 의하여 예약 및 조회 등 아래의 목적으로 수집 및 이용됩니다.
                            <ul class="purpose">
                                <li>1. 개인정보의 수집·이용 목적 - 예약, 조회를 위한 본인 확인 절차</li>
                                <li>2. 개인정보 수집 항목 - 예약자명, 핸드폰, 이메일</li>
                                <li>3. 개인정보의 보유 및 이용기간 - 이용자의 개인정보는 원칙적으로 개인정보의 처리목적이 달성되면 지체 없이 파기합니다.</li>
                            </ul>

                            예약을 위하여 수집된 개인정보는 ‘전자상거래 등에서의 소비자보호에 관한 법률’ 제6조에의거 정해진 기간동안 보유됩니다.<br/>
                            ※ 상기 내용은 고객님께 예약서비스를 제공하는데 필요한 최소한의 정보입니다.<br/>
                            ※ 상기 내용에 대하여 본인이 동의하지 않을 수 있으나, 그러할 경우 예약 서비스 제공에 차질이 발생할 수 있습니다.

                        </div>
                        <div class="panel-footer">
                            <label><input type="checkbox" name="agree2" value="1" id="agree2" /> 개인정보 활용에 동의 합니다.</label>
                        </div>
                    </div>

                    <div class="row">

                        <div id="display_pay_button" class="col-md-12 btn-group-justified" role="group">
                            <div class="btn-group" role="group">
                                <button type="button" class="btn btn-primary" onclick="location.href='../bbs/board.php?bo_table=booking&cp_code=&mode=step1&sch_day=2024-04-10';"><i class="fa fa-chevron-left fa-sm"></i> 이전단계</button>
                            </div>
                            <div class="btn-group" role="group">
                                <button type="button" id="submit_next" data-loading-text="Loading..." autocomplete="off" class="btn btn-success" onclick="getNext();"><i class="fa fa-check"></i> 예약하기</button>
                            </div>
                        </div>

                        <div id="display_pay_process" style="display:none;">
                            결제가 진행중입니다...
                        </div>



                        <input type="hidden" name="card_name"    value="">


                        <input type="hidden" name="good_mny"    value="">


                        <input type="hidden" name="version"     value="1.0" >
                        <input type="hidden" name="mid"         value="">
                        <input type="hidden" name="oid"         value="1240407010528352">
                        <input type="hidden" name="goodname"    value="신라역사투어">
                        <input type="hidden" name="price"       value="">
                        <input type="hidden" name="buyername"   value="">
                        <input type="hidden" name="buyeremail"  value="">
                        <input type="hidden" name="parentemail" value="">
                        <input type="hidden" name="buyertel"    value="">
                        <input type="hidden" name="recvname"    value="">
                        <input type="hidden" name="recvtel"     value="">
                        <input type="hidden" name="recvaddr"    value="">
                        <input type="hidden" name="recvpostnum" value="">

                        <!-- 기타설정 -->
                        <input type="hidden" name="currency"    value="WON">

                        <!-- 결제방법 -->
                        <input type="hidden" name="gopaymethod" value="">

                        <!--
                        SKIN : 플러그인 스킨 칼라 변경 기능 - 6가지 칼라(ORIGINAL, GREEN, ORANGE, BLUE, KAKKI, GRAY)
                        HPP : 컨텐츠 또는 실물 결제 여부에 따라 HPP(1)과 HPP(2)중 선택 적용(HPP(1):컨텐츠, HPP(2):실물).
                        Card(0): 신용카드 지불시에 이니시스 대표 가맹점인 경우에 필수적으로 세팅 필요 ( 자체 가맹점인 경우에는 카드사의 계약에 따라 설정) - 자세한 내용은 메뉴얼  참조.
                        OCB : OK CASH BAG 가맹점으로 신용카드 결제시에 OK CASH BAG 적립을 적용하시기 원하시면 "OCB" 세팅 필요 그 외에 경우에는 삭제해야 정상적인 결제 이루어짐.
                        no_receipt : 은행계좌이체시 현금영수증 발행여부 체크박스 비활성화 (현금영수증 발급 계약이 되어 있어야 사용가능)
                        -->
                        <input type="hidden" name="acceptmethod" value="">

                        <!--
                        플러그인 좌측 상단 상점 로고 이미지 사용
                        이미지의 크기 : 90 X 34 pixels
                        플러그인 좌측 상단에 상점 로고 이미지를 사용하실 수 있으며,
                        주석을 풀고 이미지가 있는 URL을 입력하시면 플러그인 상단 부분에 상점 이미지를 삽입할수 있습니다.
                        -->
                        <!--input type="hidden" name="ini_logoimage_url"  value="http://[사용할 이미지주소]"-->

                        <!--
                        좌측 결제메뉴 위치에 이미지 추가
                        이미지의 크기 : 단일 결제 수단 - 91 X 148 pixels, 신용카드/ISP/계좌이체/가상계좌 - 91 X 96 pixels
                        좌측 결제메뉴 위치에 미미지를 추가하시 위해서는 담당 영업대표에게 사용여부 계약을 하신 후
                        주석을 풀고 이미지가 있는 URL을 입력하시면 플러그인 좌측 결제메뉴 부분에 이미지를 삽입할수 있습니다.
                        -->
                        <!--input type="hidden" name="ini_menuarea_url" value="http://[사용할 이미지주소]"-->

                        <!--
                        플러그인에 의해서 값이 채워지거나, 플러그인이 참조하는 필드들
                        삭제/수정 불가
                        -->
                        <input type="hidden" name="timestamp"   value="">
                        <input type="hidden" name="signature"   value="">
                        <input type="hidden" name="returnUrl"   value="">
                        <input type="hidden" name="mKey"        value="">
                        <input type="hidden" name="charset"     value="UTF-8">
                        <input type="hidden" name="payViewType" value="overlay">
                        <input type="hidden" name="closeUrl"    value="">
                        <input type="hidden" name="popupUrl"    value="">
                        <input type="hidden" name="nointerest"  value="">
                        <input type="hidden" name="quotabase"   value="">

                    </div>

                </form>

                <script type="text/javascript">
                    <!--
                    $(function() {

                        // 인원선택
                        $("select[name='rm_cnt[]']").on('change', function() {
                            calculate_order();        });
                        $("select[name='rm_cnt_teenager[]']").on('change', function() {
                            calculate_order();        });
                        $("select[name='rm_cnt_child[]']").on('change', function() {
                            calculate_order();        });

                        // 옵션 선택
                        $(document).on('change', '.cal_option_cnt', function() {
                            calculate_order();        });

                        $('.payment_type').on('click', function() {
                            var payment = $(':input:radio[name=bk_payment]:checked').val();
                            if (payment == '무통장') {
                                $('#bk_deposit_name').val( $('#bk_name').val() );
                                $('#bank_info_box').show();
                                $('#naver_info_box').hide();
                            } else if (payment == '네이버페이') {
                                $('#bank_info_box').hide();
                                $('#naver_info_box').show();
                            }
                            else {
                                $('#bank_info_box').hide();
                                $('#naver_info_box').hide();
                            }
                        });

                        calculate_order();    });

                    function calculate_order() {

                        var z = y = x = 0;
                        var total_price = 0;
                        var total_p_cnt = 0;

                        $("select[name='rm_cnt[]']").each(
                            function(){
                                var cnt             = parseInt($(this).val());
                                var price           = parseInt($(this).attr('data-price'));
                                var price_type      = $(this).attr('data-price-type');

                                if (price_type == '인당') {
                                    price = price * cnt;
                                }
                                total_price += price;
                                $('#time-total-'+z).html(number_format(price+""));

                                total_p_cnt += cnt;
                                z++;
                            }
                        )

                        $("select[name='rm_cnt_teenager[]']").each(
                            function(){
                                var cnt             = parseInt($(this).val());
                                var price           = parseInt($(this).attr('data-price'));
                                var price_type      = $(this).attr('data-price-type');

                                if (price_type == '인당') {
                                    price = price * cnt;
                                }
                                total_price += price;
                                $('#time-total-teenager-'+y).html(number_format(price+""));

                                total_p_cnt += cnt;
                                y++;
                            }
                        )

                        $("select[name='rm_cnt_child[]']").each(
                            function(){
                                var cnt             = parseInt($(this).val());
                                var price           = parseInt($(this).attr('data-price'));
                                var price_type      = $(this).attr('data-price-type');

                                if (price_type == '인당') {
                                    price = price * cnt;
                                }
                                total_price += price;
                                $('#time-total-child-'+x).html(number_format(price+""));

                                total_p_cnt += cnt;
                                x++;
                            }
                        )

                        $('#all-total').html(number_format(total_price+""));

                        var cnt_option = price_option = 0;
                        i = 0;
                        $('input[name="opt[]"]').each(
                            function(){
                                i = this.value;
                                cnt_option   = parseInt($('#rmo_cnt_'+i).val()); // 선택갯수
                                price_option += parseInt($('#rmo_cnt_'+i).attr('data-price')) * cnt_option;
                            }
                        );
                        $('#option_tot_price').html(number_format(price_option+""));
                        total_price += price_option;

                        $('#pg-price-all').html(number_format(total_price+""));

                        // 예약금처리
                        var reserv_price = Math.round((total_price / 100) * 100);
                        $('#pg_tot_price').val(total_price);
                        $('#reserv_price').val(reserv_price);
                        $('#org_bk_price').val(reserv_price);
                        $('#od_tot_price').html(number_format(reserv_price+""));

                        // 총 인원수
                        $('#total_pcnt').val(total_p_cnt);
                    }

                    function getNext() {
                        var f = document.forms.wzfrm;

                        var rm_cnt = $("input[name='rmt_ix[]']").length;
                        if (rm_cnt < 1) {
                            alert("예약정보가 존재하지 않습니다.");
                            return;
                        }
                        if (!f.bk_name.value) {
                            alert("예약자명을 입력해주세요.");
                            f.bk_name.focus();
                            return;
                        }
                        if (!f.bk_hp.value) {
                            alert("핸드폰번호를 입력해주세요.");
                            f.bk_hp.focus();
                            return;
                        }

                        var payment = '무통장';

                        var _bk_payment = f.bk_payment.value;
                        if (_bk_payment == '무통장') {
                            if (!f.bk_deposit_name.value) {
                                alert("입금자명을 입력해주세요.");
                                f.bk_deposit_name.focus();
                                return;
                            }
                            var bk_bank_account = document.getElementById("bk_bank_account");
                            if (bk_bank_account) {
                                if (f.bk_bank_account.options[f.bk_bank_account.selectedIndex].value == '') {
                                    alert("계좌번호를 선택해주세요.");
                                    f.bk_bank_account.focus();
                                    return;
                                }
                            }
                        }

                        payment = $(":input:radio[name=bk_payment]:checked").val();
                        if (!payment) {
                            alert("결제방식을 선택해주세요.");
                            return;
                        }


                        if (f.agree1.checked == false) {
                            alert("이용규정에 동의 후 예약이 가능합니다.");
                            f.agree1.focus();
                            return;
                        }
                        if (f.agree2.checked == false) {
                            alert("개인정보 활용에 동의 후 예약이 가능합니다.");
                            f.agree2.focus();
                            return;
                        }

                        // 내용 저장
                        var formData = new FormData(f);

                        $.ajax({
                            cache : false,
                            url : "/plugin/wz.bookingD.prm/step.2.update.cart.php", // 요기에
                            processData: false,
                            contentType: false,
                            type : 'POST',
                            data : formData,
                            success : function(data) {
                                var jsonObj = JSON.parse(data);
                            }, // success

                            error : function(xhr, status) {
                                alert(xhr + " : " + status);
                            }
                        }); // $.ajax */    }

                        if (payment == '무통장') {
                            if (confirm("예약하시겠습니까?")) {
                                f.action = "https://cmtour.co.kr/plugin/wz.bookingD.prm/step.2.update.php";
                                f.target = "_self";
                                f.submit();
                            }
                        } else if (payment == '카카오페이') {
                            pg_pay2(f);
                        } else if (payment == '네이버페이') {
                            //alert(f.total_pcnt.value);
                            pg_pay3(f);
                        }
                        else {
                            pg_pay(f);
                        }

                    }


                    // 카카오페이결제 추가
                    function getNext2() {
                        var f = document.forms.wzfrm;

                        var rm_cnt = $("input[name='rmt_ix[]']").length;
                        if (rm_cnt < 1) {
                            alert("예약정보가 존재하지 않습니다.");
                            return;
                        }
                        if (!f.bk_name.value) {
                            alert("예약자명을 입력해주세요.");
                            f.bk_name.focus();
                            return;
                        }
                        if (!f.bk_hp.value) {
                            alert("핸드폰번호를 입력해주세요.");
                            f.bk_hp.focus();
                            return;
                        }

                        var payment = '무통장';

                        var _bk_payment = f.bk_payment.value;
                        if (_bk_payment == '무통장') {
                            if (!f.bk_deposit_name.value) {
                                alert("입금자명을 입력해주세요.");
                                f.bk_deposit_name.focus();
                                return;
                            }
                            var bk_bank_account = document.getElementById("bk_bank_account");
                            if (bk_bank_account) {
                                if (f.bk_bank_account.options[f.bk_bank_account.selectedIndex].value == '') {
                                    alert("계좌번호를 선택해주세요.");
                                    f.bk_bank_account.focus();
                                    return;
                                }
                            }
                        }

                        payment = $(":input:radio[name=bk_payment]:checked").val();
                        if (!payment) {
                            alert("결제방식을 선택해주세요.");
                            return;
                        }


                        if (f.agree1.checked == false) {
                            alert("이용규정에 동의 후 예약이 가능합니다.");
                            f.agree1.focus();
                            return;
                        }
                        if (f.agree2.checked == false) {
                            alert("개인정보 활용에 동의 후 예약이 가능합니다.");
                            f.agree2.focus();
                            return;
                        }

                        if (payment == '무통장') {
                            if (confirm("예약하시겠습니까?")) {
                                f.action = "https://cmtour.co.kr/plugin/wz.bookingD.prm/step.2.update.php";
                                f.target = "_self";
                                f.submit();
                            }
                        }
                        else {
                            pg_pay2(f);
                        }

                    }

                    function getCart() {
                        alert('로그인 후 사용 가능합니다.');    }

                    //-->
                </script>

                <div class="clearfix" style="height:10px;"></div>

            </div>

        </div>

        <script type="text/javascript">
            <!--
            Object.defineProperty(console, '_commandLineAPI', { get : function() { throw '콘솔을 사용할 수 없습니다.' } });
            //-->
        </script>
    </div>
</section>


<%--footer_jsp_적용_시작--%>
<footer>
    <%@ include file="common_footer.jsp" %>
</footer>
<%--footer_jsp_적용_끝--%>

<%@ include file="common_m_footer.jsp" %>
<%@ include file="common_sidebar.jsp" %>
<%@ include file="common_lower_container.jsp" %>

<%--스크롤_애니메이션_리셋--%>
<script src="../front_util/js/wow.min.js"></script>
<script> new WOW().init(); </script>
</body>
</html>

