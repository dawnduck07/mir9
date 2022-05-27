<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
<head>
	<meta charset="utf-8">
	<title>회원가입</title>
	<meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
	
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	
	<style>
	body {
		min-height: 100vh;
		background: -webkit-gradient(linear, left bottom, right top, from(#92b5db),
			to(#1d466c));
		background: -webkit-linear-gradient(bottom left, #92b5db 0%, #1d466c 100%);
		background: -moz-linear-gradient(bottom left, #92b5db 0%, #1d466c 100%);
		background: -o-linear-gradient(bottom left, #92b5db 0%, #1d466c 100%);
		background: linear-gradient(to top right, #92b5db 0%, #1d466c 100%);
	}
	
	.input-form {
		max-width: 680px;
		margin-top: 80px;
		padding: 32px;
		background: #fff;
		-webkit-border-radius: 10px;
		-moz-border-radius: 10px;
		border-radius: 10px;
		-webkit-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
		-moz-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
		box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15)
	}
	
	label {
		font-weight: bold;
	}
	</style>
</head>

<body>
	<div class="container">
		<div class="input-form-backgroud row">
			<div class="input-form col-md-12 mx-auto">
			<div class="text-center">
				<img src="${pageContext.request.contextPath}/resources/imgs/imageBoard/neadam_logo.png" style="height: 50px; margin: 20px;">
			</div>
				<h4 class="mb-3" style="font-weight: bold">회원가입</h4>
				<form:form name="userJoinFrm" method="POST" action="${pageContextrequest.contextPath}/user/user/userEnroll.do" >
					<input type="hidden" name="checked_id" value=""/>
					<input type="hidden" name="checked_email" value=""/>
					<div class="mb-3">
						<label for="id">아이디</label> 
						<div class="row col">
							<input type="text" class="form-control col-6" id="id" name="id" placeholder="영문과 숫자 4~15자로 입력하세요." value="" required>&nbsp;&nbsp;
							<button type="button" id="btnCheckId" class="btn btn-outline-secondary" onclick="onclickCheckId()">중복확인</button>						
						</div>
					</div>
					<div class="mb-3">
						<label for="password">비밀번호</label> 
						<input type="password" class="form-control" id="password" name="password" placeholder="영문소문자와 숫자 포함 8~15자로 입력하세요." required>
					</div>
					<div class="mb-3">
						<label for="passwordCheck">비밀번호</label> 
						<input type="password" class="form-control" id="passwordCheck" name="passwordCheck" placeholder="비밀번호 확인을 위해 더 입력하세요." required>
					</div>
					<div class="row">
						<div class="col-md-6 mb-3">
							<label for="firstName">이름</label> 
							<input type="text" class="form-control" id="firstName" name="firstName" placeholder="이름" value="" required>
						</div>
						<div class="col-md-6 mb-3">
							<label for="lastName">성</label> 
							<input type="text" class="form-control" id="lastName" name="lastName" placeholder="성" value="" required>
						</div>
					</div>
					<div class="mb-3">
						<label for="phone">휴대폰</label>
						<div class="row">
							<div class="col-md-3 mb-2">
								<select id="mobile1" name="mobile1" class="form-control">
									<option value="010">010</option>
									<option value="011">011</option>
									<option value="016">016</option>
									<option value="017">017</option>
									<option value="018">018</option>
									<option value="019">019</option>
								</select>
							</div>
							<span>-</span>
							<div class="col-md-3 mb-2">
								<input type="text" id="mobile2" name="mobile2" class="form-control" maxlength="4">
							</div>
							<span>-</span>
							<div class="col-md-3 mb-2">
								<input type="text" id="mobile3" name="mobile3" class="form-control" maxlength="4">
							</div>
						</div>  
					</div>
					<div class="mb-3">
						<label for="id">주소</label> 
						<div class="row col mb-2">
							<input type="text" class="form-control col-3" id="address_zipcode" name="addressZipcode" placeholder="" readonly>&nbsp;&nbsp;
							<button type="button" id="btnAddressInput" onclick="callAddress()" class="btn btn-outline-secondary">주소입력</button>	
						</div>
						<div class="mb-2">
							<input type="text" class="form-control" id="address_main" name="addressMain" placeholder="" readonly>
						</div>
						<div class="mb-2">
							<input type="text" class="form-control" id="address_sub" name="addressSub" placeholder="상세주소">
						</div>
						<div class="invalid-feedback">주소를 입력해주세요.</div>
					</div>

					<div class="mb-3">
						<label for="email">이메일</label> 
						<div class="row col">
							<input type="email" class="form-control col-6" id="email" name="email" placeholder="" required>&nbsp;&nbsp;
							<button type="button" id="btnCheckedEmail" onclick="onclickCheckEmail()" class="btn btn-outline-secondary">중복확인</button>						
						</div>
						<div class="invalid-feedback">이메일을 입력해주세요.</div>
					</div>
					<div class="custom-control custom-checkbox">
						<input type="checkbox" class="custom-control-input" id="aggrement" required> 
						<label class="custom-control-label" for="aggrement">* 이메일 수신에 동의하시면 여러가지 혜택과 이벤트 정보를 받아 보실 수 있습니다.</label>
					</div>

					<hr class="mb-4">
					<div class="text-center">
						<button type="button" onclick="cancel()" class="btn btn-secondary btn-lg">취소</button>&nbsp;&nbsp;&nbsp;&nbsp;
						<button type="button" onclick="userEnrollSubmit()" class="btn btn-primary btn-lg">가입</button>
					</div>
				</form:form>
			</div>
		</div>
		<footer class="my-3 text-center text-small">
			<p class="mb-1">&copy; NAEDAM</p>
		</footer>
	</div>
</body>

<script>
//아이디 중복 확인
function onclickCheckId(){
	console.log("onclickCheckId() 작동");
	var id = $("#id").val();
	console.log("id = " + id);
	
	// id 값을 입력하지 않았을 때
	if(id == ""){
		alert("id를 정확히 입력해주세요");
		// 해당 위치로 입력 커서 이동
		$("#id").focus();
		return false;
	}
	
	// 아이디 개수 유효성 검사
	if(!/^[a-zA-Z0-9]{4,12}$/.test(id)){
		alert("id를 정확히 입력해주세요");
		$("#id").focus();
		return false;
	}
	
	const data = {
			id : id
	};
	const jsonData = JSON.stringify(data);
	console.log("jsonData : " + jsonData);
	
	// 비동기 중복 검사
	$.ajax({
		url : `${pageContext.request.contextPath}/user/user/checkIdDuplicate.do`,
		data : data,
		contentType : "application/json ; charset=utf-8",
		method : "GET",
		success(data) {
			const {available} = data;
			if(available){
				alert("사용 가능한 아이디 입니다.");
				$("input[name=checked_id]").val('Y');
				$("#password").focus();
			}
			else{
				alert("[" + id + "]은 이미 사용중인 아이디 입니다. \n\n 다른 아이디를 사용하시기 바랍니다.");
				$("#id").focus();
			}
		},
		error : console.log
	});
}; 

// 가입
function userEnrollSubmit(){
	var id = $("#id").val();
	var password = $("#password").val();
	var passwordCheck = $("#passwordCheck").val();
	var firstName = $("#firstName").val();
	var lastName = $("#lastName").val();
	var addressMain = $("#address_main").val();
	var addressSub = $("#address_sub").val();
	var addressZipcode = $("#address_zipcode").val();
	
	// 아이디 공란 확인
	if(id == ''){
		alert("아이디가 입력되지 않았습니다.");
		$("#id").focus();
		return false;
	}
	
	// 비밀번호 공란 확인
	if(password == ''){
		alert("비밀번호가 입력되지 않았습니다.");
		$("#password").focus();
		return false;
	}
	
	// 비밀번호 유효성 검사
	if(!/^(?=.*[a-zA-Z])((?=.*\d)|(?=.*\W)).{8,15}$/.test(password)){
		alert("비밀번호는 8 ~ 15 글자 이내로 공백 없이 영문자, 숫자, 특수문자를 혼합하여 입력해주세요.");
		$("#password").focus();
		return false;
	}
	
	// 비밀번호 확인 공란 확인
	if(passwordCheck == ''){
		alert("비밀번호가 확인이 입력되지 않았습니다.");
		$("#passwordCheck").focus();
		return false;
	}
	
	if($("input[name=checked_id]").val() == '') {
		alert("아이디 중복확인을 해주세요.");
		$("#btnCheckId").focus();
		return false;
	}
	
	// 비밀번호 일치 확인
	if(password != passwordCheck){
		alert("비밀번호와 비밀번호 확인이 일치하지 않습니다.");
		$("#passwordCheck").focus();
		return false;
	}
	
	// 이름 공란 확인
	if(firstName == ''){
		alert("이름이 입력되지 않았습니다.");
		$("#firstName").focus();
		return false;
	}

	// 성 공란 확인
	if(lastName == ''){
		alert("성이 입력되지 않았습니다.");
		$("#lastName").focus();
		return false;
	}
	
	// 주소 공란 확인
	if(addressMain == ''){
		alert("주소가 입력되지 않았습니다.");
		$("#btnAddressInput").focus();
		return false;
	}
	
	// 이메일 유효성 검사
	var email = $("#email").val();
	var regEmail = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/;
	
	if(!regEmail.test(email)){
		alert("이메일을 정확하게 입력해주세요.");
		$("#email").focus();
		return false;
	}
	
	// 이메일 중복검사 확인
	if($("input[name=checked_email]").val() == '') {
		alert("이메일 중복확인을 해주세요.");
		$("#btnCheckEmail").focus();
		return false;
	}
	
	$(document.userJoinFrm).submit();
}

//주소 입력
function callAddress() {
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var addr = ''; // 주소 변수
            var extraAddr = ''; // 참고항목 변수

            //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                addr = data.roadAddress;
            } else { // 사용자가 지번 주소를 선택했을 경우(J)
                addr = data.jibunAddress;
            }

            // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
            if(data.userSelectedType === 'R'){
                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraAddr !== ''){
                    extraAddr = ' (' + extraAddr + ')';
                }
            
            } 

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('address_zipcode').value = data.zonecode;
            document.getElementById("address_main").value = addr;
            // 커서를 상세주소 필드로 이동한다.
            document.getElementById("address_sub").focus();
        }
    }).open();
}

// 이메일 중복검사 
function onclickCheckEmail() {
	console.log("onclickCheckEmail() 시작");
	var email = $("#email").val();
	console.log("email = " + email);
	
	if(email == ""){
		alert("email을 정확히 입력해주세요");
		$("#email").focus();
		return false;
	}
	
	// 이메일 유효성 검사
	var regEmail = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/;
	
	if(!regEmail.test(email)){
		alert("이메일을 정확하게 입력해주세요.");
		$("#email").focus();
		return false;
	}
	
	const data = {
		email : email	
	};
	const jsonData = JSON.stringify(data);
	console.log("jsonData : " + jsonData);
	
	$.ajax({
		url : `${pageContext.request.contextPath}/user/user/checkEmailDuplicate.do`,
		data : data,
		contentType : "application/json; charset=utf-8",
		method : "GET",
		success(data) {
			const {available} = data;
			if(available){
				alert("사용 가능한 이메일 입니다.");
				$("input[name=checked_email]").val('Y');
			} else {
				alert("[" + email + "]은 이미 사용중인 이메일 입니다. \n\n 다른 이메일을 사용하시기 바랍니다.");
				$("#email").focus();
			}
		},
		error : console.log
	});
}
</script>
</html>