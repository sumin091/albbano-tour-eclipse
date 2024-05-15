<%--
Created by IntelliJ IDEA.
User: potatomoong
Date: 2024-04-17
Time: 오후 12:41
To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <title>전체검색 결과 | 알빠노관광</title>

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
                        <span>전체검색 결과</span>
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
            <li>전체검색 결과</li>
        </div>
        <div class="title"></div>
        <p class="normal_txt"></p>
    </div>

    <div class="scontents">


        <div class="bg_vline"></div>
        <p class="eng"><em></em> 전체검색 결과</p>
        <p class="stitle"></p>


        <!-- 전체검색 시작 { -->
        <form name="fsearch" onsubmit="return fsearch_submit(this);" method="get">
            <input type="hidden" name="srows" value="0">
            <fieldset id="sch_res_detail">
                <legend>상세검색</legend>
                <label for="gr_id" class="sound_only">게시판 그룹선택</label><select name="gr_id" id="gr_id" class="select">
                <option value="">전체 분류
                <option value="community">커뮤니티</option>
            </select>
                <script>document.getElementById("gr_id").value = "";</script>

                <label for="sfl" class="sound_only">검색조건</label>
                <select name="sfl" id="sfl">
                    <option value="wr_subject||wr_content">제목+내용</option>
                    <option value="wr_subject">제목</option>
                    <option value="wr_content">내용</option>
                    <option value="mb_id">회원아이디</option>
                    <option value="wr_name">이름</option>
                </select>

                <label for="stx" class="sound_only">검색어<strong class="sound_only"> 필수</strong></label>
                <span class="sch_wr">
        <input type="text" name="stx" value="" id="stx" required class="frm_input" size="40">
        <button type="submit" class="btn_submit"><i class="fa fa-search" aria-hidden="true"></i> 검색</button>
    </span>

                <script>
                    function fsearch_submit(f) {
                        if (f.stx.value.length < 2) {
                            alert("검색어는 두글자 이상 입력하십시오.");
                            f.stx.select();
                            f.stx.focus();
                            return false;
                        }

                        // 검색에 많은 부하가 걸리는 경우 이 주석을 제거하세요.
                        var cnt = 0;
                        for (var i = 0; i < f.stx.value.length; i++) {
                            if (f.stx.value.charAt(i) == ' ')
                                cnt++;
                        }

                        if (cnt > 1) {
                            alert("빠른 검색을 위하여 검색어에 공백은 한개만 입력할 수 있습니다.");
                            f.stx.select();
                            f.stx.focus();
                            return false;
                        }

                        f.action = "";
                        return true;
                    }
                </script>
                <span class="sch_rd">
        <input type="radio" value="or" checked id="sop_or" name="sop">
        <label for="sop_or">OR</label>
        <input type="radio" value="and" id="sop_and" name="sop">
        <label for="sop_and">AND</label>
    </span>
            </fieldset>
        </form>

        <div id="sch_result">


            <hr>


        </div>
        <!-- } 전체검색 끝 -->
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
