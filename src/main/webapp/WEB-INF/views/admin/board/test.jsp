<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang='en'>
  <head>
	<link rel='stylesheet'  href='${pageContext.request.contextPath}/resources/fullcalendar/lib/main.css'/>
	<link rel="stylesheet"  href="${pageContext.request.contextPath}/resources/css/colorselector.css">
	<script src='${pageContext.request.contextPath}/resources/fullcalendar/lib/main.js'></script>
	<script src='${pageContext.request.contextPath}/resources/fullcalendar/lib/locales/ko.js'></script>
	<script src='${pageContext.request.contextPath}/resources/js/moment.js'></script>  
  
    <meta charset='utf-8' />
    <link href='fullcalendar/main.css' rel='stylesheet' />
    <script src='fullcalendar/main.js'></script>
    <script>
      document.addEventListener('DOMContentLoaded', function() {
        var calendarEl = document.getElementById('calendar');
        var calendar = new FullCalendar.Calendar(calendarEl, {
          initialView: 'dayGridMonth',
          googleCalendarApiKey: 'AIzaSyASBmDMiz6BkF4sQyRk9bmGrI0lzwp9Y5Y',
          events: {
            googleCalendarId: 'esvapcmtd888b358srsgd12dt0@group.calendar.google.com',
            className: 'gcal-event' // an option!
          }
        });
        calendar.render();
      });
    </script>
  </head>
  <body>
    <div id='calendar'></div>
  </body>
</html>


