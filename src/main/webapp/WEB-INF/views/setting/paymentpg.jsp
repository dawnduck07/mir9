<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<jsp:include page="/WEB-INF/views/common/header.jsp">
<jsp:param value="결제 PG 설정" name="title"/>
</jsp:include>


<!-- content-wrapper -->
<div class="content-wrapper">
<section class="content-header">
    <h1>
    결제PG 설정
    <small>Billing PG</small>
    </h1>

    <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
        <li>설정</li>
        <li class="active">결제PG 설정</li>
    </ol>
</section>

<section class="content">
<div class="row">
    <div class="col-xs-12">
        <div class="box">
            <div class="box-body">
                <form name="form_register" method="post" action="/index.php?tpf=admin/setting/process">
                <input type="hidden" name="mode" value="updatePaymentPG">

                <h4><p class="text-light-blue"><i class="fa fa-fw fa-info-circle"></i> 기본 설정</p></h4>
                <table class="table table-bordered">
                <tbody>
                <tr>
                    <td class="menu">국내/해외 여부</td>
                    <td align="left">
                    <input type="checkbox" name="chk_gubun1" value='Y' onchange="checkGubun(this.value);" ${pg.isDomestic == 'Y' ? 'checked' : '' }>국내&nbsp;&nbsp;
                    <input type="checkbox" name="chk_gubun2" value='Y' onchange="checkGubun(this.value);" ${pg.isForeigne == 'Y' ? 'checked' : '' }>해외
                    </td>
                </tr>
                <tr id="display_pg" style="display:none;">
                    <td class="menu">국내 카드PG사</td>
                    <td align="left">
                    <input type="radio" name="card_pg" value="ini" onchange="checkCardPGType(this.value);" ${pg.cardPg == 'ini' ? 'checked' : '' }>KG 이니시스&nbsp;&nbsp;&nbsp;&nbsp;
                    <input type="radio" name="card_pg" value="xpay" onchange="checkCardPGType(this.value);" ${pg.cardPg == 'xpay' ? 'checked' : '' }>LG 유플러스&nbsp;&nbsp;&nbsp;&nbsp;
                    <input type="radio" name="card_pg" value="kcp" onchange="checkCardPGType(this.value);" ${pg.cardPg == 'kcp' ? 'checked' : '' }>NHN KCP
                    </td>
                </tr>
				<tr id="display_ease_pg" style="display:none;">
                    <td class="menu">국내 간편결제</td>
                    <td align="left">
                    <input type="checkbox" name="naverpay_use" id="naverpay_use" value='Y' onchange="checkEasyPGNaver(this.checked);" ${pg.naverpayUse == 'Y' ? 'checked' : '' }> <label for="naverpay_use">네이버페이</label> &nbsp;&nbsp;
					<!-- <input type="checkbox" name="kakaopay_use" id="kakaopay_use" value='y' onchange="checkEasyPGKakao(this.checked);"> <label for="kakaopay_use">카카오페이</label> &nbsp;&nbsp; -->
                    </td>
                </tr>
                </tbody>
                </table>
                <br>
                
                <span id="display_ini_title" style="display:none;"><h4><p class="text-light-blue"><i class="fa fa-fw fa-info-circle"></i> KG 이니시스 일반결제 설정</p></h4></span>
                <table class="table table-bordered" id="display_ini" style="display:none;">
                <tbody>
                <tr>
                    <td class="menu">사용 여부</td>
                    <td align="left">
                    <input type="checkbox" name="chk_use_ini" value='Y' ${kgIni.useIni == 'Y' ? 'checked' : '' }>사용함
                    </td>
                </tr>
                <tr>
                    <td class="menu">PG사 모듈 버전</td>
                    <td align="left">${kgIni.moduleVersion }</td>
                </tr>
                <tr>
                    <td class="menu">결제수단 설정</td>
                    <td align="left">
	                    <input type="checkbox" name="chk_ini1" value='Y' ${kgIni.useCredit == 'Y' ? 'checked' : '' }>신용카드&nbsp;&nbsp;
	                    <input type="checkbox" name="chk_ini2" value='Y' ${kgIni.useBank == 'Y' ? 'checked' : '' }>계좌이체&nbsp;&nbsp;
	                    <input type="checkbox" name="chk_ini3" value='Y' ${kgIni.useVBank == 'Y' ? 'checked' : '' }>가상계좌
                    </td>
                </tr>
                <tr>
                    <td class="menu">사용 모드</td>
                    <td align="left">
                        <input type="radio" name="pg_mode" value="1"  ${kgIni.pgMode == 1 ? 'checked' : '' }>TEST 모드&nbsp;&nbsp;&nbsp;&nbsp;
                        <input type="radio" name="pg_mode" value="2" ${kgIni.pgMode == 2 ? 'checked' : '' }>REAL 모드
                    </td>
                </tr>
                <tr>
                    <td class="menu">상점 ID</td>
                    <td align="left">
                        <span style="float:left;"><input type="text" name="shop_id_ini" value="${kgIni.storeId == null ? '' : kgIni.storeId }" class="form-control input-sm" style="width:300px;"></span>
                    </td>
                </tr>
                <tr>
                    <td class="menu">Sign Key</td>
                    <td align="left">
                        <span style="float:left;"><input type="text" name="shop_key_ini" value="${kgIni.signKey == null ? '' : kgIni.signKey }" class="form-control input-sm" style="width:300px;"></span>
                    </td>
                </tr>
                <tr>
                    <td class="menu">Upload Key File</td>
                    <td align="left">
                        <span style="float:left;"> <input type="file" name="file1" class="form-control input-sm" style="width:100%; display:inline;"></span>
                        <span style="line-height:2.0;"><small class="text-black"> &nbsp;&nbsp;압축파일 형식(zip)의 Key File을 업로드해 주세요. </small></span>
                    </td>
                </tr>
                </tbody>
                </table>

                <span id="display_xpay_title" style="display:none;"><h4><p class="text-light-blue"><i class="fa fa-fw fa-info-circle"></i> LG 유플러스 일반결제 설정</p></h4></span>
                <table class="table table-bordered" id="display_xpay" style="display:none;">
                <tbody>
                <tr>
                    <td class="menu">사용 여부</td>
                    <td align="left">
                    <input type="checkbox" name="chk_use_xpay" value='y' checked=checked>사용함
                    </td>
                </tr>
                <tr>
                    <td class="menu">PG사 모듈 버전</td>
                    <td align="left">XPay Crossplatform (V 1.0 - 20150826) / Smart XPay (V 1.2 - 20140730)</td>
                </tr>
                <tr>
                    <td class="menu">결제수단 설정</td>
                    <td align="left">
                    <input type="checkbox" name="chk_xpay1" value='y' checked=checked>신용카드&nbsp;&nbsp;
                    <input type="checkbox" name="chk_xpay2" value='y'>계좌이체&nbsp;&nbsp;
                    <input type="checkbox" name="chk_xpay3" value='y'>가상계좌
                    </td>
                </tr>
                <tr>
                    <td class="menu">사용 모드</td>
                    <td align="left">

                        <input type="radio" name="pg_mode" value="xpay_test" >TEST 모드&nbsp;&nbsp;&nbsp;&nbsp;
                        <input type="radio" name="pg_mode" value="xpay_service" >REAL 모드
                    </td>
                </tr>
                <tr>
                    <td class="menu">LG 유플러스 상점 ID</td>
                    <td align="left">
                        <span style="float:left;"><input type="text" name="shop_id_xpay" value="INIpayTest" class="form-control input-sm" style="width:300px;"></span>
                    </td>
                </tr>
                <tr>
                    <td class="menu">LG 유플러스 mertkey</td>
                    <td align="left">
                        <span style="float:left;"><input type="text" name="shop_key_xpay" value="SU5JTElURV9UUklQTEVERVNfS0VZU1RS" class="form-control input-sm" style="width:300px;"></span>
                    </td>
                </tr>
                </tbody>
                </table>

                <span id="display_kcp_title" style="display:none;"><h4><p class="text-light-blue"><i class="fa fa-fw fa-info-circle"></i> NHN KCP 일반결제 설정</p></h4></span>
                <table class="table table-bordered" id="display_kcp" style="display:none;">
                <tbody>
                <tr>
                    <td class="menu">사용 여부</td>
                    <td align="left">
                    <input type="checkbox" name="chk_use_kcp" value='y' checked=checked>사용함
                    </td>
                </tr>
                <tr>
                    <td class="menu">PG사 모듈 버전</td>
                    <td align="left">NHN KCP WEB 표준결제창 (V.3.0.0 - 20151125) / NHN KCP SmartPhone WEB 결제창 (V.3.0.0 - 20151125)</td>
                </tr>
                <tr>
                    <td class="menu">결제수단 설정</td>
                    <td align="left">
                    <input type="checkbox" name="chk_kcp1" value='y' checked=checked>신용카드&nbsp;&nbsp;
                    <input type="checkbox" name="chk_kcp2" value='y'>계좌이체&nbsp;&nbsp;
                    <input type="checkbox" name="chk_kcp3" value='y'>가상계좌
                    </td>
                </tr>
                <tr>
                    <td class="menu">사용 모드</td>
                    <td align="left">
                        <input type="radio" name="pg_mode" value="kcp_dev" >TEST 모드&nbsp;&nbsp;&nbsp;&nbsp;
                        <input type="radio" name="pg_mode" value="kcp_real" >REAL 모드
                    </td>
                </tr>
                <tr>
                    <td class="menu">사이트코드(site_cd)</td>
                    <td align="left">
                        <span style="float:left;"><input type="text" name="shop_id_kcp" value="INIpayTest" class="form-control input-sm" style="width:300px;"></span>
                    </td>
                </tr>
                <tr>
                    <td class="menu">사이트키(site_key)</td>
                    <td align="left">
                        <span style="float:left;"><input type="text" name="shop_key_kcp" value="SU5JTElURV9UUklQTEVERVNfS0VZU1RS" class="form-control input-sm" style="width:300px;"></span>
                    </td>
                </tr>
                </tbody>
                </table>

				<span id="display_naverpay_title" style="display:none;"><h4><p class="text-light-blue"><i class="fa fa-fw fa-info-circle"></i> 네이버페이 설정</p></h4></span>
                <table class="table table-bordered" id="display_naverpay" style="display:none;">
                <tbody>
                <tr>
                    <td class="menu">가맹점 ID</td>
                    <td align="left">
                        <input type="text" name="naverpay_shopid" value="yellowandsky" class="form-control input-sm" style="width:300px;" />
						<a href="https://admin.pay.naver.com/" target="_blank">네이버페이 센터 바로가기 &gt;</a>
                    </td>
                </tr>
                <tr>
                    <td class="menu">가맹점 인증키</td>
                    <td align="left">
                        <span style="float:left;"><input type="text" name="naverpay_certi_key" value="D2B73AA4-5FCE-4DA8-A7F1-1E7E37379B30" class="form-control input-sm" style="width:300px;" /></span>
                    </td>
                </tr>
				<tr>
                    <td class="menu">버튼 인증키</td>
                    <td align="left">
                        <span style="float:left;"><input type="text" name="naverpay_button_key" value="2DB98C5D-6939-49C9-B9FD-715537119256" class="form-control input-sm" style="width:300px;" /></span>
                    </td>
                </tr>
				<tr>
                    <td class="menu">사용 모드</td>
                    <td align="left">
                        <input type="radio" name="naverpay_mode" id="naverpay_mode1" value="t"  checked=checked> <label for="naverpay_mode1">TEST 모드</label>&nbsp;&nbsp;&nbsp;&nbsp;
                        <input type="radio" name="naverpay_mode" id="naverpay_mode2" value="s" > <label for="naverpay_mode2">REAL 모드</label>
                    </td>
                </tr>
				</tbody>
                </table>

				<span id="display_kakaopay_title" style="display:none;"><h4><p class="text-light-blue"><i class="fa fa-fw fa-info-circle"></i> 카카오페이 설정</p></h4></span>
                <table class="table table-bordered" id="display_kakaopay" style="display:none;">
                <tbody>
                <tr>
                    <td class="menu">가맹점 ID</td>
                    <td align="left">
                        <input type="text" name="kakaopay_cid" value="" class="form-control input-sm" style="width:300px;" />
						<a href="https://with.kakao.com/kakaopay/index" target="_blank">카카오페이 제휴신청 바로가기 &gt;</a><br />
						<a href="https://pg.kakao.com/" target="_blank">카카오페이 파트너 어드민 바로가기 &gt;</a>
                    </td>
                </tr>
                <tr>
                    <td class="menu">가맹점 인증키</td>
                    <td align="left">
                        <input type="text" name="kakaopay_apikey" value="" class="form-control input-sm" style="width:300px;" />

                    </td>
                </tr>
				<tr>
                    <td class="menu">사용 모드</td>
                    <td align="left">
                        <input type="radio" name="kakaopay_mode" id="kakaopay_mode1" value="t"  checked=checked> <label for="kakaopay_mode1">TEST 모드</label>&nbsp;&nbsp;&nbsp;&nbsp;
                        <input type="radio" name="kakaopay_mode" id="kakaopay_mode2" value="s" > <label for="kakaopay_mode2">REAL 모드</label>
                    </td>
                </tr>
				</tbody>
                </table>

                <span id="display_exim_title" style="display:none;"><h4><p class="text-light-blue"><i class="fa fa-fw fa-info-circle"></i> EXIMBAY 설정(해외결제)</p></h4></span>
                <table class="table table-bordered" id="display_exim" style="display:none;">
                <tbody>
                <tr>
                    <td class="menu">사용 여부</td>
                    <td align="left">
                    <input type="checkbox" name="chk_use_eximbay" value='Y' checked=${eximbay.useEximbay == 'Y' ? 'checked' : '' }>사용함
                    </td>
                </tr>
                <tr>
                    <td class="menu">PG사 모듈 버전</td>
                    <td align="left">${eximbay.moduleVersion == null ? '' : eximbay.moduleVersion }</td>
                </tr>
                <tr>
                    <td class="menu">결제수단 설정</td>
                    <td align="left">
                    <input type="checkbox" name="chk_eximbay1" value='card' ${eximbay.useCredit == 'Y' ? 'checked' : '' }>CreditCard&nbsp;&nbsp;
                    <input type="checkbox" name="chk_eximbay2" value='paypal' ${eximbay.usePaypal == 'Y' ? 'checked' : '' }>Paypal&nbsp;&nbsp;
                    <input type="checkbox" name="chk_eximbay3" value='unionpay' ${eximbay.useUnion == 'Y' ? 'checked' : '' }>UnionPay&nbsp;&nbsp;
                    <input type="checkbox" name="chk_eximbay4" value='alipay' ${eximbay.useAli == 'Y' ? 'checked' : '' }>Alipay
                    </td>
                </tr>
                <tr>
                    <td class="menu">사용 모드</td>
                    <td align="left">
                        <input type="radio" name="overseas_mode" value="1" ${eximbay.pgMode == 1 ? 'checked' : '' }>TEST 모드&nbsp;&nbsp;&nbsp;&nbsp;
                        <input type="radio" name="overseas_mode" value="2" ${eximbay.pgMode == 2 ? 'checked' : '' }>REAL 모드
                    </td>
                </tr>
                <tr>
                    <td class="menu">mid</td>
                    <td align="left">
                        <span style="float:left;"><input type="text" name="shop_id_eximbay" value="${eximbay.mid == null ? '' : eximbay.mid }" class="form-control input-sm" style="width:300px;"></span>
                    </td>
                </tr>
                <tr>
                    <td class="menu">Secret Key</td>
                    <td align="left">
                        <span style="float:left;"><input type="text" name="shop_key_eximbay" value="${eximbay.secretKey == null ? '' : eximbay.secretKey }" class="form-control input-sm" style="width:300px;"></span>
                    </td>
                </tr>
                </tbody>
                </table>

                <h4><p class="text-light-blue"><i class="fa fa-fw fa-info-circle"></i> 네이버 쇼핑 연동</p></h4>
                <table class="table table-bordered">
                <tbody>
                <tr>
                    <td class="menu">tsv파일 실행주소</td>
                    <td align="left">
                    ${naverShopping.tsvUrl == null ? '' : naverShopping.tsvUrl }
                    </td>
                </tr>
                <tr>
                    <td class="menu">상품 DB URL</td>
                    <td align="left">
                     ${naverShopping.productDbUrl == null ? '' : naverShopping.productDbUrl }
                    </td>
                </tr>
                <tr>
                    <td class="menu">네이버 쇼핑파트너존</td>
                    <td align="left">
                    1. 입점 신청 : <a href="https://join.shopping.naver.com" target="_blank">입점신청 바로가기</a><br>
                    2. 위 실행주소를 복사후에 <a href="https://adcenter.shopping.naver.com/member/login/form.nhn?targetUrl=%2Fmain.nhn" target="_blank">[상품 DB URL 등록하기]</a>에서 등록하세요.<br>
                    </td>
                </tr>
                </tbody>
                </table>

                <div style="text-align:center; padding:20px 0px 0 0px"><button type="button" onclick="register()" class="btn btn-primary">확인</button></div>
                </form>

                </div><!-- /.box-body -->
            </div><!-- /.box -->
        </div><!-- /.col-xs-12 -->
    </div><!-- /.row -->
