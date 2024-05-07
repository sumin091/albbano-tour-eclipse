<%--
Created by IntelliJ IDEA.
User: potatomoong
Date: 2024-04-17
Time: 오후 02:16
To change this template use File | Settings | File Templates.
--%>
<%@page import="org.eclipse.jdt.internal.compiler.IDebugRequestor"%>
<%@page import="vo.QnaVO" %>
<%@page import="java.util.List" %>
<%@page import="dao.QnaDAO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%String login_id =(String)session.getAttribute("idKey");
if(login_id == null){ %>
	<script>
	alert("로그인이 필요한 페이지 입니다.");
	location.href = "login.jsp";
	</script>

	<% }%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <title>질문답변 1 페이지 | 알빠노관광</title>

    <script>
        // 자바스크립트에서 사용하는 전역변수 선언
        var g5_url = "../index.html";
        var g5_bbs_url = "index.html";
        var g5_is_member = "";
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
<jsp:useBean id="qsVO" class="vo.QnasearchVO" scope="page"/>
<jsp:setProperty property="*" name="qsVO"/>

	
<%
QnaDAO qDao = QnaDAO.getInstance();


int totalCount=qDao.selecttotalCount(qsVO);
int pageScale=5;

int totalPage=(int)Math.ceil((double)totalCount/pageScale);

String tempPage=qsVO.getCurrentPage();
int currentPage=1;
if(tempPage != null){
	try{
		currentPage=Integer.parseInt(tempPage);
	}catch(NumberFormatException nfe){
		
	}
}
int startNum=currentPage * pageScale-pageScale +1;
int endNum=startNum+pageScale-1;

qsVO.setStartNum(startNum);
qsVO.setEndNum(endNum);

List<QnaVO> list = qDao.selectQna(qsVO, login_id);

pageContext.setAttribute("list", list);




String ASK_DOC_NO = request.getParameter("ASK_DOC_NO");
String ID = request.getParameter("ID");





QnaDAO qDAO= QnaDAO.getInstance();
QnaVO qVO = qDAO.selectmyQna(ASK_DOC_NO, ID);
pageContext.setAttribute("qVO", qVO);



%> 
<%@ include file="common_m_header.jsp" %>
<%@ include file="common_desktop_header.jsp" %>

<section id="sub_visual">
    <div class="backgroundimg">
        <div class="visual_area"
             style="background:url('../front_util/images/sub_visual05.jpg') no-repeat top center;"></div>
    </div>
</section>


