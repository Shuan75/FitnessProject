<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ include file="auth.jsp" %>
 <!DOCTYPE html>
<html lang="ko">

  <head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <link href="https://fonts.googleapis.com/css?family=Montserrat:100,200,300,400,500,600,700,800,900" rel="stylesheet">

    <title>Better Body, Better Life</title>
    
    <!-- Bootstrap core CSS -->
    <link href="../vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- Additional CSS Files -->
     <link href="../assets/css/fontawesome.css" rel="stylesheet">
     <link href="../assets/css/templatemo-grad-school.css" rel="stylesheet">
     <link href="../assets/css/owl.css" rel="stylesheet">
     <link href="../assets/css/lightbox.css" rel="stylesheet">
  <!--   <link rel="stylesheet" href="assets/css/fontawesome.css">
    <link rel="stylesheet" href="assets/css/templatemo-grad-school.css">
    <link rel="stylesheet" href="assets/css/owl.css">
    <link rel="stylesheet" href="assets/css/lightbox.css">

    
TemplateMo 557 Grad School

https://templatemo.com/tm-557-grad-school

-->
  </head>

<body>

    <!--header-->
  <header class="main-header clearfix" role="header">
    <div class="logo">
      <a href="#"><em>BETTER</em> </a>
    </div>
    <a href="#menu" class="menu-link"><i class="fa fa-bars"></i></a>
    <nav id="menu" class="main-nav" role="navigation">
      <ul class="main-menu">
        <li><a href="#section1">Home</a></li>
        
        <li class="menu"><a href="#" onclick="location.href='program.do'">PROGRAM</a>
          </li>
        <!-- <li><a href="#section5">Video</a></li> -->
        <li class="has-submenu">>
        <a href="#" onclick="location.href='noticeList.do'">COMMUNITY</a>
         <ul class="sub-menu">
            <li><a href="#section2">공지사항</a></li>
            <li><a href="#section3">자유게시판</a></li>
          </ul>
        </li>
        
