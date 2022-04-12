<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<jsp:include page="/WEB-INF/views/common/header.jsp">
<jsp:param value="SMS 설정" name="title"/>
</jsp:include>

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
					                        <input type="hidden" name="msg[join][code]" value="1" />
					                        <textarea name="msg[join][content]">[{{shop_name}}] {{user_name}} 회원님의 가입을 진심으로 축하드립니다.</textarea>
					                    </td>
					                    <td class="content">
					                    	<input type="checkbox" name="msg[join][is_send]" value="y" checked/>
					                    </td>
					                    <td class="content">
					                   		<button type="button" onclick="getDefaultTemplate('sms', 'join', '');" class="btn btn-primary btn-xs">가져오기</button>
					                    </td>
					                    <td>
					                    	<textarea name="msg[join][content_admin]">[{{shop_name}}] {{user_name}} 회원님이 회원가입하셨습니다.</textarea>
					                    </td>
					                    <td class="content">
					                    	<input type="checkbox" name="msg[join][is_send_admin]" value="y" />
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
					                        <input type="hidden" name="msg[findid][code]" value="46" />
					                        <textarea name="msg[findid][content]">[{{shop_name}}] {{user_name}} 회원님의 아이디가 메일로 발송되었습니다.</textarea>
					                    </td>
					                    <td class="content">
					                    	<input type="checkbox" name="msg[findid][is_send]" value="y" checked/>
					                    </td>
					                    <td class="content">
					                    	<button type="button" onclick="getDefaultTemplate('sms', 'findid', '');" class="btn btn-primary btn-xs">가져오기</button>
					                    </td>
					                    <td>
					                    	<textarea name="msg[findid][content_admin]">[{{shop_name}}] {{user_name}} 회원님의 아이디가 메일로 발송되었습니다.</textarea>
					                    </td>
					                    <td class="content">
					                    	<input type="checkbox" name="msg[findid][is_send_admin]" value="y" />
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
					                        <input type="hidden" name="msg[findpw][code]" value="45" />
					                        <textarea name="msg[findpw][content]">[{{shop_name}}] {{user_name}} 회원님의 메일로 임시 비밀번호가 발송 되었습니다.</textarea>
					                    </td>
					                    <td class="content">
					                    	<input type="checkbox" name="msg[findpw][is_send]" value="y" checked/>
					                    </td>
					                    <td class="content">
					                    	<button type="button" onclick="getDefaultTemplate('sms', 'findpw', '');" class="btn btn-primary btn-xs">가져오기</button>
					                    </td>
					                    <td>
					                    	<textarea name="msg[findpw][content_admin]">[{{shop_name}}] {{user_name}} 회원님의 메일로 임시 비밀번호가 발송 되었습니다.</textarea>
					                    </td>
					                    <td class="content">
					                    	<input type="checkbox" name="msg[findpw][is_send_admin]" value="y" />
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
					                        <input type="hidden" name="msg[order][code]" value="2" />
					                        <textarea name="msg[order][content]">[{{shop_name}}] {{order_name}}님의 주문({{order_number}})이 접수되었습니다. 감사합니다.</textarea>
					                    </td>
					                    <td class="content">
					                    	<input type="checkbox" name="msg[order][is_send]" value="y" checked/>
					                    </td>
					                    <td class="content">
					                    	<button type="button" onclick="getDefaultTemplate('sms', 'order', '');" class="btn btn-primary btn-xs">가져오기</button>
					                    </td>
					                    <td>
					                    	<textarea name="msg[order][content_admin]">[{{shop_name}}] {{order_name}}님의 주문({{order_number}})이 접수되었습니다.</textarea>
					                    </td>
					                    <td class="content">
					                    	<input type="checkbox" name="msg[order][is_send_admin]" value="y" />
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
					                        <input type="hidden" name="msg[pay_done][code]" value="3" />
					                        <textarea name="msg[pay_done][content]">[{{shop_name}}] {{order_name}}님의 주문({{order_number}})이 결제완료 되었습니다.</textarea>
					                    </td>
					                    <td class="content">
					                    	<input type="checkbox" name="msg[pay_done][is_send]" value="y" checked/>
					                    </td>
					                    <td class="content">
					                    	<button type="button" onclick="getDefaultTemplate('sms', 'pay_done', '');" class="btn btn-primary btn-xs">가져오기</button>
					                    </td>
					                    	<td><textarea name="msg[pay_done][content_admin]">[{{shop_name}}] {{order_name}}님의 주문({{order_number}})이 결제완료 되었습니다.</textarea>
					                    </td>
					                    <td class="content">
					                    	<input type="checkbox" name="msg[pay_done][is_send_admin]" value="y" />
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
					                        <input type="hidden" name="msg[delivery_ready][code]" value="51" />
					                        <textarea name="msg[delivery_ready][content]">[{{shop_name}}] {{order_name}}님의 주문하신 상품이 배송준비중 입니다.</textarea>
					                    </td>
					                    <td class="content">
					                    	<input type="checkbox" name="msg[delivery_ready][is_send]" value="y" checked/>
					                    </td>
					                    <td class="content">
					                    	<button type="button" onclick="getDefaultTemplate('sms', 'delivery_ready', '');" class="btn btn-primary btn-xs">가져오기</button>
					                    </td>
					                    <td>
					                    	<textarea name="msg[delivery_ready][content_admin]">[{{shop_name}}] {{order_name}}님의 주문하신 상품이 배송준비중 입니다.</textarea>
					                    </td>
					                    <td class="content">
					                    	<input type="checkbox" name="msg[delivery_ready][is_send_admin]" value="y" />
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
					                        <input type="hidden" name="msg[delivery_ing][code]" value="4" />
					                        <textarea name="msg[delivery_ing][content]">[{{shop_name}}] {{order_name}}님의 주문하신 상품이 배송중 입니다.</textarea>
					                    </td>
					                    <td class="content">
					                    	<input type="checkbox" name="msg[delivery_ing][is_send]" value="y" checked/>
					                    </td>
					                    <td class="content">
					                    	<button type="button" onclick="getDefaultTemplate('sms', 'delivery_ing', '');" class="btn btn-primary btn-xs">가져오기</button>
					                    </td>
					                    <td>
					                    	<textarea name="msg[delivery_ing][content_admin]">[{{shop_name}}] {{order_name}}님의 주문하신 상품이 발송 되었습니다.</textarea>
					                    </td>
					                    <td class="content">
					                    	<input type="checkbox" name="msg[delivery_ing][is_send_admin]" value="y" />
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
					                        <input type="hidden" name="msg[delivery_done][code]" value="52" />
					                        <textarea name="msg[delivery_done][content]">[{{shop_name}}] {{order_name}}님의 주문하신 상품이 배송완료 되었습니다.</textarea>
					                    </td>
					                    <td class="content">
					                    	<input type="checkbox" name="msg[delivery_done][is_send]" value="y" checked/>
					                    </td>
					                    <td class="content">
					                    	<button type="button" onclick="getDefaultTemplate('sms', 'delivery_done', '');" class="btn btn-primary btn-xs">가져오기</button>
					                    </td>
					                    <td>
					                    	<textarea name="msg[delivery_done][content_admin]">[{{shop_name}}] {{order_name}}님의 주문하신 상품이 배송완료 되었습니다.</textarea>
					                    </td>
					                    <td class="content">
					                    	<input type="checkbox" name="msg[delivery_done][is_send_admin]" value="y" /></td>
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
					                        <input type="hidden" name="msg[order_cancel][code]" value="5" />
					                        <textarea name="msg[order_cancel][content]">[{{shop_name}}] {{order_name}}님께서 요청하신 주문({{order_number}})이 취소되었습니다.</textarea>
					                    </td>
					                    <td class="content">
					                    	<input type="checkbox" name="msg[order_cancel][is_send]" value="y" checked/>
					                    </td>
					                    <td class="content">
					                    	<button type="button" onclick="getDefaultTemplate('sms', 'order_cancel', '');" class="btn btn-primary btn-xs">가져오기</button>
					                    </td>
					                    <td>
					                    	<textarea name="msg[order_cancel][content_admin]">[{{shop_name}}] {{order_name}}님께서 요청하신 주문({{order_number}})이 취소되었습니다.</textarea>
					                    </td>
					                    <td class="content">
					                    	<input type="checkbox" name="msg[order_cancel][is_send_admin]" value="y" />
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
					                        <input type="hidden" name="msg[refund][code]" value="6" />
					                        <textarea name="msg[refund][content]">[{{shop_name}}] {{order_name}}님께서 요청하신 주문({{order_number}})이 환불 처리되었습니다.</textarea>
					                    </td>
					                    <td class="content">
					                    	<input type="checkbox" name="msg[refund][is_send]" value="y" checked/>
					                    </td>
					                    <td class="content">
					                    	<button type="button" onclick="getDefaultTemplate('sms', 'refund', '');" class="btn btn-primary btn-xs">가져오기</button>
					                    </td>
					                    <td>
					                    	<textarea name="msg[refund][content_admin]">[{{shop_name}}] {{order_name}}님께서 요청하신 주문({{order_number}})이 환불 처리되었습니다.</textarea>
					                    </td>
					                    <td class="content">
					                    	<input type="checkbox" name="msg[refund][is_send_admin]" value="y" />
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
					                        <input type="hidden" name="msg[point][code]" value="7" />
					                        <textarea name="msg[point][content]">[{{shop_name}}] {{user_name}}님에게 적립금 [{{point}}]이 {{point_type}} 되었습니다. 감사합니다.</textarea>
					                    </td>
					                    <td class="content">
					                    	<input type="checkbox" name="msg[point][is_send]" value="y" checked/>
					                    </td>
					                    <td class="content">
					                    	<button type="button" onclick="getDefaultTemplate('sms', 'point', '');" class="btn btn-primary btn-xs">가져오기</button>
					                    </td>
					                    <td>
					                    	<textarea name="msg[point][content_admin]">[{{shop_name}}] {{user_name}}님에게 적립금 [{{point}}]이 {{point_type}} 되었습니다. 감사합니다.</textarea>
					                    </td>
					                    <td class="content">
					                    	<input type="checkbox" name="msg[point][is_send_admin]" value="y" />
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
					                        <input type="hidden" name="msg[coupon][code]" value="17" />
					                        <textarea name="msg[coupon][content]">[{{shop_name}}] {{user_name}}님에게 [{{coupon_name}}]이 지급 되었습니다. 감사합니다.</textarea>
					                    </td>
					                    <td class="content">
					                    	<input type="checkbox" name="msg[coupon][is_send]" value="y" checked/>
					                    </td>
					                    <td class="content">
					                    	<button type="button" onclick="getDefaultTemplate('sms', 'coupon', '');" class="btn btn-primary btn-xs">가져오기</button>
					                    </td>
					                    <td>
					                    	<textarea name="msg[coupon][content_admin]">[{{shop_name}}] {{user_name}}님에게 [{{coupon_name}}]이 지급 되었습니다. 감사합니다.</textarea>
					                    </td>
					                    <td class="content">
					                    	<input type="checkbox" name="msg[coupon][is_send_admin]" value="y" />
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
	
	                </div><!-- /.box-body -->
	            </div><!-- /.box -->
	        </div><!-- /.col-xs-12 -->
	    </div><!-- /.row -->
	</section>
