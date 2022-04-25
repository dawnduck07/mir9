<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" style="height: auto; min-height: 100%;">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>AdminLTE 2 | Dashboard</title>
<!-- Tell the browser to be responsive to screen width -->
<meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
<!-- Bootstrap 3.3.7 -->
<link rel="stylesheet" href="/html/css/bootstrap.min.css">
<!-- Font Awesome -->
<link rel="stylesheet" href="/html/css/font-awesome.min.css">
<!-- Ionicons -->
<link rel="stylesheet" href="//mir9.co.kr/resource/js/AdminLTE-2.4.2/bower_components/Ionicons/css/ionicons.min.css">
<!-- jvectormap -->
<link rel="stylesheet" href="//mir9.co.kr/resource/js/AdminLTE-2.4.2/bower_components/jvectormap/jquery-jvectormap.css">
<!-- Theme style -->
<link rel="stylesheet" href="//mir9.co.kr/resource/js/AdminLTE-2.4.2/dist/css/AdminLTE.min.css">
<!-- AdminLTE Skins. Choose a skin from the css/skins folder instead of downloading all of them to reduce the load. -->
<link rel="stylesheet" href="//mir9.co.kr/resource/js/AdminLTE-2.4.2/dist/css/skins/_all-skins.min.css">
<link href="//mir9.co.kr/resource/css/admin.css" rel="stylesheet" type="text/css">
<link href="//mir9.co.kr/resource/css/jquery-ui.css" rel="stylesheet">
<!-- fullcalendar -->
<link href="//mir9.co.kr/resource/css/bootstrap-colorselector.css" rel="stylesheet">
<link href="//mir9.co.kr/resource/js/AdminLTE-2.4.2/bower_components/fullcalendar/dist/fullcalendar.min.css" rel="stylesheet" type="text/css">
<link href="//mir9.co.kr/resource/js/AdminLTE-2.4.2/bower_components/fullcalendar/dist/fullcalendar.print.css" rel="stylesheet" type="text/css" media="print">
<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
<script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
<script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
<![endif]-->
<!-- Google Font -->
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">
<style>.cke{visibility:hidden;}</style><script type="text/javascript" src="http://mir9.co.kr/resource/js/ckeditor4.7.2/config.js?t=H7HD"></script><style type="text/css">.jqstooltip { position: absolute;left: 0px;top: 0px;visibility: hidden;background: rgb(0, 0, 0) transparent;background-color: rgba(0,0,0,0.6);filter:progid:DXImageTransform.Microsoft.gradient(startColorstr=#99000000, endColorstr=#99000000);-ms-filter: "progid:DXImageTransform.Microsoft.gradient(startColorstr=#99000000, endColorstr=#99000000)";color: white;font: 10px arial, san serif;text-align: left;white-space: nowrap;padding: 5px;border: 1px solid white;box-sizing: content-box;z-index: 10000;}.jqsfield { color: white;font: 10px arial, san serif;text-align: left;}</style><link rel="stylesheet" type="text/css" href="http://mir9.co.kr/resource/js/ckeditor4.7.2/skins/office2013/editor.css?t=H7HD"><script type="text/javascript" src="http://mir9.co.kr/resource/js/ckeditor4.7.2/lang/ko.js?t=H7HD"></script><script type="text/javascript" src="http://mir9.co.kr/resource/js/ckeditor4.7.2/styles.js?t=H7HD"></script><script type="text/javascript" src="http://mir9.co.kr/resource/js/ckeditor4.7.2/plugins/codemirror/plugin.js?t=H7HD"></script><link rel="stylesheet" type="text/css" href="http://mir9.co.kr/resource/js/ckeditor4.7.2/plugins/scayt/dialogs/dialog.css"><link rel="stylesheet" type="text/css" href="http://mir9.co.kr/resource/js/ckeditor4.7.2/plugins/tableselection/styles/tableselection.css"><script type="text/javascript" src="http://mir9.co.kr/resource/js/ckeditor4.7.2/plugins/codemirror/lang/ko.js?t=H7HD"></script><link rel="stylesheet" type="text/css" href="http://mir9.co.kr/resource/js/ckeditor4.7.2/plugins/codemirror/css/codemirror.min.css"><link rel="stylesheet" type="text/css" href="http://mir9.co.kr/resource/js/ckeditor4.7.2/plugins/codemirror/theme/3024-night.css"><script type="text/javascript" src="http://mir9.co.kr/resource/js/ckeditor4.7.2/plugins/codemirror/js/codemirror.min.js"></script><script type="text/javascript" src="http://mir9.co.kr/resource/js/ckeditor4.7.2/plugins/codemirror/js/codemirror.addons.min.js"></script><script type="text/javascript" src="http://mir9.co.kr/resource/js/ckeditor4.7.2/plugins/codemirror/js/codemirror.mode.htmlmixed.min.js"></script><script type="text/javascript" src="http://mir9.co.kr/resource/js/ckeditor4.7.2/plugins/codemirror/js/codemirror.addons.search.min.js"></script>
</head>

<body class="skin-red sidebar-mini" style="height: auto; min-height: 100%;">
<iframe name="iframe_process" width="0" height="0" frameborder="0" style="display:none;"></iframe>

<div class="wrapper" style="height: auto; min-height: 100%;">

<!-- header -->
<header class="main-header">
    <a href="/admin" class="logo">
    <!-- mini logo for sidebar mini 50x50 pixels -->
    <span class="logo-mini"><b>A</b></span>
    <!-- logo for regular state and mobile devices -->
    <span class="logo-lg"><b>MIR9 SHOP Admin</b></span>
    </a>

    <nav class="navbar navbar-static-top">
        <!-- Sidebar toggle button-->
        <a href="#" class="sidebar-toggle" data-toggle="push-menu" role="button">
        <span class="sr-only">Toggle navigation</span>
        </a>

        <div class="navbar-custom-menu">
        <ul class="nav navbar-nav">
            <li class="dropdown user user-menu">
            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                <img src="https://mir9.co.kr/resource/js/AdminLTE-2.4.2/dist/img/avatar5.png" class="user-image" alt="User Image">
                <span class="hidden-xs">길동이</span>
            </a>
            <ul class="dropdown-menu">
                <li class="user-header">
                    <img src="https://mir9.co.kr/resource/js/AdminLTE-2.4.2/dist/img/avatar5.png" class="img-circle" alt="User Image">
                    <p>
                    길동이 - Web Administrator
                    <small>MIR9 SHOP 관리자</small>
                    </p>
                </li>
                <li class="user-footer">
                    <div class="pull-right">
                        <a href="?tpf=member/logout" class="btn btn-danger btn-flat">Sign out</a>
                    </div>
                </li>
            </ul>
            </li>
        </ul>
        </div>
    </nav>
</header><!-- /.header -->

<!-- sidebar -->
<aside class="main-sidebar">
    <section class="sidebar" style="height: auto;">
        <ul class="sidebar-menu tree" data-widget="tree">
            <li class="header">MAIN NAVIGATION</li>
            <li>
                <a href="?tpf=admin/dashboard/list">
                <i class="fa fa-dashboard"></i> <span>Dashboard</span>
                </a>
            </li>
            <li class="treeview">
                <a href="#">
                <i class="fa fa-shopping-cart"></i> <span>주문 관리</span> <i class="fa fa-angle-left pull-right"></i>
                </a>
                <ul class="treeview-menu">
                    <li class="active"><a href="?tpf=admin/order/list"><i class="fa fa-circle-o"></i> 주문 리스트</a></li>
                    <li><a href="https://iniweb.inicis.com/security/login.do" target="_new"><i class="fa fa-circle-o"></i> 이니시스 상점관리자</a></li>
                    <li><a href="?tpf=admin/order/log_list"><i class="fa fa-circle-o"></i>카드결제로그 리스트</a></li>
                </ul>
            </li>
            <li class="active treeview menu-open">
                <a href="#">
                <i class="fa fa-file-text-o"></i> <span>메뉴 관리</span> <i class="fa fa-angle-left pull-right"></i>
                </a>
                <ul class="treeview-menu">
                    <li class="active"><a href="?tpf=admin/menu/list&amp;menu=manager"><i class="fa fa-circle-o"></i> 메뉴 관리</a></li>
                    <li><a href="?tpf=admin/menu/head"><i class="fa fa-circle-o"></i> 헤더 관리</a></li>
                    <li><a href="?tpf=admin/menu/bottom"><i class="fa fa-circle-o"></i> 하단 관리</a></li>
                    <li><a href="?tpf=admin/menu/meta"><i class="fa fa-circle-o"></i> 메타 관리</a></li>
                </ul>
            </li>

            <li class="treeview">
                <a href="#">
                <i class="fa fa-list-alt"></i> <span>게시판 관리</span> <i class="fa fa-angle-left pull-right"></i>
                </a>
                <ul class="treeview-menu">
                    <li><a href="index.php?tpf=admin/board/manage"><i class="fa fa-circle-o"></i> 리스트</a></li>
      <li><a href="index.php?tpf=admin/board/list_upload&amp;board_code=1"><i class="fa fa-circle-o"></i> 공지사항</a></li>      <li><a href="index.php?tpf=admin/board/list&amp;board_code=2"><i class="fa fa-circle-o"></i> 자주하는 질문</a></li>      <li><a href="index.php?tpf=admin/board/list&amp;board_code=3"><i class="fa fa-circle-o"></i> 1:1 문의</a></li>              </ul>
            </li>
            <li class="treeview">
                <a href="#">
                <i class="fa fa-gift"></i> <span>제품</span>  <i class="fa fa-angle-left pull-right"></i>
                </a>
                <ul class="treeview-menu">
                    <li class="active"><a href="?tpf=admin/product/list"><i class="fa fa-circle-o"></i> 리스트 </a></li>
                    <li><a href="?tpf=admin/product/category"><i class="fa fa-circle-o"></i> 카테고리 </a></li>
                    <li><a href="?tpf=admin/product/option_bank"><i class="fa fa-circle-o"></i> 자주쓰는 옵션 관리 </a></li>
                </ul>
            </li>
            <li class="treeview">
                <a href="#">
                <i class="fa fa-user"></i> <span>회원 관리</span> <i class="fa fa-angle-left pull-right"></i>
                </a>
                <ul class="treeview-menu">
                    <li class="active"><a href="?tpf=admin/member/list"><i class="fa fa-circle-o"></i> 회원 리스트</a></li>
                    <li><a href="?tpf=admin/member/withdraw_list"><i class="fa fa-circle-o"></i> 탈퇴회원 리스트</a></li>
                    <li><a href="?tpf=admin/member/log"><i class="fa fa-circle-o"></i> 회원 접속이력 관리</a></li>
                    <li><a href="?tpf=admin/member/level"><i class="fa fa-circle-o"></i> 등급 관리</a></li>
                    <li><a href="?tpf=admin/member/point"><i class="fa fa-circle-o"></i> 회원 적립금 관리</a></li>
                </ul>
            </li>
            <li class="">
                <a href="?tpf=admin/schedule/list">
                <i class="fa fa-calendar"></i> <span>일정 관리</span>
                </a>
            </li>
            <li class="treeview">
                <a href="#">
                <i class="fa fa-check-square-o"></i> <span>폼메일 관리</span> <i class="fa fa-angle-left pull-right"></i>
                </a>
                <ul class="treeview-menu">
                    <li><a href="index.php?tpf=admin/form/manage"><i class="fa fa-circle-o"></i> 리스트</a></li>
      <li><a href="index.php?tpf=admin/form/list&amp;form_code=1"><i class="fa fa-circle-o"></i> 문의사항</a></li>      <li><a href="index.php?tpf=admin/form/list&amp;form_code=8"><i class="fa fa-circle-o"></i> test</a></li>              </ul>
            </li>
			<li class="treeview">
                <a href="#">
                <i class="fa fa-shopping-cart"></i> <span>통계</span>  <i class="fa fa-angle-left pull-right"></i>
                </a>
                <ul class="treeview-menu">
                    <li><a href="?tpf=admin/statistics/sales_day"><i class="fa fa-circle-o"></i>기간별 매출 통계 </a></li>
					<li><a href="?tpf=admin/statistics/sales_product"><i class="fa fa-circle-o"></i>제품별 매출 통계 </a></li>
					<li><a href="?tpf=admin/statistics/sales_member"><i class="fa fa-circle-o"></i>회원별 매출 통계 </a></li>
					<li><a href="?tpf=admin/statistics/sales_address_day"><i class="fa fa-circle-o"></i>지역별 매출 통계 </a></li>
                </ul>
            </li>
            <li class="treeview">
                <a href="#">
                <i class="fa fa-commenting"></i> <span>커뮤니티 관리</span>  <i class="fa fa-angle-left pull-right"></i>
                </a>
                <ul class="treeview-menu">
                    <li><a href="?tpf=admin/community/email"><i class="fa fa-circle-o"></i>메일 설정</a></li>
                    <li><a href="?tpf=admin/community/email_list"><i class="fa fa-circle-o"></i>메일 발송 내역</a></li>
                    <li><a href="?tpf=admin/community/sms"><i class="fa fa-circle-o"></i>SMS 설정</a></li>
                    <li><a href="?tpf=admin/community/sms_list"><i class="fa fa-circle-o"></i>SMS 발송 내역</a></li>
                    <li><a href="?tpf=admin/community/review"><i class="fa fa-circle-o"></i>주문후기 리스트</a></li>
                </ul>
            </li>
            <li class="treeview">
                <a href="#">
                <i class="fa fa-gear"></i> <span>설정</span> <i class="fa fa-angle-left pull-right"></i>
                </a>
                <ul class="treeview-menu">
                    <li><a href="?tpf=admin/setting/point"><i class="fa fa-circle-o"></i> 적립금 관리</a></li>
                    <li><a href="?tpf=admin/setting/coupon"><i class="fa fa-circle-o"></i> 쿠폰 관리</a></li>
<li><a href="?tpf=admin/setting/popup"><i class="fa fa-circle-o"></i> 팝업 관리</a></li><li><a href="?tpf=admin/setting/map"><i class="fa fa-circle-o"></i> 약도 관리</a></li><li><a href="?tpf=admin/setting/staff"><i class="fa fa-circle-o"></i> 임원 관리</a></li><li><a href="?tpf=admin/setting/history"><i class="fa fa-circle-o"></i> 연혁 관리</a></li><li><a href="?tpf=admin/setting/banner"><i class="fa fa-circle-o"></i> 배너 관리</a></li><li><a href="?tpf=admin/setting/contract"><i class="fa fa-circle-o"></i> 약관 관리</a></li>				<li><a href="?tpf=admin/setting/delivery_setting"><i class="fa fa-circle-o"></i> 배송 설정</a></li>
<li><a href="?tpf=admin/setting/delivery_company"><i class="fa fa-circle-o"></i> 택배사 관리</a></li><li><a href="?tpf=admin/setting/info"><i class="fa fa-circle-o"></i> 기본 설정</a></li><li><a href="?tpf=admin/setting/seo"><i class="fa fa-circle-o"></i> SEO 설정</a></li><li><a href="?tpf=admin/setting/paymentpg"><i class="fa fa-circle-o"></i> 결제PG 설정</a></li><li><a href="?tpf=admin/setting/snslogin"><i class="fa fa-circle-o"></i> SNS  연동 설정</a></li><li><a href="?tpf=admin/setting/locale"><i class="fa fa-circle-o"></i> 다국어 번역</a></li>                </ul>
            </li>
            <li>
                <a href="?tpf=admin/setting/version">
                <i class="fa fa-exclamation-circle"></i> <span>Version</span> <small class="label pull-right bg-green">2.8.1</small>
                </a>
            </li>
        </ul>
    </section>
</aside><!-- /.sidebar -->
<!-- content-wrapper -->
<div class="content-wrapper" style="min-height: 868px;">
<style>
.table {
    margin-bottom : 0px;
}
</style>

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
                <iframe name="tree" id="iframe_tree" src="?tpf=admin/menu/tree&amp;menu=category" width="100%" scrolling="auto" frameborder="1" height="769"></iframe>
                </div>

                <div class="col-xs-9" style="padding:0 5px 0 0;">
                <iframe name="list" id="iframe_list" src="?tpf=admin/menu/list_sub" width="100%" scrolling="auto" frameborder="1" height="769"></iframe>
                </div>
                </div><!-- /.box-body -->
            </div><!-- /.box -->
        </div><!-- /.col-xs-12 -->
    </div><!-- /.row -->
</section>

<!-- 리비젼 보기 부터 -->
<div class="modal fade" id="modalContent" tabindex="-2" role="dialog" aria-labelledby="myModal" aria-hidden="true">
    <div class="modal-dialog" style="width:90%;">
        <div class="modal-content">
            <form name="form_register" method="post" onsubmit="return false;" action="?tpf=admin/menu/process">
            <input type="hidden" name="mode" value="insertMenu">
            <input type="hidden" name="code">
            <input type="hidden" name="category_code">
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
                <td align="left"><input type="text" name="title" class="form-control input-sm"></td>
                <td class="menu">url &nbsp;&nbsp;<input type="checkbox" name="is_outer_link" onclick="checkOuterLink()" value="y"> <small>외부링크</small></td>
                <td align="left">
                <select id="displayOuterLink" name="target" class="form-control input-sm" style="display:none; width:25%; padding:0; margin-right:5px; float:left;">
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
                <option value="">선택하세요</option>
      <option value="40">ABOUT</option>      <option value="41">PRODUCTS</option>      <option value="42">RnD</option>      <option value="43">company</option>      <option value="44">contact</option>                </select>
                </td>
                <td class="menu">메타 태그</td>
                <td align="left"><input type="checkbox" name="is_meta" onclick="checkMeta()" value="y"> 사용</td>
            </tr>
            <tr id="displayMeta" style="display:none;">
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
                <textarea name="content" id="content-editor" onfocus="javascript:this.value=''" rows="10" cols="80" style="visibility: hidden; display: none;"></textarea><div id="cke_content-editor" class="cke_1 cke cke_reset cke_chrome cke_editor_content-editor cke_ltr cke_browser_webkit" dir="ltr" lang="ko" role="application" aria-labelledby="cke_content-editor_arialbl"><span id="cke_content-editor_arialbl" class="cke_voice_label">리치 텍스트 편집기, content-editor</span><div class="cke_inner cke_reset" role="presentation"><span id="cke_1_top" class="cke_top cke_reset_all" role="presentation" style="height: auto; user-select: none;"><span id="cke_10" class="cke_voice_label">에디터 툴바</span><span id="cke_1_toolbox" class="cke_toolbox" role="group" aria-labelledby="cke_10" onmousedown="return false;"><span id="cke_13" class="cke_toolbar" aria-labelledby="cke_13_label" role="toolbar"><span id="cke_13_label" class="cke_voice_label">클립보드/실행 취소</span><span class="cke_toolbar_start"></span><span class="cke_toolgroup" role="presentation"><a id="cke_14" class="cke_button cke_button__cut cke_button_disabled " href="javascript:void('잘라내기')" title="잘라내기 (컨트롤+X)" tabindex="-1" hidefocus="true" role="button" aria-labelledby="cke_14_label" aria-describedby="cke_14_description" aria-haspopup="false" aria-disabled="true" onkeydown="return CKEDITOR.tools.callFunction(2,event);" onfocus="return CKEDITOR.tools.callFunction(3,event);" onclick="CKEDITOR.tools.callFunction(4,this);return false;"><span class="cke_button_icon cke_button__cut_icon" style="background-image:url('http://mir9.co.kr/resource/js/ckeditor4.7.2/plugins/icons.png?t=H7HD');background-position:0 -240px;background-size:auto;">&nbsp;</span><span id="cke_14_label" class="cke_button_label cke_button__cut_label" aria-hidden="false">잘라내기</span><span id="cke_14_description" class="cke_button_label" aria-hidden="false">키보드 단축키 컨트롤+X</span></a><a id="cke_15" class="cke_button cke_button__copy cke_button_disabled " href="javascript:void('복사')" title="복사 (컨트롤+C)" tabindex="-1" hidefocus="true" role="button" aria-labelledby="cke_15_label" aria-describedby="cke_15_description" aria-haspopup="false" aria-disabled="true" onkeydown="return CKEDITOR.tools.callFunction(5,event);" onfocus="return CKEDITOR.tools.callFunction(6,event);" onclick="CKEDITOR.tools.callFunction(7,this);return false;"><span class="cke_button_icon cke_button__copy_icon" style="background-image:url('http://mir9.co.kr/resource/js/ckeditor4.7.2/plugins/icons.png?t=H7HD');background-position:0 -192px;background-size:auto;">&nbsp;</span><span id="cke_15_label" class="cke_button_label cke_button__copy_label" aria-hidden="false">복사</span><span id="cke_15_description" class="cke_button_label" aria-hidden="false">키보드 단축키 컨트롤+C</span></a><a id="cke_16" class="cke_button cke_button__paste cke_button_disabled " href="javascript:void('붙여넣기')" title="붙여넣기 (컨트롤+V)" tabindex="-1" hidefocus="true" role="button" aria-labelledby="cke_16_label" aria-describedby="cke_16_description" aria-haspopup="false" aria-disabled="true" onkeydown="return CKEDITOR.tools.callFunction(8,event);" onfocus="return CKEDITOR.tools.callFunction(9,event);" onclick="CKEDITOR.tools.callFunction(10,this);return false;"><span class="cke_button_icon cke_button__paste_icon" style="background-image:url('http://mir9.co.kr/resource/js/ckeditor4.7.2/plugins/icons.png?t=H7HD');background-position:0 -288px;background-size:auto;">&nbsp;</span><span id="cke_16_label" class="cke_button_label cke_button__paste_label" aria-hidden="false">붙여넣기</span><span id="cke_16_description" class="cke_button_label" aria-hidden="false">키보드 단축키 컨트롤+V</span></a><a id="cke_17" class="cke_button cke_button__pastetext cke_button_disabled " href="javascript:void('텍스트로 붙여넣기')" title="텍스트로 붙여넣기 (컨트롤+시프트+V)" tabindex="-1" hidefocus="true" role="button" aria-labelledby="cke_17_label" aria-describedby="cke_17_description" aria-haspopup="false" aria-disabled="true" onkeydown="return CKEDITOR.tools.callFunction(11,event);" onfocus="return CKEDITOR.tools.callFunction(12,event);" onclick="CKEDITOR.tools.callFunction(13,this);return false;"><span class="cke_button_icon cke_button__pastetext_icon" style="background-image:url('http://mir9.co.kr/resource/js/ckeditor4.7.2/plugins/icons.png?t=H7HD');background-position:0 -696px;background-size:auto;">&nbsp;</span><span id="cke_17_label" class="cke_button_label cke_button__pastetext_label" aria-hidden="false">텍스트로 붙여넣기</span><span id="cke_17_description" class="cke_button_label" aria-hidden="false">키보드 단축키 컨트롤+시프트+V</span></a><a id="cke_18" class="cke_button cke_button__pastefromword cke_button_disabled " href="javascript:void('MS Word 에서 붙여넣기')" title="MS Word 에서 붙여넣기" tabindex="-1" hidefocus="true" role="button" aria-labelledby="cke_18_label" aria-describedby="cke_18_description" aria-haspopup="false" aria-disabled="true" onkeydown="return CKEDITOR.tools.callFunction(14,event);" onfocus="return CKEDITOR.tools.callFunction(15,event);" onclick="CKEDITOR.tools.callFunction(16,this);return false;"><span class="cke_button_icon cke_button__pastefromword_icon" style="background-image:url('http://mir9.co.kr/resource/js/ckeditor4.7.2/plugins/icons.png?t=H7HD');background-position:0 -744px;background-size:auto;">&nbsp;</span><span id="cke_18_label" class="cke_button_label cke_button__pastefromword_label" aria-hidden="false">MS Word 에서 붙여넣기</span><span id="cke_18_description" class="cke_button_label" aria-hidden="false"></span></a><span class="cke_toolbar_separator" role="separator"></span><a id="cke_19" class="cke_button cke_button__undo cke_button_disabled " href="javascript:void('실행 취소')" title="실행 취소 (컨트롤+Z)" tabindex="-1" hidefocus="true" role="button" aria-labelledby="cke_19_label" aria-describedby="cke_19_description" aria-haspopup="false" aria-disabled="true" onkeydown="return CKEDITOR.tools.callFunction(17,event);" onfocus="return CKEDITOR.tools.callFunction(18,event);" onclick="CKEDITOR.tools.callFunction(19,this);return false;"><span class="cke_button_icon cke_button__undo_icon" style="background-image:url('http://mir9.co.kr/resource/js/ckeditor4.7.2/plugins/icons.png?t=H7HD');background-position:0 -984px;background-size:auto;">&nbsp;</span><span id="cke_19_label" class="cke_button_label cke_button__undo_label" aria-hidden="false">실행 취소</span><span id="cke_19_description" class="cke_button_label" aria-hidden="false">키보드 단축키 컨트롤+Z</span></a><a id="cke_20" class="cke_button cke_button__redo cke_button_disabled " href="javascript:void('다시 실행')" title="다시 실행 (컨트롤+Y)" tabindex="-1" hidefocus="true" role="button" aria-labelledby="cke_20_label" aria-describedby="cke_20_description" aria-haspopup="false" aria-disabled="true" onkeydown="return CKEDITOR.tools.callFunction(20,event);" onfocus="return CKEDITOR.tools.callFunction(21,event);" onclick="CKEDITOR.tools.callFunction(22,this);return false;"><span class="cke_button_icon cke_button__redo_icon" style="background-image:url('http://mir9.co.kr/resource/js/ckeditor4.7.2/plugins/icons.png?t=H7HD');background-position:0 -936px;background-size:auto;">&nbsp;</span><span id="cke_20_label" class="cke_button_label cke_button__redo_label" aria-hidden="false">다시 실행</span><span id="cke_20_description" class="cke_button_label" aria-hidden="false">키보드 단축키 컨트롤+Y</span></a></span><span class="cke_toolbar_end"></span></span><span id="cke_21" class="cke_toolbar" aria-labelledby="cke_21_label" role="toolbar"><span id="cke_21_label" class="cke_voice_label">편집</span><span class="cke_toolbar_start"></span><span class="cke_toolgroup" role="presentation"><a id="cke_22" class="cke_button cke_button__scayt cke_button_disabled" href="javascript:void('Spell Check')" title="Spell Check" tabindex="-1" hidefocus="true" role="button" aria-labelledby="cke_22_label" aria-describedby="cke_22_description" aria-haspopup="true" aria-disabled="true" onkeydown="return CKEDITOR.tools.callFunction(23,event);" onfocus="return CKEDITOR.tools.callFunction(24,event);" onclick="CKEDITOR.tools.callFunction(25,this);return false;"><span class="cke_button_icon cke_button__scayt_icon" style="background-image:url('http://mir9.co.kr/resource/js/ckeditor4.7.2/plugins/icons.png?t=H7HD');background-position:0 -864px;background-size:auto;">&nbsp;</span><span id="cke_22_label" class="cke_button_label cke_button__scayt_label" aria-hidden="false">Spell Check As You Type</span><span id="cke_22_description" class="cke_button_label" aria-hidden="false"></span><span class="cke_button_arrow"></span></a></span><span class="cke_toolbar_end"></span></span><span id="cke_23" class="cke_toolbar" aria-labelledby="cke_23_label" role="toolbar"><span id="cke_23_label" class="cke_voice_label">링크</span><span class="cke_toolbar_start"></span><span class="cke_toolgroup" role="presentation"><a id="cke_24" class="cke_button cke_button__link cke_button_disabled " href="javascript:void('링크 삽입/변경')" title="링크 삽입/변경 (컨트롤+L)" tabindex="-1" hidefocus="true" role="button" aria-labelledby="cke_24_label" aria-describedby="cke_24_description" aria-haspopup="false" aria-disabled="true" onkeydown="return CKEDITOR.tools.callFunction(26,event);" onfocus="return CKEDITOR.tools.callFunction(27,event);" onclick="CKEDITOR.tools.callFunction(28,this);return false;"><span class="cke_button_icon cke_button__link_icon" style="background-image:url('http://mir9.co.kr/resource/js/ckeditor4.7.2/plugins/icons.png?t=H7HD');background-position:0 -504px;background-size:auto;">&nbsp;</span><span id="cke_24_label" class="cke_button_label cke_button__link_label" aria-hidden="false">링크 삽입/변경</span><span id="cke_24_description" class="cke_button_label" aria-hidden="false">키보드 단축키 컨트롤+L</span></a><a id="cke_25" class="cke_button cke_button__unlink cke_button_disabled " href="javascript:void('링크 지우기')" title="링크 지우기" tabindex="-1" hidefocus="true" role="button" aria-labelledby="cke_25_label" aria-describedby="cke_25_description" aria-haspopup="false" aria-disabled="true" onkeydown="return CKEDITOR.tools.callFunction(29,event);" onfocus="return CKEDITOR.tools.callFunction(30,event);" onclick="CKEDITOR.tools.callFunction(31,this);return false;"><span class="cke_button_icon cke_button__unlink_icon" style="background-image:url('http://mir9.co.kr/resource/js/ckeditor4.7.2/plugins/icons.png?t=H7HD');background-position:0 -528px;background-size:auto;">&nbsp;</span><span id="cke_25_label" class="cke_button_label cke_button__unlink_label" aria-hidden="false">링크 지우기</span><span id="cke_25_description" class="cke_button_label" aria-hidden="false"></span></a><a id="cke_26" class="cke_button cke_button__anchor cke_button_disabled " href="javascript:void('책갈피')" title="책갈피" tabindex="-1" hidefocus="true" role="button" aria-labelledby="cke_26_label" aria-describedby="cke_26_description" aria-haspopup="false" aria-disabled="true" onkeydown="return CKEDITOR.tools.callFunction(32,event);" onfocus="return CKEDITOR.tools.callFunction(33,event);" onclick="CKEDITOR.tools.callFunction(34,this);return false;"><span class="cke_button_icon cke_button__anchor_icon" style="background-image:url('http://mir9.co.kr/resource/js/ckeditor4.7.2/plugins/icons.png?t=H7HD');background-position:0 -480px;background-size:auto;">&nbsp;</span><span id="cke_26_label" class="cke_button_label cke_button__anchor_label" aria-hidden="false">책갈피</span><span id="cke_26_description" class="cke_button_label" aria-hidden="false"></span></a></span><span class="cke_toolbar_end"></span></span><span id="cke_27" class="cke_toolbar" aria-labelledby="cke_27_label" role="toolbar"><span id="cke_27_label" class="cke_voice_label">삽입</span><span class="cke_toolbar_start"></span><span class="cke_toolgroup" role="presentation"><a id="cke_28" class="cke_button cke_button__image cke_button_disabled " href="javascript:void('이미지')" title="이미지" tabindex="-1" hidefocus="true" role="button" aria-labelledby="cke_28_label" aria-describedby="cke_28_description" aria-haspopup="false" aria-disabled="true" onkeydown="return CKEDITOR.tools.callFunction(35,event);" onfocus="return CKEDITOR.tools.callFunction(36,event);" onclick="CKEDITOR.tools.callFunction(37,this);return false;"><span class="cke_button_icon cke_button__image_icon" style="background-image:url('http://mir9.co.kr/resource/js/ckeditor4.7.2/plugins/icons.png?t=H7HD');background-position:0 -336px;background-size:auto;">&nbsp;</span><span id="cke_28_label" class="cke_button_label cke_button__image_label" aria-hidden="false">이미지</span><span id="cke_28_description" class="cke_button_label" aria-hidden="false"></span></a><a id="cke_29" class="cke_button cke_button__table cke_button_disabled " href="javascript:void('표')" title="표" tabindex="-1" hidefocus="true" role="button" aria-labelledby="cke_29_label" aria-describedby="cke_29_description" aria-haspopup="false" aria-disabled="true" onkeydown="return CKEDITOR.tools.callFunction(38,event);" onfocus="return CKEDITOR.tools.callFunction(39,event);" onclick="CKEDITOR.tools.callFunction(40,this);return false;"><span class="cke_button_icon cke_button__table_icon" style="background-image:url('http://mir9.co.kr/resource/js/ckeditor4.7.2/plugins/icons.png?t=H7HD');background-position:0 -888px;background-size:auto;">&nbsp;</span><span id="cke_29_label" class="cke_button_label cke_button__table_label" aria-hidden="false">표</span><span id="cke_29_description" class="cke_button_label" aria-hidden="false"></span></a><a id="cke_30" class="cke_button cke_button__horizontalrule cke_button_disabled " href="javascript:void('가로 줄 삽입')" title="가로 줄 삽입" tabindex="-1" hidefocus="true" role="button" aria-labelledby="cke_30_label" aria-describedby="cke_30_description" aria-haspopup="false" aria-disabled="true" onkeydown="return CKEDITOR.tools.callFunction(41,event);" onfocus="return CKEDITOR.tools.callFunction(42,event);" onclick="CKEDITOR.tools.callFunction(43,this);return false;"><span class="cke_button_icon cke_button__horizontalrule_icon" style="background-image:url('http://mir9.co.kr/resource/js/ckeditor4.7.2/plugins/icons.png?t=H7HD');background-position:0 -312px;background-size:auto;">&nbsp;</span><span id="cke_30_label" class="cke_button_label cke_button__horizontalrule_label" aria-hidden="false">가로 줄 삽입</span><span id="cke_30_description" class="cke_button_label" aria-hidden="false"></span></a><a id="cke_31" class="cke_button cke_button__specialchar cke_button_disabled " href="javascript:void('특수문자 삽입')" title="특수문자 삽입" tabindex="-1" hidefocus="true" role="button" aria-labelledby="cke_31_label" aria-describedby="cke_31_description" aria-haspopup="false" aria-disabled="true" onkeydown="return CKEDITOR.tools.callFunction(44,event);" onfocus="return CKEDITOR.tools.callFunction(45,event);" onclick="CKEDITOR.tools.callFunction(46,this);return false;"><span class="cke_button_icon cke_button__specialchar_icon" style="background-image:url('http://mir9.co.kr/resource/js/ckeditor4.7.2/plugins/icons.png?t=H7HD');background-position:0 -840px;background-size:auto;">&nbsp;</span><span id="cke_31_label" class="cke_button_label cke_button__specialchar_label" aria-hidden="false">특수문자 삽입</span><span id="cke_31_description" class="cke_button_label" aria-hidden="false"></span></a></span><span class="cke_toolbar_end"></span></span><span id="cke_32" class="cke_toolbar" aria-labelledby="cke_32_label" role="toolbar"><span id="cke_32_label" class="cke_voice_label">도구</span><span class="cke_toolbar_start"></span><span class="cke_toolgroup" role="presentation"><a id="cke_33" class="cke_button cke_button__maximize cke_button_off" href="javascript:void('최대화')" title="최대화" tabindex="-1" hidefocus="true" role="button" aria-labelledby="cke_33_label" aria-describedby="cke_33_description" aria-haspopup="false" onkeydown="return CKEDITOR.tools.callFunction(47,event);" onfocus="return CKEDITOR.tools.callFunction(48,event);" onclick="CKEDITOR.tools.callFunction(49,this);return false;"><span class="cke_button_icon cke_button__maximize_icon" style="background-image:url('http://mir9.co.kr/resource/js/ckeditor4.7.2/plugins/icons.png?t=H7HD');background-position:0 -648px;background-size:auto;">&nbsp;</span><span id="cke_33_label" class="cke_button_label cke_button__maximize_label" aria-hidden="false">최대화</span><span id="cke_33_description" class="cke_button_label" aria-hidden="false"></span></a></span><span class="cke_toolbar_end"></span></span><span id="cke_34" class="cke_toolbar" aria-labelledby="cke_34_label" role="toolbar"><span id="cke_34_label" class="cke_voice_label">문서</span><span class="cke_toolbar_start"></span><span class="cke_toolgroup" role="presentation"><a id="cke_35" class="cke_button cke_button__searchcode cke_button_off" href="javascript:void('Search Source')" title="Search Source" tabindex="-1" hidefocus="true" role="button" aria-labelledby="cke_35_label" aria-describedby="cke_35_description" aria-haspopup="false" onkeydown="return CKEDITOR.tools.callFunction(50,event);" onfocus="return CKEDITOR.tools.callFunction(51,event);" onclick="CKEDITOR.tools.callFunction(52,this);return false;"><span class="cke_button_icon cke_button__searchcode_icon" style="background-image:url('http://mir9.co.kr/resource/js/ckeditor4.7.2/plugins/codemirror/icons/searchcode.png?t=H7HD');background-position:0 0px;background-size:16px;">&nbsp;</span><span id="cke_35_label" class="cke_button_label cke_button__searchcode_label" aria-hidden="false">Search Source</span><span id="cke_35_description" class="cke_button_label" aria-hidden="false"></span></a><a id="cke_36" class="cke_button cke_button__autoformat cke_button_off" href="javascript:void('Format Selection')" title="Format Selection" tabindex="-1" hidefocus="true" role="button" aria-labelledby="cke_36_label" aria-describedby="cke_36_description" aria-haspopup="false" onkeydown="return CKEDITOR.tools.callFunction(53,event);" onfocus="return CKEDITOR.tools.callFunction(54,event);" onclick="CKEDITOR.tools.callFunction(55,this);return false;"><span class="cke_button_icon cke_button__autoformat_icon" style="background-image:url('http://mir9.co.kr/resource/js/ckeditor4.7.2/plugins/codemirror/icons/autoformat.png?t=H7HD');background-position:0 0px;background-size:16px;">&nbsp;</span><span id="cke_36_label" class="cke_button_label cke_button__autoformat_label" aria-hidden="false">Format Selection</span><span id="cke_36_description" class="cke_button_label" aria-hidden="false"></span></a><a id="cke_37" class="cke_button cke_button__commentselectedrange cke_button_off" href="javascript:void('Comment Selection')" title="Comment Selection" tabindex="-1" hidefocus="true" role="button" aria-labelledby="cke_37_label" aria-describedby="cke_37_description" aria-haspopup="false" onkeydown="return CKEDITOR.tools.callFunction(56,event);" onfocus="return CKEDITOR.tools.callFunction(57,event);" onclick="CKEDITOR.tools.callFunction(58,this);return false;"><span class="cke_button_icon cke_button__commentselectedrange_icon" style="background-image:url('http://mir9.co.kr/resource/js/ckeditor4.7.2/plugins/codemirror/icons/commentselectedrange.png?t=H7HD');background-position:0 0px;background-size:16px;">&nbsp;</span><span id="cke_37_label" class="cke_button_label cke_button__commentselectedrange_label" aria-hidden="false">Comment Selection</span><span id="cke_37_description" class="cke_button_label" aria-hidden="false"></span></a><a id="cke_38" class="cke_button cke_button__uncommentselectedrange cke_button_off" href="javascript:void('Uncomment Selection')" title="Uncomment Selection" tabindex="-1" hidefocus="true" role="button" aria-labelledby="cke_38_label" aria-describedby="cke_38_description" aria-haspopup="false" onkeydown="return CKEDITOR.tools.callFunction(59,event);" onfocus="return CKEDITOR.tools.callFunction(60,event);" onclick="CKEDITOR.tools.callFunction(61,this);return false;"><span class="cke_button_icon cke_button__uncommentselectedrange_icon" style="background-image:url('http://mir9.co.kr/resource/js/ckeditor4.7.2/plugins/codemirror/icons/uncommentselectedrange.png?t=H7HD');background-position:0 0px;background-size:16px;">&nbsp;</span><span id="cke_38_label" class="cke_button_label cke_button__uncommentselectedrange_label" aria-hidden="false">Uncomment Selection</span><span id="cke_38_description" class="cke_button_label" aria-hidden="false"></span></a><a id="cke_39" class="cke_button cke_button__autocomplete cke_button_on" href="javascript:void('Enable/Disable HTML Tag Autocomplete')" title="Enable/Disable HTML Tag Autocomplete" tabindex="-1" hidefocus="true" role="button" aria-labelledby="cke_39_label" aria-describedby="cke_39_description" aria-haspopup="false" onkeydown="return CKEDITOR.tools.callFunction(62,event);" onfocus="return CKEDITOR.tools.callFunction(63,event);" onclick="CKEDITOR.tools.callFunction(64,this);return false;" aria-pressed="true"><span class="cke_button_icon cke_button__autocomplete_icon" style="background-image:url('http://mir9.co.kr/resource/js/ckeditor4.7.2/plugins/codemirror/icons/autocomplete.png?t=H7HD');background-position:0 0px;background-size:16px;">&nbsp;</span><span id="cke_39_label" class="cke_button_label cke_button__autocomplete_label" aria-hidden="false">Enable/Disable HTML Tag Autocomplete</span><span id="cke_39_description" class="cke_button_label" aria-hidden="false"></span></a><span class="cke_toolbar_separator" role="separator"></span><a id="cke_40" class="cke_button cke_button__print cke_button_disabled " href="javascript:void('인쇄')" title="인쇄" tabindex="-1" hidefocus="true" role="button" aria-labelledby="cke_40_label" aria-describedby="cke_40_description" aria-haspopup="false" aria-disabled="true" onkeydown="return CKEDITOR.tools.callFunction(65,event);" onfocus="return CKEDITOR.tools.callFunction(66,event);" onclick="CKEDITOR.tools.callFunction(67,this);return false;"><span class="cke_button_icon cke_button__print_icon" style="background-image:url('http://mir9.co.kr/resource/js/ckeditor4.7.2/plugins/icons.png?t=H7HD');background-position:0 -1104px;background-size:auto;">&nbsp;</span><span id="cke_40_label" class="cke_button_label cke_button__print_label" aria-hidden="false">인쇄</span><span id="cke_40_description" class="cke_button_label" aria-hidden="false"></span></a></span><span class="cke_toolbar_end"></span></span><span class="cke_toolbar_break"></span><span id="cke_41" class="cke_toolbar" aria-labelledby="cke_41_label" role="toolbar"><span id="cke_41_label" class="cke_voice_label">기본 스타일</span><span class="cke_toolbar_start"></span><span class="cke_toolgroup" role="presentation"><a id="cke_42" class="cke_button cke_button__bold cke_button_disabled " href="javascript:void('굵게')" title="굵게 (컨트롤+B)" tabindex="-1" hidefocus="true" role="button" aria-labelledby="cke_42_label" aria-describedby="cke_42_description" aria-haspopup="false" aria-disabled="true" onkeydown="return CKEDITOR.tools.callFunction(68,event);" onfocus="return CKEDITOR.tools.callFunction(69,event);" onclick="CKEDITOR.tools.callFunction(70,this);return false;"><span class="cke_button_icon cke_button__bold_icon" style="background-image:url('http://mir9.co.kr/resource/js/ckeditor4.7.2/plugins/icons.png?t=H7HD');background-position:0 -24px;background-size:auto;">&nbsp;</span><span id="cke_42_label" class="cke_button_label cke_button__bold_label" aria-hidden="false">굵게</span><span id="cke_42_description" class="cke_button_label" aria-hidden="false">키보드 단축키 컨트롤+B</span></a><a id="cke_43" class="cke_button cke_button__italic cke_button_disabled " href="javascript:void('기울임꼴')" title="기울임꼴 (컨트롤+I)" tabindex="-1" hidefocus="true" role="button" aria-labelledby="cke_43_label" aria-describedby="cke_43_description" aria-haspopup="false" aria-disabled="true" onkeydown="return CKEDITOR.tools.callFunction(71,event);" onfocus="return CKEDITOR.tools.callFunction(72,event);" onclick="CKEDITOR.tools.callFunction(73,this);return false;"><span class="cke_button_icon cke_button__italic_icon" style="background-image:url('http://mir9.co.kr/resource/js/ckeditor4.7.2/plugins/icons.png?t=H7HD');background-position:0 -48px;background-size:auto;">&nbsp;</span><span id="cke_43_label" class="cke_button_label cke_button__italic_label" aria-hidden="false">기울임꼴</span><span id="cke_43_description" class="cke_button_label" aria-hidden="false">키보드 단축키 컨트롤+I</span></a><a id="cke_44" class="cke_button cke_button__underline cke_button_disabled " href="javascript:void('밑줄')" title="밑줄 (컨트롤+U)" tabindex="-1" hidefocus="true" role="button" aria-labelledby="cke_44_label" aria-describedby="cke_44_description" aria-haspopup="false" aria-disabled="true" onkeydown="return CKEDITOR.tools.callFunction(74,event);" onfocus="return CKEDITOR.tools.callFunction(75,event);" onclick="CKEDITOR.tools.callFunction(76,this);return false;"><span class="cke_button_icon cke_button__underline_icon" style="background-image:url('http://mir9.co.kr/resource/js/ckeditor4.7.2/plugins/icons.png?t=H7HD');background-position:0 -144px;background-size:auto;">&nbsp;</span><span id="cke_44_label" class="cke_button_label cke_button__underline_label" aria-hidden="false">밑줄</span><span id="cke_44_description" class="cke_button_label" aria-hidden="false">키보드 단축키 컨트롤+U</span></a><a id="cke_45" class="cke_button cke_button__strike cke_button_disabled " href="javascript:void('취소선')" title="취소선" tabindex="-1" hidefocus="true" role="button" aria-labelledby="cke_45_label" aria-describedby="cke_45_description" aria-haspopup="false" aria-disabled="true" onkeydown="return CKEDITOR.tools.callFunction(77,event);" onfocus="return CKEDITOR.tools.callFunction(78,event);" onclick="CKEDITOR.tools.callFunction(79,this);return false;"><span class="cke_button_icon cke_button__strike_icon" style="background-image:url('http://mir9.co.kr/resource/js/ckeditor4.7.2/plugins/icons.png?t=H7HD');background-position:0 -72px;background-size:auto;">&nbsp;</span><span id="cke_45_label" class="cke_button_label cke_button__strike_label" aria-hidden="false">취소선</span><span id="cke_45_description" class="cke_button_label" aria-hidden="false"></span></a><a id="cke_46" class="cke_button cke_button__subscript cke_button_disabled " href="javascript:void('아래 첨자')" title="아래 첨자" tabindex="-1" hidefocus="true" role="button" aria-labelledby="cke_46_label" aria-describedby="cke_46_description" aria-haspopup="false" aria-disabled="true" onkeydown="return CKEDITOR.tools.callFunction(80,event);" onfocus="return CKEDITOR.tools.callFunction(81,event);" onclick="CKEDITOR.tools.callFunction(82,this);return false;"><span class="cke_button_icon cke_button__subscript_icon" style="background-image:url('http://mir9.co.kr/resource/js/ckeditor4.7.2/plugins/icons.png?t=H7HD');background-position:0 -96px;background-size:auto;">&nbsp;</span><span id="cke_46_label" class="cke_button_label cke_button__subscript_label" aria-hidden="false">아래 첨자</span><span id="cke_46_description" class="cke_button_label" aria-hidden="false"></span></a><a id="cke_47" class="cke_button cke_button__superscript cke_button_disabled " href="javascript:void('위 첨자')" title="위 첨자" tabindex="-1" hidefocus="true" role="button" aria-labelledby="cke_47_label" aria-describedby="cke_47_description" aria-haspopup="false" aria-disabled="true" onkeydown="return CKEDITOR.tools.callFunction(83,event);" onfocus="return CKEDITOR.tools.callFunction(84,event);" onclick="CKEDITOR.tools.callFunction(85,this);return false;"><span class="cke_button_icon cke_button__superscript_icon" style="background-image:url('http://mir9.co.kr/resource/js/ckeditor4.7.2/plugins/icons.png?t=H7HD');background-position:0 -120px;background-size:auto;">&nbsp;</span><span id="cke_47_label" class="cke_button_label cke_button__superscript_label" aria-hidden="false">위 첨자</span><span id="cke_47_description" class="cke_button_label" aria-hidden="false"></span></a><span class="cke_toolbar_separator" role="separator"></span><a id="cke_48" class="cke_button cke_button__removeformat cke_button_disabled " href="javascript:void('형식 지우기')" title="형식 지우기" tabindex="-1" hidefocus="true" role="button" aria-labelledby="cke_48_label" aria-describedby="cke_48_description" aria-haspopup="false" aria-disabled="true" onkeydown="return CKEDITOR.tools.callFunction(86,event);" onfocus="return CKEDITOR.tools.callFunction(87,event);" onclick="CKEDITOR.tools.callFunction(88,this);return false;"><span class="cke_button_icon cke_button__removeformat_icon" style="background-image:url('http://mir9.co.kr/resource/js/ckeditor4.7.2/plugins/icons.png?t=H7HD');background-position:0 -768px;background-size:auto;">&nbsp;</span><span id="cke_48_label" class="cke_button_label cke_button__removeformat_label" aria-hidden="false">형식 지우기</span><span id="cke_48_description" class="cke_button_label" aria-hidden="false"></span></a></span><span class="cke_toolbar_end"></span></span><span id="cke_49" class="cke_toolbar" aria-labelledby="cke_49_label" role="toolbar"><span id="cke_49_label" class="cke_voice_label">단락</span><span class="cke_toolbar_start"></span><span class="cke_toolgroup" role="presentation"><a id="cke_50" class="cke_button cke_button__numberedlist cke_button_disabled " href="javascript:void('순서 있는 목록')" title="순서 있는 목록" tabindex="-1" hidefocus="true" role="button" aria-labelledby="cke_50_label" aria-describedby="cke_50_description" aria-haspopup="false" aria-disabled="true" onkeydown="return CKEDITOR.tools.callFunction(89,event);" onfocus="return CKEDITOR.tools.callFunction(90,event);" onclick="CKEDITOR.tools.callFunction(91,this);return false;"><span class="cke_button_icon cke_button__numberedlist_icon" style="background-image:url('http://mir9.co.kr/resource/js/ckeditor4.7.2/plugins/icons.png?t=H7HD');background-position:0 -624px;background-size:auto;">&nbsp;</span><span id="cke_50_label" class="cke_button_label cke_button__numberedlist_label" aria-hidden="false">순서 있는 목록</span><span id="cke_50_description" class="cke_button_label" aria-hidden="false"></span></a><a id="cke_51" class="cke_button cke_button__bulletedlist cke_button_disabled " href="javascript:void('순서 없는 목록')" title="순서 없는 목록" tabindex="-1" hidefocus="true" role="button" aria-labelledby="cke_51_label" aria-describedby="cke_51_description" aria-haspopup="false" aria-disabled="true" onkeydown="return CKEDITOR.tools.callFunction(92,event);" onfocus="return CKEDITOR.tools.callFunction(93,event);" onclick="CKEDITOR.tools.callFunction(94,this);return false;"><span class="cke_button_icon cke_button__bulletedlist_icon" style="background-image:url('http://mir9.co.kr/resource/js/ckeditor4.7.2/plugins/icons.png?t=H7HD');background-position:0 -576px;background-size:auto;">&nbsp;</span><span id="cke_51_label" class="cke_button_label cke_button__bulletedlist_label" aria-hidden="false">순서 없는 목록</span><span id="cke_51_description" class="cke_button_label" aria-hidden="false"></span></a><span class="cke_toolbar_separator" role="separator"></span><a id="cke_52" class="cke_button cke_button__outdent cke_button_disabled " href="javascript:void('내어쓰기')" title="내어쓰기" tabindex="-1" hidefocus="true" role="button" aria-labelledby="cke_52_label" aria-describedby="cke_52_description" aria-haspopup="false" aria-disabled="true" onkeydown="return CKEDITOR.tools.callFunction(95,event);" onfocus="return CKEDITOR.tools.callFunction(96,event);" onclick="CKEDITOR.tools.callFunction(97,this);return false;"><span class="cke_button_icon cke_button__outdent_icon" style="background-image:url('http://mir9.co.kr/resource/js/ckeditor4.7.2/plugins/icons.png?t=H7HD');background-position:0 -432px;background-size:auto;">&nbsp;</span><span id="cke_52_label" class="cke_button_label cke_button__outdent_label" aria-hidden="false">내어쓰기</span><span id="cke_52_description" class="cke_button_label" aria-hidden="false"></span></a><a id="cke_53" class="cke_button cke_button__indent cke_button_disabled " href="javascript:void('들여쓰기')" title="들여쓰기" tabindex="-1" hidefocus="true" role="button" aria-labelledby="cke_53_label" aria-describedby="cke_53_description" aria-haspopup="false" aria-disabled="true" onkeydown="return CKEDITOR.tools.callFunction(98,event);" onfocus="return CKEDITOR.tools.callFunction(99,event);" onclick="CKEDITOR.tools.callFunction(100,this);return false;"><span class="cke_button_icon cke_button__indent_icon" style="background-image:url('http://mir9.co.kr/resource/js/ckeditor4.7.2/plugins/icons.png?t=H7HD');background-position:0 -384px;background-size:auto;">&nbsp;</span><span id="cke_53_label" class="cke_button_label cke_button__indent_label" aria-hidden="false">들여쓰기</span><span id="cke_53_description" class="cke_button_label" aria-hidden="false"></span></a><span class="cke_toolbar_separator" role="separator"></span><a id="cke_54" class="cke_button cke_button__justifyleft cke_button_disabled " href="javascript:void('왼쪽 정렬')" title="왼쪽 정렬" tabindex="-1" hidefocus="true" role="button" aria-labelledby="cke_54_label" aria-describedby="cke_54_description" aria-haspopup="false" aria-disabled="true" onkeydown="return CKEDITOR.tools.callFunction(101,event);" onfocus="return CKEDITOR.tools.callFunction(102,event);" onclick="CKEDITOR.tools.callFunction(103,this);return false;"><span class="cke_button_icon cke_button__justifyleft_icon" style="background-image:url('http://mir9.co.kr/resource/js/ckeditor4.7.2/plugins/icons.png?t=H7HD');background-position:0 -1056px;background-size:auto;">&nbsp;</span><span id="cke_54_label" class="cke_button_label cke_button__justifyleft_label" aria-hidden="false">왼쪽 정렬</span><span id="cke_54_description" class="cke_button_label" aria-hidden="false"></span></a><a id="cke_55" class="cke_button cke_button__justifycenter cke_button_disabled " href="javascript:void('가운데 정렬')" title="가운데 정렬" tabindex="-1" hidefocus="true" role="button" aria-labelledby="cke_55_label" aria-describedby="cke_55_description" aria-haspopup="false" aria-disabled="true" onkeydown="return CKEDITOR.tools.callFunction(104,event);" onfocus="return CKEDITOR.tools.callFunction(105,event);" onclick="CKEDITOR.tools.callFunction(106,this);return false;"><span class="cke_button_icon cke_button__justifycenter_icon" style="background-image:url('http://mir9.co.kr/resource/js/ckeditor4.7.2/plugins/icons.png?t=H7HD');background-position:0 -1032px;background-size:auto;">&nbsp;</span><span id="cke_55_label" class="cke_button_label cke_button__justifycenter_label" aria-hidden="false">가운데 정렬</span><span id="cke_55_description" class="cke_button_label" aria-hidden="false"></span></a><a id="cke_56" class="cke_button cke_button__justifyright cke_button_disabled " href="javascript:void('오른쪽 정렬')" title="오른쪽 정렬" tabindex="-1" hidefocus="true" role="button" aria-labelledby="cke_56_label" aria-describedby="cke_56_description" aria-haspopup="false" aria-disabled="true" onkeydown="return CKEDITOR.tools.callFunction(107,event);" onfocus="return CKEDITOR.tools.callFunction(108,event);" onclick="CKEDITOR.tools.callFunction(109,this);return false;"><span class="cke_button_icon cke_button__justifyright_icon" style="background-image:url('http://mir9.co.kr/resource/js/ckeditor4.7.2/plugins/icons.png?t=H7HD');background-position:0 -1080px;background-size:auto;">&nbsp;</span><span id="cke_56_label" class="cke_button_label cke_button__justifyright_label" aria-hidden="false">오른쪽 정렬</span><span id="cke_56_description" class="cke_button_label" aria-hidden="false"></span></a><a id="cke_57" class="cke_button cke_button__justifyblock cke_button_disabled " href="javascript:void('양쪽 맞춤')" title="양쪽 맞춤" tabindex="-1" hidefocus="true" role="button" aria-labelledby="cke_57_label" aria-describedby="cke_57_description" aria-haspopup="false" aria-disabled="true" onkeydown="return CKEDITOR.tools.callFunction(110,event);" onfocus="return CKEDITOR.tools.callFunction(111,event);" onclick="CKEDITOR.tools.callFunction(112,this);return false;"><span class="cke_button_icon cke_button__justifyblock_icon" style="background-image:url('http://mir9.co.kr/resource/js/ckeditor4.7.2/plugins/icons.png?t=H7HD');background-position:0 -1008px;background-size:auto;">&nbsp;</span><span id="cke_57_label" class="cke_button_label cke_button__justifyblock_label" aria-hidden="false">양쪽 맞춤</span><span id="cke_57_description" class="cke_button_label" aria-hidden="false"></span></a></span><span class="cke_toolbar_end"></span></span><span id="cke_58" class="cke_toolbar" aria-labelledby="cke_58_label" role="toolbar"><span id="cke_58_label" class="cke_voice_label">스타일</span><span class="cke_toolbar_start"></span><span id="cke_11" class="cke_combo cke_combo__font cke_combo_disabled" role="presentation" aria-disabled="true"><span id="cke_11_label" class="cke_combo_label">글꼴</span><a class="cke_combo_button" title="글꼴" tabindex="-1" href="javascript:void('글꼴')" hidefocus="true" role="button" aria-labelledby="cke_11_label" aria-haspopup="true" onkeydown="return CKEDITOR.tools.callFunction(114,event,this);" onfocus="return CKEDITOR.tools.callFunction(115,event);" onclick="CKEDITOR.tools.callFunction(113,this);return false;"><span id="cke_11_text" class="cke_combo_text cke_combo_inlinelabel">글꼴</span><span class="cke_combo_open"><span class="cke_combo_arrow"></span></span></a></span><span id="cke_12" class="cke_combo cke_combo__fontsize cke_combo_disabled" role="presentation" aria-disabled="true"><span id="cke_12_label" class="cke_combo_label">크기</span><a class="cke_combo_button" title="글자 크기" tabindex="-1" href="javascript:void('글자 크기')" hidefocus="true" role="button" aria-labelledby="cke_12_label" aria-haspopup="true" onkeydown="return CKEDITOR.tools.callFunction(117,event,this);" onfocus="return CKEDITOR.tools.callFunction(118,event);" onclick="CKEDITOR.tools.callFunction(116,this);return false;"><span id="cke_12_text" class="cke_combo_text cke_combo_inlinelabel">크기</span><span class="cke_combo_open"><span class="cke_combo_arrow"></span></span></a></span><span class="cke_toolbar_end"></span></span><span id="cke_59" class="cke_toolbar" aria-labelledby="cke_59_label" role="toolbar"><span id="cke_59_label" class="cke_voice_label">색상</span><span class="cke_toolbar_start"></span><span class="cke_toolgroup" role="presentation"><a id="cke_60" class="cke_button cke_button__textcolor cke_button_disabled" href="javascript:void('글자 색상')" title="글자 색상" tabindex="-1" hidefocus="true" role="button" aria-labelledby="cke_60_label" aria-describedby="cke_60_description" aria-haspopup="true" aria-disabled="true" onkeydown="return CKEDITOR.tools.callFunction(119,event);" onfocus="return CKEDITOR.tools.callFunction(120,event);" onclick="CKEDITOR.tools.callFunction(121,this);return false;"><span class="cke_button_icon cke_button__textcolor_icon" style="background-image:url('http://mir9.co.kr/resource/js/ckeditor4.7.2/plugins/icons.png?t=H7HD');background-position:0 -1176px;background-size:auto;">&nbsp;</span><span id="cke_60_label" class="cke_button_label cke_button__textcolor_label" aria-hidden="false">글자 색상</span><span id="cke_60_description" class="cke_button_label" aria-hidden="false"></span><span class="cke_button_arrow"></span></a><a id="cke_61" class="cke_button cke_button__bgcolor cke_button_disabled" href="javascript:void('배경 색상')" title="배경 색상" tabindex="-1" hidefocus="true" role="button" aria-labelledby="cke_61_label" aria-describedby="cke_61_description" aria-haspopup="true" aria-disabled="true" onkeydown="return CKEDITOR.tools.callFunction(122,event);" onfocus="return CKEDITOR.tools.callFunction(123,event);" onclick="CKEDITOR.tools.callFunction(124,this);return false;"><span class="cke_button_icon cke_button__bgcolor_icon" style="background-image:url('http://mir9.co.kr/resource/js/ckeditor4.7.2/plugins/icons.png?t=H7HD');background-position:0 -1152px;background-size:auto;">&nbsp;</span><span id="cke_61_label" class="cke_button_label cke_button__bgcolor_label" aria-hidden="false">배경 색상</span><span id="cke_61_description" class="cke_button_label" aria-hidden="false"></span><span class="cke_button_arrow"></span></a></span><span class="cke_toolbar_end"></span></span><span id="cke_62" class="cke_toolbar cke_toolbar_last" aria-labelledby="cke_62_label" role="toolbar"><span id="cke_62_label" class="cke_voice_label">about</span><span class="cke_toolbar_start"></span><span class="cke_toolgroup" role="presentation"><a id="cke_63" class="cke_button cke_button__about cke_button_off" href="javascript:void('CKEditor에 대하여')" title="CKEditor에 대하여" tabindex="-1" hidefocus="true" role="button" aria-labelledby="cke_63_label" aria-describedby="cke_63_description" aria-haspopup="false" onkeydown="return CKEDITOR.tools.callFunction(125,event);" onfocus="return CKEDITOR.tools.callFunction(126,event);" onclick="CKEDITOR.tools.callFunction(127,this);return false;"><span class="cke_button_icon cke_button__about_icon" style="background-image:url('http://mir9.co.kr/resource/js/ckeditor4.7.2/plugins/icons.png?t=H7HD');background-position:0 0px;background-size:auto;">&nbsp;</span><span id="cke_63_label" class="cke_button_label cke_button__about_label" aria-hidden="false">CKEditor에 대하여</span><span id="cke_63_description" class="cke_button_label" aria-hidden="false"></span></a></span><span class="cke_toolbar_end"></span></span></span></span><div id="cke_1_contents" class="cke_contents cke_reset" role="presentation" style="height: 800px;"><textarea dir="ltr" tabindex="0" role="textbox" aria-label="리치 텍스트 편집기, content-editor" class="cke_source cke_reset cke_enable_context_menu cke_editable cke_editable_themed cke_contents_ltr" title="리치 텍스트 편집기, content-editor" aria-describedby="cke_71" style="width: 100%; height: 100%; resize: none; outline: none; text-align: left; tab-size: 4; display: none;"></textarea><div class="CodeMirror cm-s-3024-night CodeMirror-wrap" style="height: 800px;"><div style="overflow: hidden; position: relative; width: 3px; height: 0px;"><textarea autocorrect="off" autocapitalize="off" spellcheck="false" tabindex="0" style="position: absolute; bottom: -1em; padding: 0px; width: 1000px; height: 1em; outline: none;"></textarea></div><div class="CodeMirror-vscrollbar" cm-not-content="true"><div style="min-width: 1px;"></div></div><div class="CodeMirror-hscrollbar" cm-not-content="true"><div style="height: 100%; min-height: 1px;"></div></div><div class="CodeMirror-scrollbar-filler" cm-not-content="true"></div><div class="CodeMirror-gutter-filler" cm-not-content="true"></div><div class="CodeMirror-scroll" tabindex="-1"><div class="CodeMirror-sizer" style="margin-left: 0px;"><div style="position: relative;"><div class="CodeMirror-lines" role="presentation"><div role="presentation" style="position: relative; outline: none;"><div class="CodeMirror-measure"><pre><span>xxxxxxxxxx</span></pre><div class="CodeMirror-linenumber CodeMirror-gutter-elt"><div>1</div></div></div><div class="CodeMirror-measure"></div><div style="position: relative; z-index: 1;"></div><div class="CodeMirror-cursors"></div><div class="CodeMirror-code" role="presentation"></div></div></div></div></div><div style="position: absolute; height: 30px; width: 1px;"></div><div class="CodeMirror-gutters"><div class="CodeMirror-gutter CodeMirror-linenumbers" style="width: 1px;"></div><div class="CodeMirror-gutter CodeMirror-foldgutter"></div></div></div></div><span id="cke_71" class="cke_voice_label">도움이 필요하면 ALT 0 을 누르세요</span></div><span id="cke_1_bottom" class="cke_bottom cke_reset_all" role="presentation" style="user-select: none;"><span id="cke_1_resizer" class="cke_resizer cke_resizer_vertical cke_resizer_ltr" title="크기 조절" onmousedown="CKEDITOR.tools.callFunction(0, event)">◢</span><span id="cke_1_path_label" class="cke_voice_label">요소 경로</span><span id="cke_1_path" class="cke_path" role="group" aria-labelledby="cke_1_path_label"><span class="cke_path_empty">&nbsp;</span></span></span></div></div>
                </td>
            </tr>
            </tbody></table>
            
            </div></form>

            </div>
            <div class="modal-footer">
            <button type="button" id="displayButton" onclick="register();" class="btn btn-primary">저장하기</button>
            <a href="#none" id="previewLink" target="_new"><button type="button" class="btn btn-success">미리보기</button></a>
            </div>
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

<div class="modal fade" id="modalRevision" tabindex="-2" role="dialog" aria-labelledby="myModal" aria-hidden="true">
    <div class="modal-dialog" style="width:500px;">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                <h4 class="modal-title">리비젼 내역</h4>
            </div>
            <div class="modal-body">

            <span style="float:left;"><h4><p class="text-light-blue"><i class="fa fa-fw fa-info-circle"></i> <span id="revisionTitle" style="padding-top:10px;"></span></p></h4></span>
            <span id="htmlTag"></span>
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
      <option value="en">ENG</option>      <option value="zh">中国</option>      <option value="vn">Tiếng việt</option>                </select>
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

<form name="formDeleteRevision" method="post" action="?tpf=admin/menu/process">
<input type="hidden" name="mode" value="deleteRevision">
<input type="hidden" name="code">
</form>

<script src="//mir9.co.kr/resource/js/ckeditor4.7.2/ckeditor.js"></script>
</div><!-- /.content-wrapper -->

<footer class="main-footer">
<div class="pull-right hidden-xs">
    <b>Version</b> 2.7.4
</div>
<strong>Copyright © 2017 <a href="/admin">MIR9 SHOP</a>.</strong> All rights reserved.
</footer>


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
<script src="/html/js/common.js" type="text/javascript" charset="utf-8"></script>
<!-- fullcalendar -->
<script src="//mir9.co.kr/resource/js/bootstrap-colorselector.js"></script>
<script src="//mir9.co.kr/resource/js/AdminLTE-2.4.2/bower_components/fullcalendar/dist/fullcalendar.moment.min.js" type="text/javascript"></script>
<script src="//mir9.co.kr/resource/js/AdminLTE-2.4.2/bower_components/fullcalendar/dist/fullcalendar.min.js" type="text/javascript"></script>


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
        }
        function onclickManual() {
            $('#modalManual').modal({backdrop:'static', show:true});
        }
        function closeManual() {
            $('#modalManual').modal('hide');
        }
        function printData(json_data) {
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
            }
            parent.$('[name=title]').val(json_data.title);
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
            }, 200);
            setTimeout(function(){
                parent.objEditor.setData(json_data.content);
            }, 200);
        }
        function setData(code) {
            // 정보
            $.ajax({
                url:'http://demoshop.mir9.kr/api/process.php',
                type:'post',
                dataType:'json',
                data:{
                    method : 'UtilMenu.infoMenu',
                    locale : parent.$('[name=locale]').val(),
                    code : code
                },
                success:function(data, textStatus, jqXHR){
                    var json_data = data.data;
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
            parent.$('#modalContent').modal({backdrop:'static', show:true});
            // 리비젼 정보 보여주기
            $.ajax({
                url:'http://demoshop.mir9.kr/api/process.php',
                type:'post',
                dataType:'json',
                data:{
                    method : 'UtilMenu.infoRevision',
                    locale : parent.$('[name=locale]').val(),
                    code : code
                },
                success:function(data, textStatus, jqXHR){
                    var json_data = data.data;
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
        function deleteRevision(code, obj) {
            if(confirm('해당 리비젼 정보를 정말 삭제하시겠습니까?')) {
                parent.formDeleteRevision.code.value = code;
                parent.formDeleteRevision.target = 'iframe_process';
                parent.formDeleteRevision.submit();
                // tr 태그 삭제
                $(obj).parents('tr').remove();
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

</body></html>