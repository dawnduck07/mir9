<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<jsp:include page="/WEB-INF/views/common/header.jsp">
<jsp:param value="메일 설정" name="title"/>
</jsp:include>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!-- content-wrapper -->
<div class="content-wrapper">
<style>
textarea {
    width:180px;
    height:100px;
}
</style>

	<section class="content-header">
	    <h1>
	    	메일 설정
	    	<small>sms setting</small>
	    </h1>
	
	    <ol class="breadcrumb">
	        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
	        <li>커뮤니티 관리</li>
	        <li class="active">메일 설정</li>
	    </ol>
	</section>
	
	<section class="content">
		<div class="row">
		    <div class="col-xs-12">
		        <div class="box">
		            <div class="box-body">
	
		                <form name="form_register" method="post" action="/index.php?tpf=admin/community/email_process">
			                <input type="hidden" name="mode" value="updateEmail">
			                <input type="hidden" name="locale" value="ko">
			
							<h4><p class="text-light-blue"><i class="fa fa-fw fa-info-circle"></i> 메일 발송 문구 설정 </p></h4>
			                <div style="text-align:right;">
								<button type="button" id="locale_ko" onclick="parent.location.href='?tpf=admin/community/email&locale=ko'" class="btn btn-primary"><i class="fa fa-globe" aria-hidden="true"></i> 한국어</button>
								<button type="button" id="locale_en" onclick="parent.location.href='?tpf=admin/community/email&locale=en'" class="btn btn-default"><i class="fa fa-globe" aria-hidden="true"></i> ENG</button>
								<button type="button" id="locale_zh" onclick="parent.location.href='?tpf=admin/community/email&locale=zh'" class="btn btn-default"><i class="fa fa-globe" aria-hidden="true"></i> 中国</button>
								<button type="button" id="locale_vn" onclick="parent.location.href='?tpf=admin/community/email&locale=vn'" class="btn btn-default"><i class="fa fa-globe" aria-hidden="true"></i> Tiếng việt</button>                
							</div></br>
			
							<table class="table table-bordered table-hover">
								<thead>
				                    <tr>
				                        <td rowspan="3" class="menu" style="width:350px;">발송항목</td>
										<td colspan="4">발송대상 및 메일 문구설정</td>
										<td rowspan="3" class="menu" style="width:350px;">치환문구 설명</td>
				                    </tr>
									<tr>
				                        <td colspan="2">회원</td>
										<td colspan="2">관리자</td>
				                    </tr>
				                    <tr>
				                        <td>자동발송</td>
										<td>문구</td>
				                        <td>자동발송</td>
										<td>문구</td>
				                    </tr>
				                </thead>
				                <tbody>
				      				<tr>
					                    <input type="hidden" name="msg[join][code]" value="10" />
										<td class="content">회원가입</td>
					                    <td class="content">
					                    	<input type="checkbox" name="msg[join][is_send]" value="y" checked/>
					                    </td>
					                    <td class="content">
					                    	<button type="button" onclick="onclickUpdate('10','join');" class="btn btn-primary btn-xs">편집</button>
					                    </td>
					                    <td class="content">
					                    	<input type="checkbox" name="msg[join][is_send_admin]" value="y" />
					                    </td>
					                    <td class="content">
					                    	<button type="button" onclick="onclickUpdate('10','join','admin');" class="btn btn-primary btn-xs">편집</button>
					                    </td>
					                    <td align="left">
											<ul>
												<li>{{shop_name}} : 사이트명</li> <li>{{user_name}} : 회원명</li> <li>{{user_id}} : 회원 아이디</li>			    
											</ul>
										</td>
				               		</tr>      
				               		<tr>
					                    <input type="hidden" name="msg[findid][code]" value="47" />
										<td class="content">아이디 찾기<br>[아이디 찾기시]</td>
					                    <td class="content">
					                    	<input type="checkbox" name="msg[findid][is_send]" value="y" checked/>
					                    </td>
					                    <td class="content">
					                    	<button type="button" onclick="onclickUpdate('47','findid');" class="btn btn-primary btn-xs">편집</button>
					                    </td>
					                    <td class="content">
					                    	<input type="checkbox" name="msg[findid][is_send_admin]" value="y" />
					                    </td>
					                    <td class="content">
					                    	<button type="button" onclick="onclickUpdate('47','findid','admin');" class="btn btn-primary btn-xs">편집</button>
					                    </td>
					                    <td align="left">
											<ul>		    
												<li>{{shop_name}} : 사이트명</li> <li>{{user_name}} : 회원명</li> <li>{{user_id}} : 회원 아이디</li>			    
											</ul>
										</td>
					                </tr>      
					                <tr>
					                    <input type="hidden" name="msg[findpw][code]" value="43" />
										<td class="content">임시비밀번호 발급알림<br>[비밀번호 찾기시]</td>
					                    <td class="content">
					                    	<input type="checkbox" name="msg[findpw][is_send]" value="y" checked/>
					                    </td>
					                    <td class="content">
					                    	<button type="button" onclick="onclickUpdate('43','findpw');" class="btn btn-primary btn-xs">편집</button>
					                    </td>
					                    <td class="content">
					                    	<input type="checkbox" name="msg[findpw][is_send_admin]" value="y" />
					                    </td>
					                    <td class="content">
					                    	<button type="button" onclick="onclickUpdate('43','findpw','admin');" class="btn btn-primary btn-xs">편집</button>
					                    </td>
					                    <td align="left">
											<ul>		    
												<li>{{shop_name}} : 사이트명</li> <li>{{user_id}} : 회원 아이디</li> <li>{{tmp_password}} : 임시비밀번호</li>			    
											</ul>
										</td>
					                </tr>      
					                <tr>
					                    <input type="hidden" name="msg[order][code]" value="11" />
										<td class="content">주문접수<br>[무통장/카드 결제시]</td>
					                    <td class="content">
					                    	<input type="checkbox" name="msg[order][is_send]" value="y" checked/>
					                    </td>
					                    <td class="content">
					                    	<button type="button" onclick="onclickUpdate('11','order');" class="btn btn-primary btn-xs">편집</button>
					                    </td>
					                    <td class="content">
					                    	<input type="checkbox" name="msg[order][is_send_admin]" value="y" />
					                    </td>
					                    <td class="content">
					                    	<button type="button" onclick="onclickUpdate('11','order','admin');" class="btn btn-primary btn-xs">편집</button>
					                    </td>
					                    <td align="left">
											<ul>		    
												<li>{{shop_name}} : 사이트명</li> <li>{{payment_status}} : 결제 상태</li> <li>{{order_number}} : 주문번호</li>		    
												<li>{{order_date}} : 주문 일자</li> <li>{{order_first_name}} : 주문자 성</li> <li>{{order_name}} : 주문자명</li>		    
												<li>{{order_email}} : 주문자 이메일</li> <li>{{order_mobile}} : 주문자 휴대폰 번호</li> <li>{{order_list}} : 주문 내역</li>		    
												<li>{{receiver_first_name}} : 수신자 성</li> <li>{{receiver_name}} : 수신자 이름</li> <li>{{receiver_email}} : 수신자 이메일</li>		    
												<li>{{receiver_mobile}} : 수신자 휴대폰 번호</li> <li>{{receiver_addr}} : 수신자 주소</li> <li>{{request_message}} : 요청 메세지</li>		    
												<li>{{payment_info}} : 결제 정보</li>			    
											</ul>
										</td>
					                </tr>      
					                <tr>
					                    <input type="hidden" name="msg[pay_done][code]" value="12" />
										<td class="content">입금확인<br>[무통장 입금 완료시]</td>
					                    <td class="content">
					                    	<input type="checkbox" name="msg[pay_done][is_send]" value="y" checked/>
					                    </td>
					                    <td class="content">
					                    	<button type="button" onclick="onclickUpdate('12','pay_done');" class="btn btn-primary btn-xs">편집</button>
					                    </td>
					                    <td class="content">
					                    	<input type="checkbox" name="msg[pay_done][is_send_admin]" value="y" />
					                    </td>
					                    <td class="content">
					                    	<button type="button" onclick="onclickUpdate('12','pay_done','admin');" class="btn btn-primary btn-xs">편집</button>
					                    </td>
					                    <td align="left">
											<ul>
												<li>{{shop_name}} : 사이트명</li> <li>{{payment_status}} : 결제 상태</li> <li>{{order_number}} : 주문번호</li>		    
												<li>{{order_date}} : 주문 일자</li> <li>{{order_first_name}} : 주문자 성</li> <li>{{order_name}} : 주문자명</li>
												<li>{{order_email}} : 주문자 이메일</li> <li>{{order_mobile}} : 주문자 휴대폰 번호</li> <li>{{order_list}} : 주문 내역</li>		    
												<li>{{receiver_first_name}} : 수신자 성</li> <li>{{receiver_name}} : 수신자 이름</li> <li>{{receiver_email}} : 수신자 이메일</li>		    
												<li>{{receiver_mobile}} : 수신자 휴대폰 번호</li> <li>{{receiver_addr}} : 수신자 주소</li> <li>{{request_message}} : 요청 메세지</li>		    
												<li>{{payment_info}} : 결제 정보</li>			    
											</ul>
										</td>
					                </tr>      
					                <tr>
					                    <input type="hidden" name="msg[delivery_ready][code]" value="49" />
										<td class="content">상품 배송 준비중<br>[주문상태 배송준비중으로 변경시]</td>
					                    <td class="content">
					                    	<input type="checkbox" name="msg[delivery_ready][is_send]" value="y" checked/>
					                    </td>
					                    <td class="content">
					                    	<button type="button" onclick="onclickUpdate('49','delivery_ready');" class="btn btn-primary btn-xs">편집</button>
					                    </td>
					                    <td class="content"><input type="checkbox" name="msg[delivery_ready][is_send_admin]" value="y" /></td>
					                    <td class="content">
					                    	<button type="button" onclick="onclickUpdate('49','delivery_ready','admin');" class="btn btn-primary btn-xs">편집</button>
					                    </td>
					                    <td align="left">
											<ul>		    
												<li>{{shop_name}} : 사이트명</li> <li>{{payment_status}} : 결제 상태</li> <li>{{order_number}} : 주문번호</li>		    
												<li>{{order_date}} : 주문 일자</li> <li>{{order_first_name}} : 주문자 성</li> <li>{{order_name}} : 주문자명</li>		    
												<li>{{order_email}} : 주문자 이메일</li> <li>{{order_mobile}} : 주문자 휴대폰 번호</li> <li>{{order_list}} : 주문 내역</li>		    
												<li>{{receiver_first_name}} : 수신자 성</li> <li>{{receiver_name}} : 수신자 이름</li> <li>{{receiver_email}} : 수신자 이메일</li>		    
												<li>{{receiver_mobile}} : 수신자 휴대폰 번호</li> <li>{{receiver_addr}} : 수신자 주소</li> <li>{{request_message}} : 요청 메세지</li>		    
												<li>{{payment_info}} : 결제 정보</li>			    
											</ul>
										</td>
					                </tr>      
					                <tr>
					                    <input type="hidden" name="msg[delivery_ing][code]" value="13" />
										<td class="content">상품 배송중<br>[주문상태 배송중으로 변경시]</td>
					                    <td class="content">
					                    	<input type="checkbox" name="msg[delivery_ing][is_send]" value="y" checked/>
					                    </td>
					                    <td class="content">
					                    	<button type="button" onclick="onclickUpdate('13','delivery_ing');" class="btn btn-primary btn-xs">편집</button>
					                    </td>
					                    <td class="content"><input type="checkbox" name="msg[delivery_ing][is_send_admin]" value="y" /></td>
					                    <td class="content">
					                    	<button type="button" onclick="onclickUpdate('13','delivery_ing','admin');" class="btn btn-primary btn-xs">편집</button>
					                    </td>
					                    <td align="left">
											<ul>		    
												<li>{{shop_name}} : 사이트명</li> <li>{{payment_status}} : 결제 상태</li> <li>{{order_number}} : 주문번호</li>
												<li>{{order_date}} : 주문 일자</li> <li>{{order_first_name}} : 주문자 성</li> <li>{{order_name}} : 주문자명</li>
												<li>{{order_email}} : 주문자 이메일</li>	<li>{{order_mobile}} : 주문자 휴대폰 번호</li> <li>{{order_list}} : 주문 내역</li>		    
												<li>{{receiver_first_name}} : 수신자 성</li> <li>{{receiver_name}} : 수신자 이름</li> <li>{{receiver_email}} : 수신자 이메일</li>
												<li>{{receiver_mobile}} : 수신자 휴대폰 번호</li> <li>{{receiver_addr}} : 수신자 주소</li> <li>{{request_message}} : 요청 메세지</li>
												<li>{{payment_info}} : 결제 정보</li>			    
											</ul>
										</td>
					                </tr>      
					                <tr>
					                    <input type="hidden" name="msg[delivery_done][code]" value="50" />
										<td class="content">상품 배송 완료<br>[주문상태 배송완료로 변경시]</td>
					                    <td class="content">
					                    	<input type="checkbox" name="msg[delivery_done][is_send]" value="y" checked/>
					                    </td>
					                    <td class="content">
					                    	<button type="button" onclick="onclickUpdate('50','delivery_done');" class="btn btn-primary btn-xs">편집</button>
					                    </td>
					                    <td class="content">
					                    	<input type="checkbox" name="msg[delivery_done][is_send_admin]" value="y" />
					                    </td>
					                    <td class="content">
					                    	<button type="button" onclick="onclickUpdate('50','delivery_done','admin');" class="btn btn-primary btn-xs">편집</button>
					                    </td>
					                    <td align="left">
											<ul>		    
												<li>{{shop_name}} : 사이트명</li> <li>{{payment_status}} : 결제 상태</li> <li>{{order_number}} : 주문번호</li>		    
												<li>{{order_date}} : 주문 일자</li>	 <li>{{order_first_name}} : 주문자 성</li> <li>{{order_name}} : 주문자명</li>		    
												<li>{{order_email}} : 주문자 이메일</li> <li>{{order_mobile}} : 주문자 휴대폰 번호</li> <li>{{order_list}} : 주문 내역</li>		    
												<li>{{receiver_first_name}} : 수신자 성</li> <li>{{receiver_name}} : 수신자 이름</li> <li>{{receiver_email}} : 수신자 이메일</li>		    
												<li>{{receiver_mobile}} : 수신자 휴대폰 번호</li> <li>{{receiver_addr}} : 수신자 주소</li> <li>{{request_message}} : 요청 메세지</li>		    
												<li>{{payment_info}} : 결제 정보</li>			    
											</ul>
										</td>
					                </tr>      
					                <tr>
					                    <input type="hidden" name="msg[order_cancel][code]" value="14" />
										<td class="content">주문취소<br>[주문 취소시]</td>
					                    <td class="content">
					                    	<input type="checkbox" name="msg[order_cancel][is_send]" value="y" checked/>
					                    </td>
					                    <td class="content">
					                    	<button type="button" onclick="onclickUpdate('14','order_cancel');" class="btn btn-primary btn-xs">편집</button>
					                    </td>
					                    <td class="content">
					                    	<input type="checkbox" name="msg[order_cancel][is_send_admin]" value="y" />
					                    </td>
					                    <td class="content">
					                    	<button type="button" onclick="onclickUpdate('14','order_cancel','admin');" class="btn btn-primary btn-xs">편집</button>
					                    </td>
					                    <td align="left">
											<ul>		    
												<li>{{shop_name}} : 사이트명</li> <li>{{payment_status}} : 결제 상태</li> <li>{{order_number}} : 주문번호</li>		    
												<li>{{order_date}} : 주문 일자</li> <li>{{order_first_name}} : 주문자 성</li> <li>{{order_name}} : 주문자명</li>		    
												<li>{{order_email}} : 주문자 이메일</li> <li>{{order_mobile}} : 주문자 휴대폰 번호</li> <li>{{order_list}} : 주문 내역</li>		    
												<li>{{receiver_first_name}} : 수신자 성</li> <li>{{receiver_name}} : 수신자 이름</li> <li>{{receiver_email}} : 수신자 이메일</li>		    
												<li>{{receiver_mobile}} : 수신자 휴대폰 번호</li> <li>{{receiver_addr}} : 수신자 주소</li> <li>{{request_message}} : 요청 메세지</li>		    
												<li>{{payment_info}} : 결제 정보</li>			    
											</ul>
										</td>
					                </tr>      
					                <tr>
					                    <input type="hidden" name="msg[refund][code]" value="15" />
										<td class="content">환불완료<br>[주문상태 환불완료로 변경시]</td>
					                    <td class="content">
					                    	<input type="checkbox" name="msg[refund][is_send]" value="y" checked/>
					                    </td>
					                    <td class="content">
					                    	<button type="button" onclick="onclickUpdate('15','refund');" class="btn btn-primary btn-xs">편집</button>
					                    </td>
					                    <td class="content">
					                    	<input type="checkbox" name="msg[refund][is_send_admin]" value="y" />
					                    </td>
					                    <td class="content">
					                    	<button type="button" onclick="onclickUpdate('15','refund','admin');" class="btn btn-primary btn-xs">편집</button>
					                    </td>
					                    <td align="left">
											<ul>		    
												<li>{{shop_name}} : 사이트명</li> <li>{{payment_status}} : 결제 상태</li> <li>{{order_number}} : 주문번호</li>		    
												<li>{{order_date}} : 주문 일자</li> <li>{{order_first_name}} : 주문자 성</li> <li>{{order_name}} : 주문자명</li>		    
												<li>{{order_email}} : 주문자 이메일</li> <li>{{order_mobile}} : 주문자 휴대폰 번호</li> <li>{{order_list}} : 주문 내역</li>		    
												<li>{{receiver_first_name}} : 수신자 성</li> <li>{{receiver_name}} : 수신자 이름</li> <li>{{receiver_email}} : 수신자 이메일</li>		    
												<li>{{receiver_mobile}} : 수신자 휴대폰 번호</li> <li>{{receiver_addr}} : 수신자 주소</li> <li>{{request_message}} : 요청 메세지</li>		    
												<li>{{payment_info}} : 결제 정보</li>			    
											</ul>
										</td>
					                </tr>      
					                <tr>
					                    <input type="hidden" name="msg[point][code]" value="16" />
										<td class="content">적립금 적립<br>[개별 적립금 적립시]</td>
					                    <td class="content">
					                    	<input type="checkbox" name="msg[point][is_send]" value="y" checked/>
					                    </td>
					                    <td class="content">
					                    	<button type="button" onclick="onclickUpdate('16','point');" class="btn btn-primary btn-xs">편집</button>
					                    </td>
					                    <td class="content">
					                    	<input type="checkbox" name="msg[point][is_send_admin]" value="y" />
					                    </td>
					                    <td class="content">
					                    	<button type="button" onclick="onclickUpdate('16','point','admin');" class="btn btn-primary btn-xs">편집</button>
					                    </td>
					                    <td align="left">
											<ul>		    
												<li>{{shop_name}} : 사이트명</li> <li>{{point}} : 포인트</li> <li>{{point_type}} : 포인트 구분</li>			    
											</ul>
										</td>
					                </tr>      
					                <tr>
					                    <input type="hidden" name="msg[coupon][code]" value="18" />
										<td class="content">쿠폰 지급<br>[개별 쿠폰 지급시]</td>
					                    <td class="content">
					                    	<input type="checkbox" name="msg[coupon][is_send]" value="y" checked/>
					                    </td>
					                    <td class="content">
					                    	<button type="button" onclick="onclickUpdate('18','coupon');" class="btn btn-primary btn-xs">편집</button>
					                    </td>
					                    <td class="content">
					                    	<input type="checkbox" name="msg[coupon][is_send_admin]" value="y" />
					                    </td>
					                    <td class="content">
					                    	<button type="button" onclick="onclickUpdate('18','coupon','admin');" class="btn btn-primary btn-xs">편집</button>
					                    </td>
					                    <td align="left">
											<ul>		    
												<li>{{shop_name}} : 사이트명</li> <li>{{coupon_name}} : 쿠폰명</li> <li>{{date}} : 유효기간</li>			    
											</ul>
										</td>
					                </tr>				
								</tbody>
							</table>
				            <br>
						</form>
		
		            	<div style="text-align:center;"><button type="button" onclick="register()" class="btn btn-primary">확인</button></div>
	
	                </div><!-- /.box-body -->
	            </div><!-- /.box -->
	        </div><!-- /.col-xs-12 -->
	    </div><!-- /.row -->
	</section>
	
	<div class="modal fade" id="modalContent" tabindex="-2" role="dialog" aria-labelledby="myModal" aria-hidden="true">
	    <div class="modal-dialog" style="width:1000px;">
	        <div class="modal-content">
	            <form name="formContent" method="post" action="?tpf=admin/community/email_process" enctype="multipart/form-data">
		            <input type="hidden" name="mode" id="mode" value="update">
		            <input type="hidden" name="code" id="code">
		            <input type="hidden" name="action" id="action">
		            <input type="hidden" name="is_admin" id="is_admin">
		            <input type="hidden" name="locale" id="locale" value="ko">
		            <div class="modal-header">
		                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
		                <h4 class="modal-title" id="myModalLabelPortfolio">메일 문구설정 관리</h4>
		            </div>
		            <div class="modal-body">
		
		            	<h4><p class="text-light-blue"><i class="fa fa-fw fa-info-circle"></i> 메일 문구설정</h4>
			            <table class="table table-bordered">
				            <tr>
				                <td class="menu">제목</td>
				                <td align="left">
				                <span style="float:left;width:80%;"><input type="text" name="title" id="title" class="form-control input-sm"></span>
				                </td>
				            </tr>
				            <tr>
				                <td class="menu">내용</td>
				                <td align="left"><textarea name="content" id="content" rows="10" cols="80"></textarea></td>
				            </tr>
			            </table>
		            </div>
		            <div class="modal-footer">
			            <button type="button" onclick="registerContent()" class="btn btn-primary">확인</button>&nbsp;&nbsp;&nbsp;
			            <button type="button" onclick="getDefaultTemplate();" class="btn btn-warning">기본문구 가져오기</button>
		            </div>
	            </form>
	        </div><!-- / .modal-content -->
	    </div><!-- / .modal-dialog -->
	</div><!-- / .modal -->
