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
				      					<!-- action에 해당하는 이름값 class로 분리하기 -->
				      					<!-- 
				      						안에 내용이 해당 code 값에 대응함 
				      						code가 10일 경우 회원가입 이메일 메시지가 모달창에 조회됨 
				      						API에서 지정한 코드값인 것 같음
				      					-->
					                    <input type="hidden" class="join" name="code" value="10" />
										<td class="content">회원가입</td>
					                    <td class="content">
					                    	<input type="checkbox" class="join" name="is_send" checked/>
					                    </td>
					                    <td class="content">
					                    	<!-- onclickUpdate(code, action, is_admin) -->
					                    	<button type="button" onclick="onclickUpdate('10','join');" class="btn btn-primary btn-xs">편집</button>
					                    </td>
					                    <td class="content">
					                    	<input type="checkbox" class="join" name="is_send_admin" />
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
					                    <input type="hidden" class="findid" name="code" value="47" />
										<td class="content">아이디 찾기<br>[아이디 찾기시]</td>
					                    <td class="content">
					                    	<input type="checkbox" class="findid" name="is_send" checked/>
					                    </td>
					                    <td class="content">
					                    	<button type="button" onclick="onclickUpdate('47','findid');" class="btn btn-primary btn-xs">편집</button>
					                    </td>
					                    <td class="content">
					                    	<input type="checkbox" class="findid" name="is_send_admin" />
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
					                    <input type="hidden" class="findpw" name="code" value="43" />
										<td class="content">임시비밀번호 발급알림<br>[비밀번호 찾기시]</td>
					                    <td class="content">
					                    	<input type="checkbox" class="findpw" name="is_send" checked/>
					                    </td>
					                    <td class="content">
					                    	<button type="button" onclick="onclickUpdate('43','findpw');" class="btn btn-primary btn-xs">편집</button>
					                    </td>
					                    <td class="content">
					                    	<input type="checkbox" class="findpw" name="is_send_admin" />
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
					                    <input type="hidden" class="order" name="code" value="11" />
										<td class="content">주문접수<br>[무통장/카드 결제시]</td>
					                    <td class="content">
					                    	<input type="checkbox" class="order" name="is_send" checked/>
					                    </td>
					                    <td class="content">
					                    	<button type="button" onclick="onclickUpdate('11','order');" class="btn btn-primary btn-xs">편집</button>
					                    </td>
					                    <td class="content">
					                    	<input type="checkbox" class="order" name="is_send_admin" />
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
					                    <input type="hidden" class="pay_done" name="code" value="12" />
										<td class="content">입금확인<br>[무통장 입금 완료시]</td>
					                    <td class="content">
					                    	<input type="checkbox" class="pay_done" name="is_send" checked/>
					                    </td>
					                    <td class="content">
					                    	<button type="button" onclick="onclickUpdate('12','pay_done');" class="btn btn-primary btn-xs">편집</button>
					                    </td>
					                    <td class="content">
					                    	<input type="checkbox" class="pay_done" name="is_send_admin" />
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
					                    <input type="hidden" class="delivery_ready" name="code" value="49" />
										<td class="content">상품 배송 준비중<br>[주문상태 배송준비중으로 변경시]</td>
					                    <td class="content">
					                    	<input type="checkbox" class="delivery_ready" name="is_send" checked/>
					                    </td>
					                    <td class="content">
					                    	<button type="button" onclick="onclickUpdate('49','delivery_ready');" class="btn btn-primary btn-xs">편집</button>
					                    </td>
					                    <td class="content">
					                    	<input type="checkbox" class="delivery_ready" name="is_send_admin" />
					                    </td>
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
					                    <input type="hidden" class="delivery_ing" name="code" value="13" />
										<td class="content">상품 배송중<br>[주문상태 배송중으로 변경시]</td>
					                    <td class="content">
					                    	<input type="checkbox" class="delivery_ing" name="is_send" checked/>
					                    </td>
					                    <td class="content">
					                    	<button type="button" onclick="onclickUpdate('13','delivery_ing');" class="btn btn-primary btn-xs">편집</button>
					                    </td>
					                    <td class="content">
					                    	<input type="checkbox" class="delivery_ing" name="is_send_admin" />
					                    </td>
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
					                    <input type="hidden" class="delivery_done" name="code" value="50" />
										<td class="content">상품 배송 완료<br>[주문상태 배송완료로 변경시]</td>
					                    <td class="content">
					                    	<input type="checkbox" class="delivery_done" name="is_send" checked/>
					                    </td>
					                    <td class="content">
					                    	<button type="button" onclick="onclickUpdate('50','delivery_done');" class="btn btn-primary btn-xs">편집</button>
					                    </td>
					                    <td class="content">
					                    	<input type="checkbox" class="delivery_done" name="is_send_admin" />
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
					                    <input type="hidden" class="order_cancel" name="code" value="14" />
										<td class="content">주문취소<br>[주문 취소시]</td>
					                    <td class="content">
					                    	<input type="checkbox" class="order_cancel" name="is_send" checked/>
					                    </td>
					                    <td class="content">
					                    	<button type="button" onclick="onclickUpdate('14','order_cancel');" class="btn btn-primary btn-xs">편집</button>
					                    </td>
					                    <td class="content">
					                    	<input type="checkbox" class="order_cancel" name="is_send_admin" />
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
					                    <input type="hidden" class="refund" name="code" value="15" />
										<td class="content">환불완료<br>[주문상태 환불완료로 변경시]</td>
					                    <td class="content">
					                    	<input type="checkbox" class="refund" name="is_send" checked/>
					                    </td>
					                    <td class="content">
					                    	<button type="button" onclick="onclickUpdate('15','refund');" class="btn btn-primary btn-xs">편집</button>
					                    </td>
					                    <td class="content">
					                    	<input type="checkbox" class="refund" name="is_send_admin" />
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
					                    <input type="hidden" class="point" name="code" value="16" />
										<td class="content">적립금 적립<br>[개별 적립금 적립시]</td>
					                    <td class="content">
					                    	<input type="checkbox" class="point" name="is_send" checked/>
					                    </td>
					                    <td class="content">
					                    	<button type="button" onclick="onclickUpdate('16','point');" class="btn btn-primary btn-xs">편집</button>
					                    </td>
					                    <td class="content">
					                    	<input type="checkbox" class="point" name="is_send_admin" />
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
					                    <input type="hidden" class="coupon" name="code" value="18" />
										<td class="content">쿠폰 지급<br>[개별 쿠폰 지급시]</td>
					                    <td class="content">
					                    	<input type="checkbox" class="coupon" name="is_send" checked/>
					                    </td>
					                    <td class="content">
					                    	<button type="button" onclick="onclickUpdate('18','coupon');" class="btn btn-primary btn-xs">편집</button>
					                    </td>
					                    <td class="content">
					                    	<input type="checkbox" class="coupon" name="is_send_admin" />
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
			            <!-- getDefaultTemplate(type, action, is_admin) -->
			            <button type="button" onclick="getDefaultTemplate();" class="btn btn-warning">기본문구 가져오기</button>
		            </div>
	            </form>
	        </div><!-- / .modal-content -->
	    </div><!-- / .modal-dialog -->
	</div><!-- / .modal -->
