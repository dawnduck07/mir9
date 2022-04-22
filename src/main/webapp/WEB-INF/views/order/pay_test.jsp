<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>  

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
 <!-- jQuery -->
  <script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
  <!-- iamport.payment.js -->
<script src="https://cdn.iamport.kr/js/iamport.payment-1.1.8.js" type="text/javascript"></script>
  <script>
  const { IMP } = window;
  IMP.init('imp86621495');
  
  </script>
<body>
<sec:authentication property="principal" var="loginMember" />
	<button onclick="paymentComplete();">결제 정보확인test @log</button>
</body>

<script>
function paymentComplete(){
	console.log(new Date(1650593265))
	const data = {
			payMethod : 'card',
			orderNo : "220316000000008",
			amount : 40000,
			buyer_email : '${loginMember.email}',
			buyer_name : '${loginMember.lastName}${loginMember.firstName}',
			buyer_tel : '${loginMember.phone}',
			buyer_addr : '서울특별시 강남구 삼성동',
			buyer_postcode : '123-456',
			imp_uid : "imp_679227711838",
			merchant_uid : "220316000000008",
			totalPrice : 40000
	}
	$.ajax({
		url : "${pageContext.request.contextPath}/payment/complete",
		method : "POST",
		headers: {
            "${_csrf.headerName}" : "${_csrf.token}"
        },
		data : data,
		success(data){
			console.log(data)
		},
		error : console.log
	});
}
</script>
</html>