<%if(s_id.equals("guest") || s_password.equals("guest") || s_rating.equals("guest")) {
	

	Cookie[] cookies = request.getCookies();
	String c_id = "";
	if(cookies!=null) {
		
		for(int i = 0; i<cookies.length; i++) {
			Cookie cookie = cookies[i]; 
			if(cookie.getName().equals("c_id")==true) {
				c_id = cookie.getValue(); // cookie 변수값가져오기
				
			}
			
		}
		
	} 
%>
        <li><a href="#" onclick="location.href='login.do'">LOGIN</a></li>
        
        <% } else {%>
        	<li><a href="#">${s_id }님 환영합니다.</a></li>
    		<li><a href="#" onclick="location.href='logout.do'" >로그아웃</a></li>
    		<li><a href="#" onclick="location.href='modify.do?id=${s_id}'">마이페이지</a></li>
   
    	
       	  <%
        	/* out.println("<a href='myPage/myPage.jsp?id=<%=id%'>[마이페이지]</a>");
         */
        	
        } %>
       

      </ul>
    </nav>
  </header>
   

  <!-- ***** Main Banner Area Start ***** -->
  <section class="section main-banner" id="top" data-section="section1">
      <video autoplay muted loop id="bg-video">
          <source src="../assets/images/upperVideo.mp4" type="video/mp4" />
      </video>

      <div class="video-overlay header-text">
          <div class="caption">
              <!-- <h6>Graduate School of Management</h6> -->
              <h2><em>Better body.</em> <br> Better life.</h2>
              <div class="main-button">
                  <div class="scroll-to-section"><a href="#section2">더 알아보기</a></div>
              </div>
          </div>
      </div>
  </section>
  <!-- ***** Main Banner Area End ***** -->


  <section class="features">
    <div class="container">
      <div class="row">
        <div class="col-lg-4 col-12">
          <div class="features-post">
            <div class="features-content">
              <div class="content-show">
                <h4><i class="fa fa-pencil"></i>강의소개</h4>
              </div>
              <div class="content-hide">
                <p>요가와 필라테스 모든 수업은 1:5 소규모로 진행되며 기구 필라테스로 모든 수업은 100% 기구를 이용하여 진행됩니다.</p>
                <p>꾸준한 운동진행 프로그램으로 회원님들의 신체적, 정신적 열정을 회복시켜드립니다.</p>
                <p class="hidden-sm">Curabitur id eros vehicula, tincidunt libero eu, lobortis mi. In mollis eros a posuere imperdiet.</p>
                <div class="scroll-to-section"><a href="#section2">More Info.</a></div>
            </div>
            </div>
          </div>
        </div>
        <div class="col-lg-4 col-12">
          <div class="features-post second-features">
            <div class="features-content">
              <div class="content-show">
                <h4><i class="fa fa-graduation-cap"></i>강사소개</h4>
              </div>
              <div class="content-hide">             
                <p>Better 지도자는 Clients에게 최선을 다합니다.</p>
                <p>Clients 개개인의 문제점을 정확히 파악하고 그에 따른 운동방법을 체계적으로 접근합니다.</p>
                <p>모든 강사진은 파트근무직이 아닌 정규직입니다. 운동을 시작하는 순간부터 마치는 순간까지 차별화된 담임 강사와 체계적으로 관리받을 수 있습니다.<p>
                
          
                <div class="scroll-to-section"><a href="#section4">Details</a></div>
            </div>
            </div>
          </div>
        </div>
        <div class="col-lg-4 col-12">
          <div class="features-post third-features">
            <div class="features-content">
              <div class="content-show">
                <h4><i class="fa fa-book"></i>찾아오는 길</h4>
              </div>
              <div class="content-hide">
              
                <p>BETTER</p>
                <p>서울특별시 종로구 관철동 13-13</p>
          
                <div class="scroll-to-section"><a href="#section6">Read More</a></div>
            </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>

  <section class="section why-us" data-section="section2">
    <div class="container">
      <div class="row">
        <div class="col-md-12">
          <div class="section-heading">
            <h2>Why choose Gym?</h2>
          </div>
        </div>
        <div class="col-md-12">
          <div id='tabs'>
            <ul>
              <li><a href='#tabs-1'>Yoga</a></li>
              <li><a href='#tabs-2'>Pilates</a></li>
              <li><a href='#tabs-3'>professional</a></li>
            </ul>
            <section class='tabs-content'>
              <article id='tabs-1'>
                <div class="row">
                  <div class="col-md-6">
                    <img src="../assets/images/ft_yoga.png" alt="">
                  </div>
                  <div class="col-md-6">
                    <h4>Yoga</h4>
                    <p>요가란 마음을 조절해서 마음의 움직임을 억제하여 인간 본래의 고요한 마음으로 돌아가는 상태입니다.</p>
                    <p>요가의 수련과정은 모두가 정신력을 개발하고 육체를 강화하는 목표를 평형상태의 유지와 조화에 두며 요가의 수련은 도덕적인 통제를 우선합니다.</p>
                   
                  </div>
                </div>
              </article>
              <article id='tabs-2'>
                <div class="row">
                  <div class="col-md-6">
                    <img src="../assets/images/ft_pilat.png" alt="">
                  </div>
                  <div class="col-md-6">
                    <h4>Pilates</h4>
                    <p>반복된 운동과 연속 동작을 통해 근육을 운동시키며 통증 없이 근육을 강화할 수 있는 특징이 있습니다.</p> 
                    <p>심폐 능력과 순환기 능력을 강화시키는 데 효과가 있는 것으로 알려져 있으며 마음을 차분히 가라앉히는 과정을 통해 긴장 해소와 스트레스 감소에도 좋은 효과가 있습니다.</p>
                  </div>
                </div>
              </article>
              <article id='tabs-3'>
                <div class="row">
                  <div class="col-md-6">
                    <img src="../images/pro.png" alt="">
                  </div>
                  <div class="col-md-6">
                    <h4>Professional</h4>
                    <p>Better은 전문성을 갖춘 최고의 강사들로 구성되어 있습니다.</p>
                  </div>
                </div>
              </article>
            </section>
          </div>
        </div>
      </div>
    </div>
  </section>

  <section class="section coming-soon" data-section="section3">
  
    <div class="container">
      <div class="row">
        <div class="col-md-7 col-xs-12">
          <div class="continer centerIt">
            <div>
              <h4>Let's get<em> started!</em> </h4>
              <div class="counter">

                <div class="days">
                  <div class="value">00</div>
                  <span>Days</span>
                </div>

                <div class="hours">
                  <div class="value">00</div>
                  <span>Hours</span>
                </div>

                <div class="minutes">
                  <div class="value">00</div>
                  <span>Minutes</span>
                </div>

                <div class="seconds">
                  <div class="value">00</div>
                  <span>Seconds</span>
                </div>
         

              </div>
            </div>
          </div>
        </div>
        <div class="col-md-5">
          <div class="right-content">
            <div class="top-content">
              <h6>Register your free account and <em>get immediate</em> access to online courses</h6>
            </div>
            <form id="contact" action="" method="get">
              <div class="row">
                <div class="col-md-12">
                  <fieldset>
                    <input name="name" type="text" class="form-control" id="name" placeholder="Your Name" required="">
                  </fieldset>
                </div>
                <div class="col-md-12">
                  <fieldset>
                    <input name="email" type="text" class="form-control" id="email" placeholder="Your Email" required="">
                  </fieldset>
                </div>
                <div class="col-md-12">
                  <fieldset>
                    <input name="phone-number" type="text" class="form-control" id="phone-number" placeholder="Your Phone Number" required="">
                  </fieldset>
                </div>
                <div class="col-md-12">
                  <fieldset>
                    <button type="submit" id="form-submit" class="button">Get it now</button>
                  </fieldset>
                </div>
              </div>
            </form>
          </div>
        </div>
      </div>
    </div>
  </section>

  <section class="section courses" data-section="section4">
    <div class="container-fluid">
      <div class="row">
        <div class="col-md-12">
          <div class="section-heading">
            <h2>강사소개</h2>
          </div>
        </div>
        <div class="owl-carousel owl-theme">
          <div class="item">
            <img src="../assets/images/ft_junga.png" alt="Course #1">
            <div class="down-content">
              <h4>정아영 트레이너</h4>
              <p>요가지도자 1급 취득</p>
              <p>요가지도자 2급 취득</p>
              <br>
              <br>
             
              <div class="author-image">
                <img src="../assets/images/ft_junga" alt="Author 1">
              </div>
              <div class="text-button-pay">
                <a href="#">Pay <i class="fa fa-angle-double-right"></i></a>
              </div>
            </div>
          </div>
          <div class="item">
            <img src="../assets/images/ft_an.png" alt="Course #2">
            <div class="down-content">
              <h4>안지영</h4>
              <p>요가지도자 1급 취득</p>
              <p>요가지도자 2급 취득</p>
              <p>아쉬탕가 마이솔 수련<br>
              <div class="author-image">
                <img src="../assets/images/ft_an.png" alt="Author 2">
              </div>
              <div class="text-button-free">
                <a href="#">Free <i class="fa fa-angle-double-right"></i></a>
              </div>
            </div>
          </div>
          <div class="item">
            <img src="../assets/images/ft_park.png" alt="Course #3">
            <div class="down-content">
              <h4>박정연</h4>
              <p>요가지도자 1급 취득</p>
              <p>하타 집중반 수련</p>
              <br>
              <br>
              <br>
              <br>
              <div class="author-image">
                <img src="../assets/images/ft_park.png" alt="Author 3">
              </div>
            </div>
          </div>
          <div class="item">
            <img src="../assets/images/ft_kim.png" alt="">
            <div class="down-content">
              <h4>김명진 트레이너</h4>
              <p>Hoospine 필라테스 협회
              <br>매트필라테스 레벨1,2,3 획득</p>
			<br>
			<br>
              <div class="author-image">
                <img src="../assets/images/ft_kim.png" alt="">
              </div>
              <div class="text-button-pay">
                <a href="#">Pay <i class="fa fa-angle-double-right"></i></a>
              </div>
            </div>
          </div>
 
          <div class="item">
            <img src="../assets/images/ft_back.png" alt="">
            <div class="down-content">
              <h4>백수진 트레이너</h4>
              <p>생활체육 지도자 3급</p>
              <p>요가지도자 1급</p>
              <div class="author-image">
                <img src="../assets/images/ft_back.png" alt="">
              </div>
              <div class="text-button-free">
                <a href="#">Free <i class="fa fa-angle-double-right"></i></a>
              </div>
            </div>
          </div>
 
        </div>
      </div>
    </div>
  </section>
  

  <section class="section video" data-section="section5">
    <div class="container">
      <div class="row">
        <div class="col-md-6 align-self-center">
          <div class="left-content">
            <span>our presentation is for you</span>
            <h4>Watch the video to learn more <em>about BETTER</em></h4>
            <p>BETTER를 소개합니다. 
            <br><br>최신식 기구~</p>
            <div class="main-button"><a rel="nofollow" href="https://fb.com/templatemo" target="_parent">External URL</a></div>
          </div>
        </div>
        <div class="col-md-6">
          <article class="video-item">
            <div class="video-caption">
              <h4>더 알아보기</h4>
            </div>
            <figure>
              <a href="https://www.youtube.com/watch?v=r9LtOG6pNUw" class="play"><img src="assets/images/ft_bbbl2.png"></a>
            </figure>
          </article>
        </div>
      </div>
    </div>
  </section>

  <section class="section contact" data-section="section6">
    <div class="container">
      <div class="row">
        <div class="col-md-12">
          <div class="section-heading">
            <h2>Let’s Keep In Touch</h2>
          </div>
        </div>
        <div class="col-md-6">
        
        <!— Do you need a working HTML contact-form script?
                	
                    Please visit https://templatemo.com/contact page —>
                    
          <form id="contact" action="" method="post">
            <div class="row">
              <div class="col-md-6">
                  <fieldset>
                    <input name="name" type="text" class="form-control" id="name" placeholder="Your Name" required="">
                  </fieldset>
                </div>
                <div class="col-md-6">
                  <fieldset>
                    <input name="email" type="text" class="form-control" id="email" placeholder="Your Email" required="">
                  </fieldset>
                </div>
              <div class="col-md-12">
                <fieldset>
                  <textarea name="message" rows="6" class="form-control" id="message" placeholder="Your message…" required=""></textarea>
                </fieldset>
              </div>
              <div class="col-md-12">
                <fieldset>
                  <button type="submit" id="form-submit" class="button">Send Message Now</button>
                </fieldset>
              </div>
            </div>
          </form>
        </div>
        <div class="col-md-6">
          <div id="map">
            <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d395.2994483428081!2d126.98599587116412!3d37.569301582921035!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x357ca2e89e08e16b%3A0xf8955b2100de16c3!2z7IaU642w7Iqk7YGs!5e0!3m2!1sko!2skr!4v1655352044953!5m2!1sko!2skr" width="100%" height="422px" frameborder="0" style="border:0" allowfullscreen></iframe>
          </div>
        </div>
      </div>
    </div>
  </section>

  <footer>
    <div class="container">
      <div class="row">
        <div class="col-md-12">
          <p><i class="fa fa-copyright"></i>5조 프로젝트<a href="https://templatemo.com" rel="sponsored" target="_parent">Better</a></p>
        </div>
      </div>
    </div>
  </footer>

  <!-- Scripts -->
  <!-- Bootstrap core JavaScript -->
    <script src="../vendor/jquery/jquery.min.js"></script>
    <script src="../vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <script src="../assets/js/isotope.min.js"></script>
    <script src="../assets/js/owl-carousel.js"></script>
    <script src="../assets/js/lightbox.js"></script>
    <script src="../assets/js/tabs.js"></script>
    <script src="../assets/js/video.js"></script>
    <script src="../assets/js/slick-slider.js"></script>
    <script src="../assets/js/custom.js"></script>
    <script>
        //according to loftblog tut
        $('.nav li:first').addClass('active');

        var showSection = function showSection(section, isAnimate) {
          var
          direction = section.replace(/#/, ''),
          reqSection = $('.section').filter('[data-section="' + direction + '"]'),
          reqSectionPos = reqSection.offset().top - 0;

          if (isAnimate) {
            $('body, html').animate({
              scrollTop: reqSectionPos },
            800);
          } else {
            $('body, html').scrollTop(reqSectionPos);
          }

        };

        var checkSection = function checkSection() {
          $('.section').each(function () {
            var
            $this = $(this),
            topEdge = $this.offset().top - 80,
            bottomEdge = topEdge + $this.height(),
            wScroll = $(window).scrollTop();
            if (topEdge < wScroll && bottomEdge > wScroll) {
              var
              currentId = $this.data('section'),
              reqLink = $('a').filter('[href*=\\#' + currentId + ']');
              reqLink.closest('li').addClass('active').
              siblings().removeClass('active');
            }
          });
        };

        $('.main-menu, .scroll-to-section').on('click', 'a', function (e) {
          if($(e.target).hasClass('external')) {
            return;
          }
          e.preventDefault();
          $('#menu').removeClass('active');
          showSection($(this).attr('href'), true);
        });

        $(window).scroll(function () {
          checkSection();
        });
    </script>
</body>
</html>