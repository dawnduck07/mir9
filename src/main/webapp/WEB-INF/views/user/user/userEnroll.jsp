<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>회원가입</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<!-- Bootstrap CSS -->
<link rel="stylesheet"
	  href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	  integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	  crossorigin="anonymous">

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
				<form:form class="memberJoinFrm" method="POST" action="${pageContextrequest.contextPath}/user/user/userEnroll.do" >
					<div class="mb-3">
						<label for="id">아이디</label> 
						<div class="row col">
							<input type="text" class="form-control col-6" id="id" name="id" placeholder="영문과 숫자 4~15자로 입력하세요." value="" required>&nbsp;&nbsp;
							<button type="button" class="btn btn-outline-secondary" onclick="onclickCheckId()">중복확인</button>						
						</div>
						<div class="invalid-feedback">이메일을 입력해주세요.</div>
					</div>
					
					<div class="mb-3">
						<label for="password">비밀번호</label> 
						<input type="password" class="form-control" id="password" placeholder="영문소문자와 숫자 포함 8~15자로 입력하세요." required>
						<div class="invalid-feedback">비밀번호를 입력해주세요.</div>
					</div>
					<div class="mb-3">
						<label for="passwordCheck">비밀번호</label> 
						<input type="password" class="form-control" id="passwordCheck" placeholder="비밀번호 확인을 위해 더 입력하세요." required>
						<div class="invalid-feedback">비밀번호를 입력해주세요.</div>
					</div>
					
					<div class="row">
						<div class="col-md-6 mb-3">
							<label for="firstName">이름</label> 
							<input type="text" class="form-control" id="firstName" placeholder="이름" value="" required>
							<div class="invalid-feedback">이름을 입력해주세요.</div>
						</div>
						<div class="col-md-6 mb-3">
							<label for="lastName">성</label> 
							<input type="text" class="form-control" id="lastName" placeholder="성" value="" required>
							<div class="invalid-feedback">성을 입력해주세요.</div>
						</div>
					</div>

					<div class="mb-3">
						<label for="id">주소</label> 
						<div class="row col mb-2">
							<input type="text" class="form-control col-3" id="addressZipcode" placeholder="" readonly>&nbsp;&nbsp;
							<button type="button" class="btn btn-outline-secondary">주소입력</button>	
						</div>
						<div class="mb-2">
							<input type="text" class="form-control" id="addressMain" placeholder="" readonly>
						</div>
						<div class="mb-2">
							<input type="text" class="form-control" id="addressSub" placeholder="상세주소">
						</div>
						<div class="invalid-feedback">주소를 입력해주세요.</div>
					</div>

					<div class="mb-3">
						<label for="email">이메일</label> 
						<div class="row col">
							<input type="email" class="form-control col-6" id="email" placeholder="" required>&nbsp;&nbsp;
							<button type="button" class="btn btn-outline-secondary">중복확인</button>						
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
						<button type="button" onclick="submit()" class="btn btn-primary btn-lg">가입</button>
					</div>
				</form:form>
			</div>
		</div>
		<footer class="my-3 text-center text-small">
			<p class="mb-1">&copy; NAEDAM</p>
		</footer>
	</div>
	<script>
    window.addEventListener('load', () => {
      const forms = document.getElementsByClassName('validation-form');

      Array.prototype.filter.call(forms, (form) => {
        form.addEventListener('submit', function (event) {
          if (form.checkValidity() === false) {
            event.preventDefault();
            event.stopPropagation();
          }

          form.classList.add('was-validated');
        }, false);
      });
    }, false);
  </script>
</body>
<script>
//아이디 중복 확인
function onclickCheckId(){
	var id = $("#id").val();
	
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
	
	// 비동기 중복 검사
	$.ajax({
		url : `${pageContext.request.contextPath}/admin/member/checkIdDuplicate.do`,
		data : data,
		contentType : "application/json ; charset=utf-8",
		method : "GET",
		success(data) {
			const {available} = data;
			if(available){
				alert("사용 가능한 아이디 입니다.");
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
function submit(){
	var id = $("#id").val();
	var password = $("#password").val();
	var passwordCheck = $("#passwordCheck").val();
	var firstName = $("#firstName").val();
	var lastName = $("#lastName").val();
	var authority = $("#memberGradeChk option:selected").val();
	
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

	// 이메일 유효성 검사
	var email = $("#email").val();
	var regEmail = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/;
	
	if(!regEmail.test(email)){
		alert("이메일을 정확하게 입력해주세요.");
		$("#email").focus();
		return false;
	}
	
	$(document.memberInsertModalFrm).submit();
}
</script>

</html>