</div><!-- /.content-wrapper -->

<script src="//mir9.co.kr/resource/js/ckeditor4.7.2/ckeditor.js"></script>

<script type="text/javascript">

	$(function(){
		// 시그니처, timestamp 조회
		var postSig = "<c:out value='${ postSig }' />";
		var timestamp = "<c:out value='${ timestamp }' />";
		console.log(postSig);
		console.log(timestamp);
	});

	var objEditor = CKEDITOR.replace('content', {
		height: 300,
	    extraPlugins : 'tableresize',
	    filebrowserUploadUrl: '/ckfinder/core/connector/php/connector.php?command=QuickUpload&type=Files', // 여기로 전송 됨 
	    filebrowserImageUploadUrl: '/daemon/ckeditor_upload.php?command=QuickUpload&type=Images', // 여기로 전송됨
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
			
	// 문구 편집 버튼
	function onclickUpdate(code, action, is_admin) {
		// 모달 히든에 각각의 값 전달
	    $('#code').val(code); 
	    $('#action').val(action); 
	    $('#is_admin').val(is_admin); 
	    $('#modalContent').modal({backdrop:'static', show:true});
	    
	    // 조회
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
	
	// 변경 문구 저장 버튼 
	function registerContent() { 
	    // 제목 입력 필수
		if(formContent.title.value == '') { 
	    	alert('제목이 입력되지 않았습니다.'); 
	    	formContent.title.focus(); 
	    	return false;
	    }
	
        /*
		form_register.target = 'iframe_process';
	    form_register.submit(); // action 값 수정 필요
	    */
	}	

	// 기존 양식 불러오기
	function getDefaultTemplate(type, action, is_admin) { 
		$.ajax({
			url:'http://demoshop.mir9.kr/api/process.php', 
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
	
	// 전체 변경 확인 버튼
	function register() { 
		// 체크박스 값 설정
		$("input:checkbox[name='is_send']").each(function() {
        	if($(this).is(":checked")) { // 회원 자동 발송이 체크
        		$(this).attr("value", "y");
        	}
        	else {
        		$(this).attr("value", "n");
        	}
        });
		
		$("input:checkbox[name='is_send_admin']").each(function() { 
        	if($(this).is(":checked")) { // 관리자 자동 발송이 체크
        		$(this).attr("value", "y");
        	}
        	else {
        		$(this).attr("value", "n");
        	}
        });
		
		// 폼 정보 불러오기 
		const formData = new FormData(document["form_register"]);
		var obj = {};
		for(const [k, v] of formData) {
			obj[k] = v; // key, value로 담기
		}
		
		// code, checkbox 선언
		obj.code = []; // 추후 변경
		obj.is_send = [];
		obj.is_send_admin = [];
		
		// obj에 각각의 값 담기
		$.each($("input[name='code']"), function(index, value) { 
			obj.code.push($(value).val());
		});
		$.each($("input[name='is_send']"), function(index, value) {
			obj.is_send.push($(value).val());
		});
		$.each($("input[name='is_send_admin']"), function(index, value) {
			obj.is_send_admin.push($(value).val());
		});
		
		console.log("=====obj=====");
		console.log(obj);		
		
        /*
		form_register.target = 'iframe_process';
	    form_register.submit(); 
	    */
	}	
	
	function setData(mode, type, action, code, locale){

	}
		
	function category_txt(t_name){
		var return_txt = "";
		
			if(t_name == "join"){
				return_txt = "회원가입";
			}
		else
			if(t_name == "findid"){
				return_txt = "아이디 찾기 [아이디 찾기시]";
			}
		else
			if(t_name == "findpw"){
				return_txt = "임시비밀번호 발급알림 [비밀번호 찾기시]";
			}
		else
			if(t_name == "order"){
				return_txt = "주문접수 [무통장/카드 결제시]";
			}
		else
			if(t_name == "pay_done"){
				return_txt = "입금확인 [무통장 입금 완료시]";
			}
		else
			if(t_name == "delivery_ready"){
				return_txt = "상품 배송 준비중 [주문상태 배송준비중으로 변경시]";
			}
		else
			if(t_name == "delivery_ing"){
				return_txt = "상품 배송중 [주문상태 배송중으로 변경시]";
			}
		else
			if(t_name == "delivery_done"){
				return_txt = "상품 배송 완료 [주문상태 배송완료로 변경시]";
			}
		else
			if(t_name == "order_cancel"){
				return_txt = "주문취소 [주문 취소시]";
			}
		else
			if(t_name == "refund"){
				return_txt = "환불완료 [주문상태 환불완료로 변경시]";
			}
		else
			if(t_name == "point"){
				return_txt = "적립금 적립 [개별 적립금 적립시]";
			}
		else
			if(t_name == "coupon"){
				return_txt = "쿠폰 지급 [개별 쿠폰 지급시]";
			}
		
		return return_txt;
	}

</script>

<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>