</section>
</div><!-- /.content-wrapper -->

<script>
function checkGubun() {
    var form = document.form_register;
	if ((form.chk_gubun1.checked == true) && (form.chk_gubun2.checked == true)) { // 국내/해외
		$('#display_pg').show();

		$('#display_exim_title').show();
		$('#display_exim').show();

		$('#display_ease_pg').show();
    }else if (form.chk_gubun1.checked == true) {  // 국내
		$('#display_pg').show();
		$('#display_ease_pg').show();

		$('#display_exim_title').hide();
		$('#display_exim').hide();
        $("input:checkbox[name='chk_use_eximbay']").prop("checked",false);
        $("input:checkbox[name='chk_eximbay1']").prop("checked",false);
        $("input:checkbox[name='chk_eximbay2']").prop("checked",false);
        $("input:checkbox[name='chk_eximbay3']").prop("checked",false);
        $("input:checkbox[name='chk_eximbay4']").prop("checked",false);
        $("input[name='shop_id_eximbay']").prop("value",'');
        $("input[name='shop_key_eximbay']").prop("value",'');
	}else if (form.chk_gubun2.checked == true) { // 해외
		$('#display_pg').hide();

        $("input:radio[name='card_pg']:radio[value='ini']").prop("checked",false);
        $("input:radio[name='card_pg']:radio[value='xpay']").prop("checked",false);
        $("input:radio[name='card_pg']:radio[value='kcp']").prop("checked",false);

		$('#display_ini_title').hide();
		$('#display_ini').hide();
		$('#display_xpay_title').hide();
		$('#display_xpay').hide();
		$('#display_kcp_title').hide();
		$('#display_kcp').hide();
		$('#display_exim_title').show();
		$('#display_exim').show();

		$('#display_ease_pg').hide();
		hideNaverPay();
		hideKakaoPay();
    }else{
		$('#display_pg').hide();
		$('#display_ease_pg').hide();
        $("input:radio[name='card_pg']:radio[value='ini']").prop("checked",false);
        $("input:radio[name='card_pg']:radio[value='xpay']").prop("checked",false);
        $("input:radio[name='card_pg']:radio[value='kcp']").prop("checked",false);

		$('#display_ini_title').hide();
		$('#display_ini').hide();
		$('#display_xpay_title').hide();
		$('#display_xpay').hide();
		$('#display_kcp_title').hide();
		$('#display_kcp').hide();
		$('#display_exim_title').hide();
		$('#display_exim').hide();
        $("input:checkbox[name='chk_use_eximbay']").prop("checked",false);
        $("input:checkbox[name='chk_eximbay1']").prop("checked",false);
        $("input:checkbox[name='chk_eximbay2']").prop("checked",false);
        $("input:checkbox[name='chk_eximbay3']").prop("checked",false);
        $("input:checkbox[name='chk_eximbay4']").prop("checked",false);
        $("input[name='shop_id_eximbay']").prop("value",'');
        $("input[name='shop_key_eximbay']").prop("value",'');
	}
}

