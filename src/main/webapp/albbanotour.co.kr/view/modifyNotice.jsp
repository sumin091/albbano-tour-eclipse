<%@page import="dao.NoticeDAO"%>
<%@page import="vo.NoticeVO"%>
<%@page import="java.sql.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    info="공지사항 작성"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
    
<%
request.setCharacterEncoding("UTF-8");

int num= Integer.parseInt(request.getParameter("doc_No"));

String doc_No= request.getParameter("doc_No");
String title= request.getParameter("title");
String img_Name= request.getParameter("img_Name");
String id= request.getParameter("id");
String doc_cont= request.getParameter("doc_cont");
String del_yn= request.getParameter("del_Yn");

NoticeDAO ntDAO=NoticeDAO.getInstance();
NoticeVO ntVO= new NoticeVO(); 

int isUpdated = ntDAO.updateNotice(ntVO);
/*  
if (isUpdated) {
    response.sendRedirect(request.getContextPath() + "/modiftNotice.jsp?doc_No=" + doc_No);
} else {
    response.sendRedirect(request.getContextPath() + "/registNotice.jsp");
}
*/
%>
<!DOCTYPE html>
<html lang="ko">

<head>
	<meta charset="UTF-8">
	<title>공지사항 | 알빠노관광</title>
 <script>
        // 자바스크립트에서 사용하는 전역변수 선언
        var g5_url = "";
        var g5_bbs_url = "";
        var g5_is_member = "1";
        var g5_is_admin = "";
        var g5_is_mobile = "";
        var g5_bo_table = "qa";
        var g5_sca = "";
        var g5_editor = "smarteditor2";
        var g5_cookie_domain = "";
    </script>
    <%@ include file="common_head.jsp" %>
</head>

<body>
<%@ include file="common_m_header.jsp" %>
<%-- <%@ include file="common_desktop_header.jsp" %>  --%>


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
                        <span>고객센터</span>
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
                        <span>질문답변</span>
                        <ul>
                            <li><a href="/bbs/board.php?bo_table=notice" target="_self">공지사항</a></li>


                            <li><a href="/bbs/faq.php?fm_id=1" target="_self">자주 묻는 질문</a></li>


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
            <li>고객센터</li>
            <li></li>
            <li>질문답변</li>
        </div>
        <div class="title">고객센터</div>
        <p class="normal_txt"></p>
    </div>

    <div class="scontents">


        <div class="bg_vline"></div>
        <p class="eng"><em></em> 공지사항 작성</p>
        <p class="stitle"></p>

	 <section id="bo_w">
            <h2 class="sound_only">공지사항 작성</h2>
	
	
	 <!-- 게시물 작성/수정 시작 { -->
            <form name="fwrite" id="fwrite" action="<%=request.getContextPath() %>/modifyNotice.jsp" method="post"
                  style="width:100%">

                <div class="bo_w_info write_div">
					<input type="hidden" name="doc_No" value="<%=ntVO.getDoc_No() %>">

                </div>


                <div class="bo_w_tit write_div">
                    <label for="wr_subject" class="sound_only">제목<strong>필수</strong></label>

                    <div id="autosave_wrapper write_div">
                        <input type="text" name="wr_subject" value="" id="wr_subject" required 
                               class="frm_input full_input required" value="<%=ntVO.getTitle() %>" size="50" maxlength="255" placeholder="제목">

                    </div>

                </div>

                <div class="write_div">
                    <label for="wr_content" class="sound_only">내용<strong>필수</strong></label>
                    <div class="wr_content smarteditor2">
                        <span class="sound_only">웹에디터 시작</span>
                        <script src="https://cmtour.co.kr/plugin/editor/smarteditor2/js/service/HuskyEZCreator.js"></script>
                        <script>var g5_editor_url = "https://cmtour.co.kr/plugin/editor/smarteditor2", oEditors = [],
                            ed_nonce = "52kNkUk0bp|1712424678|ed8c8bcef39e04e0cc6f094af2617bc1b8d3a47b";</script>
                        <script src="https://cmtour.co.kr/plugin/editor/smarteditor2/config.js"></script>
                       
                        <textarea id="wr_content" name="wr_content" class="smarteditor2" maxlength="65536"
                                   style="width:100%;height:300px" value="<%=ntVO.getDoc_Cont() %> "></textarea>
                        <span class="sound_only">웹 에디터 끝</span></div>

                </div>


                <div class="bo_w_flie write_div">
                    <div class="file_wr write_div">
                        <label for="bf_file_2" class="lb_icon"><i class="fa fa-download" aria-hidden="true"></i><span
                                class="sound_only"> 파일 #1</span></label>
                        <input type="file" name="bf_file[]" id="bf_file_2" title="파일첨부 2 : 용량 10,485,760 바이트 이하만 업로드 가능"
                               value="<%=ntVO.getImg_Name() %>" class="frm_file ">
                    </div>


                </div>


                <div class="btn_confirm write_div" style="text-align:center;">
                    <input type="button" value="취소" class="btn btn-light" onclick="history.back();"/>
                    <input type="submit" value="수정" id="btn_submit" class="btn_submit btn" onclick="alert()">
                </div>
            </form>

        </section>
        <!-- } 게시물 작성/수정 끝 -->
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