</div><!-- /.content-wrapper -->

<script>

	function register() {
		var is_send_arr = $("input[name='is_send']"); // 회원 자동 발송
		var content_arr = $("textarea[name='content']"); // 회원 문구
		var is_send_admin_arr = $("input[name='is_send_admin']"); // 관리자 자동 발송 
		var content_admin_arr = $("textarea[name='content_admin']"); // 관리자 문구
		for(var i=0 ; i<is_send_arr.length ; i++ ){
			if(is_send_arr[i].checked == true){ // 회원 자동 발송이 체크 되어 있을 경우
				if(content_arr[i].value.length < 10){ 
					alert('자동발송을 하려면 '+category_txt(is_send_arr[i].name)+' 안내메시지가 최소 10자 이상 입력되어야 합니다. '); // category_txt(t_name) : name 값에 따른 txt 반환 함수
					content_arr[i].focus();
					return;
				}
			}
			if(is_send_admin_arr[i].checked == true){ // 관리자 자동 발송이 체크 되어 있을 경우
				if(content_admin_arr[i].value.length < 10){
					alert('자동발송을 하려면 '+category_txt(content_admin_arr[i].name)+' 안내메시지가 최소 10자 이상 입력되어야 합니다. ');
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
			url:'http://demoshop.mir9.kr/api/process.php',
			type:'post',
			dataType:'json',
			data:{
				method:'UtilNotice.getCommunityTemplate',
				type: type,
				action: action,
	            is_admin: is_admin
			},
			success:function(data, textStatus, jqXHR){
	            console.log(data);
				if(data.data.length > 0){
					if(confirm(data.data + '\n\n해당 문구로 적용하시겠습니까?')){
						if(is_admin == 'admin'){
							$("textarea[name='msg["+action+"][content_admin]']").val(data.data);
						}else{
							$("textarea[name='msg["+action+"][content]']").val(data.data);
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