function checkCardPGType(type) {
    if (type == 'ini') { // KG 이니시스
		$('#display_ini_title').show();
		$('#display_ini').show();
		$('#display_xpay_title').hide();
		$('#display_xpay').hide();
		$('#display_kcp_title').hide();
		$('#display_kcp').hide();

        $("input:checkbox[name='chk_use_xpay']").prop("checked",false);
        $("input:checkbox[name='chk_xpay1']").prop("checked",false);
        $("input:checkbox[name='chk_xpay2']").prop("checked",false);
        $("input:checkbox[name='chk_xpay3']").prop("checked",false);
        $("input[name='shop_id_xpay']").prop("value",'');
        $("input[name='shop_key_xpay']").prop("value",'');
        $("input:checkbox[name='chk_use_kcp']").prop("checked",false);
        $("input:checkbox[name='chk_kcp1']").prop("checked",false);
        $("input:checkbox[name='chk_kcp2']").prop("checked",false);
        $("input:checkbox[name='chk_kcp3']").prop("checked",false);
        $("input[name='shop_id_kcp']").prop("value",'');
        $("input[name='shop_key_kcp']").prop("value",'');

	}else if (type == 'xpay') {   // LG 유플러스
		$('#display_ini_title').hide();
		$('#display_ini').hide();
		$('#display_xpay_title').show();
		$('#display_xpay').show();
		$('#display_kcp_title').hide();
		$('#display_kcp').hide();

        $("input:checkbox[name='chk_use_ini']").prop("checked",false);
        $("input:checkbox[name='chk_ini1']").prop("checked",false);
        $("input:checkbox[name='chk_ini2']").prop("checked",false);
        $("input:checkbox[name='chk_ini3']").prop("checked",false);
        $("input[name='shop_id_ini']").prop("value",'');
        $("input[name='shop_key_ini']").prop("value",'');
        $("input:checkbox[name='chk_use_kcp']").prop("checked",false);
        $("input:checkbox[name='chk_kcp1']").prop("checked",false);
        $("input:checkbox[name='chk_kcp2']").prop("checked",false);
        $("input:checkbox[name='chk_kcp3']").prop("checked",false);
        $("input[name='shop_id_kcp']").prop("value",'');
        $("input[name='shop_key_kcp']").prop("value",'');

    }else if (type == 'kcp') {  // NHN KCP
		$('#display_ini_title').hide();
		$('#display_ini').hide();
        $('input[name=\'shop_id_ini\']').attr('value','');
        $('input[name=\'shop_key_ini\']').attr('value','');
		$('#display_xpay_title').hide();
		$('#display_xpay').hide();
		$('#display_kcp_title').show();
		$('#display_kcp').show();

        $("input:checkbox[name='chk_use_ini']").prop("checked",false);
        $("input:checkbox[name='chk_ini1']").prop("checked",false);
        $("input:checkbox[name='chk_ini2']").prop("checked",false);
        $("input:checkbox[name='chk_ini3']").prop("checked",false);
        $("input[name='shop_id_ini']").prop("value",'');
        $("input[name='shop_key_ini']").prop("value",'');
        $("input:checkbox[name='chk_use_xpay']").prop("checked",false);
        $("input:checkbox[name='chk_xpay1']").prop("checked",false);
        $("input:checkbox[name='chk_xpay2']").prop("checked",false);
        $("input:checkbox[name='chk_xpay3']").prop("checked",false);
        $("input[name='shop_id_xpay']").prop("value",'');
        $("input[name='shop_key_xpay']").prop("value",'');

	}
}

