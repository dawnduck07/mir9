<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="_csrf_header" id="_csrf_header" content="X-CSRF-TOKEN">
<meta name="_csrf" id="_scrf" content="ee76a9b6-4532-490f-9560-f9324f453668">
<title>AdminLTE 2 | 게시판 관리</title>
<!-- Tell the browser to be responsive to screen width -->
<meta
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no"
	name="viewport">

<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<!-- Bootstrap 3.3.7 -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"
	integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49"
	crossorigin="anonymous"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"
	integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy"
	crossorigin="anonymous"></script>
<!-- Font Awesome -->
<script src="https://kit.fontawesome.com/76afde4c0b.js"
	crossorigin="anonymous"></script>
<!-- Ionicons -->
<script src="https://unpkg.com/ionicons@4.4.1/dist/ionicons.js"></script>
<!-- jvectormap -->
<link rel="stylesheet" href="/mir9/resources/css/jquery.vector-map.css">
<!-- Theme style -->
<link rel="stylesheet" href="/mir9/resources/css/AdminLTE.min.css">
<!-- AdminLTE Skins. Choose a skin from the css/skins folder instead of downloading all of them to reduce the load. -->
<link rel="stylesheet" href="/mir9/resources/css/_all-skins.min.css">
<link href="/mir9/resources/css/admin.css" rel="stylesheet" type="text/css" />

<!-- fullcalendar -->
<link href="//mir9.co.kr/resource/css/bootstrap-colorselector.css"
	rel="stylesheet" />
<link
	href="//mir9.co.kr/resource/js/AdminLTE-2.4.2/bower_components/fullcalendar/dist/fullcalendar.min.css"
	rel="stylesheet" type="text/css" />
<link
	href="//mir9.co.kr/resource/js/AdminLTE-2.4.2/bower_components/fullcalendar/dist/fullcalendar.print.css"
	rel="stylesheet" type="text/css" media='print' />
<link rel="stylesheet" href="/mir9/resources/css/bootstrap.min.css">
<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
<script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
<script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
<![endif]-->
<!-- Google Font -->
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">
<link href="/mir9/resources/css/jquery-ui.css" rel="stylesheet" />

<script type="text/javascript">
	
	$(function(){
		
		$("a[name='board']").one("click", function(){
			
			$.ajax({
				url : "/mir9/board/json/listBoard",
				method : "GET" ,
				dataType : "json" ,
				headers : {
					"Accept" : "application/json",
					"Content-Type" : "application/json"
				},
				success : function(Data, status){
					
					var display = '';
					if(Data.length > 0){
						for(var i = 0; i < Data.length; i++){
							display = "<li>"
									+ "<a href=/mir9/board/postList?boardNo="+Data[i].boardNo+">"
									+ "<i class='fa fa-circle-o'></i> "+Data[i].boardTitle
									+ "</a>"
									+ "</li>"
							$('#boardMenu').append(display);
						}
					}
					
				}
			})
				
		})		

		
	})

	

</script>
<!-- redirect Msg 처리 : deliveryController 참조 -->


	
</head>
<body class="hold-transition skin-red sidebar-mini">
	<iframe name="iframe_process" width="0" height="0" frameborder="0"
		style="display: none;"></iframe>

	<div class="wrapper">

		<!-- header -->
		<header class="main-header">
			<a href="/admin" class="logo"> <!-- mini logo for sidebar mini 50x50 pixels -->
				<span class="logo-mini"><b>A</b></span> <!-- logo for regular state and mobile devices -->
				<span class="logo-lg"><b>MIR9 SHOP Admin</b></span>
			</a>

			<nav class="navbar navbar-static-top">
				<!-- Sidebar toggle button-->
				<a href="#" class="sidebar-toggle" data-toggle="push-menu"
					role="button"> <span class="sr-only">Toggle navigation</span>
				</a>

				<div class="navbar-custom-menu">
					<ul class="nav navbar-nav">
						<li class="dropdown user user-menu">
						
						<a href="#"
							class="dropdown-toggle" data-toggle="dropdown"> <img
								src="https://mir9.co.kr/resource/js/AdminLTE-2.4.2/dist/img/avatar5.png"
								class="user-image" alt="User Image" /> <span class="hidden-xs">admin
										&#91;ROLE&#95;ADMIN&#93;님</span>
						</a>
							<ul class="dropdown-menu">
								<li class="user-header"><img
									src="https://mir9.co.kr/resource/js/AdminLTE-2.4.2/dist/img/avatar5.png"
									class="img-circle" alt="User Image" />
									<p>
										admin
										님 - Web
										Administrator <small>MIR9 SHOP 관리자</small>
									</p></li>
								<li class="user-footer">
									<div class="pull-left">
										<button 
									    	class="btn btn-outline-success my-2 my-sm-0" 
									    	type="button"
									    	onclick="location.href='/mir9/member/memberWithdrawal.do';">탈퇴</button>
									</div>
									<div class="pull-right">
										<form id="memberLogoutFrm" name="memberLogoutFrm" action="/mir9/member/memberLogout.do" method="POST">
											<a
												onclick="logoutSubmit()"
												class="btn btn-danger btn-flat"
												type="submit">Sign out</a>
										<div>