<section id="sub_wrapper">
    <div id="sub_menu">
        <div class="sub_location">
            <div>
                <div class="cen"><a href="index_user.jsp"><i class="fa fa-home" aria-hidden="true"></i></a></div>
                <ul class="">
                    <li>
                        <span>고객센터</span>
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
                        <span>질문답변</span>
                        <ul>
                            <li><a href="main_notice.jsp?bo_table=notice" target="_self">공지사항</a></li>


                            <li><a href="faq.jsp?fm_id=1" target="_self">자주 묻는 질문</a></li>


                            <li><a href="qna.html?bo_table=qa" target="_self">질문답변</a></li>


                            <li><a href="question.jsp" target="_self">1:1문의</a></li>


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
        <p class="eng"><em></em> 질문답변</p>
        <p class="stitle"></p>


        <!-- 게시판 목록 시작 { -->
        <div id="bo_list" style="width:100%">


            <!-- 게시판 페이지 정보 및 버튼 시작 { -->
            <div id="bo_btn_top">
                <div id="bo_list_total">
                    <span>Total 725건</span>
                    1 페이지
                </div>

                <ul class="btn_bo_user">
                    <li><a href="question.jsp" class="btn_b02 btn"><i class="fas fa-pencil-alt"></i> 글쓰기</a></li>        </ul>
            </div>
            <!-- } 게시판 페이지 정보 및 버튼 끝 -->

            <!-- 게시판 카테고리 시작 { -->
            <!-- } 게시판 카테고리 끝 -->

            <form name="fboardlist" id="fboardlist" action="https://cmtour.co.kr/bbs/board_list_update.php"
                  onsubmit="return fboardlist_submit(this);" method="post">
                <input type="hidden" name="bo_table" value="qa">
                <input type="hidden" name="sfl" value="">
                <input type="hidden" name="stx" value="">
                <input type="hidden" name="spt" value="">
                <input type="hidden" name="sca" value="">
                <input type="hidden" name="sst" value="wr_num, wr_reply">
                <input type="hidden" name="sod" value="">
                <input type="hidden" name="page" value="1">
                <input type="hidden" name="sw" value="">

                <div class="tbl_head01 tbl_wrap">
                    <table>
                        <caption>질문답변 목록</caption>
                        <thead>
                        <tr>
                            <th scope="col">번호</th>
                            <th scope="col">제목</th>
                            <th scope="col" class="lview">글쓴이</th>
                            <th scope="col" class="lview"><a
                                    href="boarda809.html?bo_table=qa&amp;sop=and&amp;sst=wr_hit&amp;sod=desc&amp;sfl=&amp;stx=&amp;sca=&amp;page=1">조회
                                <i class="fa fa-sort" aria-hidden="true"></i></a></th>
                            <th scope="col" class="lview"><a
                                    href="board62f0.html?bo_table=qa&amp;sop=and&amp;sst=wr_datetime&amp;sod=desc&amp;sfl=&amp;stx=&amp;sca=&amp;page=1">날짜
                                <i class="fa fa-sort" aria-hidden="true"></i></a></th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr class="">
                            <td class="td_num2">
                                712
                            </td>

                            <td class="td_subject" style="padding-left:0px">

                                <div class="bo_tit">

                                    <a href="boardf4f9.html?bo_table=qa&amp;wr_id=800">
                                        <i class="fa fa-lock" aria-hidden="true"></i> 예약취소
                                    </a>
                                    <img src="../front_util/images/icon_new.gif" class="title_icon"
                                         alt="새글"></div>
                                <div class="mview">
                                    <div class="gall_info">
                                        <span class="sv_member">livecafe</span></div>
                                    <div class="gall_info">
                                        <span class="sound_only">조회 </span>Hit 1 <span class="gall_date"><span
                                            class="sound_only">작성일 </span>Date  2024-04-03</span>
                                    </div>
                                </div>

                            </td>
                            <td class="td_name sv_use lview"><span class="sv_member">livecafe</span></td>
                            <td class="td_num lview">1</td>
                            <td class="td_datetime lview">2024-04-03</td>

                        </tr>
                        <tr class="">
                            <td class="td_num2">
                                711
                            </td>

                            <td class="td_subject" style="padding-left:0px">

                                <div class="bo_tit">

                                    <a href="board9f5f.html?bo_table=qa&amp;wr_id=798">
                                        공휴일 시티투어버스 운행여부
                                    </a>
                                </div>
                                <div class="mview">
                                    <div class="gall_info">
                                        <span class="sv_member">이선영1</span></div>
                                    <div class="gall_info">
                                        <span class="sound_only">조회 </span>Hit 2 <span class="gall_date"><span
                                            class="sound_only">작성일 </span>Date  2024-03-30</span>
                                    </div>
                                </div>

                            </td>
                            <td class="td_name sv_use lview"><span class="sv_member">이선영1</span></td>
                            <td class="td_num lview">2</td>
                            <td class="td_datetime lview">2024-03-30</td>

                        </tr>
                        <tr class="">
                            <td class="td_num2">
                                710
                            </td>

                            <td class="td_subject" style="padding-left:10px">

                                <div class="bo_tit">

                                    <a href="board6dc5.html?bo_table=qa&amp;wr_id=799">
                                        <img src="../front_util/images/icon_reply.gif"
                                             class="icon_reply" alt="답변글"> Re: 공휴일 시티투어버스 운행여부
                                    </a>
                                </div>
                                <div class="mview">
                                    <div class="gall_info">
                                        <span class="sv_member">관리자</span></div>
                                    <div class="gall_info">
                                        <span class="sound_only">조회 </span>Hit 5 <span class="gall_date"><span
                                            class="sound_only">작성일 </span>Date  2024-03-31</span>
                                    </div>
                                </div>

                            </td>
                            <td class="td_name sv_use lview"><span class="sv_member">관리자</span></td>
                            <td class="td_num lview">5</td>
                            <td class="td_datetime lview">2024-03-31</td>
                        </tr>
                        
      <c:forEach var="qna" items="${list}" varStatus="i">
    <tr class="">
        <td class="td_num2">
            <c:out value="${qna.ASK_DOC_NO}"/>
        </td>
        <td class="td_subject" style="padding-left:0px">
            <div class="bo_tit">
                <a href="#none" onclick="return faq_open(this);" style="display: block;">
                    <p style="    display: inline;">
                    <c:out value="${qna.ASK_TITLE}"/>
                    </p>
                </a>
                <h3>
                <div class="con_inner">
                <span class="tit_bg">내용 : </span>
                <c:out value=" ${qna.ASK_CONTENTS }"/><br>
                <div class="con_closer">
                <button type="button" class="closer_btn btn_b03">닫기</button>
                </div>
                </div>
                </h3>   
            </div>
        </td>
        <td class="td_name sv_use lview">
            <span class="sv_member">
                <c:out value="${qna.ID}"/>
            </span>
        </td>
        <td class="td_num lview">2</td>
        <td class="td_datetime lview">
            <c:out value="${qna.CREATE_DATE}"/>
        </td>
    </tr>
</c:forEach>




                        
                   </tbody>
                    </table>
                </div>

            </form>

            <!-- 게시판 검색 시작 { -->
            <fieldset id="bo_sch">
                <legend>게시물 검색</legend>

                <form name="fsearch" method="get">
                    <input type="hidden" name="bo_table" value="qa">
                    <input type="hidden" name="sca" value="">
                    <input type="hidden" name="sop" value="and">
                    <label for="sfl" class="sound_only">검색대상</label>
                    <select name="sfl" id="sfl">
                        <option value="wr_subject">제목</option>
                        <option value="wr_content">내용</option>
                        <option value="wr_subject||wr_content">제목+내용</option>
                        <option value="mb_id,1">회원아이디</option>
                        <option value="mb_id,0">회원아이디(코)</option>
                        <option value="wr_name,1">글쓴이</option>
                        <option value="wr_name,0">글쓴이(코)</option>
                    </select>
                    <label for="stx" class="sound_only">검색어<strong class="sound_only"> 필수</strong></label>
                    <input type="text" name="stx" value="" required id="stx" class="sch_input" size="25" maxlength="20"
                           placeholder="검색어를 입력해주세요">
                    <button type="submit" value="검색" class="sch_btn"><i class="fa fa-search"
                                                                        aria-hidden="true"></i><span class="sound_only">검색</span>
                    </button>
                </form>
            </fieldset>
            <!-- } 게시판 검색 끝 -->
        </div>


        <!-- 페이지 -->
        <nav class="pg_wrap">
        <span class="pg">
       
		<% for(int i=1; i<= totalPage; i++){ %>
		 <a href="qna.jsp?currentPage=<%= i %>" class="pg_page"><%= i %></a> 
		<%} %>
</span></nav>

		<script>
		 $(function(){
		       
		        $(".con_inner").hide();

		        $(".closer_btn").on("click", function(){
		            $(this).closest(".con_inner").slideUp();
		        });

		        $(".bo_tit a").on("click", function(e){
		            var $con = $(this).closest("tr").find(".con_inner");

		           
		            if ($con.is(":visible")) {
		                $con.slideUp();
		            } else {
		                
		                $(".con_inner").slideUp();
		               
		                $con.slideDown();
		            }
		            
		            return true;
		        });
		    });

		  
		    $(window).on("load", function() {
		        $(".con_inner").css("display", "");
		    });
		</script>

        <!-- } 게시판 목록 끝 -->

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
