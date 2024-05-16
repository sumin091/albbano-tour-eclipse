<%--
  Created by IntelliJ IDEA.
  User: potatomoong
  Date: 2024-04-13
  Time: 오전 1:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!--모바일 시작 비로그인-->
<div id="mobile_header">
    <div class="inner">
        <h1><a href="index_user.jsp"><img src="http://127.0.0.1/front_util/images/top_logo_m.png" alt="로고" title="로고"></a></h1>
        <ul class="m_gnb">
            <li class="category"><a href="#none" class="qbt" title="전체메뉴열기">
                <i class="fa fa-outdent" aria-hidden="true"></i></a>
            </li>
            <li class="home">
                <a href="tel:1588-1234" title="고객센터전화"><i class="fa fa-phone"></i></a>
            </li>
        </ul>
    </div>
</div>

<div id="sideMenu">
    <div class="side_title qbt"> 알빠노관광
        <i class="fa fa-window-close" aria-hidden="true" style="float:right; margin-right:10px; margin-top:20px;"></i>
    </div>

    <div id="gnba">
        <div style="margin-top:10px; margin-bottom:10px;">
            <a href="login.jsp">로그인</a>
            <a href="register.jsp">회원가입</a>
        </div>
    </div>

    <!-- 모바일 로그인-->
    <!--    <div id="hd_login_msg">아이디님 로그인 중 <a href="../index_user.jsp">로그아웃</a></div>-->

    <!--    <div id="mobile_header">-->
    <!--        <div class="inner">-->
    <!--            <h1><a href="../index_user.jsp"><img src="../theme/cmtour/html/image/top_logo_m.png" alt="로고" title="로고"></a></h1>-->
    <!--            <ul class="m_gnb">-->

    <!--                <li class="category">-->
    <!--                    <a href="#none" class="qbt" title="전체메뉴열기">-->
    <!--                        <i class="fa fa-outdent" aria-hidden="true"></i>-->
    <!--                    </a>-->
    <!--                </li>-->

    <!--                <li class="home">-->
    <!--                    <a href="tel:1588-1234" title="고객센터전화">-->
    <!--                        <i class="fa fa-phone"></i>-->
    <!--                    </a>-->
    <!--                </li>-->

    <!--            </ul>-->
    <!--        </div>-->
    <!--    </div>-->

    <!--    <div id="sideMenu">-->

    <!--        <div class="side_title qbt">알빠노관광-->
    <!--            <i class="fa fa-window-close" aria-hidden="true" style="float:right; margin-right:10px; margin-top:20px;"></i>-->
    <!--        </div>-->

    <!--        <div id="gnba">-->
    <!--            <br>-->
    <!--            <span style="color:#fff;">여행자님!</span>-->
    <!--            <div style="margin-top:10px; margin-bottom:10px;">-->
    <!--                <a href="../index_user.jsp">로그아웃</a>-->
    <!--                <a href="edit_profile.jsp">정보수정</a>-->
    <!--            </div>-->
    <!--        </div>-->
    <!--모바일로그인 종료-->
    <div class="navi_bg">
        <div class="nav">
            <ul class="subnav1">
                <li class="navi_set">
                    <div>관광지<i class="fas fa-angle-down" aria-hidden="true"
                               style="float:right; margin-right:10px; margin-top:12px;"></i></div>
                    <ul class="subnav">
                        <li><a href="list_spot.jsp" target="_self">- 관광지 리스트</a></li>
                        <li><a href="review_spot.jsp" target="_self">- 관광지 리뷰</a></li>
                    </ul>
                </li>

                <li class="navi_set">
                    <div>맛집<i class="fas fa-angle-down" aria-hidden="true"
                              style="float:right; margin-right:10px; margin-top:12px;"></i></div>
                    <ul class="subnav">
                        <li><a href="list_restaurant.jsp" target="_self">- 맛집 리스트</a></li>
                        <li><a href="review_restaurant.jsp" target="_self">- 맛집 리뷰</a></li>
                    </ul>
                </li>

                <li class="navi_set">
                    <div>투어예약<i class="fas fa-angle-down" aria-hidden="true" style="float:right; margin-right:10px; margin-top:12px;"></i></div>
                    <ul class="subnav">
                        <li><a href="tour_course.jsp" target="_self">- 투어 코스</a></li>
                        <li><a href="booking.jsp" target="_self">- 투어 예약</a></li>
                        <li><a href="list_reservation.jsp" target="_self">- 예약 확인</a></li>
                    </ul>
                </li>

                <li class="navi_set">
                    <div>고객센터<i class="fas fa-angle-down" aria-hidden="true"
                                style="float:right; margin-right:10px; margin-top:12px;"></i></div>
                    <ul class="subnav">
                        <li><a href="main_notice.jsp" target="_self">- 공지사항</a></li>
                        <li><a href="faq.jsp" target="_self">- 자주 묻는 질문</a></li>
                        <li><a href="qna.jsp" target="_self">- 질문답변</a></li>
                        <li><a href="question.jsp" target="_self">- 1:1문의</a></li>
                    </ul>
                </li>

            </ul>
        </div>
    </div>

    <div style="margin: 10px auto; text-align: center">
        <p style="background: #d05222;border-radius: 20px;margin: 10px 20px;padding: 10px;color: #fff;font-size: 1rem;">
            고객문의 <br>
            02-3483-4632</p>
    </div>

</div>
<div id="back_cover"></div>
<!-- 모바일 종료-->
