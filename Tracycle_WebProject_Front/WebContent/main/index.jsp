<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<head>

<meta charset="UTF-8">
<link rel="shortcut icon" type="image/x-icon" href="../favicon.ico">
<title>지구를 위한 Tracycle</title>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/axios/0.18.0/axios.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue"></script>
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!--한글폰트 링크 -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Nanum+Gothic:wght@400;700&family=Nanum+Myeongjo:wght@400;700&family=Song+Myung&display=swap"
	rel="stylesheet">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link
	href="https://fonts.googleapis.com/css2?family=Nunito:wght@300&display=swap"
	rel="stylesheet">
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

	<nav class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light" id="ftco-navbar">
		<div class="container" id="app">
			<a class="navbar-brand" href="index.html"></a>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#ftco-nav" aria-controls="ftco-nav"
				aria-expanded="false" aria-label="Toggle navigation">
				<span class="oi oi-menu"></span> Menu
			</button>

			<div class="collapse navbar-collapse" id="ftco-nav">
				<ul class="navbar-nav ml-auto">
					<li class="nav-item active"><a href="../main/index.jsp"
						class="nav-link">Home</a></li>
					<li class="nav-item"><a href="../about_us/about_us.jsp"
						class="nav-link">About us</a></li>
					<li class="nav-item"><a href="../board/board_list.jsp"
						class="nav-link">Share</a></li>
					<li class="nav-item"><a href="../service/service_form.jsp"
						class="nav-link">Service</a></li>
					<li class="nav-item"><a href="../report/report.jsp"
						class="nav-link">Report</a></li>
					<li class="nav-item" v-if="!isLogin"><a
						href="../user/login.jsp" class="nav-link">Login</a></li>
					<li class="nav-item" v-if="isLogin"><a href="index.jsp"
						v-on:click="logout" class="nav-link">Logout</a></li>
					<li class="nav-item" v-if="isLogin"><a
						href="../user/mypage.jsp" class="nav-link">My page</a></li>
				</ul>
			</div>
		</div>
	</nav>

	<div class="block-31" style="position: relative;">
		<div class="owl-carousel loop-block-31 ">
			<div class="block-30 block-30-sm item"
				style="background-image: url('../images/main3.jpg');"
				data-stellar-background-ratio="0.5">
				<div class="container">
					<div
						class="row align-items-center justify-content-center text-center">
						<div class="col-md-7">
							<h1 class="heading mb-5">
								<img src="../images/tracycle-logo2.png" width="30%">
							</h1>
							<button class="align-self-center main-btn1"
								onClick="location.href='../service/service_form.jsp'">Our Service</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div class="site-section section-counter">
		<div class="container">
			<div class="row">
				<div class="col-md-6 pr-5">
					<div class="block-48">
						<h1>${userSession.userId}</h1>
						<span class="block-48-text-1">19년도 총 폐기물 발생량</span>
						<div class="block-48-counter ftco-number" data-number="497238">0</div>
						<span class="block-48-text-1 mb-4 d-block"> 전년(446,102톤/일)
							대비 약 11.5% 증가</span>
						<p class="mb-0">
							<a href="../report/report.jsp" class="btn btn-white px-3 py-2">View Our Report</a>
						</p>
					</div>
				</div>
				<div class="col-md-6 welcome-text">
					<h2 class="display-4 mb-3">매년 세계는</h2>
					<p class="lead">20억 톤 이상의 쓰레기를 생성 합니다. 세계적 대유행을 배경으로 해도 사고팔고
						물건이 쓰이고 버려지는 일이 많습니다. 사람들은 자신이 버린 물건에 대해 사용을 마치면 존재하지 않는 것처럼 잊어버리는
						경향이 있습니다. 그러나 물질적 재화는 그냥 사라지는 것이 아니라 환경적 영향이 남아 있습니다.</p>
					<p class="mb-4">Every year, the world generates more than two
						billion tonnes of trash. Even against the backdrop of a global
						pandemic, there is much being bought and sold, things are used and
						discarded.</p>
					<p class="mb-0">
						<a href="../about_us/about_us.jsp" class="btn btn-primary px-3 py-2"
							style="margin: auto;">About us</a>
					</p>
				</div>
			</div>
		</div>
	</div>

	<div class="site-section border-top mb-5">
		<div class="container">
			<div class="row">

				<div class="col-md-12">
					<div id="yt-container">
						<div id="ytplayer"></div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- .site-section -->

	<script>

  var tag = document.createElement('script');
  tag.src = "https://www.youtube.com/player_api";
  var firstScriptTag = document.getElementsByTagName('script')[0];
  firstScriptTag.parentNode.insertBefore(tag, firstScriptTag);
  var player;
  function onYouTubePlayerAPIReady() { 
	  new YT.Player('ytplayer', {
		 width : "100%", 
		  height : "100%",  
	    videoId: 'ZnT8UHfifcA', 
	    playerVars: {
	      autoplay: true, 
	      loop: true, 
	      list: 'PLoFiRoBwe7Y8V845_MBGQ30JbXDF8169m' 
	    },
	    events: {
	      onReady: function (event) {
	        event.target.mute(false) // 음소거!
	      }
	    }
	  })
  }
</script>
	<jsp:include page="../footer.jsp"></jsp:include>
	<!-- loader -->
	<div id="ftco-loader" class="show fullscreen">
		<svg class="circular" width="48px" height="48px">
			<circle class="path-bg" cx="24" cy="24" r="22" fill="none"
				stroke-width="4" stroke="#eeeeee" />
			<circle class="path" cx="24" cy="24" r="22" fill="none"
				stroke-width="4" stroke-miterlimit="10" stroke="#F96D00" /></svg>
	</div>

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
	<script>
const storage = window.sessionStorage;

new Vue({
    el: "#app",           
    data(){
        return {          
  				jwtauthtoken:storage.getItem("jwt-auth-token")
        }
    }, 
     
    methods:{
    	logout:function(e) {
    		if(confirm("로그아웃 하시겠습니까?")){
    			storage.setItem("jwt-auth-token", "");
    			this.jwtauthtoken=storage.getItem("jwt-auth-token");
          		storage.setItem("login_user", "");
    	  		this.message = "로그인해주세요";
    	  		this.setInfo("로그아웃 성공", "", "");
    	  		location.href="index.jsp";
    		}else{
    			e.preventDefault();
    		}

	  	}

    },
    
    computed: {
        isLogin: function () {
         	if(this.jwtauthtoken==null||this.jwtauthtoken=='')	
         		return false;
         	else
         		return true;
        }
      }

});

</script>
</body>
</html>