<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<jsp:include page="/WEB-INF/views/common/header.jsp">
<jsp:param value="SMS 설정" name="title"/>
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
	    SMS 설정
	    <small>sms setting</small>
	    </h1>
	
	    <ol class="breadcrumb">
	        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
	        <li>커뮤니티 관리</li>
	        <li class="active">sms 설정</li>
	    </ol>
	</section>
	
	<section class="content">
		<div class="row">
		    <div class="col-xs-12">
		        <div class="box">
		            <div class="box-body">
		                <h4><p class="text-light-blue"><i class="fa fa-fw fa-info-circle"></i> SMS 발송 정보 설정 </p></h4>
	
						<form name="form_register" method="post" action="/index.php?tpf=admin/community/sms_process">
			                <input type="hidden" name="mode" value="updateSMS">
			
			                <table class="table table-bordered">
				                <tbody>
					                <tr>
					                    <td class="menu">SMS 잔여 포인트</td>
					                    <td align="left">
					                    	<!-- 
					                    		관리자가 해당 포인트를 부여해주는 방식을 모르겠음;;; 
					                    	-->
					                    	<span style="float:left;">검색된 회원정보가 없습니다.mir9 포인트</span><br> 
					                    	<span style="line-height:1.0;">
					                    		<small class="text-red">※ 포인트가 부족하면 메시지를 발신 할 수 없습니다.<br>※ 발신번호 등록(관리자 > 설정 > 기본설정 > 발신자 번호)을 사전에 하여야 발송이 가능합니다. (발신번호를 미르나인 담당자에게 알려주기 바랍니다.)</small>
					                    	</span>
					                    </td>
					                </tr>
								</tbody>
			                </table>
			
							<h4><p class="text-light-blue"><i class="fa fa-fw fa-info-circle"></i> SMS 발송 문구 설정 </p></h4>
							<table class="table table-bordered table-hover">
								<thead>
				                    <tr>
				                        <td rowspan="3" class="menu" style="width:250px;">발송항목</td>
										<td colspan="6">발송대상 및 SMS 문구설정</td>
										<td rowspan="3" class="menu" style="width:350px;">치환문구 설명</td>
				                    </tr>
									<tr>
				                        <td colspan="3">회원</td>
										<td colspan="3">관리자</td>
				                    </tr>
				                    <tr>
				                        <td>문구</td>
										<td>자동발송</td>
										<td>기본문구</td>
				                        <td>문구</td>
										<td>자동발송</td>
										<td>기본문구</td>
				                    </tr>
				                </thead>
				                <tbody>
				      				<tr>
										<td class="content">회원가입</td>
					                    <td>
					                    	<!-- 
					                    		name 배열 값들 class와 name으로 분리함 
					                    		name이 code인 input 태그의 value 값은 뭐지?? 
					                    	-->
					                        <input type="hidden" class="join" name="code" value="1" /> 
					                        <textarea class="join" name="content" >[{{shop_name}}] {{user_name}} 회원님의 가입을 진심으로 축하드립니다.</textarea>
					                    </td>
					                    <td class="content">
					                    	<input type="checkbox" class="join" name="is_send" value="y" checked/>
					                    </td>
					                    <td class="content">
					                    	<!-- 
					                    		getDefaultTemplate(type, action, is_admin) 
					                    	-->
					                   		<button type="button" onclick="getDefaultTemplate('sms', 'join', '');" class="btn btn-primary btn-xs">가져오기</button>
					                    </td>
					                    <td>
					                    	<textarea class="join" name="content_admin">[{{shop_name}}] {{user_name}} 회원님이 회원가입하셨습니다.</textarea>
					                    </td>
					                    <td class="content">
					                    	<input type="checkbox" class="join" name="is_send_admin" value="y" />
					                    </td>
					                    <td class="content">
					                    	<button type="button" onclick="getDefaultTemplate('sms', 'join', 'admin');" class="btn btn-primary btn-xs">가져오기</button>
					                    </td>		
					                    <td align="left">
											<ul>
												<li>{{shop_name}} : 사이트명</li> <li>{{user_name}} : 회원명</li>			
											</ul>
										</td>      
									</tr>      
									<tr>
										<td class="content">아이디 찾기<br>[아이디 찾기시]</td>
					                    <td>
					                        <input type="hidden" class="findid" name="code" value="46" />
					                        <textarea class="findid" name="content">[{{shop_name}}] {{user_name}} 회원님의 아이디가 메일로 발송되었습니다.</textarea>
					                    </td>
					                    <td class="content">
					                    	<input type="checkbox" class="findid" name="is_send" value="y" checked/>
					                    </td>
					                    <td class="content">
					                    	<button type="button" onclick="getDefaultTemplate('sms', 'findid', '');" class="btn btn-primary btn-xs">가져오기</button>
					                    </td>
					                    <td>
					                    	<textarea class="findid" name="content_admin">[{{shop_name}}] {{user_name}} 회원님의 아이디가 메일로 발송되었습니다.</textarea>
					                    </td>
					                    <td class="content">
					                    	<input type="checkbox" class="findid" name="is_send_admin" value="y" />
					                    </td>
					                    <td class="content">
					                    	<button type="button" onclick="getDefaultTemplate('sms', 'findid', 'admin');" class="btn btn-primary btn-xs">가져오기</button>
					                    </td>		
					                    <td align="left">
											<ul>
												<li>{{shop_name}} : 사이트명</li> <li>{{user_name}} : 회원명</li>			
											</ul>
										</td>      
									</tr>      
									<tr>
										<td class="content">임시비밀번호 발급알림<br>[비밀번호 찾기시]</td>
					                    <td>
					                        <input type="hidden" class="findpw" name="code" value="45" />
					                        <textarea class="findpw" name="content">[{{shop_name}}] {{user_name}} 회원님의 메일로 임시 비밀번호가 발송 되었습니다.</textarea>
					                    </td>
					                    <td class="content">
					                    	<input type="checkbox" class="findpw" name="is_send" value="y" checked/>
					                    </td>
					                    <td class="content">
					                    	<button type="button" onclick="getDefaultTemplate('sms', 'findpw', '');" class="btn btn-primary btn-xs">가져오기</button>
					                    </td>
					                    <td>
					                    	<textarea class="findpw" name="content_admin">[{{shop_name}}] {{user_name}} 회원님의 메일로 임시 비밀번호가 발송 되었습니다.</textarea>
					                    </td>
					                    <td class="content">
					                    	<input type="checkbox" class="findpw" name="is_send_admin" value="y" />
					                    </td>
					                    <td class="content">
					                    	<button type="button" onclick="getDefaultTemplate('sms', 'findpw', 'admin');" class="btn btn-primary btn-xs">가져오기</button>
					                    </td>		
					                    <td align="left">
											<ul>
												<li>{{shop_name}} : 사이트명</li> <li>{{user_name}} : 회원명</li>			
											</ul>
										</td>      
									</tr>      
									<tr>
										<td class="content">주문접수<br>[무통장/카드 결제시]</td>
					                    <td>
					                        <input type="hidden" class="order" name="code" value="2" />
					                        <textarea class="order" name="content">[{{shop_name}}] {{order_name}}님의 주문({{order_number}})이 접수되었습니다. 감사합니다.</textarea>
					                    </td>
					                    <td class="content">
					                    	<input type="checkbox" class="order" name="is_send" value="y" checked/>
					                    </td>
					                    <td class="content">
					                    	<button type="button" onclick="getDefaultTemplate('sms', 'order', '');" class="btn btn-primary btn-xs">가져오기</button>
					                    </td>
					                    <td>
					                    	<textarea class="order" name="content_admin">[{{shop_name}}] {{order_name}}님의 주문({{order_number}})이 접수되었습니다.</textarea>
					                    </td>
					                    <td class="content">
					                    	<input type="checkbox" class="order" name="is_send_admin" value="y" />
					                    </td>
					                    <td class="content">
					                    	<button type="button" onclick="getDefaultTemplate('sms', 'order', 'admin');" class="btn btn-primary btn-xs">가져오기</button>
					                    </td>		
					                    <td align="left">
											<ul>
												<li>{{shop_name}} : 사이트명</li> <li>{{order_name}} : 주문자명</li> <li>{{order_number}} : 주문번호</li>			
											</ul>
										</td>      
									</tr>      
									<tr>
										<td class="content">입금확인<br>[무통장 입금 완료시]</td>
					                    <td>
					                        <input type="hidden" class="pay_done" name="code" value="3" />
					                        <textarea class="pay_done" name="content">[{{shop_name}}] {{order_name}}님의 주문({{order_number}})이 결제완료 되었습니다.</textarea>
					                    </td>
					                    <td class="content">
					                    	<input type="checkbox" class="pay_done" name="is_send" value="y" checked/>
					                    </td>
					                    <td class="content">
					                    	<button type="button" onclick="getDefaultTemplate('sms', 'pay_done', '');" class="btn btn-primary btn-xs">가져오기</button>
					                    </td>
					                    	<td><textarea class="pay_done" name="content_admin">[{{shop_name}}] {{order_name}}님의 주문({{order_number}})이 결제완료 되었습니다.</textarea>
					                    </td>
					                    <td class="content">
					                    	<input type="checkbox" class="pay_done" name="is_send_admin" value="y" />
					                    </td>
					                    <td class="content">
					                    	<button type="button" onclick="getDefaultTemplate('sms', 'pay_done', 'admin');" class="btn btn-primary btn-xs">가져오기</button>
					                    </td>		
					                    <td align="left">
											<ul>
												<li>{{shop_name}} : 사이트명</li> <li>{{order_name}} : 주문자명</li> <li>{{order_number}} : 주문번호</li>
											</ul>
										</td>      
									</tr>      
									<tr>
										<td class="content">상품 배송 준비중<br>[주문상태 배송준비중으로 변경시]</td>
					                    <td>
					                        <input type="hidden" class="delivery_ready" name="code" value="51" />
					                        <textarea class="delivery_ready" name="content">[{{shop_name}}] {{order_name}}님의 주문하신 상품이 배송준비중 입니다.</textarea>
					                    </td>
					                    <td class="content">
					                    	<input type="checkbox" class="delivery_ready" name="is_send" value="y" checked/>
					                    </td>
					                    <td class="content">
					                    	<button type="button" onclick="getDefaultTemplate('sms', 'delivery_ready', '');" class="btn btn-primary btn-xs">가져오기</button>
					                    </td>
					                    <td>
					                    	<textarea class="delivery_ready" name="content_admin">[{{shop_name}}] {{order_name}}님의 주문하신 상품이 배송준비중 입니다.</textarea>
					                    </td>
					                    <td class="content">
					                    	<input type="checkbox" class="delivery_ready" name="is_send_admin" value="y" />
					                    </td>
					                    <td class="content">
					                    	<button type="button" onclick="getDefaultTemplate('sms', 'delivery_ready', 'admin');" class="btn btn-primary btn-xs">가져오기</button>
					                    </td>		
					                    <td align="left">
											<ul>
												<li>{{shop_name}} : 사이트명</li> <li>{{order_name}} : 주문자명</li>
											</ul>
										</td>      
									</tr>      
									<tr>
										<td class="content">상품 배송중<br>[주문상태 배송중으로 변경시]</td>
					                    <td>
					                        <input type="hidden" class="delivery_ing" name="code" value="4" />
					                        <textarea class="delivery_ing" name="content">[{{shop_name}}] {{order_name}}님의 주문하신 상품이 배송중 입니다.</textarea>
					                    </td>
					                    <td class="content">
					                    	<input type="checkbox" class="delivery_ing" name="is_send" value="y" checked/>
					                    </td>
					                    <td class="content">
					                    	<button type="button" onclick="getDefaultTemplate('sms', 'delivery_ing', '');" class="btn btn-primary btn-xs">가져오기</button>
					                    </td>
					                    <td>
					                    	<textarea class="delivery_ing" name="content_admin">[{{shop_name}}] {{order_name}}님의 주문하신 상품이 발송 되었습니다.</textarea>
					                    </td>
					                    <td class="content">
					                    	<input type="checkbox" class="delivery_ing" name="is_send_admin" value="y" />
					                    </td>
					                    <td class="content">
					                    	<button type="button" onclick="getDefaultTemplate('sms', 'delivery_ing', 'admin');" class="btn btn-primary btn-xs">가져오기</button>
					                    </td>		
					                    <td align="left">
											<ul>
												<li>{{shop_name}} : 사이트명</li> <li>{{order_name}} : 주문자명</li>			
											</ul>
										</td>      
									</tr>      
									<tr>
										<td class="content">상품 배송 완료<br>[주문상태 배송완료로 변경시]</td>
					                    <td>
					                        <input type="hidden" class="delivery_done" name="code" value="52" />
					                        <textarea class="delivery_done" name="content">[{{shop_name}}] {{order_name}}님의 주문하신 상품이 배송완료 되었습니다.</textarea>
					                    </td>
					                    <td class="content">
					                    	<input type="checkbox" class="delivery_done" name="is_send" value="y" checked/>
					                    </td>
					                    <td class="content">
					                    	<button type="button" onclick="getDefaultTemplate('sms', 'delivery_done', '');" class="btn btn-primary btn-xs">가져오기</button>
					                    </td>
					                    <td>
					                    	<textarea class="delivery_done" name="content_admin">[{{shop_name}}] {{order_name}}님의 주문하신 상품이 배송완료 되었습니다.</textarea>
					                    </td>
					                    <td class="content">
					                    	<input type="checkbox" class="delivery_done" name="is_send_admin" value="y" /></td>
					                    <td class="content">
					                    	<button type="button" onclick="getDefaultTemplate('sms', 'delivery_done', 'admin');" class="btn btn-primary btn-xs">가져오기</button>
					                    </td>		
					                    <td align="left">
											<ul>
												<li>{{shop_name}} : 사이트명</li> <li>{{order_name}} : 주문자명</li>
											</ul>
										</td>      
									</tr>      
									<tr>
										<td class="content">주문취소<br>[주문 취소시]</td>
					                    <td>
					                        <input type="hidden" class="order_cancle" name="code" value="5" />
					                        <textarea class="order_cancle" name="content">[{{shop_name}}] {{order_name}}님께서 요청하신 주문({{order_number}})이 취소되었습니다.</textarea>
					                    </td>
					                    <td class="content">
					                    	<input type="checkbox" class="order_cancle" name="is_send" value="y" checked/>
					                    </td>
					                    <td class="content">
					                    	<button type="button" onclick="getDefaultTemplate('sms', 'order_cancel', '');" class="btn btn-primary btn-xs">가져오기</button>
					                    </td>
					                    <td>
					                    	<textarea class="order_cancle" name="content_admin">[{{shop_name}}] {{order_name}}님께서 요청하신 주문({{order_number}})이 취소되었습니다.</textarea>
					                    </td>
					                    <td class="content">
					                    	<input type="checkbox" class="order_cancle" name="is_send_admin" value="y" />
					                    </td>
					                    <td class="content">
					                    	<button type="button" onclick="getDefaultTemplate('sms', 'order_cancel', 'admin');" class="btn btn-primary btn-xs">가져오기</button>
					                    </td>		
					                    <td align="left">
											<ul>
												<li>{{shop_name}} : 사이트명</li> <li>{{order_name}} : 주문자명</li> <li>{{order_number}} : 주문번호</li>			
											</ul>
										</td>      
									</tr>      
									<tr>
										<td class="content">환불완료<br>[주문상태 환불완료로 변경시]</td>
					                    <td>
					                        <input type="hidden" class="refund" name="code" value="6" />
					                        <textarea class="refund" name="content">[{{shop_name}}] {{order_name}}님께서 요청하신 주문({{order_number}})이 환불 처리되었습니다.</textarea>
					                    </td>
					                    <td class="content">
					                    	<input type="checkbox" class="refund" name="is_send" value="y" checked/>
					                    </td>
					                    <td class="content">
					                    	<button type="button" onclick="getDefaultTemplate('sms', 'refund', '');" class="btn btn-primary btn-xs">가져오기</button>
					                    </td>
					                    <td>
					                    	<textarea class="refund" name="content_admin">[{{shop_name}}] {{order_name}}님께서 요청하신 주문({{order_number}})이 환불 처리되었습니다.</textarea>
					                    </td>
					                    <td class="content">
					                    	<input type="checkbox" class="refund" name="is_send_admin" value="y" />
					                    </td>
					                    <td class="content">
					                    	<button type="button" onclick="getDefaultTemplate('sms', 'refund', 'admin');" class="btn btn-primary btn-xs">가져오기</button>
					                    </td>		
					                    <td align="left">
											<ul>
												<li>{{shop_name}} : 사이트명</li> <li>{{order_name}} : 주문자명</li> <li>{{order_number}} : 주문번호</li>			
											</ul>
										</td>      
									</tr>      
									<tr>
										<td class="content">적립금 적립<br>[개별 적립금 적립시]</td>
					                    <td>
					                        <input type="hidden" class="point" name="code" value="7" />
					                        <textarea class="point" name="content">[{{shop_name}}] {{user_name}}님에게 적립금 [{{point}}]이 {{point_type}} 되었습니다. 감사합니다.</textarea>
					                    </td>
					                    <td class="content">
					                    	<input type="checkbox" class="point" name="is_send" value="y" checked/>
					                    </td>
					                    <td class="content">
					                    	<button type="button" onclick="getDefaultTemplate('sms', 'point', '');" class="btn btn-primary btn-xs">가져오기</button>
					                    </td>
					                    <td>
					                    	<textarea class="point" name="content_admin">[{{shop_name}}] {{user_name}}님에게 적립금 [{{point}}]이 {{point_type}} 되었습니다. 감사합니다.</textarea>
					                    </td>
					                    <td class="content">
					                    	<input type="checkbox" class="point" name="is_send_admin" value="y" />
					                    </td>
					                    <td class="content">
					                    	<button type="button" onclick="getDefaultTemplate('sms', 'point', 'admin');" class="btn btn-primary btn-xs">가져오기</button>
					                    </td>		
					                    <td align="left">
											<ul>
												<li>{{shop_name}} : 사이트명</li> <li>{{user_name}} : 회원명</li> <li>{{point}} : 포인트</li> <li>{{point_type}} : 포인트 구분</li>
											</ul>
										</td>      
									</tr>      
									<tr>
										<td class="content">쿠폰 지급<br>[개별 쿠폰 지급시]</td>
					                    <td>
					                        <input type="hidden" class="coupon" name="code" value="17" />
					                        <textarea class="coupon" name="content">[{{shop_name}}] {{user_name}}님에게 [{{coupon_name}}]이 지급 되었습니다. 감사합니다.</textarea>
					                    </td>
					                    <td class="content">
					                    	<input type="checkbox" class="coupon" name="is_send" value="y" checked/>
					                    </td>
					                    <td class="content">
					                    	<button type="button" onclick="getDefaultTemplate('sms', 'coupon', '');" class="btn btn-primary btn-xs">가져오기</button>
					                    </td>
					                    <td>
					                    	<textarea class="coupon" name="content_admin">[{{shop_name}}] {{user_name}}님에게 [{{coupon_name}}]이 지급 되었습니다. 감사합니다.</textarea>
					                    </td>
					                    <td class="content">
					                    	<input type="checkbox" class="coupon" name="is_send_admin" value="y" />
					                    </td>
					                    <td class="content">
					                    	<button type="button" onclick="getDefaultTemplate('sms', 'coupon', 'admin');" class="btn btn-primary btn-xs">가져오기</button>
					                    </td>		
					                    <td align="left">
											<ul>
												<li>{{shop_name}} : 사이트명</li> <li>{{user_name}} : 회원명</li> <li>{{coupon_name}} : 쿠폰명</li> 
											</ul>
										</td>      
									</tr>				
								</tbody>
			                </table>
			                <br>
		
						</form>
		
		                <div style="text-align:center;"><button type="button" onclick="register()" class="btn btn-primary">확인</button></div>
		                <div style="text-align:center;"><button type="button" onclick="getToken()" class="btn btn-primary">토큰 내놔</button></div>
	                
	                </div><!-- /.box-body -->
	            </div><!-- /.box -->
	        </div><!-- /.col-xs-12 -->
	    </div><!-- /.row -->
	</section>
