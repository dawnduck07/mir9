<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="기간별 통계" name="title" />
</jsp:include>

<c:set var="now" value="<%= new java.util.Date() %>"/>
<c:set var="nowYear"><fmt:formatDate value="${now }" pattern="yyyy"/></c:set>

<!-- content-wrapper -->
<div class="content-wrapper">
	<section class="content-header">
	<h1>
		기간별 매출 통계 <small>Sales Statistics by Period</small>
	</h1>

	<ol class="breadcrumb">
		<li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
		<li><a href="#">통계</a></li>
		<li class="active">기간별 매출 통계</li>
	</ol>
	</section>

	<section class="content">
	<div class="row">
		<div class="col-xs-12">
			<div class="box">
				<div class="box-body">

					<form:form name="form_search" id="form_search" method="post" action="${pageContext.request.contextPath }/statistics/period_process">
						<div class="box-tools " style="margin-bottom: 5px;">
							<table class="table table-bordered">
								<tbody>
									<tr>
										<td class="menu">통계종류</td>
										<td align="left"><input type="radio" name="statistics_type" id="statistics_type_1" value="date" onclick="location.href='${pageContext.request.contextPath}/statistics/period_day';" /> <label for="statistics_type_1">일별통계</label>&nbsp;&nbsp; <input type="radio" name="statistics_type" id="statistics_type_2" value="month" onclick="location.href='${pageContext.request.contextPath}/statistics/period_month';" /> <label for="statistics_type_2">월별통계</label>&nbsp;&nbsp; <input type="radio" name="statistics_type" id="statistics_type_3" value="year" checked /> <label for="statistics_type_3">연도별통계</label></td>
									</tr>
									<tr>
										<td class="menu">기간 검색</td>
										<td align="left"><select name="start_date" id="start_date" class="form-control input-sm " style="width: 100px; display: inline-block;">
												<c:forEach var="year" begin="2018" end="${nowYear }">
													<c:if test="${startDateStr != null }">
														<option value="${year }" ${year == startDateStr ? 'selected' : '' }>${year }</option>
													</c:if>
													<c:if test="${startDateStr == null }">
														<option value="${year }" ${year == '2018' ? 'selected' : '' }>${year }</option>
													</c:if>
												</c:forEach>
												
										</select> ~ <select name="end_date" id="end_date" class="form-control input-sm " style="width: 100px; display: inline-block;">
												<c:forEach var="year" begin="2018" end="${nowYear }">
													<c:if test="${endDateStr != null }">
														<option value="${year }" ${year == endDateStr ? 'selected' : '' }>${year }</option>
													</c:if>
													<c:if test="${endDateStr == null }">
														<option value="${year }" ${year == nowYear ? 'selected' : '' }>${year }</option>
													</c:if>
												</c:forEach>
										</select></td>
									</tr>
								</tbody>
								<tfoot>
									<tr>
										<td colspan="2" style="text-align: center;">
											<button type="submit" class="btn btn-danger btn-sm">
												<i class="fa "></i>검색
											</button>
										</td>
									</tr>
								</tfoot>
							</table>
						</div>
					</form:form>
					<script>
						var chart_data = new Array();
						var dataRow = [];
						dataRow = [ '일시', '매출금액', {
							role : 'style'
						} ];
						chart_data.push(dataRow);
					</script>
					
					<c:forEach var="r" items="${result }">
						<c:set var="dateStr">
							<fmt:formatDate value="${r.paidAt}" pattern="yyyy" />
						</c:set>
						<c:set var="tAmount">${r.totalAmount == null ? '0' : r.totalAmount - r.totalCancelAmount}</c:set>
						<script>
							dataRow = ['${dateStr}', ${tAmount} , '#76A7FA' ];
							chart_data.push(dataRow);
						</script>
					</c:forEach>
					
					<div id="chard_div" style="border: 1px solid #cdcdcd; width: 100%; margin-bottom: 10px;">
						<div id="columnchart_values" style="width: 100%; height: 370px;"></div>
					</div>

					<table class="table table-bordered table-hover">
						<colgroup>
							<col width="8%">
							<col width="*">
							<col width="8%">
							<col width="8%">
							<col width="8%">
							<col width="8%">
							<col width="8%">
							<col width="8%">
							<col width="8%">
							<col width="8%">
							<col width="8%">
							<col width="8%">
						</colgroup>
						<thead>
							<tr>
								<td rowspan="2">날짜</td>
								<td rowspan="2">매출금액</td>
								<td colspan="5">판매금액</td>
								<td colspan="5 ">환불금액</td>
							</tr>
							<tr>
								<td>상품판매가</td>
								<td>배송비</td>
								<td>쿠폰</td>
								<td>포인트</td>
								<td>총 결제금액</td>

								<td>상품판매가</td>
								<td>배송비</td>
								<td>쿠폰</td>
								<td>포인트</td>
								<td>총 결제금액</td>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="r" items="${result }">
								<tr>
									<td><fmt:formatDate value="${r.paidAt}" pattern="yyyy" /></td>
									<td class="total1" align="right">${r.totalAmount == null ? '0' : r.totalAmount - r.totalCancelAmount }</td>

									<td class="total2" align="right">${r.totalSalePrice == null ? '0' : r.totalSalePrice + r.totalOptionCost }</td>

									<td class="total3" align="right">${r.totalDeliFee }</td>

									<td class="total4" align="right">${r.totalCouponAmount }</td>

									<td class="total5" align="right">${r.totalPointAmount }</td>
									<td class="total6" align="right">${r.totalAmount == null ? '0' : r.totalAmount }</td>




									<td class="total7" align="right">${r.totalSalePriceCancel == null ? '0' : r.totalSalePriceCancel + r.totalOptionCostCancel }</td>
									<td class="total8" align="right">${r.totalDeliFeeCancel == null ? '0' : r.totalDeliFeeCancel }</td>
									<td class="total9" align="right">${r.totalCouponAmountCancel == null ? '0' : r.totalCouponAmountCancel }</td>

									<td class="total10" align="right">${r.totalPointAmountCancel == null ? '0' : r.totalPointAmountCancel }</td>
									<td class="total11" align="right">${r.totalCancelAmount == null ? '0' : r.totalCancelAmount }</td>

								</tr>
							</c:forEach>
						</tbody>
						<tfoot>
							<tr>
								<td>총 합계</td>
								<td id="total1" align="right">0</td>
								<td id="total2" align="right">0</td>
								<td id="total3" align="right">0</td>
								<td id="total4" align="right">0</td>
								<td id="total5" align="right">0</td>
								<td id="total6" align="right">0</td>
								<td id="total7" align="right">0</td>
								<td id="total8" align="right">0</td>
								<td id="total9" align="right">0</td>
								<td id="total10" align="right">0</td>
								<td id="total11" align="right">0</td>
							</tr>
						</tfoot>
					</table>
					<br />

					<!-- <button type="button" onclick="downloadExcel();" class="btn btn-warning btn-sm"><i class="fa" aria-hidden="true"></i> Excel 다운로드</button>
                    <form name="form_download" method="post" action="?tpf=admin/order/process">
                        <input type="hidden" name="mode" value="downloadExcel">
                        <input type="hidden" name="search_data">
                    </form> -->
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
$(document).ready(function(){
	for(var i = 1; i <= 11; i++){
		var target = ".total"+ i;
		var result = 0*1;
		$.each($(target), (k, v)=>{
			result += $(v).text()*1;
		})
		target = "#total" + i;
		console.log($(target))
		$(target).text(result);
		
	}

});	

