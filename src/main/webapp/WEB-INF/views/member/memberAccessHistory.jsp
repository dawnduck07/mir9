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
	<jsp:param value="회원 접속이력 관리" name="title" />
</jsp:include>


<!-- content-wrapper -->
<div class="content-wrapper">
	<link href="https://mir9.co.kr/resource/css/s9jss_single.css"
		rel="stylesheet">
	<style>
.ui-menu {
	z-index: 9999;
	width: 400px;
}
</style>

	<section class="content-header">
	<h1>
		회원 접속이력 관리 <small>member access history</small>
	</h1>

	<ol class="breadcrumb">
		<li><a href="#"><i class="fa fa-dashboard"> Home</i></a></li>
		<li>회원 관리</li>
		<li class="active">회원 접속이력 관리</li>
	</ol>
	</section>

	<section class="content">
	<div class="row">
		<div class="col-xs-12">
			<div class="box">
				<div class="box-body">
					<div id="totalCountContainer">
						<label style="margin-top: 5px;">총 ${totalAccessHistoryCount} 건</label>
					</div>
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
								<option value="access_history_id">아이디</option>
								<option value="access_history_name">이름</option>
								<option value="access_history_ip">IP 주소</option>
							</select>
						</div>
					</div>

					<table class="table table-bordered table-hover">
						<form name="form_list" method="post"
							action="?tpf=admin/member/process">
							<input type="hidden" name="mode" id="mode" value="delHistory">
							<thead>
								<tr>
									<td style="width: 30px;"><input type="checkbox"
										name="select_all" onclick=selectAllCheckBox( 'form_list'); /></td>
									<td style="width: 60px;">NO</td>
									<td style="width: 110px;">아이디</td>
									<td style="width: 110px;">이름</td>
									<td style="width: 110px;">접속 IP</td>
									<td style="width: 110px;">상태</td>
									<td style="width: 110px;">일시</td>
								</tr>
							</thead>
							<tbody id = "tbody">
								<c:forEach items="${memberAccessHistoryList}" var="history" varStatus="status" >
									<tr>
										<td style="width: 30px;"><input type="checkbox" class="member-is-checked" name="" value="${history.memberNo}" data-target="${history.memberNo}" /></td>
										<td style="width: 60px;">${history.accessHistoryNo}</td>
										<td style="width: 110px;">${history.accessHistoryId}</td>
										<td style="width: 110px;">${history.accessHistoryName}</td>
										<td style="width: 110px;">${history.accessHistoryIp}</td>
										<td style="width: 110px;">${history.accessHistoryStatus}</td>
										<td style="width: 110px;"><fmt:formatDate pattern="yyyy/MM/dd HH:mm:ss" value="${history.loginDate}" /></td>
									</tr>
								</c:forEach>
							</tbody>		
						</form>
					</table>
					<br>
					<button type="button"
						onclick="selectDelete('delHistory','선택된 회원을 삭제하시겠습니까?');"
						class="btn btn-danger">
						<i class="fa fa-minus-square"></i> 선택삭제
					</button>
					<button type="button" onclick="downloadExcel();"
						class="btn btn-warning" style="margin-left: 20px;">
						<i class="fa" aria-hidden="true"></i> Excel 다운로드
					</button>
					<form name="form_download" method="post"
						action="?tpf=admin/member/process">
						<input type="hidden" name="mode" value="downloadExcelAccessLog">
						<input type="hidden" name="search_data" value=""> <input
							type="hidden" name="search_type" value="">
					</form>
					<div style="text-align: right;">
						<ul class="pagination" style="margin: 0;">
							<li class="active"><a href="?tpf=admin/member/log&page=1">1</a></li>
							<li><a href="?tpf=admin/member/log&page=2">2</a></li>
							<li><a href="?tpf=admin/member/log&page=3">3</a></li>
							<li><a href="?tpf=admin/member/log&page=4">4</a></li>
							<li><a href="?tpf=admin/member/log&page=5">5</a></li>
							<li class="next"><a href="?tpf=admin/member/log&page=6">Next
									→ </a></li>
							<li><a href="?tpf=admin/member/log&page=46">Last → </a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
	</section>
</div>
<!-- /.content-wrapper -->
<script>
// 타입별 검색
$(document).ready(function(){
	// Enter Event
	$("#keyword").keydown(function(keyNum){
		var keyword = $('input[name=keyword]').val();
		var type = $('select[name=type]').val();
		
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
				url : `${pageContext.request.contextPath}/member/typeSearchByAcceessHistory.do`,
				data : search,
				contentType : "application/json; charset=utf-8",
				success(data){
					console.log("ajaxData = " + JSON.stringify(data));
					
					$("#tbody").html('');
					
					$.each(data.searchAccessHistoryList, (k, v) => {
						$("#tbody").append(`
								<tr>
								<td style="width: 30px;"><input type="checkbox" class="member-is-checked" name="" value="\${v.memberNo}" data-target="\${v.memberNo}" /></td>
								<td style="width: 60px;">\${v.accessHistoryNo}</td>
								<td style="width: 110px;">\${v.accessHistoryId}</td>
								<td style="width: 110px;">\${v.accessHistoryName}</td>
								<td style="width: 110px;">\${v.accessHistoryIp}</td>
								<td style="width: 110px;">\${v.accessHistoryStatus}</td>
								<td style="width: 110px;">\${v.loginDate}</td>
							</tr>
								`);
					});
					$("#totalCountContainer").html(`<label style="margin-top: 5px;">총 \${data["searchHistoryListCount"]} 건</label>`)
				}
			});
		};
	});
});
	

	


</script>

<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>