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
					                    	<!-- action에 해당하는 이름값 class로 분리 -->
					                        <input type="hidden" class="join" name="code" value="join" /> 
					                        <textarea class="join" name="content" >[{{shop_name}}] {{user_name}} 회원님의 가입을 진심으로 축하드립니다.</textarea>
					                    </td>
					                    <td class="content">
					                    	<input type="checkbox" class="join" name="is_send" checked/>
					                    </td>
					                    <td class="content">
					                    	<!-- getDefaultTemplate(type, action, is_admin) -->
					                   		<button type="button" onclick="getDefaultTemplate('sms', 'join', '');" class="btn btn-primary btn-xs">가져오기</button>
					                    </td>
					                    <td>
					                    	<textarea class="join" name="content_admin">[{{shop_name}}] {{user_name}} 회원님이 회원가입하셨습니다.</textarea>
					                    </td>
					                    <td class="content">
					                    	<input type="checkbox" class="join" name="is_send_admin" />
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
					                        <input type="hidden" class="findid" name="code" value="findid" />
					                        <textarea class="findid" name="content">[{{shop_name}}] {{user_name}} 회원님의 아이디가 메일로 발송되었습니다.</textarea>
					                    </td>
					                    <td class="content">
					                    	<input type="checkbox" class="findid" name="is_send" checked/>
					                    </td>
					                    <td class="content">
					                    	<button type="button" onclick="getDefaultTemplate('sms', 'findid', '');" class="btn btn-primary btn-xs">가져오기</button>
					                    </td>
					                    <td>
					                    	<textarea class="findid" name="content_admin">[{{shop_name}}] {{user_name}} 회원님의 아이디가 메일로 발송되었습니다.</textarea>
					                    </td>
					                    <td class="content">
					                    	<input type="checkbox" class="findid" name="is_send_admin" />
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
					                        <input type="hidden" class="findpw" name="code" value="findpw" />
					                        <textarea class="findpw" name="content">[{{shop_name}}] {{user_name}} 회원님의 메일로 임시 비밀번호가 발송 되었습니다.</textarea>
					                    </td>
					                    <td class="content">
					                    	<input type="checkbox" class="findpw" name="is_send" checked/>
					                    </td>
					                    <td class="content">
					                    	<button type="button" onclick="getDefaultTemplate('sms', 'findpw', '');" class="btn btn-primary btn-xs">가져오기</button>
					                    </td>
					                    <td>
					                    	<textarea class="findpw" name="content_admin">[{{shop_name}}] {{user_name}} 회원님의 메일로 임시 비밀번호가 발송 되었습니다.</textarea>
					                    </td>
					                    <td class="content">
					                    	<input type="checkbox" class="findpw" name="is_send_admin" />
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
					                        <input type="hidden" class="order" name="code" value="order" />
					                        <textarea class="order" name="content">[{{shop_name}}] {{order_name}}님의 주문({{order_number}})이 접수되었습니다. 감사합니다.</textarea>
					                    </td>
					                    <td class="content">
					                    	<input type="checkbox" class="order" name="is_send" checked/>
					                    </td>
					                    <td class="content">
					                    	<button type="button" onclick="getDefaultTemplate('sms', 'order', '');" class="btn btn-primary btn-xs">가져오기</button>
					                    </td>
					                    <td>
					                    	<textarea class="order" name="content_admin">[{{shop_name}}] {{order_name}}님의 주문({{order_number}})이 접수되었습니다.</textarea>
					                    </td>
					                    <td class="content">
					                    	<input type="checkbox" class="order" name="is_send_admin" />
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
					                        <input type="hidden" class="pay_done" name="code" value="pay_done" />
					                        <textarea class="pay_done" name="content">[{{shop_name}}] {{order_name}}님의 주문({{order_number}})이 결제완료 되었습니다.</textarea>
					                    </td>
					                    <td class="content">
					                    	<input type="checkbox" class="pay_done" name="is_send" checked/>
					                    </td>
					                    <td class="content">
					                    	<button type="button" onclick="getDefaultTemplate('sms', 'pay_done', '');" class="btn btn-primary btn-xs">가져오기</button>
					                    </td>
					                    	<td><textarea class="pay_done" name="content_admin">[{{shop_name}}] {{order_name}}님의 주문({{order_number}})이 결제완료 되었습니다.</textarea>
					                    </td>
					                    <td class="content">
					                    	<input type="checkbox" class="pay_done" name="is_send_admin" />
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
					                        <input type="hidden" class="delivery_ready" name="code" value="delivery_ready" />
					                        <textarea class="delivery_ready" name="content">[{{shop_name}}] {{order_name}}님의 주문하신 상품이 배송준비중 입니다.</textarea>
					                    </td>
					                    <td class="content">
					                    	<input type="checkbox" class="delivery_ready" name="is_send" checked/>
					                    </td>
					                    <td class="content">
					                    	<button type="button" onclick="getDefaultTemplate('sms', 'delivery_ready', '');" class="btn btn-primary btn-xs">가져오기</button>
					                    </td>
					                    <td>
					                    	<textarea class="delivery_ready" name="content_admin">[{{shop_name}}] {{order_name}}님의 주문하신 상품이 배송준비중 입니다.</textarea>
					                    </td>
					                    <td class="content">
					                    	<input type="checkbox" class="delivery_ready" name="is_send_admin" />
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
					                        <input type="hidden" class="delivery_ing" name="code" value="delivery_ing" />
					                        <textarea class="delivery_ing" name="content">[{{shop_name}}] {{order_name}}님의 주문하신 상품이 배송중 입니다.</textarea>
					                    </td>
					                    <td class="content">
					                    	<input type="checkbox" class="delivery_ing" name="is_send" checked/>
					                    </td>
					                    <td class="content">
					                    	<button type="button" onclick="getDefaultTemplate('sms', 'delivery_ing', '');" class="btn btn-primary btn-xs">가져오기</button>
					                    </td>
					                    <td>
					                    	<textarea class="delivery_ing" name="content_admin">[{{shop_name}}] {{order_name}}님의 주문하신 상품이 발송 되었습니다.</textarea>
					                    </td>
					                    <td class="content">
					                    	<input type="checkbox" class="delivery_ing" name="is_send_admin" />
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
					                        <input type="hidden" class="delivery_done" name="code" value="delivery_done" />
					                        <textarea class="delivery_done" name="content">[{{shop_name}}] {{order_name}}님의 주문하신 상품이 배송완료 되었습니다.</textarea>
					                    </td>
					                    <td class="content">
					                    	<input type="checkbox" class="delivery_done" name="is_send" checked/>
					                    </td>
					                    <td class="content">
					                    	<button type="button" onclick="getDefaultTemplate('sms', 'delivery_done', '');" class="btn btn-primary btn-xs">가져오기</button>
					                    </td>
					                    <td>
					                    	<textarea class="delivery_done" name="content_admin">[{{shop_name}}] {{order_name}}님의 주문하신 상품이 배송완료 되었습니다.</textarea>
					                    </td>
					                    <td class="content">
					                    	<input type="checkbox" class="delivery_done" name="is_send_admin"  /></td>
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
					                        <input type="hidden" class="order_cancle" name="code" value="order_cancle" />
					                        <textarea class="order_cancle" name="content">[{{shop_name}}] {{order_name}}님께서 요청하신 주문({{order_number}})이 취소되었습니다.</textarea>
					                    </td>
					                    <td class="content">
					                    	<input type="checkbox" class="order_cancle" name="is_send" checked/>
					                    </td>
					                    <td class="content">
					                    	<button type="button" onclick="getDefaultTemplate('sms', 'order_cancel', '');" class="btn btn-primary btn-xs">가져오기</button>
					                    </td>
					                    <td>
					                    	<textarea class="order_cancle" name="content_admin">[{{shop_name}}] {{order_name}}님께서 요청하신 주문({{order_number}})이 취소되었습니다.</textarea>
					                    </td>
					                    <td class="content">
					                    	<input type="checkbox" class="order_cancle" name="is_send_admin" />
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
					                        <input type="hidden" class="refund" name="code" value="refund" />
					                        <textarea class="refund" name="content">[{{shop_name}}] {{order_name}}님께서 요청하신 주문({{order_number}})이 환불 처리되었습니다.</textarea>
					                    </td>
					                    <td class="content">
					                    	<input type="checkbox" class="refund" name="is_send" checked/>
					                    </td>
					                    <td class="content">
					                    	<button type="button" onclick="getDefaultTemplate('sms', 'refund', '');" class="btn btn-primary btn-xs">가져오기</button>
					                    </td>
					                    <td>
					                    	<textarea class="refund" name="content_admin">[{{shop_name}}] {{order_name}}님께서 요청하신 주문({{order_number}})이 환불 처리되었습니다.</textarea>
					                    </td>
					                    <td class="content">
					                    	<input type="checkbox" class="refund" name="is_send_admin" />
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
					                        <input type="hidden" class="point" name="code" value="point" />
					                        <textarea class="point" name="content">[{{shop_name}}] {{user_name}}님에게 적립금 [{{point}}]이 {{point_type}} 되었습니다. 감사합니다.</textarea>
					                    </td>
					                    <td class="content">
					                    	<input type="checkbox" class="point" name="is_send" checked>
					                    </td>
					                    <td class="content">
					                    	<button type="button" onclick="getDefaultTemplate('sms', 'point', '');" class="btn btn-primary btn-xs">가져오기</button>
					                    </td>
					                    <td>
					                    	<textarea class="point" name="content_admin">[{{shop_name}}] {{user_name}}님에게 적립금 [{{point}}]이 {{point_type}} 되었습니다. 감사합니다.</textarea>
					                    </td>
					                    <td class="content">
					                    	<input type="checkbox" class="point" name="is_send_admin" />
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
					                        <input type="hidden" class="coupon" name="code" value="coupon" />
					                        <textarea class="coupon" name="content">[{{shop_name}}] {{user_name}}님에게 [{{coupon_name}}]이 지급 되었습니다. 감사합니다.</textarea>
					                    </td>
					                    <td class="content">
					                    	<input type="checkbox" class="coupon" name="is_send" checked />
					                    </td>
					                    <td class="content">
					                    	<button type="button" onclick="getDefaultTemplate('sms', 'coupon', '');" class="btn btn-primary btn-xs">가져오기</button>
					                    </td>
					                    <td>
					                    	<textarea class="coupon" name="content_admin">[{{shop_name}}] {{user_name}}님에게 [{{coupon_name}}]이 지급 되었습니다. 감사합니다.</textarea>
					                    </td>
					                    <td class="content">
					                    	<input type="checkbox" class="coupon" name="is_send_admin" />
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
			rest key : 692e25c8b6965b6470b9429719b4e5e7
			redirect uri : http://localhost:8080/mir9/comm/sms 
			인증코드 발급 : https://kauth.kakao.com/oauth/authorize?client_id={restKey}&response_type=code&redirect_uri={redirectURI}
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
		    },
		    error: function(textStatus, errorThrown){
				console.log(textStatus);
			}
		});
	
	};	
	
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
		
		// code, checkbox, textarea 선언
		obj.code = [];
		obj.is_send = [];
		obj.content = [];
		obj.is_send_admin = [];
		obj.content_admin = [];
		
		// obj에 각각의 값 담기
		$.each($("input[name='code']"), function(index, value) { 
			obj.code.push($(value).val());
		});
		$.each($("input[name='is_send']"), function(index, value) {
			obj.is_send.push($(value).val());
		});
		$.each($("textarea[name='content']"), function(index, value) {
			obj.content.push($(value).val());
		});
		$.each($("input[name='is_send_admin']"), function(index, value) {
			obj.is_send_admin.push($(value).val());
		});
		$.each($("textarea[name='content_admin']"), function(index, value) {
			obj.content_admin.push($(value).val());
		});
		
		console.log("=====obj=====");
		console.log(obj);
	
		for(var i=0 ; i< obj.is_send.length ; i++ ){
			if(obj.is_send[i] == "y"){ // 회원 자동 발송이 체크
				if(obj.content[i].length < 10){ // 회원 문구가 10글자 미만일 때
					alert("자동발송을 하려면 '" + category_txt(obj.code[i]) + "' 안내메시지가 최소 10자 이상 입력되어야 합니다."); 
					return;
				}
			}
			if(obj.is_send_admin[i] == "y"){ // 관리자 자동 발송이 체크 
				if(obj.content_admin[i].length < 10){
					alert("자동발송을 하려면 '" + category_txt(obj.code[i]) + "' 안내메시지가 최소 10자 이상 입력되어야 합니다.");
					return;
				}
			}
		}
		
		const jsonStr = JSON.stringify(obj);

		/*
		form_register.target = 'iframe_process';
	    form_register.submit();
		*/
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
	            
				if(data.data.length > 0){
					if(confirm(data.data + '\n\n해당 문구로 적용하시겠습니까?')){
						if(is_admin == 'admin'){
							$("textarea[class='" + action + "']").val(data.data);
						}else{
							$("textarea[class='" + action + "']").val(data.data);
						}
					}
				}
			},
			error:function(jqXHR, textStatus, errorThrown){
				console.log(textStatus);
			}
		});
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