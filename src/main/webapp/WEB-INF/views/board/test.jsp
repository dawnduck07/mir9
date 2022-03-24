<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" style="height: auto; min-height: 100%;"><head>
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
<style>.cke{visibility:hidden;}</style><script type="text/javascript" src="http://mir9.co.kr/resource/js/ckeditor4.7.2/config.js?t=H7HD"></script><style type="text/css">.jqstooltip { position: absolute;left: 0px;top: 0px;visibility: hidden;background: rgb(0, 0, 0) transparent;background-color: rgba(0,0,0,0.6);filter:progid:DXImageTransform.Microsoft.gradient(startColorstr=#99000000, endColorstr=#99000000);-ms-filter: "progid:DXImageTransform.Microsoft.gradient(startColorstr=#99000000, endColorstr=#99000000)";color: white;font: 10px arial, san serif;text-align: left;white-space: nowrap;padding: 5px;border: 1px solid white;box-sizing: content-box;z-index: 10000;}.jqsfield { color: white;font: 10px arial, san serif;text-align: left;}</style><link rel="stylesheet" type="text/css" href="http://mir9.co.kr/resource/js/ckeditor4.7.2/skins/office2013/editor.css?t=H7HD"><script type="text/javascript" src="http://mir9.co.kr/resource/js/ckeditor4.7.2/lang/ko.js?t=H7HD"></script><script type="text/javascript" src="http://mir9.co.kr/resource/js/ckeditor4.7.2/styles.js?t=H7HD"></script><script type="text/javascript" src="http://mir9.co.kr/resource/js/ckeditor4.7.2/plugins/tableresize/plugin.js?t=H7HD"></script><link rel="stylesheet" type="text/css" href="http://mir9.co.kr/resource/js/ckeditor4.7.2/plugins/scayt/dialogs/dialog.css"><link rel="stylesheet" type="text/css" href="http://mir9.co.kr/resource/js/ckeditor4.7.2/plugins/tableselection/styles/tableselection.css"></head>

<body class="skin-red sidebar-mini" style="height: auto; min-height: 100%;">
<iframe name="iframe_process" width="0" height="0" frameborder="0" style="display:none;"></iframe>

<div class="wrapper" style="height: auto; min-height: 100%;">

<!-- header -->

<div class="content-wrapper" style="min-height: 761px;">
<style>
    textarea p { line-height:120px;}
    </style>
    
    <section class="content-header">
        <h1>
        공지사항 관리
        <small>공지사항 list</small>
        </h1>
    
        <ol class="breadcrumb">
            <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
            <li class="active">공지사항 관리</li>
        </ol>
    </section>
    
    <section class="content">
        <div class="row">
            <div class="col-xs-12">
                <div class="box">
                    <div class="box-body">
                        <label style="margin-top:5px;">총 1 건</label>
                        <div class="box-tools pull-right" style="margin-bottom:5px;">
                        <form name="form_search" method="post" action="?tpf=admin/board/list">
                        <input type="hidden" name="board_code" value="1">
                            <div class="has-feedback">
                            <span>
                            <input type="text" name="keyword" id="keyword" value="" class="form-control input-sm" placeholder="검색">
                            <span class="glyphicon glyphicon-search form-control-feedback"></span>
                            </span>
                            </div>
                        </form></div>
    
                        <div class="box-tools pull-right" style="margin-bottom:5px;">
                            <div class="has-feedback">
                                <select name="field" class="form-control input-sm" style="float:left; width:130px;">
          <option value="b.title">제목</option>      <option value="b.name">작성자</option>                            </select>
                            </div>
                        
                        </div>
    
                        <table class="table table-bordered table-hover">
                        <form name="form_list" method="post" action="?tpf=admin/board/process"></form>
                        <input type="hidden" name="mode" id="mode">
                        <input type="hidden" name="board_code" value="1">
                        <thead>
                        <tr>
                            <td style="width:30px;"><input type="checkbox" name="select_all" onclick="selectAllCheckBox('form_list');"></td>
                            <td style="width:60px;">NO</td>
                                <td>제목</td>
                                <td style="width:100px;">작성자</td>
                            <td style="width:140px;">등록일</td>
                            <td style="width:80px;">조회수</td>
                            <td style="width:60px;">
                            <i onclick="changeOrder('down','board_data','?tpf=admin/board/list_order&amp;board_code=1',1,'','',);" class="fa fa-fw fa-arrow-circle-down cp" style="cursor:pointer;"></i>
                            <i onclick="changeOrder('up','board_data','?tpf=admin/board/list_order&amp;board_code=1',1,'','',);" class="fa fa-fw fa-arrow-circle-up cp" style="cursor:pointer;"></i>
                            </td>
                            <td style="width:80px;">명령</td>
                        </tr>
                        </thead>
          				<tbody>
          				<tr>
                            <td><input type="checkbox" name="list[]" value="69"></td>
                            <td>1</td>          <td align="left">공지사항          </td>          <td>길동이</td>
                            <td>2020-02-06 14:54</td>
                            <td>116</td>
                            <td><input type="radio" name="order_code" value="-1"></td>
                            <td><button type="button" onclick="onclick_update(69);" class="btn btn-primary btn-xs">상세보기</button></td>
                        </tr>                        
                        </tbody></table>
                        <br>
    
                        <button type="button" onclick="selectDelete();" class="btn btn-danger btn-sm"><i class="fa fa-minus-square"></i> 선택삭제</button>
                        <button type="button" onclick="onclickInsert()" class="btn btn-primary btn-sm"><i class="fa fa-plus-square"></i> 글 등록</button>
                        <button type="button" onclick="onclickCopyData('copyData')" class="btn btn-warning btn-sm"><i class="fa fa-random"></i> 게시물 복사</button>
                        <button type="button" onclick="onclickCopyData('moveData')" class="btn btn-warning btn-sm"><i class="fa fa-random"></i> 게시물 이전</button>
    
                        <div style="text-align:right;">
                            <ul class="pagination" style="margin:0;">
<li class="active"><a href="?tpf=admin/board/list_order&amp;board_code=1&amp;page=1">1</a></li>
</ul>                        </div>
                    </div><!-- /.box-body -->
                </div><!-- /.box -->
            </div><!-- /.col-xs-12 -->
        </div><!-- /.row -->
    </section>
    
    <div class="modal fade" id="modalContent" tabindex="-2" role="dialog" aria-labelledby="myModal" aria-hidden="true" style="display: none;">
        <div class="modal-dialog">
            <div class="modal-content">
                <form name="form_register" method="post" action="?tpf=admin/board/process" enctype="multipart/form-data">
                <input type="hidden" name="mode" id="mode" value="update">
                <input type="hidden" name="board_code" value="1">
                <input type="hidden" name="board_data_code" id="board_data_code" value="69">
                <input type="hidden" name="delete_file" id="delete_file">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                    <h4 class="modal-title" id="myModalLabelPortfolio">게시물 관리</h4>
                </div>
                <div class="modal-body">
    
                <h4><p class="text-light-blue"><i class="fa fa-fw fa-info-circle"></i> 글 <span id="board_sub_title">수정</span></p></h4>
                <table class="table table-bordered">
                    <tbody><tr>
                    <td class="menu">작성자</td>
                    <td align="left"><input type="text" name="name" id="name" value="길동이" class="form-control input-sm"></td>
                </tr>
                    <tr>
                    <td class="menu">휴대전화</td>
                    <td align="left"><input type="text" name="tel" id="tel" class="form-control input-sm" style="width:50%;"></td>
                </tr>
                <tr>
                    <td class="menu">이메일</td>
                    <td align="left"><input type="text" name="email" id="email" class="form-control input-sm" style="width:50%;"></td>
                </tr>
                    <tr>
                    <td class="menu">제목</td>
                    <td align="left">
                    <span style="float:left;width:80%;"><input type="text" name="title" id="title" class="form-control input-sm"></span>
                        <span>&nbsp;&nbsp;<input type="checkbox" name="is_notice" value="y">공지사항</span>
                        </td>
                </tr>
                    <tr>
                    <td class="menu">내용</td>
                    <td align="left"><textarea name="content" id="content" rows="10" cols="80" style="visibility: hidden; display: none;"></textarea><div id="cke_content" class="cke_1 cke cke_reset cke_chrome cke_editor_content cke_ltr cke_browser_webkit" dir="ltr" lang="ko" role="application" aria-labelledby="cke_content_arialbl"><span id="cke_content_arialbl" class="cke_voice_label">리치 텍스트 편집기, content</span><div class="cke_inner cke_reset" role="presentation"><span id="cke_1_top" class="cke_top cke_reset_all" role="presentation" style="height: auto; user-select: none;"><span id="cke_10" class="cke_voice_label">에디터 툴바</span><span id="cke_1_toolbox" class="cke_toolbox" role="group" aria-labelledby="cke_10" onmousedown="return false;"><span id="cke_13" class="cke_toolbar" aria-labelledby="cke_13_label" role="toolbar"><span id="cke_13_label" class="cke_voice_label">클립보드/실행 취소</span><span class="cke_toolbar_start"></span><span class="cke_toolgroup" role="presentation"><a id="cke_14" class="cke_button cke_button__cut cke_button_disabled " href="javascript:void('잘라내기')" title="잘라내기 (컨트롤+X)" tabindex="-1" hidefocus="true" role="button" aria-labelledby="cke_14_label" aria-describedby="cke_14_description" aria-haspopup="false" aria-disabled="true" onkeydown="return CKEDITOR.tools.callFunction(2,event);" onfocus="return CKEDITOR.tools.callFunction(3,event);" onclick="CKEDITOR.tools.callFunction(4,this);return false;"><span class="cke_button_icon cke_button__cut_icon" style="background-image:url('http://mir9.co.kr/resource/js/ckeditor4.7.2/plugins/icons.png?t=H7HD');background-position:0 -240px;background-size:auto;">&nbsp;</span><span id="cke_14_label" class="cke_button_label cke_button__cut_label" aria-hidden="false">잘라내기</span><span id="cke_14_description" class="cke_button_label" aria-hidden="false">키보드 단축키 컨트롤+X</span></a><a id="cke_15" class="cke_button cke_button__copy cke_button_disabled " href="javascript:void('복사')" title="복사 (컨트롤+C)" tabindex="-1" hidefocus="true" role="button" aria-labelledby="cke_15_label" aria-describedby="cke_15_description" aria-haspopup="false" aria-disabled="true" onkeydown="return CKEDITOR.tools.callFunction(5,event);" onfocus="return CKEDITOR.tools.callFunction(6,event);" onclick="CKEDITOR.tools.callFunction(7,this);return false;"><span class="cke_button_icon cke_button__copy_icon" style="background-image:url('http://mir9.co.kr/resource/js/ckeditor4.7.2/plugins/icons.png?t=H7HD');background-position:0 -192px;background-size:auto;">&nbsp;</span><span id="cke_15_label" class="cke_button_label cke_button__copy_label" aria-hidden="false">복사</span><span id="cke_15_description" class="cke_button_label" aria-hidden="false">키보드 단축키 컨트롤+C</span></a><a id="cke_16" class="cke_button cke_button__paste cke_button_off" href="javascript:void('붙여넣기')" title="붙여넣기 (컨트롤+V)" tabindex="-1" hidefocus="true" role="button" aria-labelledby="cke_16_label" aria-describedby="cke_16_description" aria-haspopup="false" onkeydown="return CKEDITOR.tools.callFunction(8,event);" onfocus="return CKEDITOR.tools.callFunction(9,event);" onclick="CKEDITOR.tools.callFunction(10,this);return false;"><span class="cke_button_icon cke_button__paste_icon" style="background-image:url('http://mir9.co.kr/resource/js/ckeditor4.7.2/plugins/icons.png?t=H7HD');background-position:0 -288px;background-size:auto;">&nbsp;</span><span id="cke_16_label" class="cke_button_label cke_button__paste_label" aria-hidden="false">붙여넣기</span><span id="cke_16_description" class="cke_button_label" aria-hidden="false">키보드 단축키 컨트롤+V</span></a><a id="cke_17" class="cke_button cke_button__pastetext cke_button_off" href="javascript:void('텍스트로 붙여넣기')" title="텍스트로 붙여넣기 (컨트롤+시프트+V)" tabindex="-1" hidefocus="true" role="button" aria-labelledby="cke_17_label" aria-describedby="cke_17_description" aria-haspopup="false" onkeydown="return CKEDITOR.tools.callFunction(11,event);" onfocus="return CKEDITOR.tools.callFunction(12,event);" onclick="CKEDITOR.tools.callFunction(13,this);return false;"><span class="cke_button_icon cke_button__pastetext_icon" style="background-image:url('http://mir9.co.kr/resource/js/ckeditor4.7.2/plugins/icons.png?t=H7HD');background-position:0 -696px;background-size:auto;">&nbsp;</span><span id="cke_17_label" class="cke_button_label cke_button__pastetext_label" aria-hidden="false">텍스트로 붙여넣기</span><span id="cke_17_description" class="cke_button_label" aria-hidden="false">키보드 단축키 컨트롤+시프트+V</span></a><a id="cke_18" class="cke_button cke_button__pastefromword cke_button_off" href="javascript:void('MS Word 에서 붙여넣기')" title="MS Word 에서 붙여넣기" tabindex="-1" hidefocus="true" role="button" aria-labelledby="cke_18_label" aria-describedby="cke_18_description" aria-haspopup="false" onkeydown="return CKEDITOR.tools.callFunction(14,event);" onfocus="return CKEDITOR.tools.callFunction(15,event);" onclick="CKEDITOR.tools.callFunction(16,this);return false;"><span class="cke_button_icon cke_button__pastefromword_icon" style="background-image:url('http://mir9.co.kr/resource/js/ckeditor4.7.2/plugins/icons.png?t=H7HD');background-position:0 -744px;background-size:auto;">&nbsp;</span><span id="cke_18_label" class="cke_button_label cke_button__pastefromword_label" aria-hidden="false">MS Word 에서 붙여넣기</span><span id="cke_18_description" class="cke_button_label" aria-hidden="false"></span></a><span class="cke_toolbar_separator" role="separator"></span><a id="cke_19" class="cke_button cke_button__undo cke_button_off" href="javascript:void('실행 취소')" title="실행 취소 (컨트롤+Z)" tabindex="-1" hidefocus="true" role="button" aria-labelledby="cke_19_label" aria-describedby="cke_19_description" aria-haspopup="false" onkeydown="return CKEDITOR.tools.callFunction(17,event);" onfocus="return CKEDITOR.tools.callFunction(18,event);" onclick="CKEDITOR.tools.callFunction(19,this);return false;"><span class="cke_button_icon cke_button__undo_icon" style="background-image:url('http://mir9.co.kr/resource/js/ckeditor4.7.2/plugins/icons.png?t=H7HD');background-position:0 -984px;background-size:auto;">&nbsp;</span><span id="cke_19_label" class="cke_button_label cke_button__undo_label" aria-hidden="false">실행 취소</span><span id="cke_19_description" class="cke_button_label" aria-hidden="false">키보드 단축키 컨트롤+Z</span></a><a id="cke_20" class="cke_button cke_button__redo cke_button_disabled " href="javascript:void('다시 실행')" title="다시 실행 (컨트롤+Y)" tabindex="-1" hidefocus="true" role="button" aria-labelledby="cke_20_label" aria-describedby="cke_20_description" aria-haspopup="false" aria-disabled="true" onkeydown="return CKEDITOR.tools.callFunction(20,event);" onfocus="return CKEDITOR.tools.callFunction(21,event);" onclick="CKEDITOR.tools.callFunction(22,this);return false;"><span class="cke_button_icon cke_button__redo_icon" style="background-image:url('http://mir9.co.kr/resource/js/ckeditor4.7.2/plugins/icons.png?t=H7HD');background-position:0 -936px;background-size:auto;">&nbsp;</span><span id="cke_20_label" class="cke_button_label cke_button__redo_label" aria-hidden="false">다시 실행</span><span id="cke_20_description" class="cke_button_label" aria-hidden="false">키보드 단축키 컨트롤+Y</span></a></span><span class="cke_toolbar_end"></span></span><span id="cke_21" class="cke_toolbar" aria-labelledby="cke_21_label" role="toolbar"><span id="cke_21_label" class="cke_voice_label">편집</span><span class="cke_toolbar_start"></span><span class="cke_toolgroup" role="presentation"><a id="cke_22" class="cke_button cke_button__scayt cke_button_off" href="javascript:void('Spell Check')" title="Spell Check" tabindex="-1" hidefocus="true" role="button" aria-labelledby="cke_22_label" aria-describedby="cke_22_description" aria-haspopup="true" onkeydown="return CKEDITOR.tools.callFunction(23,event);" onfocus="return CKEDITOR.tools.callFunction(24,event);" onclick="CKEDITOR.tools.callFunction(25,this);return false;"><span class="cke_button_icon cke_button__scayt_icon" style="background-image:url('http://mir9.co.kr/resource/js/ckeditor4.7.2/plugins/icons.png?t=H7HD');background-position:0 -864px;background-size:auto;">&nbsp;</span><span id="cke_22_label" class="cke_button_label cke_button__scayt_label" aria-hidden="false">Spell Check As You Type</span><span id="cke_22_description" class="cke_button_label" aria-hidden="false"></span><span class="cke_button_arrow"></span></a></span><span class="cke_toolbar_end"></span></span><span id="cke_23" class="cke_toolbar" aria-labelledby="cke_23_label" role="toolbar"><span id="cke_23_label" class="cke_voice_label">링크</span><span class="cke_toolbar_start"></span><span class="cke_toolgroup" role="presentation"><a id="cke_24" class="cke_button cke_button__link cke_button_off" href="javascript:void('링크 삽입/변경')" title="링크 삽입/변경 (컨트롤+L)" tabindex="-1" hidefocus="true" role="button" aria-labelledby="cke_24_label" aria-describedby="cke_24_description" aria-haspopup="false" onkeydown="return CKEDITOR.tools.callFunction(26,event);" onfocus="return CKEDITOR.tools.callFunction(27,event);" onclick="CKEDITOR.tools.callFunction(28,this);return false;"><span class="cke_button_icon cke_button__link_icon" style="background-image:url('http://mir9.co.kr/resource/js/ckeditor4.7.2/plugins/icons.png?t=H7HD');background-position:0 -504px;background-size:auto;">&nbsp;</span><span id="cke_24_label" class="cke_button_label cke_button__link_label" aria-hidden="false">링크 삽입/변경</span><span id="cke_24_description" class="cke_button_label" aria-hidden="false">키보드 단축키 컨트롤+L</span></a><a id="cke_25" class="cke_button cke_button__unlink cke_button_disabled " href="javascript:void('링크 지우기')" title="링크 지우기" tabindex="-1" hidefocus="true" role="button" aria-labelledby="cke_25_label" aria-describedby="cke_25_description" aria-haspopup="false" aria-disabled="true" onkeydown="return CKEDITOR.tools.callFunction(29,event);" onfocus="return CKEDITOR.tools.callFunction(30,event);" onclick="CKEDITOR.tools.callFunction(31,this);return false;"><span class="cke_button_icon cke_button__unlink_icon" style="background-image:url('http://mir9.co.kr/resource/js/ckeditor4.7.2/plugins/icons.png?t=H7HD');background-position:0 -528px;background-size:auto;">&nbsp;</span><span id="cke_25_label" class="cke_button_label cke_button__unlink_label" aria-hidden="false">링크 지우기</span><span id="cke_25_description" class="cke_button_label" aria-hidden="false"></span></a><a id="cke_26" class="cke_button cke_button__anchor cke_button_off" href="javascript:void('책갈피')" title="책갈피" tabindex="-1" hidefocus="true" role="button" aria-labelledby="cke_26_label" aria-describedby="cke_26_description" aria-haspopup="false" onkeydown="return CKEDITOR.tools.callFunction(32,event);" onfocus="return CKEDITOR.tools.callFunction(33,event);" onclick="CKEDITOR.tools.callFunction(34,this);return false;"><span class="cke_button_icon cke_button__anchor_icon" style="background-image:url('http://mir9.co.kr/resource/js/ckeditor4.7.2/plugins/icons.png?t=H7HD');background-position:0 -480px;background-size:auto;">&nbsp;</span><span id="cke_26_label" class="cke_button_label cke_button__anchor_label" aria-hidden="false">책갈피</span><span id="cke_26_description" class="cke_button_label" aria-hidden="false"></span></a></span><span class="cke_toolbar_end"></span></span><span id="cke_27" class="cke_toolbar" aria-labelledby="cke_27_label" role="toolbar"><span id="cke_27_label" class="cke_voice_label">삽입</span><span class="cke_toolbar_start"></span><span class="cke_toolgroup" role="presentation"><a id="cke_28" class="cke_button cke_button__image cke_button_off" href="javascript:void('이미지')" title="이미지" tabindex="-1" hidefocus="true" role="button" aria-labelledby="cke_28_label" aria-describedby="cke_28_description" aria-haspopup="false" onkeydown="return CKEDITOR.tools.callFunction(35,event);" onfocus="return CKEDITOR.tools.callFunction(36,event);" onclick="CKEDITOR.tools.callFunction(37,this);return false;"><span class="cke_button_icon cke_button__image_icon" style="background-image:url('http://mir9.co.kr/resource/js/ckeditor4.7.2/plugins/icons.png?t=H7HD');background-position:0 -336px;background-size:auto;">&nbsp;</span><span id="cke_28_label" class="cke_button_label cke_button__image_label" aria-hidden="false">이미지</span><span id="cke_28_description" class="cke_button_label" aria-hidden="false"></span></a><a id="cke_29" class="cke_button cke_button__table cke_button_off" href="javascript:void('표')" title="표" tabindex="-1" hidefocus="true" role="button" aria-labelledby="cke_29_label" aria-describedby="cke_29_description" aria-haspopup="false" onkeydown="return CKEDITOR.tools.callFunction(38,event);" onfocus="return CKEDITOR.tools.callFunction(39,event);" onclick="CKEDITOR.tools.callFunction(40,this);return false;"><span class="cke_button_icon cke_button__table_icon" style="background-image:url('http://mir9.co.kr/resource/js/ckeditor4.7.2/plugins/icons.png?t=H7HD');background-position:0 -888px;background-size:auto;">&nbsp;</span><span id="cke_29_label" class="cke_button_label cke_button__table_label" aria-hidden="false">표</span><span id="cke_29_description" class="cke_button_label" aria-hidden="false"></span></a><a id="cke_30" class="cke_button cke_button__horizontalrule cke_button_off" href="javascript:void('가로 줄 삽입')" title="가로 줄 삽입" tabindex="-1" hidefocus="true" role="button" aria-labelledby="cke_30_label" aria-describedby="cke_30_description" aria-haspopup="false" onkeydown="return CKEDITOR.tools.callFunction(41,event);" onfocus="return CKEDITOR.tools.callFunction(42,event);" onclick="CKEDITOR.tools.callFunction(43,this);return false;"><span class="cke_button_icon cke_button__horizontalrule_icon" style="background-image:url('http://mir9.co.kr/resource/js/ckeditor4.7.2/plugins/icons.png?t=H7HD');background-position:0 -312px;background-size:auto;">&nbsp;</span><span id="cke_30_label" class="cke_button_label cke_button__horizontalrule_label" aria-hidden="false">가로 줄 삽입</span><span id="cke_30_description" class="cke_button_label" aria-hidden="false"></span></a><a id="cke_31" class="cke_button cke_button__specialchar cke_button_off" href="javascript:void('특수문자 삽입')" title="특수문자 삽입" tabindex="-1" hidefocus="true" role="button" aria-labelledby="cke_31_label" aria-describedby="cke_31_description" aria-haspopup="false" onkeydown="return CKEDITOR.tools.callFunction(44,event);" onfocus="return CKEDITOR.tools.callFunction(45,event);" onclick="CKEDITOR.tools.callFunction(46,this);return false;"><span class="cke_button_icon cke_button__specialchar_icon" style="background-image:url('http://mir9.co.kr/resource/js/ckeditor4.7.2/plugins/icons.png?t=H7HD');background-position:0 -840px;background-size:auto;">&nbsp;</span><span id="cke_31_label" class="cke_button_label cke_button__specialchar_label" aria-hidden="false">특수문자 삽입</span><span id="cke_31_description" class="cke_button_label" aria-hidden="false"></span></a></span><span class="cke_toolbar_end"></span></span><span id="cke_32" class="cke_toolbar" aria-labelledby="cke_32_label" role="toolbar"><span id="cke_32_label" class="cke_voice_label">도구</span><span class="cke_toolbar_start"></span><span class="cke_toolgroup" role="presentation"><a id="cke_33" class="cke_button cke_button__maximize cke_button_off" href="javascript:void('최대화')" title="최대화" tabindex="-1" hidefocus="true" role="button" aria-labelledby="cke_33_label" aria-describedby="cke_33_description" aria-haspopup="false" onkeydown="return CKEDITOR.tools.callFunction(47,event);" onfocus="return CKEDITOR.tools.callFunction(48,event);" onclick="CKEDITOR.tools.callFunction(49,this);return false;"><span class="cke_button_icon cke_button__maximize_icon" style="background-image:url('http://mir9.co.kr/resource/js/ckeditor4.7.2/plugins/icons.png?t=H7HD');background-position:0 -648px;background-size:auto;">&nbsp;</span><span id="cke_33_label" class="cke_button_label cke_button__maximize_label" aria-hidden="false">최대화</span><span id="cke_33_description" class="cke_button_label" aria-hidden="false"></span></a></span><span class="cke_toolbar_end"></span></span><span id="cke_34" class="cke_toolbar" aria-labelledby="cke_34_label" role="toolbar"><span id="cke_34_label" class="cke_voice_label">문서</span><span class="cke_toolbar_start"></span><span class="cke_toolgroup" role="presentation"><a id="cke_35" class="cke_button cke_button__source cke_button_off" href="javascript:void('소스')" title="소스" tabindex="-1" hidefocus="true" role="button" aria-labelledby="cke_35_label" aria-describedby="cke_35_description" aria-haspopup="false" onkeydown="return CKEDITOR.tools.callFunction(50,event);" onfocus="return CKEDITOR.tools.callFunction(51,event);" onclick="CKEDITOR.tools.callFunction(52,this);return false;"><span class="cke_button_icon cke_button__source_icon" style="background-image:url('http://mir9.co.kr/resource/js/ckeditor4.7.2/plugins/icons.png?t=H7HD');background-position:0 -816px;background-size:auto;">&nbsp;</span><span id="cke_35_label" class="cke_button_label cke_button__source_label" aria-hidden="false">소스</span><span id="cke_35_description" class="cke_button_label" aria-hidden="false"></span></a><span class="cke_toolbar_separator" role="separator"></span><a id="cke_36" class="cke_button cke_button__print cke_button_off" href="javascript:void('인쇄')" title="인쇄" tabindex="-1" hidefocus="true" role="button" aria-labelledby="cke_36_label" aria-describedby="cke_36_description" aria-haspopup="false" onkeydown="return CKEDITOR.tools.callFunction(53,event);" onfocus="return CKEDITOR.tools.callFunction(54,event);" onclick="CKEDITOR.tools.callFunction(55,this);return false;"><span class="cke_button_icon cke_button__print_icon" style="background-image:url('http://mir9.co.kr/resource/js/ckeditor4.7.2/plugins/icons.png?t=H7HD');background-position:0 -1104px;background-size:auto;">&nbsp;</span><span id="cke_36_label" class="cke_button_label cke_button__print_label" aria-hidden="false">인쇄</span><span id="cke_36_description" class="cke_button_label" aria-hidden="false"></span></a></span><span class="cke_toolbar_end"></span></span><span class="cke_toolbar_break"></span><span id="cke_37" class="cke_toolbar" aria-labelledby="cke_37_label" role="toolbar"><span id="cke_37_label" class="cke_voice_label">기본 스타일</span><span class="cke_toolbar_start"></span><span class="cke_toolgroup" role="presentation"><a id="cke_38" class="cke_button cke_button__bold cke_button_off" href="javascript:void('굵게')" title="굵게 (컨트롤+B)" tabindex="-1" hidefocus="true" role="button" aria-labelledby="cke_38_label" aria-describedby="cke_38_description" aria-haspopup="false" onkeydown="return CKEDITOR.tools.callFunction(56,event);" onfocus="return CKEDITOR.tools.callFunction(57,event);" onclick="CKEDITOR.tools.callFunction(58,this);return false;"><span class="cke_button_icon cke_button__bold_icon" style="background-image:url('http://mir9.co.kr/resource/js/ckeditor4.7.2/plugins/icons.png?t=H7HD');background-position:0 -24px;background-size:auto;">&nbsp;</span><span id="cke_38_label" class="cke_button_label cke_button__bold_label" aria-hidden="false">굵게</span><span id="cke_38_description" class="cke_button_label" aria-hidden="false">키보드 단축키 컨트롤+B</span></a><a id="cke_39" class="cke_button cke_button__italic cke_button_off" href="javascript:void('기울임꼴')" title="기울임꼴 (컨트롤+I)" tabindex="-1" hidefocus="true" role="button" aria-labelledby="cke_39_label" aria-describedby="cke_39_description" aria-haspopup="false" onkeydown="return CKEDITOR.tools.callFunction(59,event);" onfocus="return CKEDITOR.tools.callFunction(60,event);" onclick="CKEDITOR.tools.callFunction(61,this);return false;"><span class="cke_button_icon cke_button__italic_icon" style="background-image:url('http://mir9.co.kr/resource/js/ckeditor4.7.2/plugins/icons.png?t=H7HD');background-position:0 -48px;background-size:auto;">&nbsp;</span><span id="cke_39_label" class="cke_button_label cke_button__italic_label" aria-hidden="false">기울임꼴</span><span id="cke_39_description" class="cke_button_label" aria-hidden="false">키보드 단축키 컨트롤+I</span></a><a id="cke_40" class="cke_button cke_button__strike cke_button_off" href="javascript:void('취소선')" title="취소선" tabindex="-1" hidefocus="true" role="button" aria-labelledby="cke_40_label" aria-describedby="cke_40_description" aria-haspopup="false" onkeydown="return CKEDITOR.tools.callFunction(62,event);" onfocus="return CKEDITOR.tools.callFunction(63,event);" onclick="CKEDITOR.tools.callFunction(64,this);return false;"><span class="cke_button_icon cke_button__strike_icon" style="background-image:url('http://mir9.co.kr/resource/js/ckeditor4.7.2/plugins/icons.png?t=H7HD');background-position:0 -72px;background-size:auto;">&nbsp;</span><span id="cke_40_label" class="cke_button_label cke_button__strike_label" aria-hidden="false">취소선</span><span id="cke_40_description" class="cke_button_label" aria-hidden="false"></span></a><span class="cke_toolbar_separator" role="separator"></span><a id="cke_41" class="cke_button cke_button__removeformat cke_button_off" href="javascript:void('형식 지우기')" title="형식 지우기" tabindex="-1" hidefocus="true" role="button" aria-labelledby="cke_41_label" aria-describedby="cke_41_description" aria-haspopup="false" onkeydown="return CKEDITOR.tools.callFunction(65,event);" onfocus="return CKEDITOR.tools.callFunction(66,event);" onclick="CKEDITOR.tools.callFunction(67,this);return false;"><span class="cke_button_icon cke_button__removeformat_icon" style="background-image:url('http://mir9.co.kr/resource/js/ckeditor4.7.2/plugins/icons.png?t=H7HD');background-position:0 -768px;background-size:auto;">&nbsp;</span><span id="cke_41_label" class="cke_button_label cke_button__removeformat_label" aria-hidden="false">형식 지우기</span><span id="cke_41_description" class="cke_button_label" aria-hidden="false"></span></a></span><span class="cke_toolbar_end"></span></span><span id="cke_42" class="cke_toolbar" aria-labelledby="cke_42_label" role="toolbar"><span id="cke_42_label" class="cke_voice_label">단락</span><span class="cke_toolbar_start"></span><span class="cke_toolgroup" role="presentation"><a id="cke_43" class="cke_button cke_button__numberedlist cke_button_off" href="javascript:void('순서 있는 목록')" title="순서 있는 목록" tabindex="-1" hidefocus="true" role="button" aria-labelledby="cke_43_label" aria-describedby="cke_43_description" aria-haspopup="false" onkeydown="return CKEDITOR.tools.callFunction(68,event);" onfocus="return CKEDITOR.tools.callFunction(69,event);" onclick="CKEDITOR.tools.callFunction(70,this);return false;"><span class="cke_button_icon cke_button__numberedlist_icon" style="background-image:url('http://mir9.co.kr/resource/js/ckeditor4.7.2/plugins/icons.png?t=H7HD');background-position:0 -624px;background-size:auto;">&nbsp;</span><span id="cke_43_label" class="cke_button_label cke_button__numberedlist_label" aria-hidden="false">순서 있는 목록</span><span id="cke_43_description" class="cke_button_label" aria-hidden="false"></span></a><a id="cke_44" class="cke_button cke_button__bulletedlist cke_button_off" href="javascript:void('순서 없는 목록')" title="순서 없는 목록" tabindex="-1" hidefocus="true" role="button" aria-labelledby="cke_44_label" aria-describedby="cke_44_description" aria-haspopup="false" onkeydown="return CKEDITOR.tools.callFunction(71,event);" onfocus="return CKEDITOR.tools.callFunction(72,event);" onclick="CKEDITOR.tools.callFunction(73,this);return false;"><span class="cke_button_icon cke_button__bulletedlist_icon" style="background-image:url('http://mir9.co.kr/resource/js/ckeditor4.7.2/plugins/icons.png?t=H7HD');background-position:0 -576px;background-size:auto;">&nbsp;</span><span id="cke_44_label" class="cke_button_label cke_button__bulletedlist_label" aria-hidden="false">순서 없는 목록</span><span id="cke_44_description" class="cke_button_label" aria-hidden="false"></span></a><span class="cke_toolbar_separator" role="separator"></span><a id="cke_45" class="cke_button cke_button__outdent cke_button_disabled " href="javascript:void('내어쓰기')" title="내어쓰기" tabindex="-1" hidefocus="true" role="button" aria-labelledby="cke_45_label" aria-describedby="cke_45_description" aria-haspopup="false" aria-disabled="true" onkeydown="return CKEDITOR.tools.callFunction(74,event);" onfocus="return CKEDITOR.tools.callFunction(75,event);" onclick="CKEDITOR.tools.callFunction(76,this);return false;"><span class="cke_button_icon cke_button__outdent_icon" style="background-image:url('http://mir9.co.kr/resource/js/ckeditor4.7.2/plugins/icons.png?t=H7HD');background-position:0 -432px;background-size:auto;">&nbsp;</span><span id="cke_45_label" class="cke_button_label cke_button__outdent_label" aria-hidden="false">내어쓰기</span><span id="cke_45_description" class="cke_button_label" aria-hidden="false"></span></a><a id="cke_46" class="cke_button cke_button__indent cke_button_off" href="javascript:void('들여쓰기')" title="들여쓰기" tabindex="-1" hidefocus="true" role="button" aria-labelledby="cke_46_label" aria-describedby="cke_46_description" aria-haspopup="false" onkeydown="return CKEDITOR.tools.callFunction(77,event);" onfocus="return CKEDITOR.tools.callFunction(78,event);" onclick="CKEDITOR.tools.callFunction(79,this);return false;"><span class="cke_button_icon cke_button__indent_icon" style="background-image:url('http://mir9.co.kr/resource/js/ckeditor4.7.2/plugins/icons.png?t=H7HD');background-position:0 -384px;background-size:auto;">&nbsp;</span><span id="cke_46_label" class="cke_button_label cke_button__indent_label" aria-hidden="false">들여쓰기</span><span id="cke_46_description" class="cke_button_label" aria-hidden="false"></span></a><span class="cke_toolbar_separator" role="separator"></span><a id="cke_47" class="cke_button cke_button__justifyleft cke_button_off" href="javascript:void('왼쪽 정렬')" title="왼쪽 정렬" tabindex="-1" hidefocus="true" role="button" aria-labelledby="cke_47_label" aria-describedby="cke_47_description" aria-haspopup="false" onkeydown="return CKEDITOR.tools.callFunction(80,event);" onfocus="return CKEDITOR.tools.callFunction(81,event);" onclick="CKEDITOR.tools.callFunction(82,this);return false;"><span class="cke_button_icon cke_button__justifyleft_icon" style="background-image:url('http://mir9.co.kr/resource/js/ckeditor4.7.2/plugins/icons.png?t=H7HD');background-position:0 -1056px;background-size:auto;">&nbsp;</span><span id="cke_47_label" class="cke_button_label cke_button__justifyleft_label" aria-hidden="false">왼쪽 정렬</span><span id="cke_47_description" class="cke_button_label" aria-hidden="false"></span></a><a id="cke_48" class="cke_button cke_button__justifycenter cke_button_off" href="javascript:void('가운데 정렬')" title="가운데 정렬" tabindex="-1" hidefocus="true" role="button" aria-labelledby="cke_48_label" aria-describedby="cke_48_description" aria-haspopup="false" onkeydown="return CKEDITOR.tools.callFunction(83,event);" onfocus="return CKEDITOR.tools.callFunction(84,event);" onclick="CKEDITOR.tools.callFunction(85,this);return false;"><span class="cke_button_icon cke_button__justifycenter_icon" style="background-image:url('http://mir9.co.kr/resource/js/ckeditor4.7.2/plugins/icons.png?t=H7HD');background-position:0 -1032px;background-size:auto;">&nbsp;</span><span id="cke_48_label" class="cke_button_label cke_button__justifycenter_label" aria-hidden="false">가운데 정렬</span><span id="cke_48_description" class="cke_button_label" aria-hidden="false"></span></a><a id="cke_49" class="cke_button cke_button__justifyright cke_button_off" href="javascript:void('오른쪽 정렬')" title="오른쪽 정렬" tabindex="-1" hidefocus="true" role="button" aria-labelledby="cke_49_label" aria-describedby="cke_49_description" aria-haspopup="false" onkeydown="return CKEDITOR.tools.callFunction(86,event);" onfocus="return CKEDITOR.tools.callFunction(87,event);" onclick="CKEDITOR.tools.callFunction(88,this);return false;"><span class="cke_button_icon cke_button__justifyright_icon" style="background-image:url('http://mir9.co.kr/resource/js/ckeditor4.7.2/plugins/icons.png?t=H7HD');background-position:0 -1080px;background-size:auto;">&nbsp;</span><span id="cke_49_label" class="cke_button_label cke_button__justifyright_label" aria-hidden="false">오른쪽 정렬</span><span id="cke_49_description" class="cke_button_label" aria-hidden="false"></span></a><a id="cke_50" class="cke_button cke_button__justifyblock cke_button_off" href="javascript:void('양쪽 맞춤')" title="양쪽 맞춤" tabindex="-1" hidefocus="true" role="button" aria-labelledby="cke_50_label" aria-describedby="cke_50_description" aria-haspopup="false" onkeydown="return CKEDITOR.tools.callFunction(89,event);" onfocus="return CKEDITOR.tools.callFunction(90,event);" onclick="CKEDITOR.tools.callFunction(91,this);return false;"><span class="cke_button_icon cke_button__justifyblock_icon" style="background-image:url('http://mir9.co.kr/resource/js/ckeditor4.7.2/plugins/icons.png?t=H7HD');background-position:0 -1008px;background-size:auto;">&nbsp;</span><span id="cke_50_label" class="cke_button_label cke_button__justifyblock_label" aria-hidden="false">양쪽 맞춤</span><span id="cke_50_description" class="cke_button_label" aria-hidden="false"></span></a></span><span class="cke_toolbar_end"></span></span><span id="cke_51" class="cke_toolbar" aria-labelledby="cke_51_label" role="toolbar"><span id="cke_51_label" class="cke_voice_label">스타일</span><span class="cke_toolbar_start"></span><span id="cke_11" class="cke_combo cke_combo__font cke_combo_off" role="presentation"><span id="cke_11_label" class="cke_combo_label">글꼴</span><a class="cke_combo_button" title="글꼴" tabindex="-1" href="javascript:void('글꼴')" hidefocus="true" role="button" aria-labelledby="cke_11_label" aria-haspopup="true" onkeydown="return CKEDITOR.tools.callFunction(93,event,this);" onfocus="return CKEDITOR.tools.callFunction(94,event);" onclick="CKEDITOR.tools.callFunction(92,this);return false;"><span id="cke_11_text" class="cke_combo_text cke_combo_inlinelabel">글꼴</span><span class="cke_combo_open"><span class="cke_combo_arrow"></span></span></a></span><span id="cke_12" class="cke_combo cke_combo__fontsize cke_combo_off" role="presentation"><span id="cke_12_label" class="cke_combo_label">크기</span><a class="cke_combo_button" title="글자 크기" tabindex="-1" href="javascript:void('글자 크기')" hidefocus="true" role="button" aria-labelledby="cke_12_label" aria-haspopup="true" onkeydown="return CKEDITOR.tools.callFunction(96,event,this);" onfocus="return CKEDITOR.tools.callFunction(97,event);" onclick="CKEDITOR.tools.callFunction(95,this);return false;"><span id="cke_12_text" class="cke_combo_text cke_combo_inlinelabel">크기</span><span class="cke_combo_open"><span class="cke_combo_arrow"></span></span></a></span><span class="cke_toolbar_end"></span></span><span id="cke_52" class="cke_toolbar" aria-labelledby="cke_52_label" role="toolbar"><span id="cke_52_label" class="cke_voice_label">색상</span><span class="cke_toolbar_start"></span><span class="cke_toolgroup" role="presentation"><a id="cke_53" class="cke_button cke_button__textcolor cke_button_off" href="javascript:void('글자 색상')" title="글자 색상" tabindex="-1" hidefocus="true" role="button" aria-labelledby="cke_53_label" aria-describedby="cke_53_description" aria-haspopup="true" onkeydown="return CKEDITOR.tools.callFunction(98,event);" onfocus="return CKEDITOR.tools.callFunction(99,event);" onclick="CKEDITOR.tools.callFunction(100,this);return false;"><span class="cke_button_icon cke_button__textcolor_icon" style="background-image:url('http://mir9.co.kr/resource/js/ckeditor4.7.2/plugins/icons.png?t=H7HD');background-position:0 -1176px;background-size:auto;">&nbsp;</span><span id="cke_53_label" class="cke_button_label cke_button__textcolor_label" aria-hidden="false">글자 색상</span><span id="cke_53_description" class="cke_button_label" aria-hidden="false"></span><span class="cke_button_arrow"></span></a><a id="cke_54" class="cke_button cke_button__bgcolor cke_button_off" href="javascript:void('배경 색상')" title="배경 색상" tabindex="-1" hidefocus="true" role="button" aria-labelledby="cke_54_label" aria-describedby="cke_54_description" aria-haspopup="true" onkeydown="return CKEDITOR.tools.callFunction(101,event);" onfocus="return CKEDITOR.tools.callFunction(102,event);" onclick="CKEDITOR.tools.callFunction(103,this);return false;"><span class="cke_button_icon cke_button__bgcolor_icon" style="background-image:url('http://mir9.co.kr/resource/js/ckeditor4.7.2/plugins/icons.png?t=H7HD');background-position:0 -1152px;background-size:auto;">&nbsp;</span><span id="cke_54_label" class="cke_button_label cke_button__bgcolor_label" aria-hidden="false">배경 색상</span><span id="cke_54_description" class="cke_button_label" aria-hidden="false"></span><span class="cke_button_arrow"></span></a></span><span class="cke_toolbar_end"></span></span><span id="cke_55" class="cke_toolbar cke_toolbar_last" aria-labelledby="cke_55_label" role="toolbar"><span id="cke_55_label" class="cke_voice_label">about</span><span class="cke_toolbar_start"></span><span class="cke_toolgroup" role="presentation"><a id="cke_56" class="cke_button cke_button__about cke_button_off" href="javascript:void('CKEditor에 대하여')" title="CKEditor에 대하여" tabindex="-1" hidefocus="true" role="button" aria-labelledby="cke_56_label" aria-describedby="cke_56_description" aria-haspopup="false" onkeydown="return CKEDITOR.tools.callFunction(104,event);" onfocus="return CKEDITOR.tools.callFunction(105,event);" onclick="CKEDITOR.tools.callFunction(106,this);return false;"><span class="cke_button_icon cke_button__about_icon" style="background-image:url('http://mir9.co.kr/resource/js/ckeditor4.7.2/plugins/icons.png?t=H7HD');background-position:0 0px;background-size:auto;">&nbsp;</span><span id="cke_56_label" class="cke_button_label cke_button__about_label" aria-hidden="false">CKEditor에 대하여</span><span id="cke_56_description" class="cke_button_label" aria-hidden="false"></span></a></span><span class="cke_toolbar_end"></span></span></span></span><div id="cke_1_contents" class="cke_contents cke_reset" role="presentation" style="height: 300px;"><span id="cke_61" class="cke_voice_label">도움이 필요하면 ALT 0 을 누르세요</span><iframe src="" frameborder="0" class="cke_wysiwyg_frame cke_reset" title="리치 텍스트 편집기, content" aria-describedby="cke_61" tabindex="0" allowtransparency="true" style="width: 100%; height: 100%;"></iframe></div><span id="cke_1_bottom" class="cke_bottom cke_reset_all" role="presentation" style="user-select: none;"><span id="cke_1_resizer" class="cke_resizer cke_resizer_vertical cke_resizer_ltr" title="크기 조절" onmousedown="CKEDITOR.tools.callFunction(0, event)">◢</span><span id="cke_1_path_label" class="cke_voice_label">요소 경로</span><span id="cke_1_path" class="cke_path" role="group" aria-labelledby="cke_1_path_label"><span class="cke_path_empty">&nbsp;</span></span></span></div></div></td>
                </tr>
                <tr>
                    <td class="menu">썸네일 파일</td>
                    <td align="left">
                    <input type="file" name="thumbnail" class="form-control input-sm" style="width:80%; display:inline;">
                    <span id="display_thumbnail" style=""><a href="http://demoshop.mir9.kr/user/board/69_tn?dummy=1647996454" target="_new"> <button type="button" class="btn btn-success btn-xs">보기</button></a> <button type="button" onclick="confirmIframeDelete('?tpf=common/image_delete&amp;file_name=board/69_tn&amp;table=board');" class="btn btn-danger btn-xs">삭제</button></span>
                    </td>
                </tr>
                <tr>
                    <td class="menu">파일</td>
                    <td align="left">
                    <p>
                        <span id="file_list"></span>
                    </p>
    
                    <p style="padding-top:10px; float:left; width:100%;">
                        <button type="button" class="btn btn-primary btn-xs" onclick="addPrice();"><span class="glyphicon glyphicon-plus"></span> 파일추가</button><br>
                    </p>
                    <div id="list_file"><input type="file" name="file[]" class="form-control input-sm" style="width:100%; display:inline; margin-bottom:10px;"></div>
                    </td>
                </tr>
                </tbody></table>
    
                </div>
                <div class="modal-footer">
                <button type="button" onclick="register()" class="btn btn-primary">확인</button>&nbsp;&nbsp;&nbsp;
                    <button type="button" onclick="reply()" id="display_reply" style="" class="btn btn-danger">답변 페이지로 전환</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
    
    <div class="modal fade" id="modalContent2" tabindex="-2" role="dialog" aria-labelledby="myModal" aria-hidden="true">
        <div class="modal-dialog" style="width:400px;">
            <div class="modal-content">
                <form name="form_copy_data" method="post" action="?tpf=admin/board/process">
                <input type="hidden" name="mode" id="mode">
                <input type="hidden" name="code" id="code">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                    <h4 class="modal-title" id="myModalLabelPortfolio">게시물 관리</h4>
                </div>
                <div class="modal-body">
    
                <h4><p class="text-light-blue"><i class="fa fa-fw fa-info-circle"></i> 게시물 <span id="board_sub_title2"></span></p></h4>
                <table class="table table-bordered">
                <tbody><tr>
                    <td class="menu">게시판 제목</td>
                    <td align="left">
                    <select name="board_code" id="board_code" class="form-control input-sm">
                    <option value="">선택</option>
      <option value="1">공지사항</option>  <option value="2">자주하는 질문</option>  <option value="3">1:1 문의</option>                    </select>
                    </td>
                </tr>
                </tbody></table>
                </div>
    
                <div class="modal-footer">
                <button type="button" onclick="registerCopyData()" class="btn btn-primary">확인</button>&nbsp;&nbsp;&nbsp;
                </div>
                </form>
            </div>
        </div>
    </div>
    
    <div id="list_file_tag" class="sr-only">
        <input type="file" name="file[]" class="form-control input-sm" style="width:100%; display:inline; margin-bottom:10px;">
    </div>
    
    <script src="//mir9.co.kr/resource/js/ckeditor4.7.2/ckeditor.js"></script>
</div><!-- /.content-wrapper -->

<footer class="main-footer">
<div class="pull-right hidden-xs">
    <b>Version</b> 2.7.4
</div>
<strong>Copyright © 2017 <a href="/admin">MIR9 SHOP</a>.</strong> All rights reserved.
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
<script src="/html/js/common.js" type="text/javascript" charset="utf-8"></script>
<!-- fullcalendar -->
<script src="//mir9.co.kr/resource/js/bootstrap-colorselector.js"></script>
<script src="//mir9.co.kr/resource/js/AdminLTE-2.4.2/bower_components/fullcalendar/dist/fullcalendar.moment.min.js" type="text/javascript"></script>
<script src="//mir9.co.kr/resource/js/AdminLTE-2.4.2/bower_components/fullcalendar/dist/fullcalendar.min.js" type="text/javascript"></script>


<script>
        var objEditor = CKEDITOR.replace('content', {
			height: 300,
            extraPlugins : 'tableresize',
            filebrowserUploadUrl: '/ckfinder/core/connector/php/connector.php?command=QuickUpload&type=Files',
            filebrowserImageUploadUrl: '/daemon/ckeditor_upload.php?command=QuickUpload&type=Images',
            fillEmptyBlocks : true
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
        $.fn.modal.Constructor.prototype.enforceFocus = function () {
            modal_this = this
            $(document).on('focusin.modal', function (e) {
                if (modal_this.$element[0] !== e.target && !modal_this.$element.has(e.target).length && !$(e.target.parentNode).hasClass('cke_dialog_ui_input_select') && !$(e.target.parentNode).hasClass('cke_dialog_ui_input_text')) {
                    modal_this.$element.focus()
                }
            })
        }
        function addPrice() {
            $('#list_file').append($('#list_file_tag').html());
        }
        function deleteFile(file_code) {
            $('#'+file_code).css('display','none');
            $('#delete_file').val($('#delete_file').val()+file_code+',');
        }
        function register() {
            if(form_register.name.value == '') { alert('작성자가 입력되지 않았습니다.'); form_register.name.focus(); return false;}
            if(form_register.title.value == '') { alert('제목이 입력되지 않았습니다.'); form_register.title.focus(); return false;}
            if (objEditor.getData().length < 1) {
                alert('내용이 입력되지 않았습니다.');
                objEditor.focus();
                return false;
            }
            form_register.target = 'iframe_process';
            form_register.submit();
        }
        function reply() {
            $('form[name="form_register"] #mode').val('reply');
            $('#board_sub_title').text('답변');
            $('#title').val('RE: '+form_register.title.value);
            $('#display_reply').css('display','none');
            $('#file_list').html('');
        }
        function setData(code) {
            var arrImg = ['png','jpg','jpeg','gif'];
            var arrFile = ['avi','csv','xls','xlsx','doc','docx','html','mov','mp3','mp4','pdf','ppt','pptx','txt','xml','zip'];
            var image = '';
			$.ajax({
				url:'http://demoshop.mir9.kr/api/process.php',
				type:'post',
				dataType:'json',
				data:{
					method:'Board.view',
                    code:code,
                    board_code:1
				},
				success:function(data, textStatus, jqXHR){
                    var json_data = data.data;

                    $('form[name="form_register"] #mode').val('update');
                    $('#board_data_code').val(json_data.code);
                    $('[name=category]').val(json_data.category);
                    $('#name').val(json_data.name);
                    $('#tel').val(json_data.tel);
                    $('#email').val(json_data.email);
                    $('#link').val(json_data.link);
                    $('#title').val(json_data.title);
                    if(json_data.is_notice == 'y') $('[name=is_notice]').prop('checked', true);
                    else $('[name=is_notice]').prop('checked', false);
                    $('[name=start_date]').val(json_data.start_date);
                    $('[name=end_date]').val(json_data.end_date);
                    $('#board_sub_title').text('수정');
                    $('#display_reply').css('display','');
                    objEditor.setData(json_data.content);
                    // 비밀글
                    if(json_data.is_secret == 'y') $('[name=is_secret]').prop('checked', true);
                    else $('[name=is_secret]').prop('checked', false);

                    // 첨부파일
                    if(json_data.file_name_tn) {
                        var thumbnail_tag = '<a href=\'http://demoshop.mir9.kr/user/board/'+json_data.file_name_tn+'?dummy=1647996454\' target=\'_new\'> <button type="button" class="btn btn-success btn-xs">보기</button></a> <button type="button" onclick="confirmIframeDelete(\'?tpf=common/image_delete&file_name=board/'+json_data.file_name_tn+'&table=board\');" class="btn btn-danger btn-xs">삭제</button>';
                        parent.$('#display_thumbnail').html(thumbnail_tag);
                        parent.$('#display_thumbnail').css('display','');
                    }

                    var file_list = '';
                    if (json_data.files != null) {
                        $.each(json_data.files, function(index, value) {
                            if (jQuery.inArray(value.file_ext, arrImg) >= 0) {       // 이미지 파일
                                image = '/user/'+value.file_path+'/'+value.file_name;
                            }
                            else if (jQuery.inArray(value.file_ext, arrFile) >= 0) { // 일반 파일
                                image = '/img/icon/file_'+value.file_ext+'.png';
                            }
                            else {  // 기타 파일
                                image = '/img/icon/file_etc.png';
                            }

                            file_list += '<span id="'+value.code+'" style="float:left; position:relative; text-align:center; padding-right:15px;"><img src="'+image+'" style="width:80px; cursor:pointer;" onclick="location.replace(\'?tpf=common/save_as&file_path='+value.file_path+'&file_name='+value.file_name+'&orig_name='+encodeURI(value.orig_name)+'\');"><img src="/img/delete.png" onclick="deleteFile('+value.code+')" style="width:30px;position: absolute;left:43px; top:3px; z-index:10; cursor:pointer;"></span>';
                        });
                        $('#file_list').html(file_list);
                    }
                    else {
                        $('#file_list').html('');
                    }
				},
				error:function(jqXHR, textStatus, errorThrown){
					console.log(textStatus);
					// $('#content').val(errorThrown);
				}
			});
        }
        function onclickInsert() {
            $('#modalContent').modal('show');
            form_register.reset();
            $('#board_sub_title').text('등록');
            $('form[name="form_register"] #mode').val('insert');
            $('#display_reply').css('display','none');
            objEditor.setData('');
            $('#file_list').html('');
        }
        function onclick_update(code) {
            $('#modalContent').modal({backdrop:'static', show:true});
            setData(code);
        }
        function registerCopyData() {
            if(form_copy_data.board_code.value == '') { alert('게시판 제목이 선택되지 않았습니다.'); form_copy_data.board_code.focus(); return false;}
            form_copy_data.target = 'iframe_process';
            form_copy_data.submit();
        }
        function onclickCopyData(mode) {
            var count = $(":input[name = 'list[]']").length;
            if (count > 0) {
                if (isCheckedBox('form_list')) {
                    var f = eval('form_list');
                    var chkBox = f.elements['list[]'];
                    var chkLen = chkBox.length;
                    var code = '';

                    // 선택된 파일이 있는지 체크
                    if(chkLen == undefined) {
                        code = chkBox.value;
                    }
                    else {
                        for (i = 0; i < chkLen; i++) {
                            if (chkBox[i].checked) code += chkBox[i].value+',';
                        }
                    }
                    console.log(code);
                    $('#modalContent2').modal('show');
                    if(mode == 'copyData') {
                        $('[name=form_copy_data] #code').val(code);
                        $('[name=form_copy_data] #mode').val(mode);
                        $('#board_sub_title2').text('복사');
                    }
                    else {
                        $('[name=form_copy_data] #code').val(code);
                        $('[name=form_copy_data] #mode').val(mode);
                        $('#board_sub_title2').text('이전');
                    }
                }
                else {
                    alert('항목을 선택하여야 합니다.');
                    return false;
                }
            }
            else {
                alert('항목이 없습니다.');
                return false;
            }
        }
        $(document).ready(function() {
            $('#keyword').keydown(function(event) {
                if(event.keyCode == 13) {
                    form_search.submit();
                }
            });
            $('#memo').keydown(function(event) {
                if(event.keyCode == 13) {
                    // document.getElementById('memo').value = document.getElementById('memo').value + '\n';
                }
            })
        });
        $(function() {
            $( "#datepicker1,#datepicker2" ).datepicker({
                dateFormat: 'yy-mm-dd',
                prevText: '이전 달',
                nextText: '다음 달',
                monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
                monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
                dayNames: ['일','월','화','수','목','금','토'],
                dayNamesShort: ['일','월','화','수','목','금','토'],
                dayNamesMin: ['일','월','화','수','목','금','토'],
                showMonthAfterYear: true,
                yearSuffix: '년'
            });
        });
        $(function() {
            $( "#datepicker1,#datepicker2" ).datepicker({
                dateFormat: 'yy-mm-dd'
            });
        });
</script>

</body></html>