<input type="hidden" name="_csrf" value="ee76a9b6-4532-490f-9560-f9324f453668" />
</div></form>
									</div>
								</li>
							</ul></li>
					</ul>
				</div>
			</nav>
		</header>
		<!-- /.header -->
		<!-- sidebar -->
		<aside class="main-sidebar">
			<section class="sidebar">
				<ul class="sidebar-menu" data-widget="tree">
					<li class="header">MAIN NAVIGATION</li>
					<li><a href="/mir9/dashBoard"> <i
							class="fa fa-dashboard"></i> <span>Dashboard</span>
					</a></li>
					<li class="treeview"><a href="#"> <i
							class="fa fa-shopping-cart"></i> <span>주문 관리</span> <i
							class="fa fa-angle-left pull-right"></i>
					</a>
						<ul class="treeview-menu">
							<li class="active"><a href="/mir9/order/list"><i
									class="fa fa-circle-o"></i> 주문 리스트</a></li>
							<li><a href="https://iniweb.inicis.com/security/login.do"
								target="_new"><i class="fa fa-circle-o"></i> 이니시스 상점관리자</a></li>
							<li><a href="/mir9/order/log_list"><i
									class="fa fa-circle-o"></i>카드결제로그 리스트</a></li>
						</ul></li>
					<li class="treeview"><a href="#"> <i
							class="fa fa-file-text-o"></i> <span>메뉴 관리</span> <i
							class="fa fa-angle-left pull-right"></i>
					</a>
						<ul class="treeview-menu">
							<li class="active"><a
								href="/mir9/menu/menu"><i
									class="fa fa-circle-o"></i> 메뉴 관리</a></li>
							<li><a href="/mir9/head/headList"><i
									class="fa fa-circle-o"></i> 헤더 관리</a></li>
							<li><a href="/mir9/bottom/bottomList"><i
									class="fa fa-circle-o"></i> 하단 관리</a></li>
							<li><a href="/mir9/menu/meta"><i
									class="fa fa-circle-o"></i> 메타 관리</a></li>
						</ul></li>

					<li class="treeview"><a href="#" name="board"> <i class="fa fa-list-alt"></i> 
					<span>게시판 관리</span> <i class="fa fa-angle-left pull-right"></i>
					</a>
						<ul class="treeview-menu" id="boardMenu" >
							<li><a href="/mir9/board/listBoard"><i
									class="fa fa-circle-o"></i> 리스트</a></li>
						</ul>
					</li>
					<li class="treeview"><a href="/mir9/product/list"> <i class="fa fa-gift"></i>
							<span>제품</span> <i class="fa fa-angle-left pull-right"></i>
					</a>
						<ul class="treeview-menu">
							<li class="active"><a href="/mir9/product/list"><i
									class="fa fa-circle-o"></i> 리스트 </a></li>
							<li><a href="/mir9/product/category"><i
									class="fa fa-circle-o"></i> 카테고리 </a></li>
							<li><a href="/mir9/product/option"><i
									class="fa fa-circle-o"></i> 자주쓰는 옵션 관리 </a></li>
						</ul></li>
					<li class="treeview"><a href="#"> <i class="fa fa-user"></i>
							<span>회원 관리</span> <i class="fa fa-angle-left pull-right"></i>
					</a>
						<ul class="treeview-menu">
							<li class="active"><a href="/mir9/member/list.do"><i
									class="fa fa-circle-o"></i> 회원 리스트</a></li>
							<li><a href="/mir9/member/withdraw_list"><i
									class="fa fa-circle-o"></i> 탈퇴회원 리스트</a></li>
							<li><a href="/mir9/member/log"><i
									class="fa fa-circle-o"></i> 회원 접속이력 관리</a></li>
							<li><a href="/mir9/member/memberGrade.do"><i
									class="fa fa-circle-o"></i> 등급 관리</a></li>
							<li><a href="/mir9/member/point"><i
									class="fa fa-circle-o"></i> 회원 적립금 관리</a></li>
						</ul></li>
					<li class=""><a href="/mir9/schedule/schedule"> <i
							class="fa fa-calendar"></i> <span>일정 관리</span>
					</a></li>
					<li class="treeview"><a href="#"> <i
							class="fa fa-check-square-o"></i> <span>폼메일 관리</span> <i
							class="fa fa-angle-left pull-right"></i>
					</a>
						<ul class="treeview-menu">
							<li><a href="index.php/mir9/form/manage"><i
									class="fa fa-circle-o"></i> 리스트</a></li>
							<li><a href="index.php/mir9/form/list&form_code=1"><i
									class="fa fa-circle-o"></i> 문의사항</a></li>
						</ul></li>
					<li class="treeview"><a href="#"> <i
							class="fa fa-shopping-cart"></i> <span>통계</span> <i
							class="fa fa-angle-left pull-right"></i>
					</a>
						<ul class="treeview-menu">
							<li><a href="/mir9/statistics/period_day"><i
									class="fa fa-circle-o"></i>기간별 매출 통계 </a></li>
							<li><a href="/mir9/statistics/product"><i
									class="fa fa-circle-o"></i>제품별 매출 통계 </a></li>
							<li><a href="/mir9/statistics/member"><i
									class="fa fa-circle-o"></i>회원별 매출 통계 </a></li>
							<li><a href="/mir9/statistics/address_day"><i
									class="fa fa-circle-o"></i>지역별 매출 통계 </a></li>
						</ul></li>
					<li class="treeview"><a href="#"> <i
							class="fa fa-commenting"></i> <span>커뮤니티 관리</span> <i
							class="fa fa-angle-left pull-right"></i>
					</a>
						<ul class="treeview-menu">
							<li><a href="/mir9/comm/email"><i
									class="fa fa-circle-o"></i>메일 설정</a></li>
							<li><a href="/mir9/comm/email_list"><i
									class="fa fa-circle-o"></i>메일 발송 내역</a></li>
							<li><a href="/mir9/comm/sms"><i
									class="fa fa-circle-o"></i>SMS 설정</a></li>
							<li><a href="/mir9/comm/sms_list"><i
									class="fa fa-circle-o"></i>SMS 발송 내역</a></li>
							<li><a href="/mir9/comm/review"><i
									class="fa fa-circle-o"></i>주문후기 리스트</a></li>
						</ul></li>
					<li class="treeview"><a href="#"> <i class="fa fa-gear"></i>
							<span>설정</span> <i class="fa fa-angle-left pull-right"></i>
					</a>
						<ul class="treeview-menu">
							<li><a href="/mir9/setting/point"><i
									class="fa fa-circle-o"></i> 적립금 관리</a></li>
							<li><a href="/mir9/setting/coupon"><i
									class="fa fa-circle-o"></i> 쿠폰 관리</a></li>
							<li><a href="/mir9/setting/popup"><i
									class="fa fa-circle-o"></i> 팝업 관리</a></li>
							<li><a href="/mir9/setting/map"><i
									class="fa fa-circle-o"></i> 약도 관리</a></li>
							<li><a href="/mir9/setting/staff"><i
									class="fa fa-circle-o"></i> 임원 관리</a></li>
							<li><a href="/mir9/setting/history"><i
									class="fa fa-circle-o"></i> 연혁 관리</a></li>
							<li><a href="/mir9/setting/banner"><i
									class="fa fa-circle-o"></i> 배너 관리</a></li>
							<li><a href="/mir9/setting/contract"><i
									class="fa fa-circle-o"></i> 약관 관리</a></li>
							<li><a href="/mir9/setting/delivery_setting"><i
									class="fa fa-circle-o"></i> 배송 설정</a></li>
							<li><a href="/mir9/setting/delivery_company"><i
									class="fa fa-circle-o"></i> 택배사 관리</a></li>
							<li><a href="/mir9/setting/info"><i
									class="fa fa-circle-o"></i> 기본 설정</a></li>
							<li><a href="/mir9/setting/seo"><i
									class="fa fa-circle-o"></i> SEO 설정</a></li>
							<li><a href="/mir9/setting/paymentpg"><i
									class="fa fa-circle-o"></i> 결제PG 설정</a></li>
							<li><a href="/mir9/setting/snslogin"><i
									class="fa fa-circle-o"></i> SNS 연동 설정</a></li>
							<li><a href="/mir9/setting/locale"><i
									class="fa fa-circle-o"></i> 다국어 번역</a></li>
						</ul></li>
					<li><a href="/mir9/setting/version"> <i
							class="fa fa-exclamation-circle"></i> <span>Version</span> <small
							class="label pull-right bg-green">2.8.1</small>
					</a></li>
				</ul>
			</section>
		</aside>
		<!-- /.sidebar -->
		

