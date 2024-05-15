<%--
  Created by IntelliJ IDEA.
  User: potatomoong
  Date: 2024-04-17
  Time: 오후 12:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <title>회원현황 | 알빠노관광</title>

    <script>
        // 자바스크립트에서 사용하는 전역변수 선언
        var g5_url = "../index.html";
        var g5_bbs_url = "index.html";
        var g5_is_member = "";
        var g5_is_admin = "";
        var g5_is_mobile = "";
        var g5_bo_table = "";
        var g5_sca = "";
        var g5_editor = "";
        var g5_cookie_domain = "";
    </script>
    <%@ include file="common_head.jsp" %>
</head>

<body>
<%@ include file="common_m_header.jsp" %>
<%@ include file="common_desktop_header.jsp" %>

<section id="sub_visual">
    <div class="backgroundimg">
        <div class="visual_area" style="background:url('../front_util/images/sub_visual02.jpg') no-repeat top center;"></div>
    </div>
</section>

<section id="sub_wrapper">
    <div id="sub_menu">
        <div class="sub_location">
            <div>
                <div class="cen"><a href="index_user.jsp"><i class="fa fa-home" aria-hidden="true"></i></a></div>
                <ul class="">
                    <li>
                        <span></span>
                        <ul>
                            <li><a href="tour_course.jsp" target="_self">관광지</a></li>
                            <li><a href="booking.jsp?bo_table=booking" target="_self">맛집</a></li>
                            <li><a href="../theme/albbanotour/html/business/map_info_01.html" target="_self">투어예약</a></li>
                            <li><a href="main_notice.jsp?bo_table=notice" target="_self">고객센터</a></li>
                        </ul>
                    </li>
                </ul>
                <ul class="dep2">
                    <li>
                        <span>회원현황</span>
                        <ul>
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
            <li></li>
            <li>회원현황</li>
        </div>
        <div class="title"></div>
        <p class="normal_txt"></p>
    </div>

    <div class="scontents">

        <div class="bg_vline"></div>
        <p class="eng"><em></em> 회원 방문 현황</p>
        <p class="stitle"></p>

        <!-- 현재접속자 목록 시작 { -->
        <div id="current_connect">
            <ul>
                <li class="">
                    <div class="inner">
                        <span class="crt_num">001</span>
                        <span class="crt_name"><img src="../front_util/img/no_profile.gif" alt="profile_image"><br>회원1</span>
                        <span class="crt_lct">오류안내 페이지</span>
                    </div>
                </li>
                <li class="">
                    <div class="inner">
                        <span class="crt_num">002</span>
                        <span class="crt_name"><img src="../front_util/img/no_profile.gif" alt="profile_image"><br>회원2</span>
                        <span class="crt_lct">맛집 1 페이지</span>
                    </div>
                </li>
                <li class="">
                    <div class="inner">
                        <span class="crt_num">003</span>
                        <span class="crt_name"><img src="../front_util/img/no_profile.gif" alt="profile_image"><br>회원3</span>
                        <span class="crt_lct">맛집 1 페이지</span>
                    </div>
                </li>
                <li class="">
                    <div class="inner">
                        <span class="crt_num">004</span>
                        <span class="crt_name"><img src="../front_util/img/no_profile.gif" alt="profile_image"><br>노예1</span>
                        <span class="crt_lct">맛집 1 페이지</span>
                    </div>
                </li>
                <li class="box_clear">
                    <div class="inner">
                        <span class="crt_num">005</span>
                        <span class="crt_name"><img src="../front_util/img/no_profile.gif" alt="profile_image"><br>노예2</span>
                        <span class="crt_lct">로그인</span>
                    </div>
                </li>
                <li class="">
                    <div class="inner">
                        <span class="crt_num">006</span>
                        <span class="crt_name"><img src="../front_util/img/no_profile.gif" alt="profile_image"><br>노예3</span>
                        <span class="crt_lct">주간투어 탑승시간</span>
                    </div>
                </li>
                <li class="">
                    <div class="inner">
                        <span class="crt_num">007</span>
                        <span class="crt_name"><img src="../front_util/img/no_profile.gif" alt="profile_image"><br>이제</span>
                        <span class="crt_lct">세계유산투어</span>
                    </div>
                </li>
                <li class="">
                    <div class="inner">
                        <span class="crt_num">008</span>
                        <span class="crt_name"><img src="../front_util/img/no_profile.gif" alt="profile_image"><br>이거</span>
                        <span class="crt_lct">오류안내 페이지</span>
                    </div>
                </li>
                <li class="box_clear">
                    <div class="inner">
                        <span class="crt_num">009</span>
                        <span class="crt_name"><img src="../front_util/img/no_profile.gif" alt="profile_image"><br>그만하고</span>
                        <span class="crt_lct">동해안투어</span>
                    </div>
                </li>
                <li class="">
                    <div class="inner">
                        <span class="crt_num">010</span>
                        <span class="crt_name"><img src="../front_util/img/no_profile.gif" alt="profile_image"><br>회원사진</span>
                        <span class="crt_lct">탑승정보</span>
                    </div>
                </li>
                <li class="">
                    <div class="inner">
                        <span class="crt_num">011</span>
                        <span class="crt_name"><img src="../front_util/img/no_profile.gif" alt="profile_image"><br>그리러</span>
                        <span class="crt_lct">신라역사투어</span>
                    </div>
                </li>
                <li class="">
                    <div class="inner">
                        <span class="crt_num">012</span>
                        <span class="crt_name"><img src="../front_util/img/no_profile.gif" alt="profile_image"><br>갈게요</span>
                        <span class="crt_lct">탑승정보</span>
                    </div>
                </li>
            </ul>
        </div>
        <!-- } 현재접속자 목록 끝 -->
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
