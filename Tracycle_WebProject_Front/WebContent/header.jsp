<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>

<head>
<meta http-equiv="Cache-Control"
	content="no-cache, no-store, must-revalidate" />
<meta http-equiv="Pragma" content="no-cache" />
<meta http-equiv="Expires" content="0" />
<meta charset="UTF-8">
<script src="https://cdnjs.cloudflare.com/ajax/libs/axios/0.18.0/axios.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue"></script>
<!--한글폰트 링크 -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic:wght@400;700&family=Nanum+Myeongjo:wght@400;700&family=Song+Myung&display=swap"
	rel="stylesheet">
<script src="../js/jquery.min.js"></script>
<script type="text/javascript">
    var url = window.location.pathname;
    var menu= url.split("/")[2];
    $(function() {
    	$('li a[href^="../' + menu + '"]').parent().addClass('active');
    	if(menu.includes("about")){
    		$("#header_title").text("About us");
    		$("#background_image").addClass("bg1")
    		
   		}
      	else if(menu.includes("board")){
      		$("#background_image").addClass("bg2")
      		$("#header_title").text("Share");
      	}
      	else if(menu.includes("service")){
      		$("#background_image").addClass("bg3")
      		$("#header_title").text("Service");
      	}
      	else if(menu.includes("report")){
      		$("#background_image").addClass("bg4")
      		$("#header_title").text("Report");
      	}
      	else if(menu.includes("user")){
      		$("#background_image").addClass("bg5")
      		$("#header_title").text("My page");
      	}
      	else if(menu.includes("login")){
      		$("#header_title").text("Login");
      	}
      	else{
      		$("#header_title").text("Main");
      	}
    	});
	
    </script>
</head>
<body>

	<nav class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light"
		id="ftco-navbar">
		<div class="container" id="nav">
			<a class="navbar-brand" href="../main/index.jsp"></a>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#ftco-nav" aria-controls="ftco-nav"
				aria-expanded="false" aria-label="Toggle navigation">
				<span class="oi oi-menu"></span> Menu
			</button>

			<div class="collapse navbar-collapse" id="ftco-nav">
				<a href="../main/index.jsp" class="pc-show"><h1 style="color: white;" class="pc-show">
						<img src="../images/tracycle-logo2.png" width="40%">
					</h1></a>
				<ul class="navbar-nav ml-auto">

					<li class="nav-item"><a href="../main/index.jsp"
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
					<li class="nav-item" v-if="isLogin"><a href="index.jsp" v-on:click="logout" class="nav-link">Logout</a></li>
					<li class="nav-item" v-if="isLogin"><a
						href="../user/mypage.jsp" class="nav-link">My page</a></li>

				</ul>
			</div>
		</div>
	</nav>
	<!-- END nav -->

	<div class="block-31" style="position: relative;">
		<div class="owl-carousel loop-block-31 ">
			<div class="block-30 block-30-sm item" id="background_image"
				data-stellar-background-ratio="0.5">
				<div class="container">
					<div class="col-md-3">
						<a href="../main/index.jsp"><h1 class="heading1 pt-5 mobile-show">
								<img src="../images/tracycle-logo2.png" class="logoimage-mobile">
							</h1></a>
					</div>
				</div>

				<div class="container">
					<div class="col-md-3">
						<h1 id="header_title" class="title">Report</h1>
					</div>
				</div>

			</div>
		</div>
	</div>
	</div>

</body>

<script>
const storage = window.sessionStorage;

new Vue({
    el: "#nav",           
    data(){
        return {          
        	jwtauthtoken: storage.getItem("jwt-auth-token"),
				
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
