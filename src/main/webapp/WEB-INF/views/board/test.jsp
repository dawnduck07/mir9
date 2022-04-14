<!-- addSchedule.jsp 시작 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<link rel="stylesheet"  href="${pageContext.request.contextPath}/resources/css/colorselector.css">
<link href="${pageContext.request.contextPath}/resources/fullcalendar/lib/fullcalendar.min.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/resources/fullcalendar/lib/fullcalendar.print.css" rel="stylesheet" type="text/css" media="print">

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
<script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
<script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
<![endif]-->
<!-- Google Font -->
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">
<style type="text/css">.jqstooltip { position: absolute;left: 0px;top: 0px;visibility: hidden;background: rgb(0, 0, 0) transparent;background-color: rgba(0,0,0,0.6);filter:progid:DXImageTransform.Microsoft.gradient(startColorstr=#99000000, endColorstr=#99000000);-ms-filter: "progid:DXImageTransform.Microsoft.gradient(startColorstr=#99000000, endColorstr=#99000000)";color: white;font: 10px arial, san serif;text-align: left;white-space: nowrap;padding: 5px;border: 1px solid white;box-sizing: content-box;z-index: 10000;}.jqsfield { color: white;font: 10px arial, san serif;text-align: left;}</style></head>

<body class="skin-red sidebar-mini" style="height: auto; min-height: 100%;">
<iframe name="iframe_process" width="0" height="0" frameborder="0" style="display:none;"></iframe>

<div class="wrapper" style="height: auto; min-height: 100%;">


<!-- content-wrapper -->
<div class="content-wrapper" style="min-height: 868px;">
<link rel="stylesheet" href="http://code.jquery.com/ui/1.10.4/themes/smoothness/jquery-ui.css">
<style>
.fc-sat { color:blue; }
.fc-sun { color:red;  }
.fc-event{ cursor: pointer;}
#calendar .fc-view.fc-week > table > tbody > tr:first-child > .fc-widget-content .fc-day-grid,
#calendar .fc-view.fc-week > table > tbody > tr:first-child > .fc-widget-content .fc-widget-header,
#calendar .fc-view.fc-agendaWeek-view > table > tbody > tr:first-child > .fc-widget-content .fc-day-grid,
#calendar .fc-view.fc-agendaWeek-view > table > tbody > tr:first-child > .fc-widget-content .fc-widget-header,
#calendar .fc-view.fc-agendaDay-view > table > tbody > tr:first-child > .fc-widget-content .fc-day-grid,
#calendar .fc-view.fc-agendaDay-view > table > tbody > tr:first-child > .fc-widget-content .fc-widget-header {display:none !important;}
</style>



<section class="content">
  <div class="row">
    <div class="col-md-12">
      <div class="box box-primary">
        <div class="box-body no-padding">
          <!-- THE CALENDAR -->
          <div id="calendar"></div>
        </div><!-- /.box-body -->
      </div><!-- /. box -->
    </div><!-- /.col -->
  </div><!-- /.row -->
</section>

<div class="modal fade" id="modalContent" tabindex="-2" role="dialog" aria-labelledby="myModal" aria-hidden="true">
    <div class="modal-dialog" style="width:600px;">
        <div class="modal-content">
            <form name="form_register" method="post" action="?tpf=admin/schedule/process" enctype="multipart/form-data">
            <input type="hidden" name="mode" id="mode" value="insert">
            <input type="hidden" name="type" value="nomal">
            <input type="hidden" name="code">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                <h4 class="modal-title" id="myModalLabelPortfolio">일정 관리</h4>
            </div>
            <div class="modal-body">

            <h4><p class="text-light-blue"><i class="fa fa-fw fa-info-circle"></i> 일정 <span id="board_sub_title">등록</span></p></h4>
            <table class="table table-bordered">
            <tbody><tr>
                <td class="menu">날짜</td>
                <td align="left">
                <span style="float:left">
                <input type="text" name="start_date" id="datepicker1" class="form-control input-sm hasDatepicker" style="width:80px; float:left" readonly="" placeholder="시작일">
                <select name="start_time" class="form-control input-sm" style="width:80px; margin-left:3px; float:left;">
      <option value="00:00">00:00</option>      <option value="00:30">00:30</option>      <option value="01:00">01:00</option>      <option value="01:30">01:30</option>      <option value="02:00">02:00</option>      <option value="02:30">02:30</option>      <option value="03:00">03:00</option>      <option value="03:30">03:30</option>      <option value="04:00">04:00</option>      <option value="04:30">04:30</option>      <option value="05:00">05:00</option>      <option value="05:30">05:30</option>      <option value="06:00">06:00</option>      <option value="06:30">06:30</option>      <option value="07:00">07:00</option>      <option value="07:30">07:30</option>      <option value="08:00">08:00</option>      <option value="08:30">08:30</option>      <option value="09:00">09:00</option>      <option value="09:30">09:30</option>      <option value="10:00">10:00</option>      <option value="10:30">10:30</option>      <option value="11:00">11:00</option>      <option value="11:30">11:30</option>      <option value="12:00">12:00</option>      <option value="12:30">12:30</option>      <option value="13:00">13:00</option>      <option value="13:30">13:30</option>      <option value="14:00">14:00</option>      <option value="14:30">14:30</option>      <option value="15:00">15:00</option>      <option value="15:30">15:30</option>      <option value="16:00">16:00</option>      <option value="16:30">16:30</option>      <option value="17:00">17:00</option>      <option value="17:30">17:30</option>      <option value="18:00">18:00</option>      <option value="18:30">18:30</option>      <option value="19:00">19:00</option>      <option value="19:30">19:30</option>      <option value="20:00">20:00</option>      <option value="20:30">20:30</option>      <option value="21:00">21:00</option>      <option value="21:30">21:30</option>      <option value="22:00">22:00</option>      <option value="22:30">22:30</option>      <option value="23:00">23:00</option>      <option value="23:30">23:30</option>				</select>
                </span>
                <span style="float:left">&nbsp;&nbsp;~&nbsp;&nbsp;</span>
                <span style="float:left">
                <input type="text" name="end_date" id="datepicker2" class="form-control input-sm hasDatepicker" style="width:80px; float:left" readonly="" placeholder="종료일">
                <select name="end_time" class="form-control input-sm" style="width:80px; margin-left:3px; float:left;">
      <option value="00:00">00:00</option>      <option value="00:30">00:30</option>      <option value="01:00">01:00</option>      <option value="01:30">01:30</option>      <option value="02:00">02:00</option>      <option value="02:30">02:30</option>      <option value="03:00">03:00</option>      <option value="03:30">03:30</option>      <option value="04:00">04:00</option>      <option value="04:30">04:30</option>      <option value="05:00">05:00</option>      <option value="05:30">05:30</option>      <option value="06:00">06:00</option>      <option value="06:30">06:30</option>      <option value="07:00">07:00</option>      <option value="07:30">07:30</option>      <option value="08:00">08:00</option>      <option value="08:30">08:30</option>      <option value="09:00">09:00</option>      <option value="09:30">09:30</option>      <option value="10:00">10:00</option>      <option value="10:30">10:30</option>      <option value="11:00">11:00</option>      <option value="11:30">11:30</option>      <option value="12:00">12:00</option>      <option value="12:30">12:30</option>      <option value="13:00">13:00</option>      <option value="13:30">13:30</option>      <option value="14:00">14:00</option>      <option value="14:30">14:30</option>      <option value="15:00">15:00</option>      <option value="15:30">15:30</option>      <option value="16:00">16:00</option>      <option value="16:30">16:30</option>      <option value="17:00">17:00</option>      <option value="17:30">17:30</option>      <option value="18:00">18:00</option>      <option value="18:30">18:30</option>      <option value="19:00">19:00</option>      <option value="19:30">19:30</option>      <option value="20:00">20:00</option>      <option value="20:30">20:30</option>      <option value="21:00">21:00</option>      <option value="21:30">21:30</option>      <option value="22:00">22:00</option>      <option value="22:30">22:30</option>      <option value="23:00">23:00</option>      <option value="23:30">23:30</option>				</select>
                </span>
                </td>
            </tr>
            <tr>
                <td class="menu">제목</td>
                <td align="left">
                <table border="0" cellspacing="0" cellpadding="0" width="100%">
                <tbody><tr>
                    <td style="width:8%; text-align:left;">
                    <select name="background_color" id="colorselector" style="display: none;">
          <option value="#A0522D" data-color="#A0522D"></option>          <option value="#CD5C5C" data-color="#CD5C5C"></option>          <option value="#FF4500" data-color="#FF4500"></option>          <option value="#008B8B" data-color="#008B8B"></option>          <option value="#B8860B" data-color="#B8860B"></option>          <option value="#32CD32" data-color="#32CD32"></option>          <option value="#FFD700" data-color="#FFD700"></option>          <option value="#00C0EF" data-color="#00C0EF"></option>          <option value="#87CEEB" data-color="#87CEEB"></option>          <option value="#FF69B4" data-color="#FF69B4"></option>          <option value="#87CEFA" data-color="#87CEFA"></option>          <option value="#6495ED" data-color="#6495ED"></option>          <option value="#DD4B39" data-color="#DD4B39"></option>          <option value="#FF8C00" data-color="#FF8C00"></option>          <option value="#C71585" data-color="#C71585"></option>          <option value="#00A65A" data-color="#00A65A"></option>          <option value="#F39C12" data-color="#F39C12"></option>          <option value="#3C8DBC" data-color="#3C8DBC"></option>          <option value="#000000" data-color="#000000"></option>                    </select><div class="dropdown dropdown-colorselector"><a data-toggle="dropdown" class="dropdown-toggle" href="#"><span class="btn-colorselector" style="background-color: rgb(160, 82, 45);"></span></a><ul class="dropdown-menu dropdown-caret"><li><a class="color-btn selected" href="#" data-color="#A0522D" data-value="#A0522D" title="" style="background-color: rgb(160, 82, 45);"></a></li><li><a class="color-btn" href="#" data-color="#CD5C5C" data-value="#CD5C5C" title="" style="background-color: rgb(205, 92, 92);"></a></li><li><a class="color-btn" href="#" data-color="#FF4500" data-value="#FF4500" title="" style="background-color: rgb(255, 69, 0);"></a></li><li><a class="color-btn" href="#" data-color="#008B8B" data-value="#008B8B" title="" style="background-color: rgb(0, 139, 139);"></a></li><li><a class="color-btn" href="#" data-color="#B8860B" data-value="#B8860B" title="" style="background-color: rgb(184, 134, 11);"></a></li><li><a class="color-btn" href="#" data-color="#32CD32" data-value="#32CD32" title="" style="background-color: rgb(50, 205, 50);"></a></li><li><a class="color-btn" href="#" data-color="#FFD700" data-value="#FFD700" title="" style="background-color: rgb(255, 215, 0);"></a></li><li><a class="color-btn" href="#" data-color="#00C0EF" data-value="#00C0EF" title="" style="background-color: rgb(0, 192, 239);"></a></li><li><a class="color-btn" href="#" data-color="#87CEEB" data-value="#87CEEB" title="" style="background-color: rgb(135, 206, 235);"></a></li><li><a class="color-btn" href="#" data-color="#FF69B4" data-value="#FF69B4" title="" style="background-color: rgb(255, 105, 180);"></a></li><li><a class="color-btn" href="#" data-color="#87CEFA" data-value="#87CEFA" title="" style="background-color: rgb(135, 206, 250);"></a></li><li><a class="color-btn" href="#" data-color="#6495ED" data-value="#6495ED" title="" style="background-color: rgb(100, 149, 237);"></a></li><li><a class="color-btn" href="#" data-color="#DD4B39" data-value="#DD4B39" title="" style="background-color: rgb(221, 75, 57);"></a></li><li><a class="color-btn" href="#" data-color="#FF8C00" data-value="#FF8C00" title="" style="background-color: rgb(255, 140, 0);"></a></li><li><a class="color-btn" href="#" data-color="#C71585" data-value="#C71585" title="" style="background-color: rgb(199, 21, 133);"></a></li><li><a class="color-btn" href="#" data-color="#00A65A" data-value="#00A65A" title="" style="background-color: rgb(0, 166, 90);"></a></li><li><a class="color-btn" href="#" data-color="#F39C12" data-value="#F39C12" title="" style="background-color: rgb(243, 156, 18);"></a></li><li><a class="color-btn" href="#" data-color="#3C8DBC" data-value="#3C8DBC" title="" style="background-color: rgb(60, 141, 188);"></a></li><li><a class="color-btn" href="#" data-color="#000000" data-value="#000000" title="" style="background-color: rgb(0, 0, 0);"></a></li></ul></div>
                    </td>
                    <td>
                    <input type="text" name="title" class="form-control input-sm" style="width:100%;">
                    </td>
                </tr>
                </tbody></table>
                </td>
            </tr>
            <tr>
                <td class="menu">내용</td>
                <td align="left"><textarea name="content" id="content" rows="5" style="width:100%"></textarea></td>
            </tr>
            </tbody></table>

            </div>
            <div class="modal-footer">
            <button type="button" onclick="register()" class="btn btn-primary">확인</button>&nbsp;&nbsp;&nbsp;
            <button type="button" onclick="deleteSchedule()" id="display_reply" style="display:none;" class="btn btn-danger">삭제</button>
            </div>
            </form>
        </div>
    </div>
</div>
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
<script src='${pageContext.request.contextPath}/resources/fullcalendar/lib/main.js'></script>
<script src='${pageContext.request.contextPath}/resources/fullcalendar/lib/locales/ko.js'></script>
<script src='${pageContext.request.contextPath}/resources/js/moment.js'></script>

<script>
        function register() {
            if(form_register.start_date.value == '') { alert('시작일이 입력되지 않았습니다.'); form_register.start_date.focus(); return false;}
            if(form_register.start_time.value == '') { alert('시작 시간이 입력되지 않았습니다.'); form_register.start_time.focus(); return false;}
            if(form_register.end_date.value == '') { alert('종료일이 입력되지 않았습니다.'); form_register.end_date.focus(); return false;}
            if(form_register.end_time.value == '') { alert('종료 시간이 입력되지 않았습니다.'); form_register.end_time.focus(); return false;}
            if(form_register.title.value == '') { alert('제목이 입력되지 않았습니다.'); form_register.title.focus(); return false;}
            form_register.target = 'iframe_process';
            form_register.submit();
        }
        function deleteSchedule() {
            if(confirm('해당 일정을 정말 삭제하시겠습니까?')) {
				form_register.target = 'iframe_process';
                form_register.mode.value = 'delete';
				form_register.submit();
			}
        }
        function _updateDate(code,start_date,end_date) {
            $.ajax({
                url:'http://demoshop.mir9.kr/api/process.php',
                type:'post',
                dataType:'json',
                data:{
                    method : 'UtilSchedule.updateDate',
                    code : code,
                    start_date : start_date,
                    end_date : end_date
                },
                success:function(data, textStatus, jqXHR){
                },
                error:function(jqXHR, textStatus, errorThrown){
                    console.log(textStatus);
                    // $('#content').val(errorThrown);
                }
            });
        }
        $(function() {
            /* calendar */
            // 초기화
            var current_date = '';

            $('#calendar').fullCalendar({
                header: {
                    left: 'prev,next today',
                    center: 'title',
                    right: 'month,agendaWeek,agendaDay'
                },
                titleFormat: {
                    month: 'YYYY년 MMMM',
                    week: 'YYYY년 MMMM D',
                    day: 'YYYY년 MMMM D일 dddd요일'
                },
                allDayText: '시간',
                axisFormat: 'HH:mm',
                timeFormat: 'HH:mm',
                monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
                dayNames: ['일','월','화','수','목','금','토'],
                dayNamesShort: ['일','월','화','수','목','금','토'],
                buttonText: {
                    today: '오늘',
                    month: '월간',
                    week: '주간',
                    day: '일간'
                },
                fixedWeekCount: false,
                selectable: true,
                selectHelper: true,
                editable: true,     // 드래그 수정 가능 여부
                droppable: true,    // drop 가능하게
                // $('#calendar').fullCalendar('removeEvents',event._id);   // 일정 삭제
                eventClick: function(event) {                       // 일정 클릭
                    $('#modalContent').modal({backdrop:'static', show:true});
                    form_register.mode.value = 'update';
                    form_register.code.value = event.code;
                    $('[name=start_date]').val(moment(event.start).format('YYYY-MM-DD'));
                    $('[name=start_time]').val(moment(event.start).format('HH:mm'));
                    $('[name=end_date]').val(moment(event.end).format('YYYY-MM-DD'));
                    $('[name=end_time]').val(moment(event.end).format('HH:mm'));
                    $('[name=title]').val(event.title);
                    $('[name=content]').val(event.content);
                    $('[name=background_color]').val(event.backgroundColor);
                    $('.btn-colorselector').css('background-color',event.backgroundColor);
                    $('#display_reply').css('display','');
                    $('#colorselector').colorselector('setColor', event.backgroundColor);
                },
                dayClick: function(date, allDay, jsEvent, view) {   // 날짜 클릭
                    if (current_date == '') $(this).css('background-color', '#e5e3e3');
                    else {
                        $(current_date).css('background-color','white');
                        $(this).css('background-color','#e5e3e3');
                    }
                    current_date = this;
                    form_register.mode.value = 'insert';
                    $('#modalContent').modal({backdrop:'static', show:true});   // 모달 오픈
                    // input 페이지 init
                    $('[name=title]').val('');
                    $('[name=content]').val('');
                    $('[name=start_date]').val(date.format());
                    $('[name=start_time]').val('09:00');
                    $('[name=end_date]').val(date.format());
                    $('[name=end_time]').val('09:30');
                    $('[name=background_color]').val('#A0522D');
                    $('.btn-colorselector').css('background-color','#A0522D');
                    $('#display_reply').css('display','none');
                },
                eventResize: function(event,dayDelta,minuteDelta,revertFunc) {
                    _updateDate(event.code,event.start.format().replace('T',' '),event.end.format().replace('T',' '));
                },
                eventDrop: function(event,dayDelta,minuteDelta,allDay,revertFunc) {
                    _updateDate(event.code,event.start.format().replace('T',' '),event.end.format().replace('T',' '));
                },
                // 날짜별 일정 등록
                events: [{"code":"1","title":"\u314b\u314b","content":"\u314b\u314b","start":"2018-02-20 09:00:00","end":"2018-02-22 09:30:00","backgroundColor":"#A0522D","borderColor":"#A0522D","editable":true},{"code":"2","title":"\uc2e0\uc785\uc0dd \uc624\ub9ac\uc5d4 \ud2f0\uc158","content":"\uc77c\uc815 : 3\/6 ~ 3\/7\r\n\uc7a5\uc18c : \ubcf8\uc0ac \uac15\ub2f9","start":"2018-04-05 10:00:00","end":"2018-04-06 10:30:00","backgroundColor":"#FF8C00","borderColor":"#FF8C00","editable":true},{"code":"3","title":"\uc804\uccb4 \ud68c\uc758","content":"","start":"2018-03-16 09:00:00","end":"2018-03-16 09:30:00","backgroundColor":"#C71585","borderColor":"#C71585","editable":true},{"code":"4","title":"\uba54\uc778\ud398\uc774\uc9c0","content":"\u3141\u3134\u3147\u3139\u3147\u3134\u3141\u3139","start":"2018-07-09 09:00:00","end":"2018-07-11 09:30:00","backgroundColor":"#DD4B39","borderColor":"#DD4B39","editable":true},{"code":"11","title":"\u3134\u3147\u3139","content":"\u3134\u3147\u3139","start":"2022-04-12 01:00:00","end":"2022-04-12 09:30:00","backgroundColor":"#A0522D","borderColor":"#A0522D","editable":true},{"code":"12","title":"das","content":"das","start":"2022-04-14 09:00:00","end":"2022-04-14 09:30:00","backgroundColor":"#6495ED","borderColor":"#6495ED","editable":true},{"code":"13","title":"asd","content":"asd","start":"2022-04-19 09:00:00","end":"2022-04-20 09:30:00","backgroundColor":"#A0522D","borderColor":"#A0522D","editable":true}]
            });
            $('#calendar').fullCalendar('gotoDate', '2022-04');

            /* datepicker */
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
            $('#datepicker1,#datepicker2').datepicker({
                dateFormat: 'yy-mm-dd'
            });
            $('#colorselector').colorselector();
        });
</script>

<div id="ui-datepicker-div" class="ui-datepicker ui-widget ui-widget-content ui-helper-clearfix ui-corner-all"></div></body></html>