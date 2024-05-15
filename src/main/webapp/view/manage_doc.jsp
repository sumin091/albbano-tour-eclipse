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
    <title>게시글 관리 | 알빠노관광</title>

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
             style="background:url('../front_util/images/sub_visual02.jpg') no-repeat top center;"></div>
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
                            <li><a href="../theme/albbanotour/html/business/map_info_01.html" target="_self">투어예약</a>
                            </li>
                            <li><a href="main_notice.jsp?bo_table=notice" target="_self">고객센터</a></li>

                        </ul>
                    </li>
                </ul>
                <ul class="dep2">
                    <li>
                        <span>게시글 관리</span>
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
            <li>게시글 관리</li>
        </div>
        <div class="title"></div>
        <p class="normal_txt"></p>
    </div>

    <div class="scontents">


        <div class="bg_vline"></div>
        <p class="eng"><em></em> 게시글 관리</p>
        <p class="stitle"></p>


        <!-- 전체게시물 검색 시작 { -->
        <fieldset id="new_sch">
            <legend>상세검색</legend>
            <form name="fnew" method="get">
                <label for="gr_id" class="sound_only">그룹</label><select name="gr_id" id="gr_id">
                <option value="">전체그룹
                <option value="community">커뮤니티
            </select> <label for="view" class="sound_only">검색대상</label>
                <select name="view" id="view">
                    <option value="">전체게시물
                    <option value="w">원글만
                    <option value="c">코멘트만
                </select>
                <label for="mb_id" class="sound_only">검색어<strong class="sound_only"> 필수</strong></label>
                <input type="text" name="mb_id" value="" id="mb_id" required class="frm_input" size="40">
                <button type="submit" class="btn_submit"><i class="fa fa-search" aria-hidden="true"></i> 검색</button>
                <p>회원 아이디만 검색 가능</p>
            </form>
            <script>
                /* 셀렉트 박스에서 자동 이동 해제
                function select_change()
                {
                    document.fnew.submit();
                }
                */
                document.getElementById("gr_id").value = "";
                document.getElementById("view").value = "";
            </script>
        </fieldset>
        <!-- } 전체게시물 검색 끝 -->

        <!-- 전체게시물 목록 시작 { -->
        <form name="fnewlist" id="fnewlist" method="post" action="#" onsubmit="return fnew_submit(this);">
            <input type="hidden" name="sw" value="move">
            <input type="hidden" name="view" value="">
            <input type="hidden" name="sfl" value="">
            <input type="hidden" name="stx" value="">
            <input type="hidden" name="bo_table" value="">
            <input type="hidden" name="page" value="1">
            <input type="hidden" name="pressed" value="">

            <div class="tbl_head01 tbl_wrap">
                <table>
                    <thead>
                    <tr>
                        <th scope="col">그룹</th>
                        <th scope="col">게시판</th>
                        <th scope="col">제목</th>
                        <th scope="col">이름</th>
                        <th scope="col">일시</th>
                    </tr>
                    </thead>
                    <tbody>

                    <tr>
                        <td colspan="5" class="empty_table">게시물이 없습니다.</td>
                    </tr>
                    </tbody>
                </table>
            </div>

        </form>


        <!-- } 전체게시물 목록 끝 -->
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
