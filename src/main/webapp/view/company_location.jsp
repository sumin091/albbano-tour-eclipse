<%--
Created by IntelliJ IDEA.
User: potatomoong
Date: 2024-04-14
Time: 오후 10:19
To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!doctype html>
<html lang="ko">

<head>
    <title>오시는길 | 알빠노관광</title>
    <script>
        // 자바스크립트에서 사용하는 전역변수 선언
        var g5_url = "../../../../index_user.jsp";
        var g5_bbs_url = "../../../../bbs/index_user.jsp";
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
        <div class="visual_area"
             style="background:url('../front_util/images/sub_visual04.jpg') no-repeat top center;"></div>
    </div>
</section>

<section id="sub_wrapper">
    <div id="sub_menu">
        <div class="sub_location">
            <div>
                <div class="cen"><a href="index_user.jsp"><i class="fa fa-home" aria-hidden="true"></i></a>
                </div>
                <ul class="">
                    <li>
                        <span>알빠노관광</span>
                        <ul>
                            <li><a href="tour_course.jsp" target="_self">관광지</a></li>
                            <li><a href="list_restaurant.jsp" target="_self">맛집</a></li>
                            <li><a href="booking.jsp" target="_self">투어예약</a></li>
                            <li><a href="main_notice.jsp?bo_table=notice" target="_self">고객센터</a></li>
                        </ul>
                    </li>
                </ul>
                <ul class="dep2">
                    <li>
                        <span>오시는길</span>
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
            <li>알빠노관광</li>
            <li>오시는길</li>
        </div>
        <div class="title">알빠노관광</div>
        <p class="normal_txt">
            고객님의 방문을 환영합니다.
        </p>
    </div>

    <link href="../front_util/css/style.dt_ori.daontheme_ver2_.03.css" rel="stylesheet" type="text/css">

    <div class="scontents">
        <div class="bg_vline"></div>
        <p class="eng"><em>CONTACT</em> US</p>
        <p class="stitle">찾아오시는 길을 자세히 알려드립니다.</p>

        <div class="map_wrap wow fadeInUp">

            <div class="g_map">

                <div id="daumRoughmapContainer1569549801905"
                     class="root_daum_roughmap root_daum_roughmap_landing"></div>
                <script charset="UTF-8" class="daum_roughmap_loader_script"
                        src="../../dmaps.daum.net/map_js_init/roughmapLoader.js"></script>
                <script charset="UTF-8">
                    daum_width = ($(".g_map").width()); // 1.추가
                    if (daum_width == "") daum_width = 360; // 2.추가
                    new daum.roughmap.Lander({
                        "timestamp": "1569549801905",
                        "key": "v7cp",
                        "mapWidth": daum_width, // 3.수정
                        "mapHeight": "400"
                    }).render();
                </script>
            </div>


            <div class="map_info">
                <div class="con_box">
                    <h2>오시는길</h2>
                    <table>
                        <tbody>
                        <tr>
                            <th>주소</th>
                            <td>경상북도 경주시 태종로 685번길 6</td>
                        </tr>
                        <tr>
                            <th>전화</th>
                            <td>1588-1234, 02-3483-4632</td>
                        </tr>
                        <tr>
                            <th>팩스</th>
                            <td>054-743-6009</td>
                        </tr>
                        <tr>
                            <th>이메일</th>
                            <td><a href="mailto:tour@cmtour.co.kr">tour@cmtour.co.kr</a></td>
                        </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
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

<script src="../front_util/js/wow.min.js"></script>
<script> new WOW().init(); </script>

</body>
</html>
