<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="탈퇴회원 관리" name="title" />
</jsp:include>

<!-- content-wrapper -->
<div class="content-wrapper">
	
<style>
.ui-menu {
	z-index: 9999;
	width: 400px;
}
</style>
<script>
<!-- redirect Msg 처리 -->
<c:if test="${not empty msg}">
		alert("${msg}");
		location.reload();
</c:if>
</script>

	<section class="content-header">
	<h1>
		탈퇴 회원 관리 <small>member list</small>
	</h1>

	<ol class="breadcrumb">
		<li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
		<li>회원 관리</li>
		<li class="active">탈퇴 회원 리스트</li>
	</ol>
	</section>

	<section class="content">
	<div class="row">
		<div class="col-xs-12">
			<div class="box">
				<div class="box-body">
					<div id="totalCountContainer">
						<label style="margin-top: 5px;">총 ${withdrawalCount} 건</label>
					</div>
					<!-- 타입별 검색 -->
					<form name="search-form" onsubmit="return false">
						<div class="box-tools pull-right" style="margin-bottom: 5px;">
								<div class="has-feedback">
									<span> <input type="text" name="keyword" id="keyword"
										value="" class="form-control input-sm" placeholder="검색" /> <span
										class="glyphicon glyphicon-search form-control-feedback"></span>
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
					<form:form id="withdrawalDeleteFrm" name="withdrawalDeleteFrm" action="${pageContext.request.contextPath}/member/withdrawalDelete.do" method="POST">
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
								<td style="width: 120px;">가입일</td>
								<td style="width: 50px;">상태</td>
								<td style="width: 60px;">명령</td>
							</tr>
						</thead>
						<tbody id="tbody">
						<c:if test="${not empty withdrawalMemberList}">
							<c:forEach items="${withdrawalMemberList}" var="withdrawal">
								<tr>
									<td style="width: 30px;">
										<input type="checkbox" name="" class="member-is-checked" data-target="${withdrawal.memberNo}"/>
									</td>
									<td style="width: 110px;">${withdrawal.id}</td>
									<td style="width: 110px;">${withdrawal.name}</td>
									<td style="width: 110px;">${withdrawal.phone}</td>
									<td>${withdrawal.address}</td>
									<td style="width: 120px;">
										<fmt:formatDate pattern="yyyy/MM/dd HH:mm" value="${withdrawal.regDate}" />	
									</td>
									<td style="width: 50px;">
										<span class="label label-default" style="font-size:12px;">탈퇴</span>
									</td>
									<td style="width: 60px;">
										<button type="button" id="detail_${withdrawal.memberNo}" value="${withdrawal.memberNo}" class="btn btn-primary btn-xs">상세보기</button>
									</td>
								</tr>
							</c:forEach>
							</c:if>
							<c:if test="${empty withdrawalMemberList}">
								<tr><td colspan="10"><br>등록된 자료가 없습니다.<br><br></td></tr>  
							</c:if>
						</tbody>
						<!-- <tr>
							<td colspan="10"><br>등록된 자료가 없습니다.<br>
							<br></td>
						</tr> -->
					</table>
					</form:form>
					<br>
					<button type="button"
						id="withdrawalDeleteBtn"
						class="btn btn-danger">
						<i class="fa fa-minus-square"></i> 선택삭제
					</button>
					<!--    // 관리자단에서 회원가입 숨김
                    <button type="button" onclick="onclickInsert();" class="btn btn-primary">등록</button>
                    <button type="button" onclick="onclickSMS();" class="btn btn-danger"><i class="fa fa-bell"></i> SMS발송</button>