/* 그래프 그리기 */
function drawChart() {
	var chartBarColor = '#76A7FA';

	var data = google.visualization.arrayToDataTable(chart_data);

	var chart_div_width = $('#columnchart_values').width();
	//console.log(chart_div_width);
	var view = new google.visualization.DataView(data);
	view.setColumns([ 0, 1, {
		calc : "stringify",
		sourceColumn : 1,
		type : "string",
		role : "annotation"
	}, 2 ]);

	var options = {
		title : "일별 매출금액",
		width : chart_div_width,
		height : 350,
		bar : {
			groupWidth : "95%"
		},
		legend : {
			position : "none"
		},
	};
	var chart = new google.visualization.ColumnChart(document
			.getElementById("columnchart_values"));
	chart.draw(view, options);
}

var sForm = null;

$(function() {
	sForm = document.form_search;

	$(".txt_date1").datepicker(
			{
				defaultDate : "+0d",
				changeYear : true,
				changeMonth : true,
				dateFormat : "yy-mm-dd",
				maxDate : '2022-03-15',
				showMonthAfterYear : true,
				dayNamesMin : [ '일', '월', '화', '수', '목', '금', '토' ],
				monthNamesShort : [ '1월', '2월', '3월', '4월', '5월', '6월',
						'7월', '8월', '9월', '10월', '11월', '12월' ]
			});

	google.charts.load("current", {
		packages : [ 'corechart' ]
	});
	google.charts.setOnLoadCallback(drawChart);
});


</script>

<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>