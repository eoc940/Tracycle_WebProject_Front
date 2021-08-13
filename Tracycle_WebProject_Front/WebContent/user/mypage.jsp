<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
  <head>
  <meta charset="UTF-8">
      <!-- favicon -->
    <link rel="shortcut icon" type="image/x-icon" href="../favicon.ico">
 
     <title>지구를 위한 Tracycle</title>
     <script src="https://cdnjs.cloudflare.com/ajax/libs/axios/0.18.0/axios.js"></script>
  	<script src="https://cdn.jsdelivr.net/npm/vue"></script>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Nunito:wght@300&display=swap" rel="stylesheet">
  <!--한글폰트 링크 -->
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic:wght@400;700&family=Nanum+Myeongjo:wght@400;700&family=Song+Myung&display=swap" rel="stylesheet">
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
  <div class="site-section section-counter" id="app">
    <div class="container">
      <div class="row">
        <div class="col-sm-4">
              <span class="mypage_id">ID : {{userId}} <p></p></span>
              <p class="mb-0 modifyUser"><a href="user_update.jsp" class="btn btn-primary px-3 py-2">정보 수정</a></p>
              <p class="mb-0 deleteUser"><a href="user_delete.jsp" class="btn btn-primary px-3 py-2 ">회원 탈퇴</a></p>
        </div>
        <div class="col-sm-8">
          <div class="post" >
          	<h2 class="display-4 mb-3">My Posting</h2>
          	<div class="mycontent"  v-for="board in info">
          		<a :href=("../board/board_detail.jsp?boardId="+board.boardId) class="">
          		<h4>{{board.title}}</h4>
          		<p>{{board.content}}</p>
          		</a>
          	</div>
          </div>
          <div class="comment">
          	<h2 class="display-4 mb-3">My Comment</h2>
          	<div class="mycontent" v-for="comment in commentinfo">
          		<a :href=("../board/board_detail.jsp?boardId="+comment.board.boardId) class="">
          		
				<h4>{{comment.board.title}}</h4>
				<p>{{comment.content}}</p>
          		</a>
          	</div>
          </div>
        </div>
      </div>
    </div>
  </div>
<jsp:include page="../footer.jsp"></jsp:include>
  <!-- loader -->
  <div id="ftco-loader" class="show fullscreen"><svg class="circular" width="48px" height="48px"><circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee"/><circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10" stroke="#F96D00"/></svg></div>
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
  <script src="../js/main.js"></script>
  <script>
 //const storage = window.sessionStorage;
  
  	new Vue({
  		el:"#app",
  		data() {
  			return {  
  				userId: storage.getItem("login_user"),
  				jwtauthtoken: storage.getItem("jwt-auth-token"),
  				info:[ ],
  				commentinfo:[ ]
  			}
  		},
  		mounted(userId){
            axios
            .get('http://127.0.0.1:7788/board/findById/'+this.userId,
                    {
              	   headers : {
              	  		"jwt-auth-token":storage.getItem("jwt-auth-token")
              	   }
              	})
            .then(response=>(this.info = response.data))
            .catch(error=>{
                console.log(error);
                this.errored = true
            })
            .finally(()=>this.loading = false)
            
            
            axios
            .get('http://127.0.0.1:7788/comment/findCommentById/'+this.userId,
                    {
              	   headers : {
              	  		"jwt-auth-token":storage.getItem("jwt-auth-token")
              	   }
              	})
            .then(response=>(this.commentinfo = response.data))
            .catch(error=>{
                console.log(error);
                this.errored = true
            })
            .finally(()=>this.loading = false) 
        }

  	});
  </script>
  </body>
</html>