
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

  <head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">

    <title>지구를 위한 Tracycle</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Nunito:wght@300&display=swap" rel="stylesheet">
	<!--한글폰트 링크 -->
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic:wght@400;700&family=Nanum+Myeongjo:wght@400;700&family=Song+Myung&display=swap" rel="stylesheet">
	
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous"> 


    <link rel="stylesheet" href="../css/open-iconic-bootstrap.min.css">
    <link rel="stylesheet" href="../css/animate.css">
    <link rel="stylesheet" href="../css/owl.carousel.min.css">
    <link rel="stylesheet" href="../css/owl.theme.default.min.css">
    <link rel="stylesheet" href="../css/magnific-popup.css">
    <link rel="stylesheet" href="../css/aos.css">
    <link rel="stylesheet" href="../css/ionicons.min.css">
    <link rel="stylesheet" href="../css/bootstrap-datepicker.css">
    <link rel="stylesheet" href="../css/jquery.timepicker.css">
    <link rel="stylesheet" href="../css/fancybox.min.css">
    <link rel="stylesheet" href="../css/bootstrap.css">
    <link rel="stylesheet" href="../css/style.css">
    
    
 <script>
      window.Promise ||
        document.write(
          '<script src="https://cdn.jsdelivr.net/npm/promise-polyfill@8/dist/polyfill.min.js"><\/script>'
        )
      window.Promise ||
        document.write(
          '<script src="https://cdn.jsdelivr.net/npm/eligrey-classlist-js-polyfill@1.2.20171210/classList.min.js"><\/script>'
        )
      window.Promise ||
        document.write(
          '<script src="https://cdn.jsdelivr.net/npm/findindex_polyfill_mdn"><\/script>'
        )
    </script>

    <!-- Apexchart CDN --> 
    <script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/apexcharts"></script>
    <script src="https://cdn.jsdelivr.net/npm/vue-apexcharts"></script>
    

</head>
 <body>

    
  <jsp:include page="../header.jsp"></jsp:include>
  
  <div class="site-header-section">
    <div class="container">
      <div class="row">
        <div class="col-md-12">
          <h1 class="pt-5 pb-5 text-center">10년 후, 빙하의 높이는 오늘보다 158M 줄어들었습니다.</h1>
        </div>
      </div>
    </div>
  </div>

  <div class="site-section2">
  
  <div class="col-md-12"> 
     
      <div class="flex h-screen antialiased">
        <!-- Loading screen -->
        <div
          x-ref="loading"
          class="fixed inset-0 z-50 flex items-center justify-center text-2xl font-semibold text-white bg-primary-darker"
        >
          Loading.....
        </div>
        <div class="flex-1 h-full overflow-x-hidden overflow-y-auto">
		 <!-- Content -->
            <div class="mt-2 mb-5 px-5 mx-5">
             <!--  -->
              <!-- Charts -->
              <div class="grid grid-cols-1 p-4 space-y-8 lg:gap-8 lg:space-y-3 lg:grid-cols-3">
              
              
               
                  
                 <h4 class="text-lg font-semibold text-gray-500 dark:text-light pb-3 mb-5">전국 생활폐기물 배출량</h4>
                 <!-- line Chart -->
	             <div id="appl">    
	             	<div id="chart">
	        		  	<apexchart type="line" height="350" :options="chartOptions" :series="series"></apexchart>
	      			</div>
	             </div>
	             <br>
	             <br>
			   	 <br>
                
	  			<h4 class="text-lg font-semibold text-gray-500 dark:text-light pb-3 mb-5">세계 해수면 높이 & 기온 변화</h4> 
	            <!-- mixed chart -->
				<div id="app">
			      <div id="chart">
			      <apexchart type="line" height="350" :options="chartOptions" :series="series"></apexchart>
			      </div>
			    </div>
			    <br>
			    <br>
			    <br>
			    
			    
			    
			    <h4 class="text-lg font-semibold text-gray-500 dark:text-light pb-3 mb-5">국내 평균 기온 변화 Heatmap</h4>  
			    <!-- Heatmap -->
			    <div id="apph">
			      <div id="chart">
			      <apexchart type="heatmap" height="350" :options="chartOptions" :series="series"></apexchart>
			      </div>
			    </div>  
		          
       		</div>
         </div>
       </main>
        </div>
      </div>
    </div>
    
 
    
  </div> <!-- .site-section -->

<jsp:include page="../footer.jsp"></jsp:include>


  <!-- loader -->
  <div id="ftco-loader" class="show fullscreen"><svg class="circular" width="48px" height="48px"><circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee"/><circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10" stroke="#F96D00"/></svg></div>

  <!-- For mixed chart & Heatmap -->
  <script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/apexcharts"></script>
  <script src="https://cdn.jsdelivr.net/npm/vue-apexcharts"></script>	

  
  <script src="../js/jquery.min.js"></script>
  <script src="../js/jquery-migrate-3.0.1.min.js"></script>
  <script src="../js/popper.min.js"></script>
  <script src="../js/bootstrap.min.js"></script>
  <script src="../js/jquery.easing.1.3.js"></script>
  <script src="../js/jquery.waypoints.min.js"></script>
  <script src="../js/jquery.stellar.min.js"></script>
  <script src="../js/owl.carousel.min.js"></script>
  <script src="../js/jquery.magnific-popup.min.js"></script>
  <script src="../js/bootstrap-datepicker.js"></script>
  <script src="../js/jquery.fancybox.min.js"></script>
  <script src="../js/aos.js"></script>
  <script src="../js/jquery.animateNumber.min.js"></script>
  <script src="../js/main.js"></script>
  <script src="../js/chart.js"></script>
  

  </body>

</html>