<%--
  Created by IntelliJ IDEA.
  User: potatomoong
  Date: 2024-04-13
  Time: 오후 4:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script src="../front_util/js/common.js"></script>

<!--상단이동_스크립트_시작-->
<script>
    $(function () {
        $("#top_btn2").on("click", function () {
            $("html, body").animate({scrollTop: 0}, '500');
            return false;
        });
    });
</script>
<!--상단이동_스크립트_끝-->

<!--모바일_상단이동_버튼-->
<button type="button" id="top_btn">
    <i class="fa fa-arrow-up" aria-hidden="true"></i>
    <span class="sound_only">상단으로</span>
</button>
<!--모바일_상단이동_버튼-->

<!--모바일_상단이동_스크립트_시작-->
<script>
    $(function () {
        $("#top_btn").on("click", function () {
            $("html, body").animate({scrollTop: 0}, '500');
            return false;
        });
    });
</script>
<!--모바일_상단이동_스크립트_끝-->

<!--폰트_리사이즈_스크립트_시작-->
<script>
    $(function () {
        font_resize("container", get_cookie("ck_font_resize_rmv_class"), get_cookie("ck_font_resize_add_class"));
    });
</script>
<!--폰트_리사이즈_스크립트_끝-->

<script src="http://127.0.0.1/front_util/js/wow.min.js"></script>

