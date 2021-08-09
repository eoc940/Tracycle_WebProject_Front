
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
	<!-- 차트 링크 --> 
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous"> 
	<script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>
	<script src="https://cdn.jsdelivr.net/npm/chart.js@2.9.4/dist/Chart.bundle.min.js"></script>
	<!-- 아이콘 링크 -->
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">


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
    


</head>
 <body>

    
  <jsp:include page="../header.jsp"></jsp:include>
  
  <div class="site-header-section" id="app">
    <div class="container">
      <div class="row">
        <div class="col-md-12">
          <h2 class="pt-5 pb-5 text-center"> </br></br><p>TV는 무상(유상)으로 수거가 가능한 제품입니다.</p></h2>
        </div>
      </div>
    </div>
  </div>
  <div class="site-section-img">
	  <div class="container">
	      <div class="row">
	        <div class="col-md-12 text-center pt-5 pb-5 mt-5 mb-5">
	          <h1 class="pt-5 pb-5 text-center"> 이미지 들어갈 곳</h1>
	          <img alt="" src="http://127.0.0.1:8085/static/result0.jpg">
      		 </div>
      	  </div>
      </div>
   </div>

 <div class="tableContainer">   
    <div class="areaContainer">
		 <p id="area" v-html></p> 
	</div>
  <table class="table text-center pt-5 pb-5 mt-5 mb-5">
    <thead>
      <tr>
        <th>ID</th>
        <th>Category</th>
        <th>Standard</th>
        <th>Price</th>
        <th>Description</th>
      </tr>
    </thead>
    <tbody class="tbody  pt-5 pb-5 mt-5 mb-5">
      <tr v-for="">
        <td v-html=""></td>
        <td v-html=""></td>
        <td v-html=""></td>
        <td v-html=""></td>
        <td v-html=""></td>
        
      </tr>
    </tbody>
  </table>
</div>

<div class="bannerContainer">
        <div class="row d-flex">
<!--           <div class="col-md-4 d-flex align-self-stretch">
            <div class="media block-7">
              <div class="media-body p-3 mt-3">
             	<span style="color:rgba(128, 156, 168, 1)"><i class="fa fa-globe fa-5x" aria-hidden="true" style="width:100px; height:150px;"></i></span>
                <h6 class="heading mb-4">폐기물 인터넷 접수 바로가기</h6>
                <p class="heading-2"></p>
              </div>
            </div>      
          </div> -->
          <div class="col-md-4  align-self-stretch">
            <div class="media block-71">
              <div class="media-body p-3 mt-3">
             	<span style="color:rgba(128, 156, 168, 1)"><i class="fa fa-globe fa-5x" aria-hidden="true" style="width:100px;"></i></span>
                <h6 class="heading mt-2 mb-4">폐기물 인터넷 <br class="mobile-br">접수 바로가기</h6>
              </div>
            </div>      
            <div class="media block-71" v-on:click="go15990903">
              <div class="media-body p-3 mt-3">
             	<span style="color:rgba(128, 156, 168, 1)"><i class="fa fa-truck fa-5x" aria-hidden="true" style="width:100px;"></i></span>
                <h6 class="heading mt-2 mb-4">폐가전 무상방문수거 <br class="mobile-br">접수 바로가기</h6>
              </div>
            </div>      
          </div>
          <div class="col-md-4 d-flex align-self-stretch">
            <div class="media block-7">
              <div class="media-body p-3 mt-3">
              	<a href="../board/board_form.jsp">
              	<span style="color:rgba(128, 156, 168, 1)"><i class="fa fa-heart-o fa-5x" aria-hidden="true" style="width:100px; height:150px;"></i></span>
                <h6 class="heading mb-4" style="color:black">작은 실천이 <br class="mobile-br">큰 힘이 됩니다</h6>
                <p class="heading-2" style="color:black">무료 나눔 하기</p></a>
              </div>
            </div>    
          </div>
          <div class="col-md-4 d-flex align-self-stretch">
            <div class="media block-7 ">
              <div class="media-body p-3 mt-3">
              <span style="color:rgba(128, 156, 168, 1)"><i class="fa fa-volume-control-phone fa-5x" aria-hidden="true" style="width:100px; height:150px;"></i></span>
               <h6 class="heading mb-4">폐기물 전화 접수하기</h6>
                <p class="heading-2">010-1111-1111</p>
              </div>
            </div>    
          </div>
          
        </div>
      </div>



<jsp:include page="../footer.jsp"></jsp:include>

  <!-- loader -->
  <div id="ftco-loader" class="show fullscreen"><svg class="circular" width="48px" height="48px"><circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee"/><circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10" stroke="#F96D00"/></svg></div>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/axios/0.18.0/axios.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
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
  <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
  <script src="../js/google-map.js"></script>
  <script src="../js/main.js"></script>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <script>
  	
    
        new Vue({
            el: "#app",           
            data(){
                return {
                    info:[],
                    loading:true,
                    errored:false
                }
            },
            mounted(){
                axios
             	.get('http://127.0.0.1:7788/result/getResult')
                .then(response=>(this.info = response.data))
                .catch(error=>{
                    console.log(error);
                    this.errored = true
                })
                .finally(()=>this.loading = false),
            },
            methods:{
            	go15990903(){
            		window.open("http://www.15990903.or.kr", "_blank");

            	}
            	
            }
        })
    </script>

  </body>
</html>