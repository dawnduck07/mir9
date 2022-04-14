<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>	

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="회원 관리" name="title" />
</jsp:include>
<style>

#menu_wrap {position:absolute;top:0;left:0;bottom:0;width:250px;margin:10px 0 30px 10px;padding:5px;overflow-y:auto;background:rgba(255, 255, 255, 0.7);z-index: 1;font-size:12px;border-radius: 10px;}
.bg_white {background:#fff;}
#menu_wrap hr {display: block; height: 1px;border: 0; border-top: 2px solid #5F5F5F;margin:3px 0;}
#menu_wrap .option{text-align: center;}
#menu_wrap .option p {margin:10px 0;}  
#menu_wrap .option button {margin-left:5px;}
#placesList li {list-style: none;}
#placesList .item {position:relative;border-bottom:1px solid #888;overflow: hidden;cursor: pointer;min-height: 65px;}
#placesList .item span {display: block;margin-top:4px;}
#placesList .item h5, #placesList .item .info {text-overflow: ellipsis;overflow: hidden;white-space: nowrap;}
#placesList .item .info{padding:10px 0 10px 55px;}
#placesList .info .gray {color:#8a8a8a;}
#placesList .info .jibun {padding-left:26px;background:url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/places_jibun.png) no-repeat;}
#placesList .info .tel {color:#009900;}
#placesList .item .markerbg {float:left;position:absolute;width:36px; height:37px;margin:10px 0 0 10px;background:url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png) no-repeat;}
#placesList .item .marker_1 {background-position: 0 -10px;}
#placesList .item .marker_2 {background-position: 0 -56px;}
#placesList .item .marker_3 {background-position: 0 -102px}
#placesList .item .marker_4 {background-position: 0 -148px;}
#placesList .item .marker_5 {background-position: 0 -194px;}
#placesList .item .marker_6 {background-position: 0 -240px;}
#placesList .item .marker_7 {background-position: 0 -286px;}
#placesList .item .marker_8 {background-position: 0 -332px;}
#placesList .item .marker_9 {background-position: 0 -378px;}
#placesList .item .marker_10 {background-position: 0 -423px;}
#placesList .item .marker_11 {background-position: 0 -470px;}
#placesList .item .marker_12 {background-position: 0 -516px;}
#placesList .item .marker_13 {background-position: 0 -562px;}
#placesList .item .marker_14 {background-position: 0 -608px;}
#placesList .item .marker_15 {background-position: 0 -654px;}
#pagination {margin:10px auto;text-align: center;}
#pagination a {display:inline-block;margin-right:10px;}
#pagination .on {font-weight: bold; cursor: default;color:#777;}


.ui-menu {
	z-index: 9999;
	width: 400px;
	}
</style>

<!-- content-wrapper -->
<div class="content-wrapper">
<!-- <link href="https://mir9.co.kr/resource/css/s9jss_single.css" rel="stylesheet"> -->

<section class="content-header">
	<h1>
		회원 관리 <small>member list</small>
	</h1>
	<ol class="breadcrumb">
		<li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
		<li>회원 관리</li>
		<li class="active">회원 리스트</li>
	</ol>
</section>

<section class="content">
<div class="row">
	<div class="col-xs-12">
		<div class="box">
			<div class="box-body">
			<div id="totalCountContainer">
				<label style="margin-top: 5px;">총 ${totalMemberListCount} 건</label>
			</div>
				<!-- 타입별 검색 -->
				<form name="search-form" onsubmit="return false">
					<div class="box-tools pull-right" style="margin-bottom: 5px;">
						<div class="has-feedback">
							<span> 
								<input type="text" name="keyword" id="keyword"
								value="" class="form-control input-sm" placeholder="검색" /> 
								<span
									class="glyphicon glyphicon-search form-control-feedback">
								</span>
							</span>
						</div>
					</div>
					<div class="box-tools pull-right" style="margin-bottom: 5px;">
						<div class="has-feedback">
							<select name="type" class="form-control input-sm">
								<option value="last_name">성</option>
								<option value="first_name">이름</option>
								<option value="phone">휴대폰</option>
							</select>
						</div>
					</div>
				</form>
			<form:form 
					id="memberDeleteFrm"	
					name="memberDeleteFrm" 
					action="${pageContext.request.contextPath}/member/memberDelete.do" 
					method="POST">
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
				<table class="table table-bordered table-hover checkbox-group">
						<thead>
							<tr>
								<td style="width: 30px;">
									<input type="checkbox" name="select_all" id="checkAll" />
								</td>
								<td style="width: 110px;">아이디</td>
								<td style="width: 110px;">이름</td>
								<td style="width: 110px;">휴대폰</td>
								<td>주소</td>
								<td style="width: 100px;">현재 적립금</td>
								<td style="width: 120px;">가입일</td>
								<td style="width: 50px;">상태</td>
								<td style="width: 80px;">적립금</td>
								<td style="width: 100px;">명령</td>
							</tr>
						</thead>
						<tbody id = "tbody">
							<c:forEach items="${memberList}" var="memberEntity">
								<tr>
									<td style="width: 30px;">
										<input type="checkbox" class="member-is-checked" name="" data-target="${memberEntity.memberNo}"  />
									</td>
									<td style="width: 110px;">${memberEntity.id}</td>
									<td style="width: 110px;">${memberEntity.lastName}${memberEntity.firstName}</td>
									<td style="width: 110px;">${memberEntity.phone}</td>
									<td>${memberEntity.addressMain} ${memberEntity.addressSub}</td>
									<td style="width: 100px;">${memberEntity.pointAmt}</td>
									<td style="width: 120px;">
										<fmt:formatDate pattern = "yyyy/MM/dd HH:mm" value="${memberEntity.regDate}"/>
									</td>
									<td>
										<span class="label label-success" style="font-size: 12px;">보임</span>
									</td>
									<td>
										<button type="button" id="btn_${memberEntity.memberNo}" value="${memberEntity.memberNo}" class="btn btn-primary btn-xs">
											내역보기
										</button>
									</td>
									<td>
										<button type="button" onclick="onclickUpdate(18);" class="btn btn-primary btn-xs">
											상세보기
										</button>
									</td>
								</tr>
							</c:forEach>
						</tbody>
				</table>
				</form:form>
				<br>
				
				<button 
					type="button"
					id="memberListDeleteBtn"
					class="btn btn-danger">
					<i class="fa fa-minus-square"></i> 선택삭제
				</button>
				
				<!-- 등록 -->
				<button type="button" onclick="onclickInsert();"
					class="btn btn-primary">
					<i class="fa fa-plus-square"></i> 등록
				</button>
				
				<button type="button" onclick="onclickPoint();"
					class="btn btn-warning" style="margin-left: 20px;">
					<i class="fa fa-won"></i> 적립금 지급
				</button>
				<button type="button" onclick="onclickCoupon();"
					class="btn btn-warning">
					<i class="fa fa-credit-card"></i> 쿠폰 지급
				</button>
				<button type="button" onclick="downloadExcel();"
					class="btn btn-warning">
					<i class="fa fa-file-excel-o"></i> Excel 다운로드
				</button>
				<form name="form_download" method="post"
					action="?tpf=admin/member/process">
					<input type="hidden" name="mode" value="downloadExcel"> <input
						type="hidden" name="search_data">
				</form>
				<!--    // 관리자단에서 회원가입 숨김
                    <button type="button" onclick="onclickSMS();" class="btn btn-danger"><i class="fa fa-bell"></i> SMS발송</button>
-->

				<div style="text-align: right;">
					<ul class="pagination" style="margin: 0;">
						<li class="active"><a
							href="?tpf=admin/member/list&status=y&page=1">1</a></li>
					</ul>
				</div>
			</div>
			<!-- /.box-body -->
		</div>
		<!-- /.box -->
		
	</div>
	<!-- /.col-xs-12 -->
</div>
<!-- /.row --> 
</section>

	<form name="formID" method="post" onsubmit="return false;"
		action="?tpf=admin/member/process">
		<input type="hidden" name="mode" value="checkId"> <input
			type="hidden" name="id">
	</form>

	<!-- // 회원 등록 폼 -->
	<div class="modal fade" id="modalRegister" tabindex="-2"
		; role="dialog" aria-labelledby="myModal" aria-hidden="true">
		<div class="modal-dialog" style="width: 620px;">
			<div class="modal-content">
				<form name="form" method="post" onsubmit="return false;"
					action="?tpf=admin/member/process">
					<input type="hidden" name="mode"> <input type="hidden"
						name="member_code">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-hidden="true">&times;</button>
						<h4 class="modal-title" id="myModalLabel">회원 등록</h4>
					</div>
					<div class="modal-body">

						<h4>
							<p class="text-light-blue">
								<i class="fa fa-fw fa-info-circle"></i> 회원정보
							</p>
						</h4>
						<table class="table table-bordered">
							<tr>
								<td class="menu">아이디</td>
								<td align="left">
									<input type="text" id="id" name="id" class="form-control input-sm" style="width: 30%; float: left;" />
									&nbsp;
									<button 
										type="button" 
										id="CheckId" 
										value=""
										class="btn btn-sm btn-default" 
										onclick="onclickCheckId();">아이디 중복확인</button> 4~12자로 입력하세요.
								</td>
							</tr>
							<tr>
								<td class="menu">비밀번호</td>
								<td align="left">
								<input 
									type="password" 
									id="password"
									name="password"
									class="form-control input-sm"
									style="width: 30%; float: left;" /> 대소문자와 숫자 포함 8~15자로 입력하세요</td>
							</tr>
							<tr>
								<td class="menu">비밀번호 확인</td>
								<td align="left">
								<input 
									type="password"
									id="passwordCheck"
									name="passwordCheck" 
									class="form-control input-sm" 
									style="width: 30%;" />
								</td>
							</tr>
							<tr>
								<td class="menu">이름</td>
								<td align="left">
									<input type="text" name="firstName" id="firstName"
									class="form-control input-sm" style="width: 30%; float: left;"
									placeholder="이름" /> 
									<input type="text" name="lastName" id="lastName"
									class="form-control input-sm" style="width: 30%;"
									placeholder="성" /></td>
							</tr>
							<tr>
								<td class="menu">휴대폰</td>
								<td align="left">
								<select 
									name="mobile1"
									id="mobile1"
									class="form-control input-sm" style="width: 15%; float: left;">
										<option value="010">010</option>
										<option value="011">011</option>
										<option value="016">016</option>
										<option value="017">017</option>
										<option value="018">018</option>
										<option value="019">019</option>
								</select> 
								<span style="float: left;">-</span> 
								<input 
									type="text"
									name="mobile2"
									id="mobile2" 
									class="form-control input-sm" style="width: 15%; float: left;"
									maxlength="4" /> 
								<span style="float: left;">-</span> 
								<input
									type="text" 
									name="mobile3"
									id="mobile3"
									class="form-control input-sm" style="width: 15%; float: left;"
									maxlength="4" /></td>
							</tr>
							<tr>
								<td class="menu">이메일</td>
								<td align="left">
									<input type="text" name="email" id="email"
									class="form-control input-sm" style="width: 60%;"/>
								</td>
							</tr>
							<tr>
								<td class="menu">주소</td>
								<td align="left">
									<input type="text" name="zipcode" id="zipcode" readonly class="form-control input-sm"
									style="width: 15%; background-color: #dddddd; float: left;" />&nbsp;
									<button type="button" onclick="callAddress();" class="btn btn-sm btn-default">
										주소입력
									</button>
									<span id="displaySearch" style="float: right; font-size: 13px; padding-top: 10px; display: none;">
										[검색자료 : 
										<span id="displaySearchCount" style="color: red;"></span>건]
									</span>
									<br> 
										
									
								        <div class="option">
								            <div>
								                <form id="addressSearch" onsubmit="searchPlaces(); return false;">
								                    <input type="text" value="" id="address" size="15"
					                    			placeholder="주소입력 예) 느티마을4단, ㄱㄴㅍㅇㄴㅅ, 여의 메리츠, 행자부, 목동아파트, 테헤란로 152"
					                    			style="display: none; margin: 5px 0 0 0; width: 100%;">  
								                </form>
								            </div>
								        </div>
								        <ul id="placesList"></ul>
								        <div id="pagination"></div>
								    
										
										
										
									

									<input type="text" name="addr" id="addr" readonly
										class="form-control input-sm"
										style="margin: 5px 0; width: 100%; background-color: #dddddd;" />
									<input type="text" name="addr_etc" id="addr_etc"
										placeholder="상세주소" class="form-control input-sm"
										style="width: 100%;" />
								</td>
							</tr>
							<tr>
								<td class="menu">메모</td>
								<td align="left"><textarea name="memo" id="memo" rows="4"
										class="form-control input-sm" style="width: 100%;"></textarea></td>
							</tr>
							<tr>
								<td class="menu">현재 포인트</td>
								<td align="left"><span id="current_point"></span></td>
							</tr>
							<tr id="display_level">
								<td class="menu">등급 <span class="text-light-blue"><i
										class="fa fa-check"></i></span></td>
								<td><select name="level" id="level"
									class="form-control input-sm" style="width: 120px;">
										<option value="1">슈퍼관리자</option>
										<option value="2">회원</option>
										<option value="3">ㅈㅇㅇㅈ</option>
								</select></td>
							</tr>
						</table>
				</form>
			</div>
		</div>
		<div class="modal-footer">
			<button type="button" onclick="register();" class="btn btn-primary">저장</button>
			<!--<button type="button" onclick="deleteMember();" class="btn btn-danger">삭제</button>-->
		</div>
	</div>
</div>
</div>

<!-- // 적립금 지급 폼 -->
<div class="modal fade" id="modalPoint" tabindex="-2" role="dialog"
	aria-labelledby="myModal" aria-hidden="true">
	<div class="modal-dialog" style="width: 500px;">
		<div class="modal-content">
			<form name="formPoint" method="post" onsubmit="return false;"
				action="?tpf=admin/member/process">
				<input type="hidden" name="mode" value="point"> <input
					type="hidden" name="member_code">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 class="modal-title" id="myModalLabelPortfolio">적립금 지급</h4>
				</div>
				<div class="modal-body">

					<table class="table table-bordered">
						<tr>
							<td class="menu">대상 회원</td>
							<td align="left"><span id="sendCount"></span> 명</td>
						</tr>
						<tr>
							<td class="menu">지급 형태</td>
							<td align="left"><select name="sms_type"
								class="form-control input-sm" style="width: 120px;">
									<option value="+">지급</option>
									<option value="-">차감</option>
							</select></td>
						</tr>
						<tr>
							<td class="menu">적립금</td>
							<td align="left"><input type="text" name="point"
								onkeyup="this.value=displayComma(checkNum(this.value))"
								class="form-control input-sm" style="width: 120px;" /></td>
						</tr>
						<tr>
							<td class="menu">메모</td>
							<td align="left"><input type="text" name="content"
								class="form-control input-sm" /></td>
						</tr>
						<tr>
							<td class="menu">알림 설정</td>
							<td align="left"><input type="checkbox" name="is_send_sms"
								value="y" /> SMS 알림 (설정된 SMS 발송)<br> <input
								type="checkbox" name="is_send_email" value="y" /> 메일 알림 (설정된 메일
								발송)<br></td>
						</tr>
					</table>
			</form>
		</div>

	</div>
	<div class="modal-footer">
		<button type="button" onclick="registerPoint();"
			class="btn btn-primary">지급하기</button>
	</div>
</div>
</div>
</div>

<!-- // 쿠폰 지급 폼 -->
<div class="modal fade" id="modalCoupon" tabindex="-2" role="dialog"
	aria-labelledby="myModal" aria-hidden="true">
	<div class="modal-dialog" style="width: 500px;">
		<div class="modal-content">
			<form name="formCoupon" method="post" onsubmit="return false;"
				action="?tpf=admin/member/process">
				<input type="hidden" name="mode" value="coupon"> <input
					type="hidden" name="member_code">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 class="modal-title" id="myModalLabelPortfolio">쿠폰 지급</h4>
				</div>
				<div class="modal-body">

					<table class="table table-bordered">
						<tr>
							<td class="menu">대상 회원</td>
							<td align="left"><span id="sendCountCoupon"></span> 명</td>
						</tr>
						<tr>
							<td class="menu">쿠폰 선택</td>
							<td align="left"><select name="coupon_code"
								class="form-control input-sm">
									<option value="">선택</option>
									<option value="12|신년인사 쿠폰|제한 없음">신년인사 쿠폰
							</select> ※ 쿠폰은 회원당 한번씩만 발급 할수 있습니다.</td>
						</tr>
						<tr>
							<td class="menu">알림 설정</td>
							<td align="left"><input type="checkbox" name="is_send_sms"
								value="y" /> SMS 알림 (설정된 SMS 발송)<br> <input
								type="checkbox" name="is_send_email" value="y" /> 메일 알림 (설정된 메일
								발송)<br></td>
						</tr>
					</table>
			</form>
		</div>

	</div>
	<div class="modal-footer">
		<button type="button" onclick="registerCoupon();"
			class="btn btn-primary">지급하기</button>
	</div>
</div>
</div>
</div>

<!-- // SMS 발송 폼 -->
<div class="modal fade" id="modalSMS" tabindex="-2" role="dialog"
	aria-labelledby="myModal" aria-hidden="true">
	<div class="modal-dialog" style="width: 500px;">
		<div class="modal-content">
			<form name="formSMS" method="post" onsubmit="return false;"
				action="?tpf=admin/member/process">
				<input type="hidden" name="mode" value="sms"> <input
					type="hidden" name="field" value=""> <input type="hidden"
					name="keyword" value="">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 class="modal-title" id="myModalLabelPortfolio">SMS 발송</h4>
				</div>
				<div class="modal-body">

					<table class="table table-bordered">
						<tr>
							<td class="menu">수신자</td>
							<td align="left">5 명</td>
						</tr>

						<tr>
							<td class="menu">메세지<br> (<span id="msg_count">0</span>
								/ 90 byte)
							</td>
							<td align="left"><textarea name="msg" id="msg" rows="4"
									style="width: 100%;"></textarea></td>
						</tr>
					</table>
			</form>
		</div>

	</div>
	<div class="modal-footer">
		<button type="button" onclick="registerSMS();" class="btn btn-primary">보내기</button>
	</div>
</div>
</div>
</div>
</div>
<!-- /.content-wrapper -->
<!-- 카카오 맵 -->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=292fcbebc12a7089168e4f0553c2ae07&libraries=services"></script>

<script>
function downloadExcel() {  // Excel 다운로드
    form_download.target = 'iframe_process';
    form_download.search_data.value = $('#form_search :input').serialize();
    form_download.submit();
}

// 상세보기
$("button[id^='btn_']").on('click', function(e){
	//console.log(e.target);
	//console.log("해당 no = " + $(e.target).val());
	var memberNo = $(e.target).val();
	console.log("memberNo = " + memberNo);
	
	location.href = `${pageContext.request.contextPath}/member/memberPointList/\${memberNo}`; // \$ : "EL이 아니라 JavaScript $다."를 표시
});

$('#findList').each(function(){
	console.log("들어오냐");
});

// 등록 모달창
function onclickInsert(){
	console.log("등록(onclickInsert())");
	$("#modalRegister").modal();
}

// 아이디 중복 확인
function onclickCheckId(){
	console.log("아이디 중복 확인");
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
	
	// 비동기 중복 검사
	$.ajax({
		url : `${pageContext.request.contextPath}/member/checkIdDuplicate.do`,
		data : data,
		contentType : "application/json ; charset=utf-8",
		method : "GET",
		success(data) {
			console.log(data);
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



// 저장
function register(){
	console.log("저장(register()) 실행");
	var password = $("#password").val();
	var passwordCheck = $("#passwordCheck").val();
	var firstName = $("#firstName").val();
	var lastName = $("#lastName").val();
	
	
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
	
	// 휴대폰 번호 유효성 검사
	var mobile2 = $("#mobile2").val();
	var mobile3 = $("#mobile3").val();
	
	if(mobile2 == '' || mobile3 == ''){
		alert("휴대폰 번호가 입력되지 않았습니다.");
		$("#mobile1").focus();
		return false;
	}
	if(!/^([0-9]{3,4})$/.test(mobile2) || !/^([0-9]{4})$/.test(mobile3)){
		alert("휴대폰 번호를 정확하게 입력해주세요.");
		$("#mobile1").focus();
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
}



//주소입력
function callAddress(){
	console.log("주소입력(callAddress()) 실행");
	$("#displaySearch").show();
	$("#address").show().focus();
	
	// 마커를 담을 배열입니다
	var markers = [];
	
	// 장소 검색 객체를 생성합니다
	var ps = new kakao.maps.services.Places();
	
	// 검색 결과 목록이나 마커를 클릭했을 때 장소명을 표출할 인포윈도우를 생성합니다
	var infowindow = new kakao.maps.InfoWindow({zIndex:1});
	
	$("#address").bind("keyup", function(){
		console.log("addrss 입력창 작동");
		console.log("address = " + $("#address").val());
		//$("#addressSearch").delay(200).submit());
	});
}










// 타입별 검색
$(document).ready(function(){
	// Enter Event
	$("#keyword").keydown(function(keyNum){
		
		var keyword = $('input[name=keyword]').val(); // 검색어
		var type = $('select[name=type]').val(); // 검색 타입
	
		if(keyNum.keyCode == 13){
			console.log("Enter Event! - 타입별 검색");
			console.log("keyword = " + keyword);
			console.log("type = " + type);
			
			const search = {
				"type" : type,
				"keyword" : keyword
			};
			
			
			$.ajax({
				type : "GET",
				url : `${pageContext.request.contextPath}/member/typeSearch.do`,
				data : search,
				contentType: "application/json; charset=utf-8",
				success(data){
					console.log("ajaxData = " + JSON.stringify(data));
					
					$("#tbody").html('');
					
					$.each(data.searchMemberList, (k, v) => {
						$("#tbody").append(`
								<tr>
								<td style="width: 30px;">
									<input type="checkbox" class="member-is-checked" name="" data-target="\${v.memberNo}"/>
								</td>
								<td style="width: 110px;">\${v.id}</td>
								<td style="width: 110px;">\${v.lastName}\${v.firstName}</td>
								<td style="width: 110px;">\${v.phone}</td>
								<td>\${v.addressMain} \${v.addressSub}</td>
								<td style="width: 100px;">\${v.pointAmt}</td>
								<td style="width: 120px;">\${v.regDate}</td>
								<td>
									<span class="label label-success" style="font-size: 12px;">보임</span>
								</td>
								<td>
									<button type="button" id="btn_\${v.memberNo}" value="\${v.memberNo}" class="btn btn-primary btn-xs">
										내역보기
									</button>
								</td>
								<td>
									<button type="button" onclick="onclickUpdate(18);" class="btn btn-primary btn-xs">
										상세보기
									</button>
								</td>
							</tr>
								`);
					});
					
					$("#totalCountContainer").html(`<label style="margin-top: 5px;">총 \${data["searchListCount"]} 건</label>`)
				},
				error : console.log	
			});
		}
	});
});

// 체크박스 전체 선택
$(".checkbox-group").on("click", "#checkAll", ((e)=>{
	let checked = $(e.target).is(":checked");
	console.log("전체 선택 : " + checked);
	
	if(checked){
		$(e.target).parents(".checkbox-group").find("input:checkbox").prop("checked", true);
	} else {
		$(e.target).parents(".checkbox-group").find("input:checkbox").prop("checked", false);
	}
}));


// 체크박스 개별 선택
$(document).on("click", ".member-is-checked", function(){
	let isChecked = true;
	console.log("개별 선택 : " + isChecked);
	
	$(".member-is-checked").each((i, item)=>{
		isChecked = isChecked && $(item).is(":checked");
		console.log("i : " + i);
		//console.log(item);
		console.log($(item).is(":checked"));
	});
	
	$("#checkAll").prop("checked", isChecked);	
});


// 선택삭제
$(document).on("click", "#memberListDeleteBtn", function(){
	let isChecked = false;
	
	$(".member-is-checked").each((i, item)=>{
		isChecked = isChecked || $(item).is(":checked");
		let target = $(item).data("target");
		console.log("target = ", target); // target = memberNo
		
		if($(item).is(":checked")){
			$(item).after(`<input type="hidden" name="memberNo" value="\${target}"/>`);
		}
	});
	
	if(!isChecked){
		alert("선택된 목록이 없습니다.");
		return;
	}
	
	console.log("클릭");
	console.log($(document.memberDeleteFrm));
	if(confirm("선택된 회원을 삭제하시겠습니까?"))
		$(document.memberDeleteFrm).submit();
});




</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>