function checkEasyPGNaver(useYn){
	if(useYn == true || useYn == 'y'){
		$('#display_naverpay_title').show();
		$('#display_naverpay').show();
	}else{
		hideNaverPay();
	}
}

function hideNaverPay(){
	$('#display_naverpay_title').hide();
	$('#display_naverpay').hide();

	//값 초기화
	$("input:checkbox[name='naverpay_use']").prop("checked",false);
	$("input[name='naverpay_shopid']").prop("value",'');
	$("input[name='naverpay_certi_key']").prop("value",'');
	$("input[name='naverpay_button_key']").prop("value",'');
	$("input:checkbox[name='naverpay_mode']").prop("checked",false);
}

function checkEasyPGKakao(useYn){
	if(useYn == true || useYn == 'y'){
		$('#display_kakaopay_title').show();
		$('#display_kakaopay').show();
	}else{
		hideKakaoPay();
	}
}

function hideKakaoPay(){
}

function register() {

    var form = document.form_register;
	if ((form.chk_gubun1.checked == false) && (form.chk_gubun2.checked == false)) { alert('국내/해외 여부가 선택되지 않았습니다.'); form.chk_gubun1.focus(); return false;}
    if (form.chk_gubun1.checked == true){
        if(!$('input:radio[name=\'card_pg\']').is(':checked')) { alert('국내 카드PG사를 체크하세요.'); return false;}
    }

	if (form.chk_gubun1.checked == true) {   // 국내
        var radioArr = $('input[name=card_pg]:radio');
        if (radioArr[0].checked == true){       // KG 이니시스
            if(!$('input:checkbox[name=\'chk_use_ini\']').is(':checked')) { alert('사용여부를 선택하세요.'); return false;}
            if(!$('input:checkbox[name=\'chk_ini1\']').is(':checked') && !$('input:checkbox[name=\'chk_ini2\']').is(':checked') && !$('input:checkbox[name=\'chk_ini3\']').is(':checked')) { alert('결제수단을 선택하세요.'); return false;}
        }else if (radioArr[1].checked == true){     // LG 유플러스
            if(!$('input:checkbox[name=\'chk_use_xpay\']').is(':checked')) { alert('사용여부를 선택하세요.'); return false;}
            if(!$('input:checkbox[name=\'chk_xpay1\']').is(':checked') && !$('input:checkbox[name=\'chk_xpay2\']').is(':checked') && !$('input:checkbox[name=\'chk_xpay3\']').is(':checked')) { alert('결제수단을 선택하세요.'); return false;}
        }else if (radioArr[2].checked == true){     // NHN KCP
            if(!$('input:checkbox[name=\'chk_use_kcp\']').is(':checked')) { alert('사용여부를 선택하세요.'); return false;}
            if(!$('input:checkbox[name=\'chk_kcp1\']').is(':checked') && !$('input:checkbox[name=\'chk_kcp2\']').is(':checked') && !$('input:checkbox[name=\'chk_kcp3\']').is(':checked')) { alert('결제수단을 선택하세요.'); return false;}
        }
        if(!$('input:radio[name=\'pg_mode\']').is(':checked')) { alert('사용모드를 체크하세요.'); return false;}
    }

	if (form.chk_gubun2.checked == true) {   //해외
        if(!$('input:checkbox[name=\'chk_use_eximbay\']').is(':checked')) { alert('사용여부를 선택하세요.'); return false;}
        if(!$('input:checkbox[name=\'chk_eximbay1\']').is(':checked') && !$('input:checkbox[name=\'chk_eximbay2\']').is(':checked') && !$('input:checkbox[name=\'chk_eximbay3\']').is(':checked') && !$('input:checkbox[name=\'chk_eximbay4\']').is(':checked')) { alert('결제수단을 선택하세요.'); return false;}
        if(!$('input:radio[name=\'overseas_mode\']').is(':checked')) { alert('사용모드를 체크하세요.'); return false;}
    }

	if (form.naverpay_use.checked == true){
        if(form.naverpay_shopid.value == '') { alert('네이버페이 가맹점 ID를 입력해주세요.');  form.naverpay_shopid.focus(); return false;}
		if(form.naverpay_certi_key.value == '') { alert('네이버페이 가맹점 인증키를 입력해주세요.');  form.naverpay_certi_key.focus(); return false;}
		if(form.naverpay_button_key.value == '') { alert('네이버페이 버튼 인증키를 입력해주세요.');  form.naverpay_button_key.focus(); return false;}
    }

	form_register.target = 'iframe_process';
    form_register.submit();
}

