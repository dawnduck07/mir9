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
				<form class="validation-form" novalidate>
				
					<div class="mb-3">
						<label for="id">아이디</label> 
						<div class="row col">
							<input type="text" class="form-control col-6" id="id" placeholder="영문과 숫자 4~15자로 입력하세요." required>&nbsp;&nbsp;
							<button type="button" class="btn btn-outline-secondary">중복확인</button>						
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
						<button type="button" class="btn btn-secondary btn-lg">취소</button>&nbsp;&nbsp;&nbsp;&nbsp;
						<button type="button" class="btn btn-primary btn-lg">가입</button>
					</div>
				</form>
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
</html>