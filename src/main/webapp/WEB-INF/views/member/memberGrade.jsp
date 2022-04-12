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
	<jsp:param value="등급 관리" name="title" />
</jsp:include>

<!-- content-wrapper -->
<div class="content-wrapper">
	<section class="content-header">
	<h1>
		등급 관리 <small>grade list</small>
	</h1>

	<ol class="breadcrumb">
		<li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
		<li>회원 관리</li>
		<li class="active">등급 관리</li>
	</ol>
	</section>

	<section class="content">
	<div class="row">
		<div class="col-xs-12">
			<div class="box">
				<div class="box-body">
				
					<form:form 
						id="memberGradeInsertFrm" 
						name="memberGradeInsertFrm"
						method="POST"
						action="${pageContext.request.contextPath}/member/memberGradeInsert.do">
						<table class="table table-bordered table-hover"
							style="width: 30%;">
							<thead>
								<tr>
									<td style="width: 60px;">등급</td>
									<td>명칭</td>
									<td style="width: 80px;">회원수</td>
								</tr>
							</thead>
							<tbody id = "tbody">
								<c:forEach items="${memberGradeList}" var="mgl">
									<tr>
										<td>${mgl.memberGradeNo}</td>
										<td><input type="text" name="memberGradeName" value="${mgl.memberGradeName}"
											class="form-control input-sm" style="width: 100%;" /></td>
										<td>${mgl.cnt}</td>
									</tr>
								</c:forEach>
							</tbody>
							
							<!--  
							<tr>
								<td>1</td>
								<td>
									
									<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" /> 
									<input type="text" name="memberGrade1" value="관리자" readonly class="form-control input-sm" style="width: 100%;"/>
								</td>
								<td></td>
							</tr>
							<tr>
								<td>2</td>
								<td><input type="text" name="memberGrade2" value="${memberGradeList.memberGrade2}"
									class="form-control input-sm" style="width: 100%;" /></td>
								<td></td>
							</tr>
							<tr>
								<td>3</td>
								<td><input type="text" name="memberGrade3" value="${memberGradeList.memberGrade3}"
									class="form-control input-sm" style="width: 100%;" /></td>
								<td></td>
							</tr>
							<tr>
								<td>4</td>
								<td><input type="text" name="memberGrade4" value="${memberGradeList.memberGrade4}"
									class="form-control input-sm" style="width: 100%;" /></td>
								<td></td>
							</tr>
							<tr>
								<td>5</td>
								<td><input type="text" name="memberGrade5" value="${memberGradeList.memberGrade5}"
									class="form-control input-sm" style="width: 100%;" /></td>
								<td></td>
							</tr>
							-->
						</table>

						<br>

						<button type="button" onclick="insertGrade()"
							class="btn btn-primary btn-sm">
							<i class="fa fa-gear"></i> 등급 수정
						</button>
					</form:form>
				</div>
				<!-- /.box-body -->
			</div>
			<!-- /.box -->
		</div>
		<!-- /.col-xs-12 -->
	</div>
	<!-- /.row --> </section>
</div>
<!-- /.content-wrapper -->

<script>
function insertGrade(){
	console.log("등급수정(insertGrade()) 동작");
	$(document.memberGradeInsertFrm).submit();
		
}

</script>


<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>