<%--
  Created by IntelliJ IDEA.
  User: potatomoong
  Date: 2024-04-17
  Time: 오후 02:20
  To change this template use File | Settings | File Templates.
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

	<%
	//String login_id = (String)session.getAttribute("idKey");
	//if(login_id == null){ %>
	<%--
	<script>
	alert("로그인이 필요한 페이지 입니다.");
	location.href = "login_ok.jsp";
	</script>
	 --%>
	
	<% //}%>



<!DOCTYPE html>
<html lang="ko">
<head>
    <title>리뷰 글쓰기 | 알빠노관광</title>

    <script>
        // 자바스크립트에서 사용하는 전역변수 선언
        var g5_url = "https://cmtour.co.kr";
        var g5_bbs_url = "https://cmtour.co.kr/bbs";
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
        <p class="eng"><em></em> 리뷰작성</p>
        <p class="stitle"></p>


        <!-- skin : theme/daon_basic -->
        <section id="bo_w">
            <h2 class="sound_only">리뷰작성</h2>

            <!-- 게시물 작성/수정 시작 { -->
            <form name="fwrite" id="fwrite" action="https://cmtour.co.kr/bbs/write_update.php"
                  onsubmit="return fwrite_submit(this);" method="post" enctype="multipart/form-data" autocomplete="off"
                  style="width:100%">
                <input type="hidden" name="uid" value="2024040701311876">
                <input type="hidden" name="w" value="">
                <input type="hidden" name="bo_table" value="qa">
                <input type="hidden" name="wr_id" value="0">
                <input type="hidden" name="sca" value="">
                <input type="hidden" name="sfl" value="">
                <input type="hidden" name="stx" value="">
                <input type="hidden" name="spt" value="">
                <input type="hidden" name="sst" value="">
                <input type="hidden" name="sod" value="">
                <input type="hidden" name="page" value="">
                <input type="hidden" value="html1" name="html">

                <div class="bo_w_info write_div">


                </div>


                <div class="bo_w_tit write_div">
                    <label for="wr_subject" class="sound_only">제목<strong>필수</strong></label>

                    <div id="autosave_wrapper write_div">
                        <input type="text" name="wr_subject" value="" id="wr_subject" required
                               class="frm_input full_input required" size="50" maxlength="255" placeholder="제목">
                        <script src="https://cmtour.co.kr/js/autosave.js"></script>
                        <script src="https://cmtour.co.kr/plugin/editor/smarteditor2/autosave.editor.js"></script>
                        <button type="button" id="btn_autosave" class="btn_frmline">임시 저장된 글 (<span id="autosave_count">0</span>)
                        </button>
                        <div id="autosave_pop">
                            <strong>임시 저장된 글 목록</strong>
                            <ul></ul>
                            <div>
                                <button type="button" class="autosave_close">닫기</button>
                            </div>
                        </div>
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
                                  style="width:100%;height:300px"></textarea>
                        <span class="sound_only">웹 에디터 끝</span></div>

                </div>


                <div class="bo_w_flie write_div">
                    <div class="file_wr write_div">
                        <label for="bf_file_2" class="lb_icon"><i class="fa fa-download" aria-hidden="true"></i><span
                                class="sound_only"> 파일 #1</span></label>
                        <input type="file" name="bf_file[]" id="bf_file_2" title="파일첨부 2 : 용량 10,485,760 바이트 이하만 업로드 가능"
                               class="frm_file ">
                    </div>


                </div>


                <div class="btn_confirm write_div" style="text-align:center;">
                    <a href="./board.php?bo_table=qa" class="btn_cancel btn">취소</a>
                    <input type="submit" value="작성완료" id="btn_submit" accesskey="s" class="btn_submit btn">
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