</div><!-- /.content-wrapper -->

<script>
	// 사용자 토큰 발급 
	function getToken() {
		/*
			[REST API 방식]
			1. REST Key 생성 : 692e25c8b6965b6470b9429719b4e5e7
			2. RedirectURI : http://localhost:8080/mir9/comm/sms
			3. 플랫폼 지정 : http://localhost:8080/
			4. 인증 코드 발급 : GET(/oauth/authorize)
				** 해당 인증 코드로 토큰 발급 시도는 단 한 번만 가능
				https://kauth.kakao.com/oauth/authorize?client_id={restKey}&response_type=code&redirect_uri={redirectURI}
			5. 사용자 토큰 발급 : POST(/oauth/token)
				** 사용자 토큰 갱신 필요 
			6. 결과
			access_token: "5ML1RQ9TjaOY9UnYb_zF0Gbgkrz65BGVJUaFWworDNIAAAGAPuQyoQ"
			expires_in: 21599
			refresh_token: "DFFRdAEsE9vFY_yb5p6EEOQrL5BpCD1DkThdUworDNIAAAGAPuQyoQ"
			refresh_token_expires_in: 5183999
			scope: "account_email profile_image talk_message profile_nickname"
			token_type: "bearer"
		*/
		
		$.ajax({
		    type: "POST",
		    url: "https://kauth.kakao.com/oauth/token",
		    header: {
		        "Content-Type": "application/x-www-form-urlencoded; charset=UTF-8"
		    },
		    data: { 
		    	grant_type: "authorization_code", 
		    	client_id: "692e25c8b6965b6470b9429719b4e5e7", 
		    	redirect_uri: "http://localhost:8080/mir9/comm/sms", 
		    	code: "h63Hff8Su9uQKyRYqvk4PnxZ8o_JadJ6I9PWU3qb0BqyevH7JufUg9_MHTUtUDXydYR6TgopcFAAAAGAPuOvcw"
		    },
		    success: function(data) {
				console.log("=====토큰=====");
				console.log(data);
		        console.log("=============");
		    },
		    error: function(textStatus, errorThrown){
				console.log(textStatus);
			}
		});
	
	};	
	
	/* 
	알림톡 보내기 테스트
 	function sendTok() {
		
		var shop_name = "mir9";
		var member_name = "테스트";	

		alert(text);
		alert(token);
		
		var url = $("#postUrl").val();
		// alert(url);
		
		$.ajax({
			type: "POST",
			// credentials: "include", // same-origin : 같은 출처 간 요청만 // include : 모든 요청 가능 // omit : 모든 요청 거부
			url: "https://kapi.kakao.com/v2/api/talk/memo/default/send",
			headers: {
				"Content-Type": "application/x-www-form-urlencoded",
		        "Authorization": "Bearer 5ML1RQ9TjaOY9UnYb_zF0Gbgkrz65BGVJUaFWworDNIAAAGAPuQyoQ",
		        // "Access-Control-Allow-Origin" : "http://localhost:8080", // 정확한 origin url 명시
		        // "Access-Control-Allow-Credentials" : true
		    },
		    data: {
		    	object_type: "text",
		    	text: "[" + shop_name + "]\n" + member_name + " 회원님의 가입을 진심으로 축하드립니다",
		    	link: {
		    		"web_url": "http://localhost:8080/mir9/comm/sms_list" // 버튼 클릭시 연결될 링크
		    	}
		    },
		    success: function(response) {
		    	console.log("=====결과=====");
		    	alert("성공!!");
		    	console.log(response.result_code); // 성공 시 0 
		    	console.log("=============");
		    },
		    error: function(response) {
		    	console.log(response);
		    	alert("msg : " + response.msg + ", code : " + response.code + " / 그만 좀 떠...");
		    }
		});
	}	
	*/

	/*
		** CORS 오류 발생 (참고 : https://inpa.tistory.com/entry/WEB-%F0%9F%93%9A-CORS-%F0%9F%92%AF-%EC%A0%95%EB%A6%AC-%ED%95%B4%EA%B2%B0-%EB%B0%A9%EB%B2%95-%F0%9F%91%8F)
		Access to XMLHttpRequest at 'https://kapi.kakao.com/v2/api/talk/memo/default/send' from origin 'http://localhost:8080' has been blocked by CORS policy: 
		No 'Access-Control-Allow-Origin' header is present on the requested resource.
		SOP(Same Origin Policy) 프로토콜, 호스트, 포트가 모두 같은 경우
		CORS(Cross Origin Resource Sharing) 프로토콜, 호스트, 포트 중 하나하도 일치하지 않는 경우
	
		** 카카오의 CORS 정책 (참고 : https://kakao-tam.tistory.com/81)
		kauth는 CORS가 열려있어서 ajax로 요청해도 CORS 에러가 발생하지 않지만, 반면에 kapi는 CORS가 닫혀있어서 에러가 발생합니다.
		즉, 프론트엔드 스크립트에서 kapi.kakao.com API 호출은 허용되지 않습니다.
		CORS가 열려있는 kauth.kakao.com API의 경우에도 리다이렉트 URI로 되돌아가야하는 로그인(인가요청, 추가 항목 동의받기), 로그아웃은 ajax 방식으로 호출 할 수 없습니다. 
		즉, kauth.kakao.com API는 토큰 요청만 가능합니다.
		CORS해결을 위해서 프론트엔드 스크립트에서 브라우저를 이용한 요청이 아니라 백엔드에서 REST API를 직접 호출해야합니다.
	*/	
	
	function register() { // 전체 변경 확인 버튼 
		var is_send_arr = $("input[name='is_send']"); 
		var content_arr = $("textarea[name='content']"); 
		var is_send_admin_arr = $("input[name='is_send_admin']"); 
		var content_admin_arr = $("textarea[name='content_admin']"); 
		
		for(var i=0 ; i<is_send_arr.length ; i++ ){
			if(is_send_arr[i].checked == true){ // 회원 자동 발송이 체크
				if(content_arr[i].value.length < 10){ // 회원 문구가 10글자 미만일 때
					// category_txt(클래스 값 즉, action 값을 넘겨야 함)
					alert('자동발송을 하려면 '+category_txt(is_send_arr[i].class)+' 안내메시지가 최소 10자 이상 입력되어야 합니다. '); 
					content_arr[i].focus();
					return;
				}
			}
			if(is_send_admin_arr[i].checked == true){ // 관리자 자동 발송이 체크 
				if(content_admin_arr[i].value.length < 10){
					alert('자동발송을 하려면 '+category_txt(content_admin_arr[i].class)+' 안내메시지가 최소 10자 이상 입력되어야 합니다. ');
					content_admin_arr[i].focus();
					return;
				}
			}
		}
	
		form_register.target = 'iframe_process';
	    form_register.submit();
	}
	
	function getDefaultTemplate(type, action, is_admin) { // 기본 문구 
		$.ajax({
			url:'http://demoshop.mir9.kr/api/process.php', // sms 발송 api
			type:'post',
			dataType:'json',
			data:{
				method:'UtilNotice.getCommunityTemplate',
				type: type,
				action: action,
	            is_admin: is_admin
			},
			success:function(data, textStatus, jqXHR){
				
				console.log("===== 기본 data =====");
	            console.log(data);
	            console.log("===================");
	            
				if(data.data.length > 0){
					if(confirm(data.data + '\n\n해당 문구로 적용하시겠습니까?')){
						if(is_admin == 'admin'){
							$("textarea[class='"+action+"']").val(data.data);
						}else{
							$("textarea[class='"+action+"']").val(data.data);
						}
					}
				}
			},
			error:function(jqXHR, textStatus, errorThrown){
				console.log(textStatus);
			}
		});
	}
	
	function category_txt(t_class){
		var return_txt = '';
		
			if(t_class.equals('join')){
				return_txt = '회원가입';
			}
		else
			if(t_class.equals('findid')){
				return_txt = '아이디 찾기<br>[아이디 찾기시]';
			}
		else
			if(t_class.equals('findpw')){
				return_txt = '임시비밀번호 발급알림<br>[비밀번호 찾기시]';
			}
		else
			if(t_class.equals('order')){
				return_txt = '주문접수<br>[무통장/카드 결제시]';
			}
		else
			if(t_class.equals('pay_done')){
				return_txt = '입금확인<br>[무통장 입금 완료시]';
			}
		else
			if(t_class.equals('delivery_ready')){
				return_txt = '상품 배송 준비중<br>[주문상태 배송준비중으로 변경시]';
			}
		else
			if(t_class.equals('delivery_ing')){
				return_txt = '상품 배송중<br>[주문상태 배송중으로 변경시]';
			}
		else
			if(t_class.equals('delivery_done')){
				return_txt = '상품 배송 완료<br>[주문상태 배송완료로 변경시]';
			}
		else
			if(t_class.equals('order_cancel')){
				return_txt = '주문취소<br>[주문 취소시]';
			}
		else
			if(t_class.equals('refund')){
				return_txt = '환불완료<br>[주문상태 환불완료로 변경시]';
			}
		else
			if(t_class.equals('point')){
				return_txt = '적립금 적립<br>[개별 적립금 적립시]';
			}
		else
			if(t_class.equals('coupon')){
				return_txt = '쿠폰 지급<br>[개별 쿠폰 지급시]';
			}
		
		return return_txt;
	}

</script>


<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>