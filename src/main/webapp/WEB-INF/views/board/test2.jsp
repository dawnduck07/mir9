<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="1:1문의" name="title"/>
</jsp:include>
<!-- content-wrapper -->

<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>AdminLTE 2 | Dashboard</title>
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
<!-- Tell the browser to be responsive to screen width -->
<meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
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

<!-- Google Font -->
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">
<style type="text/css">.jqstooltip { position: absolute;left: 0px;top: 0px;visibility: hidden;background: rgb(0, 0, 0) transparent;background-color: rgba(0,0,0,0.6);filter:progid:DXImageTransform.Microsoft.gradient(startColorstr=#99000000, endColorstr=#99000000);-ms-filter: "progid:DXImageTransform.Microsoft.gradient(startColorstr=#99000000, endColorstr=#99000000)";color: white;font: 10px arial, san serif;text-align: left;white-space: nowrap;padding: 5px;border: 1px solid white;box-sizing: content-box;z-index: 10000;}.jqsfield { color: white;font: 10px arial, san serif;text-align: left;}</style>
<body class="skin-red sidebar-mini" style="height: auto; min-height: 100%;">
<iframe name="iframe_process" width="0" height="0" frameborder="0" style="display:none;"></iframe>

<!-- content-wrapper -->
<div class="content-wrapper">

<link rel='stylesheet'  href='${pageContext.request.contextPath}/resources/fullcalendar/lib/main.css'/>
<script src='${pageContext.request.contextPath}/resources/fullcalendar/lib/main.js'></script>
<script src='${pageContext.request.contextPath}/resources/fullcalendar/lib/locales/ko.js'></script>
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
                events: [{"code":"1","title":"\u314b\u314b","content":"\u314b\u314b","start":"2018-02-20 09:00:00","end":"2018-02-22 09:30:00","backgroundColor":"#A0522D","borderColor":"#A0522D","editable":true},{"code":"2","title":"\uc2e0\uc785\uc0dd \uc624\ub9ac\uc5d4 \ud2f0\uc158","content":"\uc77c\uc815 : 3\/6 ~ 3\/7\r\n\uc7a5\uc18c : \ubcf8\uc0ac \uac15\ub2f9","start":"2018-04-05 10:00:00","end":"2018-04-06 10:30:00","backgroundColor":"#FF8C00","borderColor":"#FF8C00","editable":true},{"code":"3","title":"\uc804\uccb4 \ud68c\uc758","content":"","start":"2018-03-16 09:00:00","end":"2018-03-16 09:30:00","backgroundColor":"#C71585","borderColor":"#C71585","editable":true},{"code":"4","title":"\uba54\uc778\ud398\uc774\uc9c0","content":"\u3141\u3134\u3147\u3139\u3147\u3134\u3141\u3139","start":"2018-07-09 09:00:00","end":"2018-07-11 09:30:00","backgroundColor":"#DD4B39","borderColor":"#DD4B39","editable":true}]
            });
            $('#calendar').fullCalendar('gotoDate', '2022-02');

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