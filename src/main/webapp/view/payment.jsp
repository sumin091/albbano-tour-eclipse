<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
    String resvCode = (String) session.getAttribute("resvCode");
    String courseName = (String) session.getAttribute("courseName");
    int totalFee = (Integer) session.getAttribute("totalFee");

    if (resvCode == null || courseName == null || totalFee == 0) {
        response.sendRedirect("error.jsp");
    }
%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>결제 | 알빠노관광</title>
    <script src="https://cdn.portone.io/v2/browser-sdk.js"></script>
    <script>
        window.onload = function() {
            requestPay();
        };

        async function requestPay() {
            try {
                const response = await PortOne.requestPayment({
                    storeId: "store-78210a12-d8bc-46bd-8b0a-ce0679096a79",
                    paymentId: '<%= resvCode %>',
                    orderName: '<%= courseName %>',
                    totalAmount: <%= totalFee %>,
                    currency: "KRW",
                    channelKey: "channel-key-c2db6c5c-a0f4-402e-a176-5ccdfd775929",
                    payMethod: "CARD",
                    isTestChannel: true,
                    redirectUrl: "http://127.0.0.1/view/list_reservation.jsp",
                });

                if (response.code != null) {
                    await updateReservationFlag(2);
                    alert(response.message);
                    return;
                }

                const updateSuccess = await updateReservationFlag(1);
                if (updateSuccess) {
                    alert("결제가 성공적으로 완료되었습니다.");
                    window.location.href = "http://127.0.0.1/view/list_reservation.jsp";
                } else {
                    alert("결제 후 예약 상태 업데이트에 실패했습니다.");
                }
            } catch (error) {
                console.error("결제 처리 중 오류 발생:", error);
                alert("결제 처리 중 오류가 발생했습니다. 다시 시도해 주세요.");
            }
        }

        async function updateReservationFlag(flag) {
            try {
                const response = await fetch('updateReservationFlag.jsp', {
                    method: 'POST',
                    headers: {
                        'Content-Type': 'application/x-www-form-urlencoded'
                    },
                    body: `flag=${flag}&resvCode=<%= resvCode %>`
                });

                if (response.ok) {
                    const result = await response.text();
                    return result === "success";
                } else {
                    return false;
                }
            } catch (error) {
                console.error("서버 통신 오류:", error);
                return false;
            }
        }
    </script>
</head>
<body>
    <h1>결제를 진행하고 있습니다...</h1>
</body>
</html>
