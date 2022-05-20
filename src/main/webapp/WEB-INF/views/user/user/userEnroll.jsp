<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>회원가입</title>

<script src="http://code.jquery.com/jquery-latest.min.js"></script>

<!-- bootstrap js: jquery load 이후에 작성할것.-->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>

<!-- bootstrap css -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css" integrity="sha384-9gVQ4dYFwwWSjIDZnLEWnxCjeSWFphJiwGPXr1jddIhOegiu1FwO5qRGvFXOdJZ4" crossorigin="anonymous">

<!-- 사용자작성 css -->
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/style.css" />

<!-- sock.js 추가 -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.5.2/sockjs.min.js" integrity="sha512-ayb5R/nKQ3fgNrQdYynCti/n+GD0ybAhd3ACExcYvOR2J1o3HebiAe/P0oZDx5qwB+xkxuKG6Nc0AFTsPT/JDQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<!-- stomp.js 추가 -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.min.js" integrity="sha512-iKDtgDyTHjAitUDdLljGhenhPwrbBfqTKWO1mkhSFH3A7blITC9MhYon6SjnMhp4o0rADGw9yAC6EW4t5a4K3g==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>

<!-- IE 지원용 : babel-standalone bael-polyfill -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/babel-standalone/6.26.0/babel.min.js" integrity="sha512-kp7YHLxuJDJcOzStgd6vtpxr4ZU9kjn77e6dBsivSz+pUuAuMlE2UTdKB7jjsWT84qbS8kdCWHPETnP/ctrFsA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/babel-polyfill/7.12.1/polyfill.min.js" integrity="sha512-uzOpZ74myvXTYZ+mXUsPhDF+/iL/n32GDxdryI2SJronkEyKC8FBFRLiBQ7l7U/PTYebDbgTtbqTa6/vGtU23A==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/member.css" />
</head>
 <style>
    body {
      min-height: 100vh;

      background: -webkit-gradient(linear, left bottom, right top, from(#92b5db), to(#1d466c));
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
  </style>
</head>

<div class="container">
  <div class="input-form-backgroud row">
    <div class="input-form col-md-12 mx-auto">
      <h4 class="mb-3">회원가입</h4>
      <form class="validation-form" novalidate>
      	<div class="mb-3">
      		<label for="id">아이디</label>
      		<input type="text" class="form-control" id="id" placeholder="영문과 숫자 4~15자로 입력하세요." value="" required>
      	</div>
      	<div class="mb-3">
      		<label for="password">비밀번호</label>
      		<input type="password" class="form-control" id="password" placeholder="영문소문자와 숫자 포함 8~15자로 입력하세요." value="" required>
      	</div>
      	<div class="mb-3">
      		<label for="password">비밀번호 확인</label>
      		<input type="password" class="form-control" id="passwordCheck" placeholder="비밀번호 확인을 위해 한번 더 입력하세요." value="" required>
      	</div>
        <div class="row">
          <div class="col-md-6 mb-3">
            <label for="firstName">이름</label>
            <input type="text" class="form-control" id="firstName" placeholder="" value="" required>
            <div class="invalid-feedback">
              이름을 입력해주세요.
            </div>
          </div>
          <div class="col-md-6 mb-3">
            <label for="lastName">성</label>
            <input type="text" class="form-control" id="lastName" placeholder="" value="" required>
            <div class="invalid-feedback">
              별명을 입력해주세요.
            </div>
          </div>
        </div>
        div
        
        
       <div class="row">
	       	<div class="col-md-6 mb-3">
	          <label for="address">주소</label>
	          <input type="text" class="form-control" id="address" required>
	        </div>
	        
		      <button type="button" class="btn btn-secondary">주소입력</button>
        
       </div>
        
       
	          <div class="invalid-feedback">
	            주소를 입력해주세요.
	          </div>
        
        <div class="mb-3">
          <label for="address2">상세주소<span class="text-muted">&nbsp;(필수 아님)</span></label>
          <input type="text" class="form-control" id="address2" placeholder="상세주소를 입력해주세요.">
        </div>
        <div class="mb-3">
          <label for="email">이메일</label>
          <input type="email" class="form-control" id="email" placeholder="you@example.com" required>
          <div class="invalid-feedback">
            이메일을 입력해주세요.
          </div>
        </div>


        <div class="row">
          <div class="col-md-8 mb-3">
            <label for="root">가입 경로</label>
            <select class="custom-select d-block w-100" id="root">
              <option value=""></option>
              <option>검색</option>
              <option>카페</option>
            </select>
            <div class="invalid-feedback">
              가입 경로를 선택해주세요.
            </div>
          </div>
          <div class="col-md-4 mb-3">
            <label for="code">추천인 코드</label>
            <input type="text" class="form-control" id="code" placeholder="" required>
            <div class="invalid-feedback">
              추천인 코드를 입력해주세요.
            </div>
          </div>
        </div>
        <hr class="mb-4">
        <div class="custom-control custom-checkbox">
          <input type="checkbox" class="custom-control-input" id="aggrement" required>
          <label class="custom-control-label" for="aggrement">개인정보 수집 및 이용에 동의합니다.</label>
        </div>
        <div class="mb-4"></div>
        <button class="btn btn-primary btn-lg btn-block" type="submit">가입 완료</button>
      </form>
    </div>
  </div>
  <footer class="my-3 text-center text-small">
    <p class="mb-1">&copy; 2021 YD</p>
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