</div><!-- /.content-wrapper -->

<script src="//mir9.co.kr/resource/js/ckeditor4.7.2/ckeditor.js"></script>

<script type="text/javascript">

	var objEditor = CKEDITOR.replace('content', {
		height: 300,
	    extraPlugins : 'tableresize',
	    filebrowserUploadUrl: '/ckfinder/core/connector/php/connector.php?command=QuickUpload&type=Files', 
	    filebrowserImageUploadUrl: '/daemon/ckeditor_upload.php?command=QuickUpload&type=Images',
	    fillEmptyBlocks : true,
	    line_height : '0px'
	});
	
	CKEDITOR.on('dialogDefinition', function (ev) {
	    var dialogName = ev.data.name;
	    var dialog = ev.data.definition.dialog;
	    var dialogDefinition = ev.data.definition;
	
	    if (dialogName == 'image') {
	        dialog.on('show', function (obj) {
	            this.selectPage('Upload'); // 업로드탭으로 시작
	        });
	        dialogDefinition.removeContents('advanced'); // 자세히탭 제거
	        dialogDefinition.removeContents('Link'); // 링크탭 제거
	    }
	});
	
	CKEDITOR.config.allowedContent = true;
	
	function register() {
		var is_send_arr = $("input[name*='is_send']"); // 회원 자동 발송
		var is_send_admin_arr = $("input[name*='is_send_admin']"); // 관리자 자동 발송
		form_register.target = 'iframe_process';
	    form_register.submit();
	}
	
	function registerContent() { // 변경 문구 저장 버튼
	    if(formContent.title.value == '') {  
	    	alert('제목이 입력되지 않았습니다.'); formContent.title.focus(); return false;}
	    	formContent.target = 'iframe_process';
	    	formContent.submit();
	}
	
	function onclickUpdate(code, action, is_admin) { // 편집 버튼
	    $('#code').val(code);
	    $('#action').val(action);
	    $('#is_admin').val(is_admin);
	    $('#modalContent').modal({backdrop:'static', show:true});
	    $.ajax({
			url:'http://demoshop.mir9.kr/api/process.php',
			type:'post',
			dataType:'json',
			data:{
				method: 'UtilNotice.infoEmail',
				code: code,
				action: action,
				is_admin: is_admin,
	            locale: $('#locale').val()
			},
			success:function(data, textStatus, jqXHR){
	            var json_data = data.data;
	            
	            // 확인용 
	            console.log("===== 수정 data =====");
	            console.log(json_data); 
	            console.log("===================");
	            /* 
	            	회원가입 (회원) 편집시 json_data
	            	action: "join"
            		code: "10" => action에 따른 코드값...???
            		content: "<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\">\r\n\t<tbody>\r\n\t\t<tr>\r\n\t\t\t<td align=\"center\" valign=\"top\">\r\n\t\t\t<table bgcolor=\"#0073bb\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"750\">\r\n\t\t\t\t<tbody>\r\n\t\t\t\t\t<tr>\r\n\t\t\t\t\t\t<td align=\"center\" height=\"25\">&nbsp;</td>\r\n\t\t\t\t\t</tr>\r\n\t\t\t\t\t<tr>\r\n\t\t\t\t\t\t<td align=\"left\" style=\" font-family:Malgun Gothic, \\'맑은 고딕\\', tahoma, gulim, \\'굴림\\', \\'돋움\\',seoul,Arial; color:#fff;font-size: 22px; line-height:28px;padding-left:23px; letter-spacing:-2px;\">[{{shop_name}}] 회원 가입 안내</td>\r\n\t\t\t\t\t</tr>\r\n\t\t\t\t\t<tr>\r\n\t\t\t\t\t\t<td height=\"20\">&nbsp;</td>\r\n\t\t\t\t\t</tr>\r\n\t\t\t\t\t<tr>\r\n\t\t\t\t\t\t<td align=\"center\">\r\n\t\t\t\t\t\t<table bgcolor=\"#FFFFFF\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"730\">\r\n\t\t\t\t\t\t\t<tbody>\r\n\t\t\t\t\t\t\t\t<tr>\r\n\t\t\t\t\t\t\t\t\t<td align=\"center\">&nbsp;</td>\r\n\t\t\t\t\t\t\t\t</tr>\r\n\t\t\t\t\t\t\t\t<tr>\r\n\t\t\t\t\t\t\t\t\t<td align=\"center\">\r\n\t\t\t\t\t\t\t\t\t<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"700\">\r\n\t\t\t\t\t\t\t\t\t\t<tbody>\r\n\t\t\t\t\t\t\t\t\t\t\t<tr>\r\n\t\t\t\t\t\t\t\t\t\t\t\t<td align=\"left\">\r\n\t\t\t\t\t\t\t\t\t\t\t\t<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\">\r\n\t\t\t\t\t\t\t\t\t\t\t\t\t<tbody>\r\n\t\t\t\t\t\t\t\t\t\t\t\t\t\t<tr>\r\n\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t<td align=\"center\" height=\"20\" width=\"20\"><img align=\"absmiddle\" src=\"http://mir9.co.kr/resource/img/icon1_1.gif\" /></td>\r\n\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t<td align=\"left\" style=\" font-family:tahoma, 굴림,돋움,seoul,Arial; color:#333333; font-size: 12px; line-height:18px;\">회원 가입을 축하드립니다.</td>\r\n\t\t\t\t\t\t\t\t\t\t\t\t\t\t</tr>\r\n\t\t\t\t\t\t\t\t\t\t\t\t\t\t<tr>\r\n\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t<td align=\"center\" height=\"20\" width=\"20\"><img align=\"absmiddle\" src=\"http://mir9.co.kr/resource/img/icon1_1.gif\" /></td>\r\n\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t<td align=\"left\" style=\" font-family:tahoma, 굴림,돋움,seoul,Arial; color:#333333; font-size: 12px; line-height:18px;\">보안을 위해 비밀번호는 정기적으로 변경해 주시기 바랍니다.</td>\r\n\t\t\t\t\t\t\t\t\t\t\t\t\t\t</tr>\r\n\t\t\t\t\t\t\t\t\t\t\t\t\t</tbody>\r\n\t\t\t\t\t\t\t\t\t\t\t\t</table>\r\n\t\t\t\t\t\t\t\t\t\t\t\t&nbsp;\r\n\r\n\t\t\t\t\t\t\t\t\t\t\t\t<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"border:solid 3px #e8e8e8;\" width=\"700\">\r\n\t\t\t\t\t\t\t\t\t\t\t\t\t<tbody>\r\n\t\t\t\t\t\t\t\t\t\t\t\t\t\t<tr>\r\n\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t<td align=\"center\" style=\"padding-top:7px;padding-bottom:7px;\">\r\n\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"680\">\r\n\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t<tbody>\r\n\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t<tr>\r\n\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t<td bgcolor=\"#D1E6F4\" height=\"28\" width=\"5\">&nbsp;</td>\r\n\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t<td align=\"left\" bgcolor=\"#D1E6F4\" style=\"font-family: tahoma, 굴림,돋움,seoul,Arial; font-size: 12px; line-height: 18px; color: #005D83; font-weight:bold; padding-left:15px\" width=\"670\">회원 정보</td>\r\n\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t<td bgcolor=\"#D1E6F4\" height=\"28\" width=\"5\">&nbsp;</td>\r\n\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t</tr>\r\n\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t<tr>\r\n\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t<td align=\"left\">&nbsp;</td>\r\n\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t<td>\r\n\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"670\">\r\n\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t<tbody>\r\n\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t<tr height=\"40\">\r\n\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t<td align=\"center\" style=\"border-bottom:solid 1px #e8e8e8;\" width=\"30\"><img align=\"absmiddle\" src=\"http://mir9.co.kr/resource/img/icon2_1.gif\" /></td>\r\n\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t<td align=\"left\" style=\"font-family: tahoma, 굴림,돋움,seoul,Arial; font-size: 12px; color: #005D83; border-bottom:solid 1px #e8e8e8;\" width=\"100\">회원명</td>\r\n\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t<td align=\"left\" style=\"font-family:Malgun Gothic, \\'맑은 고딕\\', tahoma, gulim, \\'굴림\\', \\'돋움\\',seoul,Arial; color:#005D83; font-size: 16px; border-bottom:solid 1px #e8e8e8;\">{{user_name}}</td>\r\n\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t</tr>\r\n\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t<tr height=\"40\">\r\n\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t<td align=\"center\" width=\"30\"><img align=\"absmiddle\" src=\"http://mir9.co.kr/resource/img/icon2_1.gif\" /></td>\r\n\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t<td align=\"left\" style=\"font-family: tahoma, 굴림,돋움,seoul,Arial; font-size: 12px; color: #005D83;\" width=\"100\">아이디</td>\r\n\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t<td align=\"left\" style=\" font-family:Malgun Gothic, \\'맑은 고딕\\', tahoma, 굴림,돋움,seoul,Arial; color:#005D83; font-size: 16px; line-height:18px;\">{{user_id}}</td>\r\n\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t</tr>\r\n\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t</tbody>\r\n\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t</table>\r\n\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t</td>\r\n\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t<td align=\"left\">&nbsp;</td>\r\n\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t</tr>\r\n\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t</tbody>\r\n\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t</table>\r\n\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t</td>\r\n\t\t\t\t\t\t\t\t\t\t\t\t\t\t</tr>\r\n\t\t\t\t\t\t\t\t\t\t\t\t\t</tbody>\r\n\t\t\t\t\t\t\t\t\t\t\t\t</table>\r\n\t\t\t\t\t\t\t\t\t\t\t\t</td>\r\n\t\t\t\t\t\t\t\t\t\t\t</tr>\r\n\t\t\t\t\t\t\t\t\t\t\t<tr>\r\n\t\t\t\t\t\t\t\t\t\t\t\t<td height=\"10\">&nbsp;</td>\r\n\t\t\t\t\t\t\t\t\t\t\t</tr>\r\n\t\t\t\t\t\t\t\t\t\t\t<tr>\r\n\t\t\t\t\t\t\t\t\t\t\t\t<td height=\"15\">&nbsp;</td>\r\n\t\t\t\t\t\t\t\t\t\t\t</tr>\r\n\t\t\t\t\t\t\t\t\t\t</tbody>\r\n\t\t\t\t\t\t\t\t\t</table>\r\n\t\t\t\t\t\t\t\t\t</td>\r\n\t\t\t\t\t\t\t\t</tr>\r\n\t\t\t\t\t\t\t\t<tr>\r\n\t\t\t\t\t\t\t\t\t<td align=\"center\" bgcolor=\"#E6EFF6\" height=\"30\" style=\" font-family:tahoma, 굴림,돋움,seoul,Arial; color:#333333; font-size: 12px; line-height:18px;\"><font color=\"#005494\">본 메일은 발신전용이므로 회신이 되지 않습니다.</font></td>\r\n\t\t\t\t\t\t\t\t</tr>\r\n\t\t\t\t\t\t\t</tbody>\r\n\t\t\t\t\t\t</table>\r\n\t\t\t\t\t\t</td>\r\n\t\t\t\t\t</tr>\r\n\t\t\t\t\t<tr>\r\n\t\t\t\t\t\t<td align=\"center\" height=\"20\">&nbsp;</td>\r\n\t\t\t\t\t</tr>\r\n\t\t\t\t</tbody>\r\n\t\t\t</table>\r\n\t\t\t</td>\r\n\t\t</tr>\r\n\t</tbody>\r\n</table>\r\n"
            		content_admin: "<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\">\r\n\t<tbody>\r\n\t\t<tr>\r\n\t\t\t<td align=\"center\" valign=\"top\">\r\n\t\t\t<table bgcolor=\"#0073bb\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"750\">\r\n\t\t\t\t<tbody>\r\n\t\t\t\t\t<tr>\r\n\t\t\t\t\t\t<td align=\"center\" height=\"25\">&nbsp;</td>\r\n\t\t\t\t\t</tr>\r\n\t\t\t\t\t<tr>\r\n\t\t\t\t\t\t<td align=\"left\" style=\" font-family:Malgun Gothic, \\'맑은 고딕\\', tahoma, gulim, \\'굴림\\', \\'돋움\\',seoul,Arial; color:#fff;font-size: 22px; line-height:28px;padding-left:23px; letter-spacing:-2px;\">[{{shop_name}}] 회원 가입 안내</td>\r\n\t\t\t\t\t</tr>\r\n\t\t\t\t\t<tr>\r\n\t\t\t\t\t\t<td height=\"20\">&nbsp;</td>\r\n\t\t\t\t\t</tr>\r\n\t\t\t\t\t<tr>\r\n\t\t\t\t\t\t<td align=\"center\">\r\n\t\t\t\t\t\t<table bgcolor=\"#FFFFFF\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"730\">\r\n\t\t\t\t\t\t\t<tbody>\r\n\t\t\t\t\t\t\t\t<tr>\r\n\t\t\t\t\t\t\t\t\t<td align=\"center\">&nbsp;</td>\r\n\t\t\t\t\t\t\t\t</tr>\r\n\t\t\t\t\t\t\t\t<tr>\r\n\t\t\t\t\t\t\t\t\t<td align=\"center\">\r\n\t\t\t\t\t\t\t\t\t<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"700\">\r\n\t\t\t\t\t\t\t\t\t\t<tbody>\r\n\t\t\t\t\t\t\t\t\t\t\t<tr>\r\n\t\t\t\t\t\t\t\t\t\t\t\t<td align=\"left\">\r\n\t\t\t\t\t\t\t\t\t\t\t\t<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\">\r\n\t\t\t\t\t\t\t\t\t\t\t\t\t<tbody>\r\n\t\t\t\t\t\t\t\t\t\t\t\t\t\t<tr>\r\n\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t<td align=\"center\" height=\"20\" width=\"20\"><img align=\"absmiddle\" src=\"http://mir9.co.kr/resource/img/icon1_1.gif\" /></td>\r\n\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t<td align=\"left\" style=\" font-family:tahoma, 굴림,돋움,seoul,Arial; color:#333333; font-size: 12px; line-height:18px;\">회원 가입을 축하드립니다.</td>\r\n\t\t\t\t\t\t\t\t\t\t\t\t\t\t</tr>\r\n\t\t\t\t\t\t\t\t\t\t\t\t\t\t<tr>\r\n\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t<td align=\"center\" height=\"20\" width=\"20\"><img align=\"absmiddle\" src=\"http://mir9.co.kr/resource/img/icon1_1.gif\" /></td>\r\n\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t<td align=\"left\" style=\" font-family:tahoma, 굴림,돋움,seoul,Arial; color:#333333; font-size: 12px; line-height:18px;\">보안을 위해 비밀번호는 정기적으로 변경해 주시기 바랍니다.</td>\r\n\t\t\t\t\t\t\t\t\t\t\t\t\t\t</tr>\r\n\t\t\t\t\t\t\t\t\t\t\t\t\t</tbody>\r\n\t\t\t\t\t\t\t\t\t\t\t\t</table>\r\n\t\t\t\t\t\t\t\t\t\t\t\t&nbsp;\r\n\r\n\t\t\t\t\t\t\t\t\t\t\t\t<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"border:solid 3px #e8e8e8;\" width=\"700\">\r\n\t\t\t\t\t\t\t\t\t\t\t\t\t<tbody>\r\n\t\t\t\t\t\t\t\t\t\t\t\t\t\t<tr>\r\n\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t<td align=\"center\" style=\"padding-top:7px;padding-bottom:7px;\">\r\n\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"680\">\r\n\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t<tbody>\r\n\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t<tr>\r\n\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t<td bgcolor=\"#D1E6F4\" height=\"28\" width=\"5\">&nbsp;</td>\r\n\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t<td align=\"left\" bgcolor=\"#D1E6F4\" style=\"font-family: tahoma, 굴림,돋움,seoul,Arial; font-size: 12px; line-height: 18px; color: #005D83; font-weight:bold; padding-left:15px\" width=\"670\">회원 정보</td>\r\n\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t<td bgcolor=\"#D1E6F4\" height=\"28\" width=\"5\">&nbsp;</td>\r\n\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t</tr>\r\n\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t<tr>\r\n\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t<td align=\"left\">&nbsp;</td>\r\n\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t<td>\r\n\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"670\">\r\n\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t<tbody>\r\n\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t<tr height=\"40\">\r\n\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t<td align=\"center\" style=\"border-bottom:solid 1px #e8e8e8;\" width=\"30\"><img align=\"absmiddle\" src=\"http://mir9.co.kr/resource/img/icon2_1.gif\" /></td>\r\n\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t<td align=\"left\" style=\"font-family: tahoma, 굴림,돋움,seoul,Arial; font-size: 12px; color:#005D83; border-bottom:solid 1px #e8e8e8;\" width=\"100\">회원명</td>\r\n\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t<td align=\"left\" style=\"font-family:Malgun Gothic, \\'맑은 고딕\\', tahoma, gulim, \\'굴림\\', \\'돋움\\',seoul,Arial; color:#005D83; font-size: 16px; border-bottom:solid 1px #e8e8e8;\">{{user_name}}</td>\r\n\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t</tr>\r\n\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t<tr height=\"40\">\r\n\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t<td align=\"center\" width=\"30\"><img align=\"absmiddle\" src=\"http://mir9.co.kr/resource/img/icon2_1.gif\" /></td>\r\n\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t<td align=\"left\" style=\"font-family: tahoma, 굴림,돋움,seoul,Arial; font-size: 12px; color: #005D83;\" width=\"100\">아이디</td>\r\n\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t<td align=\"left\" style=\" font-family:Malgun Gothic, \\'맑은 고딕\\', tahoma, 굴림,돋움,seoul,Arial; color:#005D83; font-size: 16px; line-height:18px;\">{{user_id}}</td>\r\n\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t</tr>\r\n\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t</tbody>\r\n\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t</table>\r\n\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t</td>\r\n\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t<td align=\"left\">&nbsp;</td>\r\n\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t</tr>\r\n\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t</tbody>\r\n\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t</table>\r\n\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t</td>\r\n\t\t\t\t\t\t\t\t\t\t\t\t\t\t</tr>\r\n\t\t\t\t\t\t\t\t\t\t\t\t\t</tbody>\r\n\t\t\t\t\t\t\t\t\t\t\t\t</table>\r\n\t\t\t\t\t\t\t\t\t\t\t\t</td>\r\n\t\t\t\t\t\t\t\t\t\t\t</tr>\r\n\t\t\t\t\t\t\t\t\t\t\t<tr>\r\n\t\t\t\t\t\t\t\t\t\t\t\t<td height=\"10\">&nbsp;</td>\r\n\t\t\t\t\t\t\t\t\t\t\t</tr>\r\n\t\t\t\t\t\t\t\t\t\t\t<tr>\r\n\t\t\t\t\t\t\t\t\t\t\t\t<td height=\"15\">&nbsp;</td>\r\n\t\t\t\t\t\t\t\t\t\t\t</tr>\r\n\t\t\t\t\t\t\t\t\t\t</tbody>\r\n\t\t\t\t\t\t\t\t\t</table>\r\n\t\t\t\t\t\t\t\t\t</td>\r\n\t\t\t\t\t\t\t\t</tr>\r\n\t\t\t\t\t\t\t\t<tr>\r\n\t\t\t\t\t\t\t\t\t<td align=\"center\" bgcolor=\"#E6EFF6\" height=\"30\" style=\" font-family:tahoma, 굴림,돋움,seoul,Arial; color:#333333; font-size: 12px; line-height:18px;\"><font color=\"#005494\">본 메일은 발신전용이므로 회신이 되지 않습니다.</font></td>\r\n\t\t\t\t\t\t\t\t</tr>\r\n\t\t\t\t\t\t\t</tbody>\r\n\t\t\t\t\t\t</table>\r\n\t\t\t\t\t\t</td>\r\n\t\t\t\t\t</tr>\r\n\t\t\t\t\t<tr>\r\n\t\t\t\t\t\t<td align=\"center\" height=\"20\">&nbsp;</td>\r\n\t\t\t\t\t</tr>\r\n\t\t\t\t</tbody>\r\n\t\t\t</table>\r\n\t\t\t</td>\r\n\t\t</tr>\r\n\t</tbody>\r\n</table>\r\n"
            		is_send: "y" => 회원 자동 발송 true
            		is_send_admin: "n" => 관리자 자동 발송 false
            		locale: "ko"  
            		reg_date: "2022-04-13 10:18:43"
            		title: "[{{shop_name}}] {{user_name}}님의 회원가입을 축하드립니다."
            		title_admin: "[{{shop_name}}] {{user_name}} 회원님이 회원가입 하셨습니다."
            		type: "email"
	            */
	            
	            if (is_admin == 'admin') { // 관리자용
	                $('#title').val(json_data.title_admin);
	                objEditor.setData(json_data.content_admin);
	            }
	            else { // 고객용
	                $('#title').val(json_data.title);
	                objEditor.setData(json_data.content);
	            }
			},
			error:function(jqXHR, textStatus, errorThrown){
				console.log(textStatus);
			}
		});
	}
	
	function setData(mode, type, action, code, locale){
	
	}
	
	function getDefaultTemplate(type, action, is_admin) { // 기존 양식 불러오기 
		$.ajax({
			url:'http://demoshop.mir9.kr/api/process.php', // 이메일 발송 api 
			type:'post',
			dataType:'json',
			data:{
				method:'UtilNotice.getCommunityTemplate',
				type: 'email',
				action: $('#action').val(),
	            is_admin: $('#is_admin').val(),
	            locale: $('#locale').val()
			},
			success:function(data, textStatus, jqXHR){
	            
				// 확인용
	            console.log("===== 기존 data =====");
				console.log(data);
				console.log("===================");
				
				if(data.data.length > 0){
					if(confirm('기본문구로 적용 하시겠습니까?')){
	                    objEditor.setData(data.data);
					}
				}
			},
			error:function(jqXHR, textStatus, errorThrown){
				console.log(textStatus);
			}
		});
	}
	
	function category_txt(t_name){
		var return_txt = '';
		
			if(t_name.indexOf('join')){
				return_txt = '회원가입';
			}
		else
			if(t_name.indexOf('findid')){
				return_txt = '아이디 찾기<br>[아이디 찾기시]';
			}
		else
			if(t_name.indexOf('findpw')){
				return_txt = '임시비밀번호 발급알림<br>[비밀번호 찾기시]';
			}
		else
			if(t_name.indexOf('order')){
				return_txt = '주문접수<br>[무통장/카드 결제시]';
			}
		else
			if(t_name.indexOf('pay_done')){
				return_txt = '입금확인<br>[무통장 입금 완료시]';
			}
		else
			if(t_name.indexOf('delivery_ready')){
				return_txt = '상품 배송 준비중<br>[주문상태 배송준비중으로 변경시]';
			}
		else
			if(t_name.indexOf('delivery_ing')){
				return_txt = '상품 배송중<br>[주문상태 배송중으로 변경시]';
			}
		else
			if(t_name.indexOf('delivery_done')){
				return_txt = '상품 배송 완료<br>[주문상태 배송완료로 변경시]';
			}
		else
			if(t_name.indexOf('order_cancel')){
				return_txt = '주문취소<br>[주문 취소시]';
			}
		else
			if(t_name.indexOf('refund')){
				return_txt = '환불완료<br>[주문상태 환불완료로 변경시]';
			}
		else
			if(t_name.indexOf('point')){
				return_txt = '적립금 적립<br>[개별 적립금 적립시]';
			}
		else
			if(t_name.indexOf('coupon')){
				return_txt = '쿠폰 지급<br>[개별 쿠폰 지급시]';
			}
		
		return return_txt;
	}

</script>

<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>