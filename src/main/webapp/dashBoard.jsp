<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>  
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="Dashboard" name="title" />
</jsp:include>

<!-- content-wrapper test-->
<div class="content-wrapper">
	<style>
ul {
	list-style: none;
}

.nav-tabs-custom .list li:not(:last-child) {
	margin: 0 0 13px;
}

.cs-m-right20 {
	margin-right: 20px;
	font-size: 14px;
	color: #97989b;
}
</style>

	<section class="content-header">
		<h1>
			Dashboard <small>쇼핑몰 운영현황</small>
		</h1>

		<ol class="breadcrumb">
			<li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
			<li>Dashboard</li>
		</ol>
	</section>

	<section class="content">
		<div class="row">
			<div class="col-md-12">
				<div class="box">
					<br>
					<div class="box-header with-border">
						<h3 class="box-title">금일 매출 현황 (2022년 02월 25일)</h3>
					</div>
					<div class="col-lg-3 col-xs-6">
						<!-- small box -->
						<div class="small-box bg-aqua">
							<div class="inner">
								<h3>${counts.todayOrderCnt }</h3>
								<p>주문건</p>
							</div>
							<div class="icon">
								<i class="fa fa-shopping-cart"></i>
							</div>
							<a class="small-box-footer"
								href="/index.php?tpf=admin/order/list">더보기 <i
								class="fa fa-arrow-circle-right"></i></a>
						</div>
					</div>
					<!-- ./col -->
					<div class="col-lg-3 col-xs-6">
						<!-- small box -->
						<div class="small-box bg-green">
							<div class="inner">
								<h3>${counts.todayPaidCnt }</h3>
								<p>입금완료</p>
							</div>
							<div class="icon">
								<i class="fa fa-pie-chart"></i>
							</div>
							<a class="small-box-footer"
								href="/index.php?tpf=admin/order/list&payment_status=pay_done">더보기
								<i class="fa fa-arrow-circle-right"></i>
							</a>
						</div>
					</div>
					<!-- ./col -->
					<div class="col-lg-3 col-xs-6">
						<!-- small box -->
						<div class="small-box bg-yellow">
							<div class="inner">
								<h3>${counts.todayPayReadyCnt }</h3>
								<p>입금대기</p>
							</div>
							<div class="icon">
								<i class="fa fa-files-o"></i>
							</div>
							<a class="small-box-footer"
								href="/index.php?tpf=admin/order/list&payment_status=pay_ready">더보기
								<i class="fa fa-arrow-circle-right"></i>
							</a>
						</div>
					</div>
					<!-- ./col -->
					<div class="col-lg-3 col-xs-6">
						<!-- small box -->
						<div class="small-box bg-red">
							<div class="inner">
								<h3>${counts.todayRegMemberCnt }</h3>

								<p>가입회원 수</p>
							</div>
							<div class="icon">
								<i class="fa fa-user"></i>
							</div>
							<a class="small-box-footer"
								href="/index.php?tpf=admin/member/list">더보기 <i
								class="fa fa-arrow-circle-right"></i></a>
						</div>
					</div>
					<!-- ./col -->

					<div class="box-header with-border">
						<h3 class="box-title">월별 요약표</h3>
					</div>
					<!-- /.box-header -->
					<div class="box-body">
						<div class="row">
							<div class="col-md-8">
								<p class="text-center">
									<strong>2022년</strong>
								</p>

								<div class="chart">
									<script>
										var chart_data = new Array();
										var dataRow = [];
										dataRow = [ 'Month', '판매금액' ];
										chart_data.push(dataRow);
									</script>
									<script>
										dataRow = [ '1월', 0 ];
										chart_data.push(dataRow);
									</script>
									<script>
										dataRow = [ '2월', 0 ];
										chart_data.push(dataRow);
									</script>
									<script>
										dataRow = [ '3월', 0 ];
										chart_data.push(dataRow);
									</script>
									<script>
										dataRow = [ '4월', 0 ];
										chart_data.push(dataRow);
									</script>
									<script>
										dataRow = [ '5월', 0 ];
										chart_data.push(dataRow);
									</script>
									<script>
										dataRow = [ '6월', 0 ];
										chart_data.push(dataRow);
									</script>
									<script>
										dataRow = [ '7월', 0 ];
										chart_data.push(dataRow);
									</script>
									<script>
										dataRow = [ '8월', 0 ];
										chart_data.push(dataRow);
									</script>
									<script>
										dataRow = [ '9월', 0 ];
										chart_data.push(dataRow);
									</script>
									<script>
										dataRow = [ '10월', 0 ];
										chart_data.push(dataRow);
									</script>
									<script>
										dataRow = [ '11월', 0 ];
										chart_data.push(dataRow);
									</script>
									<script>
										dataRow = [ '12월', 0 ];
										chart_data.push(dataRow);
									</script>
									<div id="chart_div" style="width: 100%; height: 100%;"></div>

									<!-- Sales Chart Canvas -->
									<!-- <canvas width="964" height="180" id="salesChart" style="width: 964px; height: 180px;"></canvas> -->
								</div>
								<!-- /.chart-responsive -->
							</div>
							<!-- /.col -->
							<div class="col-md-4">

								<p class="text-center">
									<strong>주문상태별 비율</strong>(최근 1개월)
									<!-- Goal Completion -->
								</p>
								<div class="chart">
									<script>
										var chart_data2 = new Array();
										var dataRow2 = [];
										dataRow2 = [ '진행상태', '건수' ];
										chart_data2.push(dataRow2);
									</script>
									<script>
										dataRow2 = [ '입금대기', 0 ];
										chart_data2.push(dataRow2);
									</script>
									<script>
										dataRow2 = [ '입금확인', 0 ];
										chart_data2.push(dataRow2);
									</script>
									<script>
										dataRow2 = [ '배송준비중', 0 ];
										chart_data2.push(dataRow2);
									</script>
									<script>
										dataRow2 = [ '배송중', 0 ];
										chart_data2.push(dataRow2);
									</script>
									<script>
										dataRow2 = [ '배송완료', 0 ];
										chart_data2.push(dataRow2);
									</script>
									<script>
										dataRow2 = [ '주문취소', 0 ];
										chart_data2.push(dataRow2);
									</script>
									<script>
										dataRow2 = [ '환불', 0 ];
										chart_data2.push(dataRow2);
									</script>
									<div id="chart_div2" style="width: 100%; height: 100%;"></div>

									<!-- Sales Chart Canvas -->
									<!-- <canvas width="964" height="180" id="salesChart" style="width: 964px; height: 180px;"></canvas> -->
								</div>
								<!-- <div class="progress-group">
                            <span class="progress-text">배송준비중</span>
                            <span class="progress-number"><b>4</b>/10</span>

                            <div class="progress sm">
                              <div class="progress-bar progress-bar-aqua" style="width: 40%;"></div>
                            </div>
                          </div>
                          <div class="progress-group">
                            <span class="progress-text">배송중</span>
                            <span class="progress-number"><b>2</b>/10</span>

                            <div class="progress sm">
                              <div class="progress-bar progress-bar-red" style="width: 20%;"></div>
                            </div>
                          </div>
                          <div class="progress-group">
                            <span class="progress-text">배송완료</span>
                            <span class="progress-number"><b>3</b>/10</span>

                            <div class="progress sm">
                              <div class="progress-bar progress-bar-green" style="width: 30%;"></div>
                            </div>
                          </div>
                          <div class="progress-group">
                            <span class="progress-text">주문취소</span>
                            <span class="progress-number"><b>1</b>/10</span>

                            <div class="progress sm">
                              <div class="progress-bar progress-bar-yellow" style="width: 10%;"></div>
                            </div>
                          </div> -->
								<!-- /.progress-group -->

							</div>
							<!-- /.col -->
						</div>
						<!-- /.row -->
					</div>
					<!-- ./box-body -->
					<div class="box-footer">
						<div class="row">
							<div class="col-sm-3 col-xs-6">
								<div class="description-block border-right">
									<span class="description-percentage text-green">총 누적판매액</span>
									<h5 class="description-header"><fmt:formatNumber value="${counts.totalSaleAmountMonth }" pattern="#,###" /></td></h5>
									<span class="description-text">(원)</span>
								</div>
								<!-- /.description-block -->
							</div>
							<!-- /.col -->
							<div class="col-sm-3 col-xs-6">
								<div class="description-block border-right">
									<span class="description-percentage text-yellow">
										<!--i class="fa fa-caret-left"></i--> 총 주문건수
									</span>
									<h5 class="description-header">${counts.monthOrderCnt }</h5>
									<span class="description-text">(건)</span>
								</div>
								<!-- /.description-block -->
							</div>
							<!-- /.col -->
							<div class="col-sm-3 col-xs-6">
								<div class="description-block border-right">
									<span class="description-percentage text-green">
										<!--i class="fa fa-caret-up"></i--> 총 누적환불액
									</span>
									<h5 class="description-header"><fmt:formatNumber value="${counts.totalCancelAmountMonth }" pattern="#,###" /></h5>
									<span class="description-text">(원)</span>
								</div>
								<!-- /.description-block -->
							</div>
							<!-- /.col -->
							<div class="col-sm-3 col-xs-6">
								<div class="description-block">
									<span class="description-percentage text-red">총 환불건수</span>
									<h5 class="description-header">${counts.monthCancelCnt }</h5>
									<span class="description-text">(건)</span>
								</div>
								<!-- /.description-block -->
							</div>
						</div>
						<!-- /.row -->
					</div>
					<!-- /.box-footer -->
				</div>
				<!-- /.box -->
			</div>
			<!-- /.col-md-12 -->
		</div>
		<!-- /.row -->


		<div class="row">
			<div class="col-md-12">

				<div class="box">
					<div class="box-body">
						<div class="col-md-6">

							<div class="box-header with-border">
								<h3 class="box-title">최근 주문건</h3>
							</div>
							<!-- /.box-header -->

							<table class="table table-bordered">
								<thead>
									<tr>
										<th style="text-align: center;">주문번호</th>
										<th style="text-align: center;">주문상품</th>
										<th style="text-align: center;">진행상태</th>
										<th style="text-align: center;">주문일시</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="order" items="${orderList }">
										<tr>
											<td><a href="${pageContext.request.contextPath }/order/list">${fn:substring(order.orderNo,0,6) }-${fn:substring(order.orderNo,7,15) }</a></td>
											<td>${order.productName }</td>
											
											<c:choose>
												<c:when test="${order.orderStatusNo == 1 }">
													<td><span class="label label-info">입금 대기</span></td>
												</c:when>
												<c:when test="${order.orderStatusNo == 2 }">
													<td><span class="label label-warning">입금확인</span></td>
												</c:when>
												<c:when test="${order.orderStatusNo == 4 }">
													<td><span class="label label-success">배송중</span></td>
												</c:when>
												<c:when test="${order.orderStatusNo == 5 }">
													<td><span class="label label-success">배송완료</span></td>
												</c:when>
											</c:choose>
											
											<c:if test="${order.piStatus == 'ready' }">
												<td>${order.piStatus == 'ready' ? ' - ':'' }</td>
											</c:if>
											<c:if test="${order.piStatus == 'paid' }">
												<td><fmt:formatDate value="${order.paidAt}" pattern="yyyy-MM-dd" /> </td>
											</c:if>
											
										</tr>
									</c:forEach>
									
								</tbody>
							</table>
						</div>
						<!-- ./col-md-6 -->

						<div class="col-md-6">

							<div class="box-header with-border">
								<h3 class="box-title">최근 등록상품</h3>
							</div>
							<!-- /.box-header -->

							<table class="table table-bordered">
								<thead>
									<tr>
										<th style="text-align: center;">상품코드</th>
										<th style="text-align: center;">상품명</th>
										<th style="text-align: center;">카테고리</th>
										<th style="text-align: center;">등록일자</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="product" items="${productList }">
										<tr>
											<td><a href="${pageContext.request.contextPath }/product/list">${product.modelName }</a></td>
											<td>${product.productName }</td>
											<td>${product.categoryName }</td>
											<td><td><fmt:formatDate value="${product.regDate}" pattern="yyyy-MM-dd" /></td>
										</tr>
									</c:forEach>
									
								</tbody>
							</table>
						</div>
						<!-- ./col-md-6 -->


					</div>
					<!-- /.box-body -->
				</div>
				<!-- /.box -->

			</div>
			<!-- /.col-md-12 -->
		</div>
		<!-- /.row -->

		<div class="row">
			<div class="col-md-4">
				<div class="small-box bg-aqua">
					<div class="inner">
						<h4>결제PG 신청</h4>
						<li>엑심베이(PayPal, 중국, 일본, 동남아 결제)</li>
						<li>이니시스</li>
					</div>
					<div class="icon">
						<i class="fa fa-credit-card"></i>
					</div>
					<a class="small-box-footer"
						href="/index.php?tpf=admin/setting/paymentpg">신청하기 <i
						class="fa fa-arrow-circle-right"></i></a>
				</div>

				<div style="text-align: center;">
					<a href="${pageContext.request.contextPath }/product/list"
						class="btn btn-default btn-lg"><i class="fa fa-gift"></i> 상품
						관리</a> <a href="${pageContext.request.contextPath }/setting/point"
						class="btn btn-default btn-lg"><i class="fa fa-dollar"></i>
						적립금 관리</a> <a href="${pageContext.request.contextPath }/setting/coupon"
						class="btn btn-default btn-lg"><i class="fa fa-credit-card"></i>
						쿠폰 관리</a>
				</div>
			</div>

			<div class="col-md-8">

				<!-- Custom Tabs -->
				<div class="nav-tabs-custom">
					<ul class="nav nav-tabs">
						<li class="active"><a aria-expanded="true" href="#tab_1"
							data-toggle="tab">공지사항</a></li>
						<li class=""><a aria-expanded="true" href="#tab_2"
							data-toggle="tab">자주하는 질문</a></li>
						<li class=""><a aria-expanded="true" href="#tab_3"
							data-toggle="tab">1:1 문의</a></li>
						<li class="pull-right"><a class="text-muted"
							href="/index.php?tpf=admin/board/list&board_code=1">더보기 <i
								class="fa fa-arrow-circle-right"></i></a></li>
					</ul>
					<div class="tab-content">
						<div class="tab-pane active" id="tab_1">
							<ul class="list">
								<li><a href="/index.php?tpf=admin/board/list&board_code=1">공지사항<span
										class="pull-right cs-m-right20">2020-02-06</span></a></li>
							</ul>
						</div>
						<div class="tab-pane " id="tab_2">
							<ul class="list">
								<li>등록된 게시물이 없습니다.</li>
							</ul>
						</div>
						<div class="tab-pane " id="tab_3">
							<ul class="list">
								<li>등록된 게시물이 없습니다.</li>
							</ul>
						</div>
					</div>
					<!-- /.tab-content -->
				</div>
				<!-- /.nav-tabs-custom -->
			</div>
			<!-- /.col-md-12 -->
		</div>
		<!-- /.row -->
	</section>
</div>
<!-- /.content-wrapper -->

<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>