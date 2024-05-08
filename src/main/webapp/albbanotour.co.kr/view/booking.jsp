<%--
  Created by IntelliJ IDEA.
  User: potatomoong
  Date: 2024-04-13
  Time: 오후 04:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="dao.TourDAO" %>
<%@ page import="vo.CourseManagementVO" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    TourDAO tourDAO = TourDAO.getInstance();
    List<CourseManagementVO> tourList = new ArrayList<>();
    tourList = tourDAO.selectAllTourList();
    pageContext.setAttribute("tourList", tourList);
%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <title>투어예약 | 알빠노관광</title>

    <script>
        // 자바스크립트에서 사용하는 전역변수 선언
        var g5_url = "../index_user.jsp";
        var g5_bbs_url = "index_user.jsp";
        var g5_is_member = "";
        var g5_is_admin = "";
        var g5_is_mobile = "";
        var g5_bo_table = "booking";
        var g5_sca = "";
        var g5_editor = "smarteditor2";
        var g5_cookie_domain = "";
    </script>

    <%@include file="common_head.jsp" %>

    <script type="text/javascript" src="../js/jquery.magnific-popup.min.js"></script>
    <script type="text/javascript" src="../js/common-booking.js"></script>
</head>

<body>

<%@ include file="common_m_header.jsp" %>
<%@ include file="common_desktop_header.jsp" %>

<section id="sub_visual">
    <div class="backgroundimg">
        <div class="visual_area"
             style="background:url('../front_util/images/sub_visual02.jpg') no-repeat top center;">
        </div>
    </div>
</section>