<script>
function logoutSubmit(){
	$(document.memberLogoutFrm).submit();
}
</script>

<style>
.table {
    margin-bottom : 0px;
}
</style>
<div class="content-wrapper">
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
<script src="https://mir9.co.kr/resource/js/ckeditor4.7.2/ckeditor.js"></script>

	<section class="content-header">
	    <h1>
	    메뉴 관리
	    <small>menu list</small>
	    </h1>
	
	    <ol class="breadcrumb">
	        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
	        <li><a href="#">메뉴 관리</a></li>
	        <li class="active">메뉴 관리</li>
	    </ol>
	</section>
	
	<section class="content">
	    <div class="row">
	        <div class="col-xs-12">
	            <div class="box">
	                <div class="box-body">
	                <div class="col-xs-3" style="padding:0 5px 0 0;">
	                <iframe name="tree" id="iframe_tree" src="/mir9/menu/tree" width="100%" scrolling="auto" frameborder="1" height="769"></iframe>
	                </div>
	
	                <div class="col-xs-9" style="padding:0 5px 0 0;">
	                <iframe name="list" id="iframe_list" src="/mir9/menu/menuList" width="100%" scrolling="auto" frameborder="1" height="769"></iframe>
	                </div>
	                </div><!-- /.box-body -->
	            </div><!-- /.box -->
	        </div><!-- /.col-xs-12 -->
	    </div><!-- /.row -->
	</section>
	
	
    


