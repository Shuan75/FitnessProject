<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no">
<link href="../css/noticestyle.css" rel="stylesheet" type="text/css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link href='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/main.min.css' rel='stylesheet' />
<script	src='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/main.min.js'></script>
<script	src='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/locales-all.min.js'></script>
 <link href="../css/fullcalendar/main.css" rel="stylesheet"/>
 <link href="../css/fullcalendar/main.js" rel="stylesheet"/>
 <link href="../css/fullcalendar/main.min.css" rel="stylesheet"/>
 <link href="../css/fullcalendar/locales-all.js" rel="stylesheet"/>
 <link href="../css/fullcalendar/locales-all.min.js" rel="stylesheet"/>
 <link href="../css/fullcalendar/main.min.js" rel="stylesheet"/>
  <link href="../css/fullcalendar/schedule.css" rel="stylesheet"/>
 <script src="../css/fullcalendar/schedule.js" type="text/javascript"></script>
<%@page import = "kr.fit.login.*"%>
<%@page import = "kr.fit.login.CalDTO" %>
<%@page import = "java.util.List" %>
<%@page import = "java.util.ArrayList" %>

<%

	CalDAO c_dao = new CalDAO();
	CalDTO c_dto = new CalDTO();
	String id = session.getAttribute("s_id").toString(); 
	/* List<ScheduleDTO> list2 = (ArrayList<ScheduleDTO>)request.getAttribute("showSchedule"); */
 	/* List<CalDTO> list = new ArrayList<CalDTO>(); */
	
%>
<style>
.add-button {
	position: absolute;
	top: 1px;
	right: 230px;
	background: #2C3E50;
	border: 0;
	color: white;
	heighgt: 35px;
	border-radius: 3px;
	width: 157px;
}

section {
	display: -webkit-flex;
	display: flex;
}

article {
	-webkit-flex: 3;
	-ms-flex: 3;
	flex: 3;
	padding: 10px;
}

html, body {
	/* overflow: hidden; */
	font-family: Arial, Helvetica Neue, Helvetica, sans-serif;
	font-size: 14px;
}

.fc-header-toolbar {
	padding-top: 1em;
	padding-left: 1em;
	padding-right: 1em;
}
</style>
<section class="mypage">

	<nav>
		<div id="navigation">
			<div class="snb">
				<h2>마이페이지</h2>
				<ul>
					<li><a href="#" onclick="location.href='modify.do?id=${s_id}'">회원정보수정</a></li>
					<li><a href="#" onclick="location.href='calendar.do'">달력</a></li>
					<li><a href="#" onclick="location.href='chart.do'">차트</a></li>
					<li><a href="#" onclick="location.href='basketList.do?id=${s_id}'">장바구니</a></li>
					<!-- <li><a href="#" onclick="location.href='chat.do'">온라인강의</a></li> -->
					
				</ul>
			</div>
		</div>
	</nav>
	<article>

    <script>

    
    document.addEventListener('DOMContentLoaded', function() {
        var calendarEl = document.getElementById('calendar');
       
        var events = [];
		 <c:forEach var="dto" items="${list}">
	    	datas.push("${list}");
	    </c:forEach>
        var calendar = new FullCalendar.Calendar(calendarEl, {
        	
        	/* plugins: [ 'interaction', 'dayGrid'], */
        	height: '700px', // calendar 높이 설정 
    		expandRows: true, // 화면에 맞게 높이 재설정
  //    	slotMinTime: '08:00', // Day 캘린더에서 시작 시간 
  //  		slotMaxTime: '20:00', // Day 캘린더에서 종료 시간

    		headerToolbar: {  
    			left: 'prev,next today',
    			center: 'title',
    			right: 'dayGridMonth,timeGridWeek,timeGridDay,listWeek' 
    		},
          initialView: 'dayGridMonth',
        	/* initialDate: '2022-06-28', // 초기 날짜 설정 (설정하지 않으면 오늘 날짜가 보인다.) */
      		navLinks: true, // 날짜를 선택하면 Day 캘린더나 Week 캘린더로 링크 
      		editable: true, // 수정 가능?
      		selectable: true, // 달력 일자 드래그 설정가능
      		nowIndicator: true, // 현재 시간 마크
      		dayMaxEvents: true, // 이벤트가 오버되면 높이 제한 (+ 몇 개식으로 표현)
      		locale: 'ko', // 한국어 설정
            eventClick: function(arg) {
          	  // 있는 일정 클릭시,
          	  console.log("#등록된 일정 클릭#");
          	  console.log(arg.event);
          	  
              if (confirm('이 일정을 삭제 하시겠습니까 ?')) {
                arg.event.remove()
              }
            },
           
   		            
		          	events: [
		          		 	 <% 
		          		 	ArrayList<CalDTO> list = c_dao.list();
		            	 	 for (int i = 0; i < list.size(); i++) {
		            	  		CalDTO dto = (CalDTO)list.get(i);
		        			 %>	
		        			   {
		        		  	   title : '<%= dto.getC_title() %>',
		        		  	   start : '<%= dto.getC_start() %>',
		        		  	   end : '<%= dto.getC_end() %>'
		        		  	   },
		        		  	   
		        		  	 <%
		            		 }
		            		 %>
		   			 {
		   				 title: '중간발표',
		   				 start: '2022-06-29',
		   				 end: '2022-06-29'
		   			},
		   		 {
		   				 title: '운동예약',
		   				 start: '2022-07-22',
		   				 end: '2022-07-22'
		   			},
		   			 /* {
		   				title: 'Click for Google',
		   				url: 'http://google.com/',
		   				start: '2022-08-05'
		   				} */
		   			],
		     		eventAdd: function(obj) { // 이벤트가 추가되면 발생하는 이벤트
		     			console.log(obj);
		   		},
		   		eventChange: function(obj) { // 이벤트가 수정되면 발생하는 이벤트
		   			console.log(obj);
		   		},
		   		eventRemove: function(obj){ // 이벤트가 삭제되면 발생하는 이벤트
		   			console.log(obj);
		   		},
		   		 
		   		
		   		
		   		select: function(arg) { // 캘린더에서 드래그로 이벤트를 생성할 수 있다.
		   			var title = prompt('Event Title:');
		   			if (title) {
		   			calendar.addEvent({
		   				title: title,
		   				start: arg.start,
		   				end: arg.end,
		   				allDay: arg.allDay
		   				})
		   			} 
		   			
		   			
		   		calendar.unselect()
		   		} 
		   		 
       });
       calendar.render();
     });
    </script>
    
			<div id='calendar-container'>
				<div id='calendar'></div>
			</div>
				 <div id='calendar' style="position : relative;">
                 		<div>
                 			<button class = "add-button" type = "button" onclick="click_add();">일정 추가</button>
                 		</div>
                 </div>
	
	</article>
</section>

<%@ include file="../footer.jsp"%>