$(document).ready(function(){
    $.ajax({
		url:'http://demoshop.mir9.kr/api/process.php',
		type:'post',
		dataType:'json',
		data:{
			method : 'Setting.infoPG'
		},
		success:function(data, textStatus, jqXHR){
            var json_data = data.data;
            //console.log(json_data);

			if(json_data.pg_domestic=='y'){
				checkGubun();
                checkCardPGType(json_data.pg_company);

				checkEasyPGNaver(json_data.naverpay_use);
			}
			if(json_data.pg_overseas=='y'){
				checkGubun();
			}
            // 해외결제수단 설정
            var arrOverseas = json_data.overseas_payment.split('|');
			if(arrOverseas[0]=='card'){
				form_register.chk_eximbay1.checked = true;
			}
			if (arrOverseas[1]=='paypal') {
				form_register.chk_eximbay2.checked = true;
			}
			if (arrOverseas[2]=='unionpay') {
				form_register.chk_eximbay3.checked = true;
			}
			if (arrOverseas[3]=='alipay') {
				form_register.chk_eximbay4.checked = true;
			}
            //$('form[name="form_register"] #mode').val('update');
            //$('[name=code]').val(code);
            //$('[name=contents]').val(json_data.title);
		},
		error:function(jqXHR, textStatus, errorThrown){
			console.log(textStatus);
		}
	});
});


</script>

<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>