<!-- 리비젼 보기 부터 -->
<div class="modal fade" id="modalContent" tabindex="-2" role="dialog" aria-labelledby="myModal" aria-hidden="true" style="display: none;">
    <div class="modal-dialog" style="width:90%;">
        <div class="modal-content">
            <form name="form_register" method="post" onsubmit="return false;" action="/mir9/menu/addMenu?_csrf=ee76a9b6-4532-490f-9560-f9324f453668">
            <input type="hidden" name="mode" value="insertMenu">
            <input type="hidden" name="originNo" id="originCode">
            <input type="hidden" name="ord" id="ordCode">
            
            <input type="hidden" name="locale" value="ko">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                <h4 class="modal-title">메뉴 등록</h4>
            </div>
            <div class="modal-body">
            <div class="row" style="margin:0">
                <div class="col-xs-4">
                <span style="float:left;"><h4><p class="text-light-blue"><i class="fa fa-fw fa-info-circle"></i> 메뉴 등록</p></h4></span>
                <span style="float:left; padding:5px 0 0 10px;"><button type="button" onclick="onclickManual();" class="btn btn-warning btn-xs"><i class="fa fa-fw fa-question-circle"></i> 프로그램 연동 방법</button></span>
                </div>

                <div class="col-xs-8" style="padding:0">
                <div class="btn-group pull-right">
      <button type="button" id="locale_ko" onclick="setLocale('ko')" class="btn btn-primary"><i class="fa fa-globe" aria-hidden="true"></i> 한국어</button>      <button type="button" id="locale_en" onclick="setLocale('en')" class="btn btn-default"><i class="fa fa-globe" aria-hidden="true"></i> ENG</button>      <button type="button" id="locale_zh" onclick="setLocale('zh')" class="btn btn-default"><i class="fa fa-globe" aria-hidden="true"></i> 中国</button>      <button type="button" id="locale_vn" onclick="setLocale('vn')" class="btn btn-default"><i class="fa fa-globe" aria-hidden="true"></i> Tiếng việt</button>                </div>
                </div>
            </div>

            <table class="table table-bordered">
            <tbody>
            <tr>
                <td class="menu">메뉴명</td>
                <td align="left"><input type="text" name="title" class="form-control input-sm"></td>
                <td class="menu">url &nbsp;&nbsp;<input type="checkbox" name="is_outer_link" onclick="checkOuterLink()" value="y"> <small>외부링크</small></td>
                <td align="left">
                <select id="displayOuterLink" name="target" class="form-control input-sm" style="width: 25%; padding: 0px; margin-right: 5px; float: left; display: none;">
                <option value="_blank">새창</option>
                <option value="_self">현재창</option>
                </select>
                <input type="text" name="url" class="form-control input-sm" style="width:70%; float:left;">
                </td>
                <td class="menu">상태</td>
				<td>
                <select name="status" class="form-control input-sm" style="width:100px;">
     				 <option value="y">보임</option>      <option value="n">숨김</option>                </select>
                </td>
                <td class="menu">헤더선택</td>
                <td>
                <select name="menu_head_code" class="form-control input-sm">
                	    <option value="0">선택하세요</option>
	                
	      				<option value="2">ABOUT</option>        
	      			
	      				<option value="3">PRODUCTS</option>        
	      			
	      				<option value="4">RnD</option>        
	      			
	      				<option value="5">company</option>        
	      			
	      				<option value="6">contact</option>        
	      			             
      			</select>
                </td>
                <td class="menu">메타 태그</td>
                <td align="left"><input type="checkbox" name="is_meta" onclick="checkMeta()" value="y"> 사용</td>
            </tr>
            <tr id="displayMeta" style="display: none;">
                <td class="menu">메타 태그</td>
                <td align="left" colspan="9">
                <span style="float:left; padding:5px 5px 0 0;">title </span>
                <span style="float:left;"><input type="text" name="meta_title" class="form-control input-sm" style="width:500px;"></span>
                <span style="float:left; padding:5px 5px 0 10px;">description </span>
                <span style="float:left;"><input type="text" name="meta_description" class="form-control input-sm" style="width:500px;"></span>
                </td>
            </tr>
            <tr>
                <td align="left" colspan="10" style="padding:0">
                <textarea name="content" id="content-editor" onfocus="javascript:this.value=''" rows="10" cols="80" "></textarea>
                </td>
            </tr>
            </tbody></table>
            
            </div></form>

            </div>
            <div class="modal-footer">
            <button type="button" id="displayButton" onclick="register();" class="btn btn-primary">저장하기</button>
            </div>
        </div>
    </div>