-->

					<div style="text-align: right;">
						<? echo $data['page'];?>
					</div>
				</div>
				<!-- /.box-body -->
			</div>
			<!-- /.box -->
		</div>
		<!-- /.col-xs-12 -->
	</div>
	<!-- /.row --> </section>

	<form name="formID" method="post" onsubmit="return false;"
		action="?tpf=admin/member/process">
		<input type="hidden" name="mode" value="checkId"> <input
			type="hidden" name="id">
	</form>

	<!-- // 회원 등록 폼 -->
	<div class="modal fade" id="modalRegister" z-index:10; role="dialog"
		aria-labelledby="myModal" aria-hidden="true">
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
								<td align="left"><input type="text" name="id"
									class="form-control input-sm" style="width: 30%; float: left;" />&nbsp;
									<button type="button" id="btn_check_id"
										class="btn btn-sm btn-default" onclick="onclickCheckId();">아이디
										중복확인</button> 4~12자로 입력하세요.</td>
							</tr>
							<tr>
								<td class="menu">비밀번호</td>
								<td align="left"><input type="password" name="password"
									placeholder="" class="form-control input-sm"
									style="width: 30%; float: left;" /> 대소문자와 숫자 포함 8~15자로 입력하세요</td>
							</tr>
							<tr>
								<td class="menu">비밀번호 확인</td>
								<td align="left"><input type="password"
									name="password_confirm" placeholder=""
									class="form-control input-sm" style="width: 30%;" /></td>
							</tr>
							<tr>
								<td class="menu">이름</td>
								<td align="left"><input type="text" name="firstName" id="firstName" class="form-control input-sm" style="width: 30%; float: left;" placeholder="이름" /> <input type="text" name="lastName" id="lastName" class="form-control input-sm" style="width: 30%;" placeholder="성" /></td>
							</tr>
							<tr>
								<td class="menu">휴대폰</td>
								<td align="left"><select name="mobile1"
									class="form-control input-sm" style="width: 15%; float: left;">
										<option value="010">010</option>
										<option value="011">011</option>
										<option value="016">016</option>
										<option value="017">017</option>
										<option value="018">018</option>
										<option value="019">019</option>
								</select> <span style="float: left;">-</span> <input type="text"
									name="mobile2" onkeyup="this.value=checkNum(this.value)"
									class="form-control input-sm" style="width: 15%; float: left;"
									maxlength="4" /> <span style="float: left;">-</span> <input
									type="text" name="mobile3"
									onkeyup="this.value=checkNum(this.value)"
									class="form-control input-sm" style="width: 15%; float: left;"
									maxlength="4" /></td>
							</tr>
							<tr>
								<td class="menu">이메일</td>
								<td align="left"><input type="text" name="email"
									class="form-control input-sm" style="width: 60%;" /></td>
							</tr>
							<tr>
								<td class="menu">주소</td>
								<td align="left">
									<input type="text" name="addressZipcode" id="addressZipcode" readonly class="form-control input-sm" style="width: 15%; background-color: #dddddd; float: left;" />
									&nbsp;
									<button type="button" onclick="callAddress();" class="btn btn-sm btn-default">주소입력</button>
									<br> 
									<input type="text" class="input-addr" id="address" placeholder="주소입력 예) 느티마을4단, ㄱㄴㅍㅇㄴㅅ, 여의 메리츠, 행자부, 목동아파트, 테헤란로 152" style="display: none; margin: 5px 0; width: 100%;"> 
									<input type="text" name="addrressMain" id="addrressMain" readonly class="form-control input-sm" style="margin: 5px 0; width: 100%; background-color: #dddddd;" />
									<input type="text" name="addressSub" id="addressSub" placeholder="상세주소" class="form-control input-sm" style="width: 100%;" />
								</td>
							</tr>
							<tr>
								<td class="menu">메모</td>
								<td align="left"><textarea name="memo" id="memo" rows="4"
										class="form-control input-sm" style="width: 100%;"></textarea></td>
							</tr>
							<tr>
								<td class="menu">탈퇴사유</td>
								<td align="left"><textarea name="reason" id="reason"
										rows="4" class="form-control input-sm" style="width: 100%;"></textarea></td>
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
							<tr id="display_status">
								<td class="menu">상태 <span class="text-light-blue"><i
										class="fa fa-check"></i></span></td>
								<td><select name="status" id="status"
									class="form-control input-sm" style="width: 120px;">
										<option value="y">정상</option>
										<option value="n">대기</option>
								</select></td>
							</tr>
							<tr id="display_last_login_date">
								<td class="menu">최근 접속일</td>
								<td align="left"><span id="last_login_date"></span></td>
							</tr>
							<tr id="display_update_date">
								<td class="menu">수정일자</td>
								<td align="left"><span id="update_date"></span></td>
							</tr>
							<tr id="display_reg_date">
								<td class="menu">등록일자</td>
								<td align="left"><span id="reg_date"></span></td>
							</tr>
							<tr id="display_reg_date">
								<td class="menu">탈퇴일</td>
								<td align="left"><span id="withdraw_date"></span></td>
							</tr>
							<tr id="display_reg_date">
								<td class="menu">탈퇴사유</td>
								<td align="left"><span id="reason"></span></td>
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
</div>
<!-- /.content-wrapper -->
<script>
//타입별 검색
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
				url : `${pageContext.request.contextPath}/member/withdrawalTypeSearch.do`,
				data : search,
				contentType: "application/json; charset=utf-8",
				success(data){
					console.log("ajaxData = " + JSON.stringify(data));
					
					$("#tbody").html('');
					
					$.each(data.searchWithdrawalList, (k, v) => {
						$("#tbody").append(`
								<tr>
								<td style="width: 30px;">
									<input type="checkbox" class="member-is-checked" name="" data-target="\${v.memberNo}"/>
								</td>
								<td style="width: 110px;">\${v.id}</td>
								<td style="width: 110px;">\${v.name}</td>
								<td style="width: 110px;">\${v.phone}</td>
								<td>\${v.address}</td>
								<td style="width: 120px;">\${v.regDate}</td>
								<td style="width: 50px;">
									<span class="label label-default" style="font-size:12px;">탈퇴</span>
								</td>
								<td style="width: 60px;">
									<button type="button" id="detail_\${v.memberNo}" value="\${v.memberNo}" class="btn btn-primary btn-xs">상세보기</button>
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
		console.log($(item).is(":checked"));
	});
	
	$("#checkAll").prop("checked", isChecked);
});

// 선택 삭제
$(document).on("click", "#withdrawalDeleteBtn", function(){
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
	console.log($(document.withdrawalDeleteFrm));
    if(confirm("선택된 회원을 삭제하시겠습니까?"))
		$(document.withdrawalDeleteFrm).submit();
});

// 상세보기 모달
$("button[id^='detail_']").on('click', function(e){
	console.log(e.target);
	console.log("해당 no = " + $(e.target).val());
	e.preventDefault();
	var memberNo = $(e.target).val();
	
	$("[name=id]").prop("readonly", true);
	$("#modalRegister").modal();
	
	const data = {
			memberNo : memberNo
	};
	
	$.ajax({
		url : `${pageContext.request.contextPath}/member/withdrawalMemberDetail.do/\${memberNo}`,
		data : data,
		contentType : "application/json; charset=utf8",
		method : "GET",
		success : function(res){
			console.log("ajaxData = " + JSON.stringify(res));
			var withdrawalMember = res.withdrawalMember;
			var mobile1 = res.mobile1;
			var mobile2 = res.mobile2;
			var mobile3 = res.mobile3;
			
			$("[name=id]").val(withdrawalMember.id);
			$("[name=lastName]").val(withdrawalMember.lastName);
			$("[name=firstName]").val(withdrawalMember.firstName);
			$("[name=mobile1]").val(mobile1);
			$("[name=mobile2]").val(mobile2);
			$("[name=mobile3]").val(mobile3);
			$("[name=email]").val(withdrawalMember.email);
		},
		error : console.log
	});
});
</script>

<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>