<section id="sub_wrapper">
    <div id="sub_menu">
        <div class="sub_location">
            <div>
                <div class="cen"><a href="index_user.jsp"><i class="fa fa-home" aria-hidden="true"></i></a></div>
                <ul class="">
                    <li>
                        <span>투어예약</span>
                        <ul>
                            <li><a href="list_spot.jsp" target="_self">관광지</a></li>
                            <li><a href="list_restaurant.jsp" target="_self">맛집</a></li>
                            <li><a href="booking.jsp" target="_self">투어</a></li>
                            <li><a href="main_notice.jsp?bo_table=notice" target="_self">고객센터</a></li>
                        </ul>
                    </li>
                </ul>
                <ul class="dep2">
                    <li>
                        <span>투어예약</span>
                        <ul>
                            <li><a href="tour_course.html" target="_self">투어코스</a></li>
                            <li><a href="review_spot.jsp" target="_self">투어예약</a></li>
                            <li><a href="review_spot.jsp" target="_self">예약확인</a></li>
                        </ul>
                    </li>
                </ul>

            </div>
        </div>
    </div>
    
    
    <div id="sub_tit">
        <div class="path">
            <li><a href="index_user.jsp"><span class="ic-home"><i></i></span></a></li>
            <li></li>
            <li>투어예약</li>
        </div>
        <div class="title">투어예약</div>
        <p class="normal_txt"></p>
    </div>

    <div class="scontents">
        <div class="bg_vline"></div>
        <p class="eng"><em></em> 투어예약</p>
        <p class="stitle"></p>

        <script type="text/javascript"> var cp_code = ''; </script>

        <div class="wetoz">
            <div class="col-md-12">
                <div class="navi-wrap">
                    <ul class="nav nav-tabs">
                        <li role="presentation" class="active"><a href="booking.jsp">실시간예약</a></li>
                        <li role="presentation" class=""><a href="list_reservation.jsp">예약확인/취소</a></li>
                    </ul>
                    <p class="button-list"></p>
                </div>

                <div class="clearfix" style="height:10px;"></div>

                <div class="bx-reserv">
                    <table cellpadding=0 cellspacing=0 border=0 style="width:100%;">
                        <tbody>
                        <tr>
                            <td class="bxframe fm-room">
                                <div class="head">01. 투어선택 ◀◀코스를 선택하세요▶▶</div>
                                <div class="list">
                                    <c:forEach var="tour" items="${tourList}" varStatus="i">
   										<a href="#none" class="roomli active" data-rm-ix="${i.index}">
        									<div class="media-left">
            								<div class="room-photo-frame">
                								<img src="https://cmtour.co.kr/data/wzb_room/thumb-3552226015_dXFPwZYD_img_sea3_50x50.png" class="room-photo-main">
            								</div>
        									</div>
        									<div class="media-body info">
            								<h4 class="media-heading" id="top-aligned-media">
          								      <c:out value="${tour.crsName}" />
         								   </h4>
      							      <div class="desc"></div>
     							   </div>
  							  </a>
								</c:forEach>
                                </div>
                            </td>
                            
                            <td class="bxframe fm-day">
                                <div class="head">02. 날짜</div>
                                <div class="list">
                                    <div id="wrap-calendar" class="wrap-calendar">
                                        <nav>
                                            <ul class="pager">
                                                <li><a href="javascript:_wzSetCanlendar('2024','3');"><i
                                                        class="fa fa-chevron-left" aria-hidden="true"></i></a></li>
                                                <li><strong class="ym-title"><span class="text-number">2024</span><span
                                                        class="text-hangul">.</span> <span class="text-number">04</span></strong>
                                                </li>
                                                <li><a href="javascript:_wzSetCanlendar('2024','5');"><i
                                                        class="fa fa-chevron-right" aria-hidden="true"></i></a></li>
                                            </ul>
                                        </nav>

                                        <div class="daylist hidden-xs hidden-sm">
                                            <a href="#none" class="dayli"><span class="txweek closed">일</span> <span
                                                    class="txday closed">07</span></a>
                                            <a href="#none" class="dayli"><span class="txweek closed">월</span> <span
                                                    class="txday closed">08</span></a>
                                            <a href="#none" class="dayli live" data-date="2024-04-09"><span
                                                    class="txweek ">화</span> <span class="txday ">09</span></a>
                                            <a href="#none" class="dayli"><span class="txweek closed">수</span> <span
                                                    class="txday closed">10</span></a>
                                            <a href="#none" class="dayli live active" data-date="2024-04-11"><span
                                                    class="txweek ">목</span> <span class="txday ">11</span></a>
                                            <a href="#none" class="dayli"><span class="txweek closed">금</span> <span
                                                    class="txday closed">12</span></a>
                                            <a href="#none" class="dayli live" data-date="2024-04-13"><span
                                                    class="txweek box-sat">토</span> <span
                                                    class="txday box-sat">13</span></a>
                                            <a href="#none" class="dayli live" data-date="2024-04-14"><span
                                                    class="txweek box-sun">일</span> <span
                                                    class="txday box-sun">14</span></a>
                                            <a href="#none" class="dayli"><span class="txweek closed">월</span> <span
                                                    class="txday closed">15</span></a>
                                            <a href="#none" class="dayli live" data-date="2024-04-16"><span
                                                    class="txweek ">화</span> <span class="txday ">16</span></a>
                                            <a href="#none" class="dayli"><span class="txweek closed">수</span> <span
                                                    class="txday closed">17</span></a>
                                            <a href="#none" class="dayli live" data-date="2024-04-18"><span
                                                    class="txweek ">목</span> <span class="txday ">18</span></a>
                                            <a href="#none" class="dayli"><span class="txweek closed">금</span> <span
                                                    class="txday closed">19</span></a>
                                            <a href="#none" class="dayli live" data-date="2024-04-20"><span
                                                    class="txweek box-sat">토</span> <span
                                                    class="txday box-sat">20</span></a>
                                            <a href="#none" class="dayli live" data-date="2024-04-21"><span
                                                    class="txweek box-sun">일</span> <span
                                                    class="txday box-sun">21</span></a>
                                            <a href="#none" class="dayli"><span class="txweek closed">월</span> <span
                                                    class="txday closed">22</span></a>
                                            <a href="#none" class="dayli live" data-date="2024-04-23"><span
                                                    class="txweek ">화</span> <span class="txday ">23</span></a>
                                            <a href="#none" class="dayli"><span class="txweek closed">수</span> <span
                                                    class="txday closed">24</span></a>
                                            <a href="#none" class="dayli live" data-date="2024-04-25"><span
                                                    class="txweek ">목</span> <span class="txday ">25</span></a>
                                            <a href="#none" class="dayli"><span class="txweek closed">금</span> <span
                                                    class="txday closed">26</span></a>
                                            <a href="#none" class="dayli live" data-date="2024-04-27"><span
                                                    class="txweek box-sat">토</span> <span
                                                    class="txday box-sat">27</span></a>
                                            <a href="#none" class="dayli live" data-date="2024-04-28"><span
                                                    class="txweek box-sun">일</span> <span
                                                    class="txday box-sun">28</span></a>
                                            <a href="#none" class="dayli"><span class="txweek closed">월</span> <span
                                                    class="txday closed">29</span></a>
                                            <a href="#none" class="dayli live" data-date="2024-04-30"><span
                                                    class="txweek ">화</span> <span class="txday ">30</span></a>
                                        </div>

                                        <div class="bx-calendar">
                                            <table class="table table-bordered tbl-canlendar hidden-md hidden-lg">
                                                <caption>위토즈 실시간 예약플러그인 D형</caption>
                                                <tbody>
                                                <tr>
                                                    <th class="sunday"><span class="text-red">Sun</span></th>
                                                    <th>Mon</th>
                                                    <th>Tue</th>
                                                    <th>Wed</th>
                                                    <th>Thu</th>
                                                    <th>Fri</th>
                                                    <th class="saturday"><span class="text-blue">Sat</span></th>
                                                </tr>

                                                </tbody>
                                                <tbody>
                                                <tr>
                                                    <td class="prev"></td>
                                                    <td class=" imposs">
                                                        <div class="text-center day">1</div>
                                                    </td>
                                                    <td class=" imposs">
                                                        <div class="text-center day">2</div>
                                                    </td>
                                                    <td class=" imposs">
                                                        <div class="text-center day">3</div>
                                                    </td>
                                                    <td class=" imposs">
                                                        <div class="text-center day">4</div>
                                                    </td>
                                                    <td class=" imposs">
                                                        <div class="text-center day">5</div>
                                                    </td>
                                                    <td class="box-sat imposs">
                                                        <div class="text-center day">6</div>
                                                    </td>
                                                </tr>
                                                <tr height="30" class="date">
                                                    <td class=" imposs">
                                                        <div class="text-center day">7</div>
                                                    </td>
                                                    <td class=" imposs">
                                                        <div class="text-center day">8</div>
                                                    </td>
                                                    <td class=" live">
                                                        <a href="#none" class="dayli live text-center day live"
                                                           data-date="2024-04-09">9</a>
                                                    </td>
                                                    <td class=" imposs">
                                                        <div class="text-center day">10</div>
                                                    </td>
                                                    <td class=" live">
                                                        <a href="#none" class="dayli live text-center day live"
                                                           data-date="2024-04-11">11</a>
                                                    </td>
                                                    <td class=" imposs">
                                                        <div class="text-center day">12</div>
                                                    </td>
                                                    <td class="box-sat live">
                                                        <a href="#none" class="dayli live text-center day box-sat live"
                                                           data-date="2024-04-13">13</a>
                                                    </td>
                                                </tr>
                                                <tr height="30" class="date">
                                                    <td class="box-sun live">
                                                        <a href="#none" class="dayli live text-center day box-sun live"
                                                           data-date="2024-04-14">14</a>
                                                    </td>
                                                    <td class=" imposs">
                                                        <div class="text-center day">15</div>
                                                    </td>
                                                    <td class=" live">
                                                        <a href="#none" class="dayli live text-center day live"
                                                           data-date="2024-04-16">16</a>
                                                    </td>
                                                    <td class=" imposs">
                                                        <div class="text-center day">17</div>
                                                    </td>
                                                    <td class=" live">
                                                        <a href="#none" class="dayli live text-center day live"
                                                           data-date="2024-04-18">18</a>
                                                    </td>
                                                    <td class=" imposs">
                                                        <div class="text-center day">19</div>
                                                    </td>
                                                    <td class="box-sat live">
                                                        <a href="#none" class="dayli live text-center day box-sat live"
                                                           data-date="2024-04-20">20</a>
                                                    </td>
                                                </tr>
                                                <tr height="30" class="date">
                                                    <td class="box-sun live">
                                                        <a href="#none" class="dayli live text-center day box-sun live"
                                                           data-date="2024-04-21">21</a>
                                                    </td>
                                                    <td class=" imposs">
                                                        <div class="text-center day">22</div>
                                                    </td>
                                                    <td class=" live">
                                                        <a href="#none" class="dayli live text-center day live"
                                                           data-date="2024-04-23">23</a>
                                                    </td>
                                                    <td class=" imposs">
                                                        <div class="text-center day">24</div>
                                                    </td>
                                                    <td class=" live">
                                                        <a href="#none" class="dayli live text-center day live"
                                                           data-date="2024-04-25">25</a>
                                                    </td>
                                                    <td class=" imposs">
                                                        <div class="text-center day">26</div>
                                                    </td>
                                                    <td class="box-sat live">
                                                        <a href="#none" class="dayli live text-center day box-sat live"
                                                           data-date="2024-04-27">27</a>
                                                    </td>
                                                </tr>
                                                <tr height="30" class="date">
                                                    <td class="box-sun live">
                                                        <a href="#none" class="dayli live text-center day box-sun live"
                                                           data-date="2024-04-28">28</a>
                                                    </td>
                                                    <td class=" imposs">
                                                        <div class="text-center day">29</div>
                                                    </td>
                                                    <td class=" live">
                                                        <a href="#none" class="dayli live text-center day live"
                                                           data-date="2024-04-30">30</a>
                                                    </td>
                                                    <td class="next "></td>
                                                    <td class="next "></td>
                                                    <td class="next "></td>
                                                    <td class="next sat"></td>
                                                </tr>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </td>
                            <td class="bxframe fm-time">
                                <div class="head">03. 시간</div>
                                <div class="list">
                                    <div id="wrap-time" class="wrap-time">
                                        <div class="btn-time"><a href="#none" class="timeli live" data-rmt-ix="1"
                                                                 data-time="09:00" data-place="경주역"><span
                                                class="remainc">( 60 / 60 )</span><span class="txtms">09시00분</span><span
                                                class="txtms left-padding30">경주역</span></a>
                                        </div>
                                    </div>
                                </div>
                            </td>
                        </tr>
                        </tbody>
                    </table>

                </div>

                <div class="clearfix" style="height:10px;"></div>

                <form method="post" name="wzfrm" id="wzfrm"
                      action="https://cmtour.co.kr/bbs/board.php?bo_table=booking&amp;cp_code="
                      onsubmit="return getNext(document.forms.wzfrm);">
                    <input type="hidden" name="mode" id="mode" value="step2"/>
                    <input type="hidden" name="rm_ix" id="rm_ix" value=""/>
                    <input type="hidden" name="sch_day" id="sch_day" value=""/>

                    <div id="hidden-parms"></div>

                    <div class="row">
                        <div class="col-md-12">
                            <div id="room-select-list"></div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-12 btn-group-justified" role="group">
                            <div class="btn-group" role="group">
                                <button type="button" class="btn btn-success" style="height: 80px;font-size: 24px" ;
                                        onclick="location.href='pay.html'">다음단계 <i
                                        class="fa fa-chevron-right fa-sm"></i></button>
                            </div>
                        </div>
                    </div>

                </form>

                <div class="clearfix" style="height:15px;"></div>

                <div class="panel panel-default">
                    <ul class="list-group">
                        <li class="list-group-item"><i class="fa fa-chevron-right fa-sm" aria-hidden="true"></i> 이용서비스
                            선택 후 날짜와 시간을 선택해주세요.
                        </li>
                        <li class="list-group-item"><i class="fa fa-chevron-right fa-sm" aria-hidden="true"></i> 예약 전
                            반드시 주의사항을 숙지하시기 바랍니다.
                        </li>
                    </ul>
                </div>
                
                <script type="text/javascript">
                    //<!--
                    var sch_day = '2024-04-03';
                    var arr_rm_ix = new Array('8');

                    jQuery(document).ready(function () {

                        $(document).on('click', '.roomli', function () {
                            $('.roomli').removeClass('active');
                            $(this).addClass('active');
                            var rm_ix = $(this).attr('data-rm-ix');
                            document.forms.wzfrm.rm_ix.value = rm_ix;
                            document.forms.wzfrm.sch_day.value = '';
                            _wzSetCanlendar('', '');
                            _wzSetTime();
                        });

                        $(document).on('click', '.dayli.live', function () {
                            $('.dayli').removeClass('active');
                            $(this).addClass('active');
                            var sch_day = $(this).attr('data-date');
                            document.forms.wzfrm.sch_day.value = sch_day;
                            _wzSetTime();
                        });

                        $(document).on('click', '.timeli.live', function (e) {

                            var f = document.forms.wzfrm;
                            var rm_ix = f.rm_ix.value;
                            var rmt_ix = $(this).attr('data-rmt-ix');
                            var rm_time = $(this).attr('data-time');
                            var rm_place = $(this).attr('data-place');

                            if ($(this).hasClass('closed')) {
                                e.preventDefault();
                                return;
                            } else {

                                var rm_exist = false;
                                $("input[name='rmt_ix[]']").each(
                                    function () {
                                        if (this.value == rmt_ix) {
                                            rm_exist = true;
                                        }
                                    }
                                );

                                $('.timeli.live').removeClass('active');
                                $('.rm_selected').remove();
                                $('#hidden-parms').append('<input type="hidden" name="rmt_ix[]" class="rm_selected" value="' + rmt_ix + '" />');
                                $('#hidden-parms').append('<input type="hidden" name="rm_time[]" class="rm_selected" value="' + rm_time + '" />');
                                $('#hidden-parms').append('<input type="hidden" name="rm_place[]" class="rm_selected" value="' + rm_place + '" />');
                                $(this).addClass('active');
                                /*
                                if (rm_exist) { // 선택 취소처리.
                                    $('.rm_selected_'+rmt_ix).remove();
                                    $(this).removeClass('active');
                                }
                                else {
                                    $('#hidden-parms').append('<input type="hidden" name="rmt_ix[]" class="rm_selected_'+rmt_ix+'" value="'+rmt_ix+'" />');
                                    $('#hidden-parms').append('<input type="hidden" name="rm_time[]" class="rm_selected_'+rmt_ix+'" value="'+rm_time+'" />');
                                    $(this).addClass('active');
                                }
                                */
                            }
                        });


                    });

                    // 달력랜더링
                    function _wzSetCanlendar(sch_year, sch_month) {

                        var f = document.forms.wzfrm;
                        var rm_ix = f.rm_ix.value;
                        $.ajax({
                            type: 'get',
                            async: true,
                            url: 'https://cmtour.co.kr/plugin/wz.bookingD.prm/ajax.calendar.php',
                            dataType: 'html',
                            timeout: 30000,
                            cache: false,
                            data: {
                                'bo_table': g5_bo_table,
                                'sch_year': sch_year,
                                'sch_month': sch_month,
                                'sch_day': sch_day,
                                'rm_ix': rm_ix
                            },
                            beforeSend: function () {
                                $('#wrap-calendar').html('<div class="ax-loading"><img src="../images/loading_contents.gif" /></div>');
                            },
                            success: function (response, status, request) {
                                console.log(response);
                                setTimeout(function () {
                                    $('#wrap-calendar').html(response);
                                }, 500);
                            }
                        });
                        $('#hidden-parms').empty();
                    }

                    // 시간랜더링
                    function _wzSetTime() {

                        var f = document.forms.wzfrm;
                        var rm_ix = f.rm_ix.value;
                        var sch_day = f.sch_day.value;
                        $.ajax({
                            type: 'get',
                            async: true,
                            url: 'https://cmtour.co.kr/plugin/wz.bookingD.prm/ajax.time.php',
                            dataType: 'html',
                            timeout: 30000,
                            cache: false,
                            data: {'bo_table': g5_bo_table, 'sch_day': sch_day, 'rm_ix': rm_ix},
                            beforeSend: function () {
                                $('#wrap-time').html('<div class="ax-loading"><img src="../images/loading_contents.gif" /></div>');
                            },
                            success: function (response, status, request) {
                                setTimeout(function () {
                                    $('#wrap-time').html(response);
                                }, 500);
                            }
                        });
                        $('#hidden-parms').empty();
                    }

                    function getNext(f) {

                        var rmt_cnt = $("input[name='rmt_ix[]']").length;

                        if (rmt_cnt < 1) {
                            alert("시간을 선택해주세요.");
                            return false;
                        }
                    }

                    //-->
                </script>

                <div class="clearfix" style="height:10px;"></div>

            </div>

        </div>

        <script type="text/javascript">
            //<!--
            Object.defineProperty(console, '_commandLineAPI', {
                get: function () {
                    throw '콘솔을 사용할 수 없습니다.'
                }
            });
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
</body>
</html>