</div>    
   
	
    



   <!-- update모달 -->
	<div class="modal fade" id="modalContent2" tabindex="-2" role="dialog" aria-labelledby="myModal" aria-hidden="true" style="display: none;">
    <div class="modal-dialog" style="width:90%;">
        <div class="modal-content">
            <form name="form_register2" method="post" onsubmit="return false;" action="/mir9/menu/updateMenu?_csrf=ee76a9b6-4532-490f-9560-f9324f453668">
            <input type="hidden" name="mode" value="insertMenu">
            <input type="hidden" name="code" id="getCode">
            
            <input type="hidden" name="locale" value="ko">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                <h4 class="modal-title">메뉴 등록</h4>
            </div>
            <div class="modal-body">
            <div class="row" style="margin:0">
                <div class="col-xs-4">
                <span style="float:left;"><h4><p class="text-light-blue"><i class="fa fa-fw fa-info-circle"></i> 메뉴 등록</p></h4></span>
                <span style="float:left; padding:5px 0 0 10px;"><button type="button" onclick="onclickManual();" class="btn btn-warning btn-xs"><i class="fa fa-fw fa-question-circle"></i> 프로그램 연동 방법</button></span>
                </div>

                <div class="col-xs-8" style="padding:0">
                <div class="btn-group pull-right">
      <button type="button" id="locale_ko" onclick="setLocale('ko')" class="btn btn-primary"><i class="fa fa-globe" aria-hidden="true"></i> 한국어</button>      <button type="button" id="locale_en" onclick="setLocale('en')" class="btn btn-default"><i class="fa fa-globe" aria-hidden="true"></i> ENG</button>      <button type="button" id="locale_zh" onclick="setLocale('zh')" class="btn btn-default"><i class="fa fa-globe" aria-hidden="true"></i> 中国</button>      <button type="button" id="locale_vn" onclick="setLocale('vn')" class="btn btn-default"><i class="fa fa-globe" aria-hidden="true"></i> Tiếng việt</button>                </div>
                </div>
            </div>

            <table class="table table-bordered">
            <tbody><tr>
                <td class="menu">메뉴명</td>
                <td align="left"><input type="text" name="title" id="getTitle" class="form-control input-sm"></td>
                <td class="menu">url &nbsp;&nbsp;<input type="checkbox" name="is_outer_link" id="getIs_outer_link" onclick="checkOuterLink()" value="y"> <small>외부링크</small></td>
                <td align="left">
	                <select id="displayOuterLink" name="target" id="getTarget" class="form-control input-sm" style="width: 25%; padding: 0px; margin-right: 5px; float: left; display: none;">
		                <option value="_blank">새창</option>
		                <option value="_self">현재창</option>
	                </select>
                <input type="text" name="url" id="getUrl" class="form-control input-sm" style="width:70%; float:left;">
                </td>
                <td class="menu">상태</td>
				<td>
	                <select name="status" id="getStatus" class="form-control input-sm" style="width:100px;">
	      				<option value="y">보임</option>      
	      				<option value="n">숨김</option>                
	      			</select>
                </td>
                <td class="menu">헤더선택</td>
                <td>
	                <select name="menu_head_code" id="getMenu_head_code" class="form-control input-sm">
	                	    <option value="0">선택하세요</option>
		                
		      				<option value="2">ABOUT</option>        
		      			
		      				<option value="3">PRODUCTS</option>        
		      			
		      				<option value="4">RnD</option>        
		      			
		      				<option value="5">company</option>        
		      			
		      				<option value="6">contact</option>        
		      			                
	    			</select>
                </td>
                <td class="menu">메타 태그</td>
                <td align="left"><input type="checkbox" name="is_meta" id="getIs_meta" onclick="checkMeta()" value="y"> 사용</td>
            </tr>
            <tr id="displayMeta" style="display: none;">
                <td class="menu">메타 태그</td>
                <td align="left" colspan="9">
                <span style="float:left; padding:5px 5px 0 0;">title </span>
                <span style="float:left;"><input type="text" name="meta_title" id="getMeta_title" class="form-control input-sm" style="width:500px;"></span>
                <span style="float:left; padding:5px 5px 0 10px;">description </span>
                <span style="float:left;"><input type="text" name="meta_description" id="getMeta_description" class="form-control input-sm" style="width:500px;"></span>
                </td>
            </tr>
            <tr>
                <td align="left" colspan="10" style="padding:0">
                <textarea name="content" id="content-editor2" onfocus="javascript:this.value=''" rows="10" cols="80" "></textarea>
                </td>
            </tr>
            </tbody></table>
            
            </div></form>

            </div>
            <div class="modal-footer">
            <button type="button" id="displayButton" onclick="register2();" class="btn btn-primary">저장하기</button>
            <button type="button" class="btn btn-success">미리보기</button>
            </div>
        </div>
    </div>
    

	<div class="modal fade" id="modalManual" tabindex="-2" role="dialog" aria-labelledby="myModal" aria-hidden="true">
	    <div class="modal-dialog" style="width:700px;">
	        <div class="modal-content">
	            <div class="modal-header">
	                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
	                <h4 class="modal-title" id="myModalLabel">프로그램 연동 방법</h4>
	            </div>
	            <div class="modal-body">
	
	            <span style="float:left;"><h4><p class="text-light-blue"><i class="fa fa-fw fa-info-circle"></i> 최신글</p></h4></span>
	            <table class="table table-bordered">
	            <tbody><tr>
	                <td class="menu">게시판</td>
	                <td align="left">
	                [include:tpf=board/latest&amp;board_code=1&amp;print_data_count=5]<br>
	                - board_code : 게시판 코드<br>
	                - print_data_count : 표출 자료 수<br>
	                - <b style="color:red">folder</b> : 메인페이지에 삽입할때만 필요 (공지사항 주소 : http://mir9.co.kr/<b style="color:red">community/notice</b> 일때는 <b style="color:red">community/notice</b> 넣어주면 됨)
	                </td>
	            </tr>
	            <tr>
	                <td class="menu">상품</td>
	                <td align="left">
	                [include:tpf=product/latest&amp;print_data_count=5]<br>
	                - print_data_count : 표출 자료 수
	                </td>
	            </tr>
	            <tr>
	                <td class="menu">배너</td>
	                <td align="left">
	                [include:tpf=company/banner&amp;print_data_count=5]<br>
	                - print_data_count : 표출 자료 수
	                </td>
	            </tr>
	            </tbody></table>
	            <br>
	
	            <span style="float:left;"><h4><p class="text-light-blue"><i class="fa fa-fw fa-info-circle"></i> 리스트</p></h4></span>
	            <table class="table table-bordered">
	            <tbody><tr>
	                <td class="menu">게시판</td>
	                <td align="left">[include:tpf=board/list&amp;board_code=1&amp;print_data_count=5]<br>
	                - board_code : 게시판 코드<br>
	                - print_data_count : 표출 자료 수<br>
	                - <b style="color:red">folder</b> : 메인페이지에 삽입할때만 필요 (공지사항 주소 : http://mir9.co.kr/<b style="color:red">community/notice</b> 일때는 <b style="color:red">community/notice</b> 넣어주면 됨)
	                </td>
	            </tr>
	            <tr>
	                <td class="menu">상품</td>
	                <td align="left">
	                [include:tpf=product/list&amp;category_code=1010&amp;is_best=y]<br>
	                - category_code : 특정 카테고리만 표출<br>
	                - is_best, is_new, is_event : best, new, event 체크된 상품만 표출<br>
	                </td>
	            </tr>
	            <tr>
	                <td class="menu">폼메일</td>
	                <td align="left">
	                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;쓰기 : [include:tpf=form/write&amp;form_code=1]<br>
	                리스트 : [include:tpf=form/list&amp;form_code=1]<br>
	                </td>
	            </tr>
	            <tr>
	                <td class="menu">약도</td>
	                <td align="left">
	                [include:tpf=form/map&amp;code=1]<br>
	                </td>
	            </tr>
	            <tr>
	                <td class="menu">연혁</td>
	                <td align="left">
	                [include:tpf=company/history]<br>
	                [include:tpf=company/history&amp;start_year=2015&amp;end_year=2017]<br>
	                - start_year : 시작년도<br>
	                - end_year : 종료년도
	                </td>
	            </tr>
	            <tr>
	                <td class="menu">사이트맵</td>
	                <td align="left">
	                [include:tpf=company/sitemap]
	                </td>
	            </tr>
	            <tr>
	                <td class="menu">약관</td>
	                <td align="left">
	                이용약관 : [include:tpf=company/contract&amp;type=provision]<br>
	                개인정보 취급방침 : [include:tpf=company/contract&amp;type=privacy]<br>
	                이메일 무단수집 거부 : [include:tpf=company/contract&amp;type=email]
	                </td>
	            </tr>
	            </tbody></table>
	            <br>
	
	            <span style="float:left;"><h4><p class="text-light-blue"><i class="fa fa-fw fa-info-circle"></i> SNS</p></h4></span>
	            <table class="table table-bordered">
	            <tbody><tr>
	                <td class="menu">유튜브</td>
	                <td align="left">[include:tpf=sns/youtube&amp;id=<b style="color:red">UCCK-O1Qt1MMJMbA-Sy9T000A</b>&amp;height=500]<br>
	                해당 채널의 최신 유튜브 동영상 표출<br>
	                - id : 채널아이디<br>
	                - height : 높이값<br>
	                - width : 100% (디폴트)
	                </td>
	            </tr>
	            <tr>
	                <td class="menu">facebook</td>
	                <td align="left">
	                [include:tpf=sns/facebook&amp;id=<b style="color:red">gundamlab</b>&amp;height=500]<br>
	                페이스북 타임라인 가져오기<br>
	                - id : 페이스북 url (https://www.facebook.com/[id])<br>
	                - height : 높이값<br>
	                - width : 100% (디폴트)
	                </td>
	            </tr>
	            <tr>
	                <td class="menu">instagram</td>
	                <td align="left">
	                [include:tpf=sns/instagram&amp;accessToken=<b style="color:red">1598429989.bd2f0c8.f7 ~ 3f</b>&amp;limit=5]<br>
	                인스타그램 타임라인 가져오기<br>
	                - resolution : low(150 x 150), medium(306 x 306 default), high(612 x 612)<br>
	                인스타그램 accessToken값 가져오기 : https://www.hooni.net/xe/study/91805<br>
	      &nbsp;&nbsp;&nbsp;1. 새로운 Client를 등록<br>
	      &nbsp;&nbsp;&nbsp;2. Access_Token 생성 (반드시 [2-2 클라이언트사이드 방식으로 가져오기]로 받기)
	                </td>
	            </tr>
	            </tbody></table>
	
	            </div>
	            <div class="modal-footer">
	            <button type="button" onclick="closeManual();" class="btn btn-primary">닫기</button>&nbsp;&nbsp;&nbsp;
	            </div>
	        </div>
	    </div>
	</div>
	
	<div class="modal fade" id="modalRevision" tabindex="-2" role="dialog" aria-labelledby="myModal" aria-hidden="true" style="display: none;">
	    <div class="modal-dialog" style="width:500px;">
	        <div class="modal-content">
	            <div class="modal-header">
	                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
	                <h4 class="modal-title">리비젼 내역</h4>
	            </div>
	            <div class="modal-body">
	
	            <span style="float:left;"><h4><p class="text-light-blue"><i class="fa fa-fw fa-info-circle"></i> <span id="revisionTitle" style="padding-top:10px;">메인페이지</span></p></h4></span>
	            <span id="htmlTag">
	            	<table class="table table-bordered">
	            		<tbody>

	            		</tbody>
	            	</table>
	            </span>
	            </div>
	            <div class="modal-footer">
	            <button type="button" onclick="closeRevision();" class="btn btn-primary">닫기</button>&nbsp;&nbsp;&nbsp;
	            </div>
	        </div>
	    </div>
	</div>
	
	<div class="modal fade" id="modalCopyMenu" tabindex="-2" role="dialog" aria-labelledby="myModal" aria-hidden="true">
	    <div class="modal-dialog" style="width:400px;">
	        <div class="modal-content">
	            <form name="formCopyMenu" method="post" action="?tpf=admin/menu/process">
	            <input type="hidden" name="mode" id="mode" value="copyMenu">
	            <div class="modal-header">
	                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
	                <h4 class="modal-title" id="myModalLabelPortfolio">메뉴 복사</h4>
	            </div>
	            <div class="modal-body">
	
	            <h4><p class="text-light-blue"><i class="fa fa-fw fa-info-circle"></i> 메뉴 <span id="board_sub_title">복사</span></p></h4>
	            <table class="table table-bordered">
	            <tbody><tr>
	                <td class="menu">언어</td>
	                <td align="left">
	                <select name="menu_locale" id="menu_locale" class="form-control input-sm">
	                    <option value="">선택</option>
	      				<option value="en">ENG</option>      
	      				<option value="zh">中国</option>      
	      				<option value="vn">Tiếng việt</option>                
	      			</select>
	                </td>
	            </tr>
	            </tbody></table>
	            </div>
	
	            <div class="modal-footer">
	            <button type="button" onclick="registerCopyMenu()" class="btn btn-primary">확인</button>&nbsp;&nbsp;&nbsp;
	            </div>
	            </form>
	        </div>
	    </div>
	</div>
</div>

<script>
        var is_revision = false;
        var revision_code;
        if (window.CKEDITOR) {  // CKEDITOR loading 여부 체크 (Web 버젼에서만 사용)
            var objEditor = CKEDITOR.replace('content-editor', {
                height: 800,
                extraPlugins : 'tableresize',
                extraPlugins: 'codemirror',
                removeButtons: 'Source',
                filebrowserUploadUrl: '/ckfinder/core/connector/php/connector.php?command=QuickUpload&type=Files',
                filebrowserImageUploadUrl: '/daemon/ckeditor_upload.php?command=QuickUpload&type=Images',
                contentsCss : ['/html/css/common.css','/html/css/style.css']
            });
            CKEDITOR.on('dialogDefinition', function (ev) {
                var dialogName = ev.data.name;
                var dialog = ev.data.definition.dialog;
                var dialogDefinition = ev.data.definition;

                if (dialogName == 'image') {
                    dialog.on('show', function (obj) {
                        this.selectPage('Upload'); //업로드텝으로 시작
                    });
                    dialogDefinition.removeContents('advanced'); // 자세히탭 제거
                    dialogDefinition.removeContents('Link'); // 링크탭 제거
                }
            });
            CKEDITOR.config.allowedContent = true;
            CKEDITOR.config.startupMode = 'source';
            CKEDITOR.config.codemirror = {
                // Set this to the theme you wish to use (codemirror themes)
                theme: '3024-night',
                // Whether or not to automatically format code should be done when the editor is loaded
                autoFormatOnStart: false
            };
        }
        if (window.CKEDITOR) {  // CKEDITOR loading 여부 체크 (Web 버젼에서만 사용)
            var objEditor2 = CKEDITOR.replace('content-editor2', {
                height: 800,
                extraPlugins : 'tableresize',
                extraPlugins: 'codemirror',
                removeButtons: 'Source',
                filebrowserUploadUrl: '/ckfinder/core/connector/php/connector.php?command=QuickUpload&type=Files',
                filebrowserImageUploadUrl: '/daemon/ckeditor_upload.php?command=QuickUpload&type=Images',
                contentsCss : ['/html/css/common.css','/html/css/style.css']
            });
            CKEDITOR.on('dialogDefinition', function (ev) {
                var dialogName = ev.data.name;
                var dialog = ev.data.definition.dialog;
                var dialogDefinition = ev.data.definition;

                if (dialogName == 'image') {
                    dialog.on('show', function (obj) {
                        this.selectPage('Upload'); //업로드텝으로 시작
                    });
                    dialogDefinition.removeContents('advanced'); // 자세히탭 제거
                    dialogDefinition.removeContents('Link'); // 링크탭 제거
                }
            });
            CKEDITOR.config.allowedContent = true;
            CKEDITOR.config.startupMode = 'source';
            CKEDITOR.config.codemirror = {
                // Set this to the theme you wish to use (codemirror themes)
                theme: '3024-night',
                // Whether or not to automatically format code should be done when the editor is loaded
                autoFormatOnStart: false
            };
        }        
        function checkOuterLink() {
            if($('[name=is_outer_link]').is(':checked')) $('#displayOuterLink').show();
            else $('#displayOuterLink').hide();
        }
        function checkMeta() {
            if($('[name=is_meta]').is(':checked')) $('#displayMeta').show();
            else $('#displayMeta').hide();
        }
        function setLocale(locale) {
            $('button[id^=locale_]').attr('class', 'btn btn-default');
            $('#locale_'+locale).attr('class', 'btn btn-primary');
            $('[name=locale]').val(locale);
            if(is_revision == false) setData($('[name=code]').val());
            else infoRevision(revision_code);

            console.log(':'+is_revision);
            console.log(':'+$('[name=code]').val()+':'+revision_code);
        }
        function register() {
            // if(form_register.title.value == '') { alert('메뉴명이 입력되지 않았습니다.'); form_register.title.focus(); return false;}
            // if(form_register.url.value == '') { alert('url이 입력되지 않았습니다.'); form_register.url.focus(); return false;}
            form_register.target = 'iframe_process';
            form_register.submit();
            alert("등록 완료")
            //location.reload();
        }
        function register2() {
            // if(form_register.title.value == '') { alert('메뉴명이 입력되지 않았습니다.'); form_register.title.focus(); return false;}
            // if(form_register.url.value == '') { alert('url이 입력되지 않았습니다.'); form_register.url.focus(); return false;}
            form_register2.target = 'iframe_process';
            form_register2.submit();
            //location.reload();
        }        
        function onclickManual() {
            $('#modalManual').modal({backdrop:'static', show:true});
        }
        function closeManual() {
            $('#modalManual').modal('hide');
        }
        function printData(json_data) {
        	/*
            if (json_data.action_type != undefined && json_data.action_type == 'delete') {  // 삭제 -> 복구
                parent.$('[name=mode]').val('repairMenu');
                parent.form_register.mode.value = 'repairMenu';
                parent.$('[name=code]').val(revision_code);
                $('#displayButton').html('복구하기');
            }
            else {                                                                          // 수정 or 리비젼 보기
                parent.form_register.mode.value = 'updateMenu';
                parent.$('[name=code]').val(json_data.code);
                $('#displayButton').html('저장하기');
            }*/
            parent.$('[name=title]').val(json_data.title);
            parent.$('[id=getCode]').val(json_data.code);
            if (json_data.menu_head_code == 0) json_data.menu_head_code = '';
            parent.$('[name=menu_head_code]').val(json_data.menu_head_code);
            parent.$('[name=url]').val(json_data.url);
            if (json_data.code == 1) parent.$('[name=url]').prop('readonly', true); // 메인 페이지는 url 변경 불가
            else  parent.$('[name=url]').prop('readonly', false);
            if(json_data.is_outer_link == 'y') {
                parent.$('[name=is_outer_link]').prop('checked', true);
                parent.$('#displayOuterLink').show();
            }
            else {
                parent.$('[name=is_outer_link]').prop('checked', false);
                parent.$('#displayOuterLink').hide();
            }
            if (json_data.is_outer_link == 'n') parent.$('[name=is_outer_link]').prop('checked', false);
            else parent.$('[name=is_outer_link]').prop('checked', true);
            parent.$('[name=target]').val(json_data.target);
            parent.$('[name=meta_title]').val(json_data.meta_title);
            parent.$('[name=meta_description]').val(json_data.meta_description);
            if(json_data.is_meta == 'y') {
                parent.$('[name=is_meta]').prop('checked', true);
                parent.$('#displayMeta').show();
            }
            else {
                parent.$('[name=is_meta]').prop('checked', false);
                parent.$('#displayMeta').hide();
            }
            parent.$('[name=status]').val(json_data.status);
            if (json_data.content == null) json_data.content = '';
            // 미리보기 링크 수정
            parent.$('#previewLink').attr('href',json_data.full_url);

            setTimeout(function(){
                parent.objEditor.setData('\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n');
                parent.objEditor2.setData('\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n');
            }, 200);
            setTimeout(function(){
                parent.objEditor.setData(json_data.content);
                parent.objEditor2.setData(json_data.content);
            }, 200);
        }
        function setData(code) {
            // 정보
            $.ajax({
                url:'/mir9/menu/json/getMenu?_csrf=ee76a9b6-4532-490f-9560-f9324f453668',
                type:'post',
                dataType:'json',
                data:{
                    method : 'menu.getMenu',
                    locale : parent.$('[name=locale]').val(),
                    code : code
                },
                success:function(data, textStatus, jqXHR){
                    var json_data = data;
                    printData(json_data);
                },
                error:function(jqXHR, textStatus, errorThrown){
                    console.log(textStatus);
                    // $('#content').val(errorThrown);
                }
            });
        }
        function closeRevision() {
            $('#modalRevision').modal('hide');
        }
        function infoRevision(code) {
            $('#modalRevision').modal('hide');
            parent.$('#modalContent2').modal({backdrop:'static', show:true});
            // 리비젼 정보 보여주기
            $.ajax({
            	url:'/mir9/menu/json/getMenu?_csrf=ee76a9b6-4532-490f-9560-f9324f453668',
                type:'post',
                dataType:'json',
                data:{
                    method : 'menu.getMenu',
                    locale : parent.$('[name=locale]').val(),
                    code : code
                },
                success:function(data, textStatus, jqXHR){
                    var json_data = data;
                    console.log('--------------------------');
                    console.log(json_data);
                    json_data.code = json_data.menu_code;
                    is_revision = true;
                    revision_code = code;
                    printData(json_data);
                },
                error:function(jqXHR, textStatus, errorThrown){
                    console.log(textStatus);
                    // $('#content').val(errorThrown);
                }
            });
        }
        function deleteRevision(code) {
    		if(!confirm("해당 리비젼 정보를 정말 삭제하시겠습니까?")){
    			alert("취소 되었습니다.");
    			return;
    		}else{
        		$.ajax({
        			url : "/mir9/menu/json/deleteMenu/"+code,
        			method : "GET",
        			dataType : "JSON",	
        			headers : {
        				"Accept" : "application/json",
        				"Content-Type" : "application/json"	 						
        			} ,
        			success : function(result){
        				alert("해당 메뉴가 삭제 되었습니다.")
        				 parent.formDeleteRevision.target = 'iframe_process';
        				$(obj).parents('tr').remove();
        			}
        			
        		})
        		
          		//$("span[id='"+fileNo+"']").remove();
        		}
            
        }
        
        function checkHeight() {
            var height = $(window).height() - 200;
            document.getElementById('iframe_tree').height = height;
            document.getElementById('iframe_list').height = height;
        }
        checkHeight();
        function registerCopyMenu() {
            if(formCopyMenu.menu_locale.value == '') { alert('언어가 선택되지 않았습니다.'); formCopyMenu.menu_locale.focus(); return false;}
            formCopyMenu.target = 'iframe_process';
            formCopyMenu.submit();
        }
        
        
</script>
<footer class="main-footer">
<div class="pull-right hidden-xs">
    <b>Version</b> 2.7.4
</div>
<strong>Copyright &copy; 2017 <a href="/admin">MIR9 SHOP</a>.</strong> All rights reserved.
</footer>
</div>

<!-- jQuery 3 -->
<script src="//mir9.co.kr/resource/js/AdminLTE-2.4.2/bower_components/jquery/dist/jquery.min.js"></script>
<!-- Bootstrap 3.3.7 -->
<script src="//mir9.co.kr/resource/js/AdminLTE-2.4.2/bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
<!-- FastClick -->
<script src="//mir9.co.kr/resource/js/AdminLTE-2.4.2/bower_components/fastclick/lib/fastclick.js"></script>
<!-- AdminLTE App -->
<script src="//mir9.co.kr/resource/js/AdminLTE-2.4.2/dist/js/adminlte.min.js"></script>
<!-- Sparkline -->
<script src="//mir9.co.kr/resource/js/AdminLTE-2.4.2/bower_components/jquery-sparkline/dist/jquery.sparkline.min.js"></script>
<!-- jvectormap  -->
<script src="//mir9.co.kr/resource/js/AdminLTE-2.4.2/plugins/jvectormap/jquery-jvectormap-1.2.2.min.js"></script>
<script src="//mir9.co.kr/resource/js/AdminLTE-2.4.2/plugins/jvectormap/jquery-jvectormap-world-mill-en.js"></script>
<!-- SlimScroll -->
<script src="//mir9.co.kr/resource/js/AdminLTE-2.4.2/bower_components/jquery-slimscroll/jquery.slimscroll.min.js"></script>
<!-- ChartJS -->
<script src="//mir9.co.kr/resource/js/AdminLTE-2.4.2/bower_components/chart.js/Chart.js"></script>
<!-- AdminLTE for demo purposes -->
<script src="//mir9.co.kr/resource/js/AdminLTE-2.4.2/dist/js/demo.js"></script>
<script src="//mir9.co.kr/resource/js/jquery/jquery-ui.min.js"></script>
<script src="/mir9/resources/js/common.js" type="text/javascript" charset="utf-8"></script>
<!-- fullcalendar -->
<script src="//mir9.co.kr/resource/js/bootstrap-colorselector.js"></script>
<script src="//mir9.co.kr/resource/js/AdminLTE-2.4.2/bower_components/fullcalendar/dist/fullcalendar.moment.min.js" type="text/javascript"></script>
<script src="//mir9.co.kr/resource/js/AdminLTE-2.4.2/bower_components/fullcalendar/dist/fullcalendar.min.js" type="text/javascript"></script>


<script language='javascript' src='//www.gstatic.com/charts/loader.js'></script>

</body>
</html>


