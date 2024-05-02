<%--
  Created by IntelliJ IDEA.
  User: potatomoong
  Date: 2024-04-17
  Time: 오후 02:41
  To change this template use File | Settings | File Templates.
--%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="vo.ResListVO"%>
<%@page import="dao.ResListDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   


<%
String resCode = request.getParameter("res_code");
String resName = request.getParameter("res_name");

if( resCode==null){
 	response.sendRedirect("http://localhost/albbano-tour-eclipse/albbanotour.co.kr/view/list_restaurant.jsp");
 	return;
 }

ResListDAO rDAO = ResListDAO.getInstance();
List<ResListVO> list = new ArrayList<ResListVO>();
list = rDAO.selectResAllReview(resCode);
pageContext.setAttribute("list", list);


%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <title>맛집 리뷰 | 알빠노관광</title>

    <script>
        // 자바스크립트에서 사용하는 전역변수 선언
        var g5_url = "index_user.jsp";
        var g5_bbs_url = "index_user.jsp";
        var g5_is_member = "1";
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
             style="background:url('https://cmtour.co.kr/theme/cmtour/html/image/sub_visual05.jpg') no-repeat top center;"></div>
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
                        <span>맛집</span>
                        <ul>
                            <li><a href="/theme/cmtour/html/business/new_01.php" target="_self">관광지</a></li>
                            <li><a href="/bbs/board.php?bo_table=booking" target="_self">맛집</a></li>
                            <li><a href="/theme/cmtour/html/business/map_info_01.php" target="_self">투어예약</a></li>
                            <li><a href="/bbs/board.php?bo_table=notice" target="_self">관광지</a></li>

                        </ul>
                    </li>
                </ul>
                <ul class="dep2">
                    <li>
                        <span>맛집 리뷰</span>
                        <ul>
                            <li><a href="/bbs/board.php?bo_table=notice" target="_self">공지사항</a></li>


                            <li><a href="/bbs/faq.php?fm_id=1" target="_self">관광지 리뷰</a></li>


                            <li><a href="/bbs/board.php?bo_table=qa" target="_self">질문답변</a></li>


                            <li><a href="/bbs/qalist.php" target="_self">1:1문의</a></li>


                        </ul>
                    </li>
                </ul>

            </div>
        </div>
    </div>

    <div id="sub_tit">
        <div class="path">
            <li><a href="index_user.jsp"><span class="ic-home"><i></i></span></a></li>
            <li>관광지</li>
            <li></li>
            <li>관광지 리뷰</li>
        </div>
        <div class="title">관광지</div>
        <p class="normal_txt"></p>
    </div>

    <div class="scontents">


        <div class="bg_vline"></div>
        <p class="eng"><em></em> <%=resName %> 리뷰</p>
        <p class="stitle"></p>


        <!-- FAQ 시작 { -->
        <div id="faq_hhtml"></div>


        <div class="select_bo_cate mview">
            <a class="sel" rel="선택">맛집 리뷰</a>
            <ul style="display:none;">
                <li><a href="#none">선택</a></li>
                <li><a href="review_spot.jsp?fm_id=1" id="bo_cate_on"><span
                        class="sound_only">열린 분류 </span>맛집 리뷰</a></li>
            </ul>
        </div>
        <nav id="bo_cate" class="snone">
            <h2>맛집 분류</h2>
            <ul id="bo_cate_ul">
                <li><a href="review_restaurant.jsp?fm_id=1" id="bo_cate_on" style="background-color: white"><span
                        class="sound_only">열린 분류 </span>리뷰 작성</a></li>
            </ul>
        </nav>

        <div id="faq_wrap" class="faq_1">
            <section id="faq_con">
                <h2>맛집 목록</h2>
                <ol>
                 <c:forEach var="review" items="${ list }" varStatus="i">
     
                    <li>
                        <h3>
                            <img src=" ${review.img_name }">
                            <a href="#none" onclick="return faq_open(this);" style="display: block;">
                                <span class="tit_bg" style="position: static">제목</span>
                                <p style="    display: inline;">
                                   <c:out value=" ${review.res_title }"/><br>
                                </p>
                            </a>
                        </h3>
                        <div class="con_inner">
                            <span class="tit_bg">내용</span>
                             <c:out value="${review.res_contents }"/>
                            <div class="con_closer">
                                <button type="button" class="closer_btn btn_b03">닫기</button>
                            </div>
                        </div>
                    </li>
                    
                    </c:forEach>
                    
                    
                    
                    
                </ol>
            </section>
        </div>

        <nav class="pg_wrap"><span class="pg"><span class="sound_only">열린</span><strong
                class="pg_current">1</strong><span class="sound_only">페이지</span>
<a href="/bbs/faq.php?&amp;fm_id=1&amp;page=2" class="pg_page">2<span class="sound_only">페이지</span></a>
<a href="/bbs/faq.php?&amp;fm_id=1&amp;page=2" class="pg_page pg_end">맨끝</a>
</span></nav>
        <div id="faq_thtml"></div>
        <fieldset id="faq_sch">
            <legend>리뷰 검색</legend>

            <form name="faq_search_form" method="get">
                <!-- <span class="sch_tit">FAQ 검색</span> -->
                <input type="hidden" name="fm_id" value="1">
                <label for="stx" class="sound_only">검색어<strong class="sound_only"> 필수</strong></label>
                <input type="text" name="stx" value="" required id="stx" class="frm_input " size="15" maxlength="15"
                       placeholder="리뷰 검색">
                <button type="submit" value="검색" class="btn_submit"><i class="fa fa-search" aria-hidden="true"></i> 검색
                </button>
            </form>
        </fieldset>

        <!-- } FAQ 끝 -->


        <script src="https://cmtour.co.kr/js/viewimageresize.js"></script>
        <script>
            $(function () {
                $(".closer_btn").on("click", function () {
                    $(this).closest(".con_inner").slideToggle();
                });
            });

            function faq_open(el) {
                var $con = $(el).closest("li").find(".con_inner");

                if ($con.is(":visible")) {
                    $con.slideUp();

                } else {
                    $("#faq_con .con_inner:visible").css("display", "none");

                    $con.slideDown(
                        function () {
                            // 이미지 리사이즈
                            $con.viewimageresize2();
                        }
                    );
                }

                return false;
            }
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
