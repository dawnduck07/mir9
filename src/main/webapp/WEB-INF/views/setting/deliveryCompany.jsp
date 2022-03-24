<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="" name="title" />
</jsp:include>

<link href="https://mir9.co.kr/resource/css/s9soft_juso.css" rel="stylesheet">
<style>
	.ui-menu {
		z-index: 9999;
		width: 400px;
	}
</style>

<!-- content-wrapper -->
<div class="content-wrapper">


	<section class="content-header">
		<h1>
			택배사 관리 <small>member list</small>
		</h1>
	
		<ol class="breadcrumb">
			<li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
			<li>택배사 관리</li>
			<li class="active">택배사 리스트</li>
		</ol>
	</section>

	<section class="content">
		<div class="row">
			<div class="col-xs-12">
				<div class="box">
					<div class="box-body">
						<label style="margin-top: 5px;">총 1 건</label>
						<form name="form_search" method="post" action="?tpf=admin/setting/delivery_company"> 
							<div class="box-tools pull-right" style="margin-bottom: 5px;">
								<div class="has-feedback">
									<span> 
										<input type="text" name="keyword" id="keyword" value="" class="form-control input-sm" placeholder="검색" /> 
										<span class="glyphicon glyphicon-search form-control-feedback"></span>
									</span>
								</div>
							</div>
							<div class="box-tools pull-right" style="margin-bottom: 5px;">
								<div class="has-feedback">
									<select name="field" class="form-control input-sm">
										<option value="company_name">택배사명</option>
										<option value="url">배송조회 url</option>
									</select>
								</div>
							</div>
						</form>
	
						<form name="form_list" method="post" action="${pageContext.request.contextPath }/delivery/deleteCompany">
							<table class="table table-bordered table-hover">
								<input type="hidden" name="mode" id="mode">
								<thead>
									<tr>
										<td style="width: 30px;"><input type="checkbox" name="select_all" onclick= "selectAllCheckBox( 'form_list');" /></td>
										<td style="width: 110px;">택배사</td>
										<td>배송조회 url</td>
										<td style="width: 140px;">등록일</td>
										<td style="width: 50px;">표출여부</td>
										<td style="width: 60px;">명령</td>
									</tr>
								</thead>
								
								<c:forEach var="company" items="${deliveryCompanyList }">
									<tr>
										<td><input type="checkbox" name="checkedNo" value="${company.deliComNo }" /></td>
										<td>${company.deliComName }</td>
										<td>${company.traceUrl }</td>
										<td><fmt:formatDate value="${company.regDate}"
												pattern="yyyy-MM-dd HH:mm:ss" /></td>
										<td>
											<c:choose>
												<c:when test="${company.showYn == 'Y' }">
													<span class="label label-success" style="font-size: 12px;">보임</span>
												</c:when>
												<c:otherwise>
													<span class="label label-default" style="font-size: 12px;">숨김</span>
												</c:otherwise>
											</c:choose>
										</td>
										<td>
											<button type="button" onclick="onclickUpdate(${company.deliComNo});" class="btn btn-primary btn-xs">상세보기</button>
										</td>
									</tr>
								</c:forEach>
							</table>
							<input type="hidden" id="companyNoList" name="companyNoList"/>
						</form>
						<br>
						
						<button type="button" onclick="selectCompanyDelete();" class="btn btn-danger"> 
							<i class="fa fa-minus-square"></i> 선택삭제
						</button>
						<button type="button" onclick="onclickInsert();" class="btn btn-primary">등록</button>
						<!--    // 관리자단에서 택배사가입 숨김
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
		<!-- /.row --> 
	</section>

	<!-- // 택배사 등록 폼 -->
	<div class="modal fade" id="modalRegister" tabindex="-2"; role="dialog" aria-labelledby="myModal" aria-hidden="true">
		<div class="modal-dialog" style="width: 620px;">
			<div class="modal-content">
				<form name="form" method="post" onsubmit="return false;" action="?tpf=admin/setting/delivery_company_process">
					<input type="hidden" name="mode"> <input type="hidden" name="code">
					<div class="modal-header"> 
						<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
						<h4 class="modal-title" id="myModalLabel">택배사 등록</h4>
					</div>
					
					<div class="modal-body">
						<h4>
							<p class="text-light-blue">
								<i class="fa fa-fw fa-info-circle"></i> 택배사정보
							</p>
						</h4>
						
						<table class="table table-bordered">
							<tr>
								<td class="menu">택배사명</td>
								<td align="left"><input type="text" name="company_name" class="form-control input-sm" /></td>
							</tr>
							
							<tr>
								<td class="menu">배송조회 url</td>
								<td align="left"><input type="text" name="url" class="form-control input-sm" placeholder="http://" /></td>
							</tr>
							
							<tr id="display_status">
								<td class="menu">상태 <span class="text-light-blue"><i class="fa fa-check"></i></span></td>
								<td>
									<select name="is_show" id="is_show" class="form-control input-sm" style="width: 120px;">
										<option value="Y">정상</option>
										<option value="N">대기</option>
									</select>
								</td>
							</tr>
							<tr id="display_reg_date">
								<td class="menu">등록일자</td>
								<td align="left"><span id="reg_date"></span></td>
							</tr>
						</table>
					</div>
				</form>
			</div>

		</div>
		<div class="modal-footer">
			<button type="button" onclick="register();" class="btn btn-primary">저장</button>
			<!--<button type="button" onclick="deleteCompany();" class="btn btn-danger">삭제</button>-->
		</div>
	</div>
</div>

<!-- /.content-wrapper -->

<script>
	/* 택배사 등록 모달 제어 */
	function onclickInsert(){
		$(modalRegister).modal('show');
	}
	
	/* 택배사 등록 */
	function register(){
		const formData = new FormData(document["form"]);
		var obj = {};
		for(const [k, v] of formData){
			obj[k] = v;
		};
		const jsonStr = JSON.stringify(obj);
		
		$.ajax({
			url:"${pageContext.request.contextPath}/delivery/insertCompany",
			method:"get",
			data: {
				jsonStr : jsonStr
			},
			contentType: "application/json; charset=utf-8",
			success(data){
				if(data > 0){
					alert("택배사가 등록되었습니다.");
					location.reload();
				}

			},
			error:console.log
		});	

	}
	
	/* 택배사 삭제  --> common.js에 기술되어있으나 별도도 구현함. (selectDelete)*/
	function selectCompanyDelete(){
		if($("input:checkbox[name=checkedNo]:checked").length == 0){
			alert('항목을 선택하여야 합니다.');			
		}else{
			var array = new Array();
			$("input:checkbox[name=checkedNo]:checked").each(function(){
				array.push(this.value);
			});
			
			$("#companyNoList").val(array);
			console.log($("#companyNoList").val())
			
			$(document["form_list"]).submit();
		}
	}

</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>