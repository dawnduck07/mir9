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
<script src="//mir9.co.kr/resource/js/bootstrap-colorselector.js"></script>
<!-- Google Font -->
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">
<style type="text/css">.jqstooltip { position: absolute;left: 0px;top: 0px;visibility: hidden;background: rgb(0, 0, 0) transparent;background-color: rgba(0,0,0,0.6);filter:progid:DXImageTransform.Microsoft.gradient(startColorstr=#99000000, endColorstr=#99000000);-ms-filter: "progid:DXImageTransform.Microsoft.gradient(startColorstr=#99000000, endColorstr=#99000000)";color: white;font: 10px arial, san serif;text-align: left;white-space: nowrap;padding: 5px;border: 1px solid white;box-sizing: content-box;z-index: 10000;}.jqsfield { color: white;font: 10px arial, san serif;text-align: left;}</style>
<body class="skin-red sidebar-mini" style="height: auto; min-height: 100%;">
<iframe name="iframe_process" width="0" height="0" frameborder="0" style="display:none;"></iframe>
<script class="cssdesk" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.11.0/moment.min.js" type="text/javascript"></script>
<!-- content-wrapper -->
<div class="content-wrapper">
<!-- ?? -->
<link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://cdn.jsdelivr.net/npm/bootstrap-colorselector@0.1.0/dist/bootstrap-colorselector.min.js">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>


<link rel='stylesheet'  href='${pageContext.request.contextPath}/resources/fullcalendar/lib/main.css'/>
<script src='${pageContext.request.contextPath}/resources/fullcalendar/lib/main.js'></script>
<script src='${pageContext.request.contextPath}/resources/fullcalendar/lib/locales/ko.js'></script>
<script src='${pageContext.request.contextPath}/resources/js/moment.js'></script>
<script>

	

	document.addEventListener('DOMContentLoaded', function() {
		
        var calendarEl = document.getElementById('calendar');
        var calendar;
        
		calendar = new FullCalendar.Calendar(calendarEl, {
	          locale: 'ko',	//한국어 설정
			  dayMaxEventRows: true, // 날짜당 일정 개수
			  //헤더에 표시할 툴바
			  headerToolbar: { 
					left: 'prev,next today', 
					center: 'title', 
					right: 'dayGridMonth,timeGridWeek,timeGridDay' 
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
			  navLinks: true, // 요일 이름 주 이름 클릭할 수 있는지
			  selectable: true, // 클릭하고 드래드 가능
			  selectMirror: true, // 드래그 하는 동안 자리 표시 이벤트
	          fixedWeekCount: false, //월별 표시되는 주의 수를 말함 true일 경우 항상 6주
	          selectHelper: true,	// 얘도 드래그 자리 표시인데?
	          editable: true,     // 드래그 수정 가능 여부
	          droppable: true,    // drop 가능하게
	          events: 
	      		$.ajax({
	    			url : "/mir9/schedule/json/getScheduleList/",
	    			method : "GET",
	    			dataType : "JSON",	
	    			headers : {
	    				"Accept" : "application/json",
	    				"Content-Type" : "application/json"	 						
	    			} ,
	    			success : function(JSONData, status){
	    				//alert(JSONData[0].scheduleStartDate)
	    				//alert(JSONData[0].scheduleNo)
	    				for(var i = 0; i < JSONData.length; i++){
    						calendar.addEvent({
    							title: JSONData[i].scheduleTitle,
    							start: JSONData[i].scheduleStartDate,
    							end: JSONData[i].scheduleEndDate,
    							backgroundColor: JSONData[i].scheduleColor,
    							contents: JSONData[i].scheduleContents,
    							id: JSONData[i].scheduleNo
    						});
	    				}
	    			},
        			error:function(request, status, error){
        				alert("경고")
        			}
	    			
	    		})
	          ,
	          eventClick: function(arg){
	        	  $('#modalContent7').modal({backdrop:'static', show:true});
	        	  $("input[name='getScheduleTitle']").val(arg.event.title);
	        	  $("textarea[name='getScheduleContents']").val(arg.event.extendedProps.contents);
	        	  $("input[name='getScheduleStartDate']").val(moment(arg.event.start).format('YYYY-MM-DD'));
	        	  $("input[name='getScheduleEndDate']").val(moment(arg.event.end).format('YYYY-MM-DD'));
	        	  $("select[name='getScheduleStartTime']").val(moment(arg.event.start).format('HH:mm'))
	        	  $("select[name='getScheduleEndTime']").val(moment(arg.event.end).format('HH:mm'))
				  
	        	  var scheduleNo = arg.event.id;
	        	  
	        	  $('button[name="updateSchedule"]').on("click", function(){
					
	            	    var scheduleStartDate = $('input[name="getScheduleStartDate"]').val();
		        		var scheduleEndDate = $('input[name="getScheduleEndDate"]').val();
		        		var scheduleStartTime = $('select[name="getScheduleStartTime"]').val();
		        		var scheduleEndTime = $('select[name="getScheduleEndTime"]').val();
		        		var scheduleColor = $("select[name='getScheduleColor']").val();
		        		var scheduleTitle = $("input[name='getScheduleTitle']").val();
		        		var scheduleContents = $("textarea[name='getScheduleContents']").val();

		        		var schedule = {
		        				scheduleStartDate:scheduleStartDate,
		        				scheduleEndDate:scheduleEndDate,
		        				scheduleColor:scheduleColor,
		        				scheduleTitle:scheduleTitle,
		        				scheduleContents:scheduleContents
		        		};
		        		var startDate = scheduleStartDate+" "+scheduleStartTime;
		        		var endDate = scheduleEndDate+" "+scheduleEndTime;

		        		
		        		$.ajax({
		        			url : "/mir9/schedule/json/updateSchedule?${_csrf.parameterName}=${_csrf.token}",
		        			method : "POST",
		        			data: JSON.stringify({
		        				'scheduleStartDate':startDate,
		        				'scheduleEndDate':endDate,
		        				'scheduleColor':scheduleColor,
		        				'scheduleTitle':scheduleTitle,
		        				'scheduleContents':scheduleContents,
		        				'scheduleNo':scheduleNo
		        			}),
		        			dataType : 'JSON',
		        			headers : {
		        				"Accept" : "application/json",
		        				"Content-Type" : "application/json"	 						
		        			} ,
		        			success : function(data){
		        				alert("수정이 완료되었습니다.")
		        				location.reload();
		        			},
		        			error:function(request, status, error){
		        				
		        			}
		        				
		        		})
		        	
					  
				  })
				  
				  $('button[name="deleteSchedule"]').on("click", function(){

	        		  $.ajax({
			    			url : "/mir9/schedule/json/deleteSchedule/"+scheduleNo,
			    			method : "GET",
			    			dataType : "JSON",	
			    			headers : {
			    				"Accept" : "application/json",
			    				"Content-Type" : "application/json"	 						
			    			} ,
			    			success : function(JSONData, status){
			    				alert("삭제가 완료되었습니다.")
			    				location.reload();
			    			}
			    			
			    	  })
					  
				  })
	        	    	  
	          },
			  select: function(event) { 
				  $('#modalContent6').modal({backdrop:'static', show:true});
				  
	              form_register.mode.value = 'update';
	              form_register.code.value = event.code;
	              $('input[name="scheduleStartDate"]').val(moment(event.start).format('YYYY-MM-DD'));
	              $('input[name="scheduleEndDate"]').val(moment(event.end).format('YYYY-MM-DD'));
	              $('select[name="scheduleStartTime"]').val(moment(event.start).format('09:00'));
	              $('select[name="scheduleEndTime"]').val(moment(event.end).format('09:30'));
	              $("input[name='scheduleTitle']").val(event.title);
	              $("textarea[name='scheduleContents']").val(event.content);
	              $("select[name='scheduleColor']").val(event.backgroundColor);
	              $('.btn-colorselector').css('background-color',event.backgroundColor);
	              $('#display_reply').css('display','');
	              //$('#colorselector').colorselector('setColor', event.backgroundColor);
	              
	              $('button[name="addSchedule"]').on("click", function(){
					
	            	  var scheduleStartDate = $('input[name="scheduleStartDate"]').val();
		        		var scheduleEndDate = $('input[name="scheduleEndDate"]').val();
		        		var scheduleStartTime = $('select[name="scheduleStartTime"]').val();
		        		var scheduleEndTime = $('select[name="scheduleEndTime"]').val();
		        		var scheduleColor = $("select[name='scheduleColor']").val();
		        		var scheduleTitle = $("input[name='scheduleTitle']").val();
		        		var scheduleContents = $("textarea[name='scheduleContents']").val();
		        	
		        		var schedule = {
		        				scheduleStartDate:scheduleStartDate,
		        				scheduleEndDate:scheduleEndDate,
		        				scheduleColor:scheduleColor,
		        				scheduleTitle:scheduleTitle,
		        				scheduleContents:scheduleContents
		        		};
		        		var startDate = scheduleStartDate+" "+scheduleStartTime;
		        		var endDate = scheduleEndDate+" "+scheduleEndTime;

		        		
		        		$.ajax({
		        			url : "/mir9/schedule/json/addSchedule?${_csrf.parameterName}=${_csrf.token}",
		        			method : "POST",
		        			data: JSON.stringify({
		        				'scheduleStartDate':startDate,
		        				'scheduleEndDate':endDate,
		        				'scheduleColor':scheduleColor,
		        				'scheduleTitle':scheduleTitle,
		        				'scheduleContents':scheduleContents
		        			}),
		        			dataType : 'JSON',
		        			headers : {
		        				"Accept" : "application/json",
		        				"Content-Type" : "application/json"	 						
		        			} ,
		        			success : function(data){

		        				calendar.addEvent({
		        					title: scheduleTitle,
		        					start: scheduleStartDate,
		        					end: scheduleEndDate,
		        					backgroundColor: scheduleColor
		        				});
		        				location.reload();
		        			},
		        			error:function(request, status, error){
		        				alert("경고")
		        			}
		        				
		        		})
					  
				  })
			  }

        });
        calendar.render();
      }); 
      

      
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
     
      
</script>

</head>

<section class="content-header">
    <h1>
    일정 관리
    <small>schedule list</small>
    </h1>

    <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
        <li class="active">일정 관리</li>
    </ol>
</section>

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

<jsp:include page="/WEB-INF/views/schedule/addSchedule.jsp"/>
<jsp:include page="/WEB-INF/views/schedule/getSchedule.jsp"/>
</div><!-- /.content-wrapper -->

<footer class="main-footer">
<div class="pull-right hidden-xs">
    <b>Version</b> 2.7.4
</div>
<strong>Copyright &copy; 2017 <a href="/admin">MIR9 SHOP</a>.</strong> All rights reserved.
</footer>

