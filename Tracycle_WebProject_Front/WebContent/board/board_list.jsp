<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
  <head>
    <title>지구를 위한 Tracycle</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
   	<!--한글폰트 링크 -->
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic:wght@400;700&family=Nanum+Myeongjo:wght@400;700&family=Song+Myung&display=swap" rel="stylesheet">
   
    <link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Nunito:wght@300&display=swap" rel="stylesheet">
    
    <link rel="stylesheet" href="../css/open-iconic-bootstrap.min.css">
    <link rel="stylesheet" href="../css/animate.css">
    <link rel="stylesheet" href="../css/owl.carousel.min.css">
    <link rel="stylesheet" href="../css/owl.theme.default.min.css">
    <link rel="stylesheet" href="../css/magnific-popup.css">
    <link rel="stylesheet" href="../css/aos.css">
    <link rel="stylesheet" href="../css/ionicons.min.css">
    <link rel="stylesheet" href="../css/bootstrap-datepicker.css">
    <link rel="stylesheet" href="../css/jquery.timepicker.css">
    <link rel="stylesheet" href="../css/flaticon.css">
    <link rel="stylesheet" href="../css/icomoon.css">
    <link rel="stylesheet" href="../css/fancybox.min.css">

    <link rel="stylesheet" href="../css/bootstrap.css">
    <link rel="stylesheet" href="../css/style.css">
 	<script src="https://cdnjs.cloudflare.com/ajax/libs/axios/0.18.0/axios.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
  </head>
  <body>

   <jsp:include page="../header.jsp"></jsp:include>
 
  <div id="app"  class="site-section bg-light">
    <div class="container">
      

      <div class="row mt-5 mb-5">
 			<div class="col-md-12 mt-5 mb-5">
			<div class="categories">
	            <h3>Categories</h3>
	            <a href="#" @click.prevent="findByCategory(1)" >가전제품</a> |
	            <a href="#" class="main-color" @click.prevent="findByCategory(2)">주방용품</a> |
	            <a href="#" class="main-color" @click.prevent="findByCategory(3)">가구류</a> |
	            <a href="#" class="main-color" @click.prevent="findByCategory(4)">침구류</a> |
	            <a href="#" class="main-color" @click.prevent="findByCategory(5)">기타</a> 
	       </div></div>
     	 <div v-for="board in info" class="col-12 col-sm-6 col-md-6 col-lg-4 mb-4 mb-lg-0">
               <div class="post-entry">
		       		<a :href=("board_detail.jsp?boardId="+board.boardId) class="mb-3 img-wrap">
		       		
					{{board.picture}}
		       		<img v-if="board.picture==null" src="../images/non-image.png" alt="Image placeholder" class="img-fluid">
		       		<img v-else :src=("http://127.0.0.1:7788/board/getMainFile/"+board.picture) alt="Image placeholder" class="img-fluid">
		       		</a>
		       		<h3><a :href=("board_detail.jsp?boardId="+board.boardId)>{{board.title}}</a></h3>
		       		<span class="date mb-4 d-block text-muted">{{board.date | formatDate}}<span :class="status_class[board.status]" v-text="status_list[board.status]"></span></span>
		       
		       <p>{{board.content | splitContent}}</p>
		       <p><a :href=("board_detail.jsp?boardId="+board.boardId) class="link-underline main-color">Read More</a></p>
          </div>
	
		</div>

      </div>
       <div v-if="isLogin" class=" pt-5 pb-5 text-center">
			<a href="board_form.jsp" class="btn py-3 px-4 btn-primary">Write Post</a>
        </div>
        
      <nav aria-label="Page navigation example">
		  <ul class="pagination justify-content-center">
		    <li class="page-item disabled">
		      <a class="page-link" href="#" tabindex="-1" aria-disabled="true"> &laquo; </a>
		    </li>
		    <li class="page-item"><a class="page-link main-color" href="#">1</a></li>
		    <li class="page-item"><a class="page-link main-color" href="#">2</a></li>
		    <li class="page-item"><a class="page-link main-color" href="#">3</a></li>
		    <li class="page-item">
		      <a class="page-link main-color" href="#">&raquo;</a>
		    </li>
		  </ul>
		</nav>
    </div>
    
  </div> <!-- .section -->

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
  <script src="../js/jquery.animateNumber.min.js"></script>
  <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
  <script src="../js/google-map.js"></script>
  <script src="../js/main.js"></script>
  <script src="../js/moment.js"></script>
   
    <script>
    
    const storage = window.sessionStorage;
    
        new Vue({
            el: "#app",           
            data(){
                return {
                    info:[ ],
                    status_class:[
                    	"ml-2 badge badge-pill badge-warning",
                    	"ml-2 badge badge-pill badge-success",   	
                    	"ml-2 badge badge-pill badge-danger",
                    	"ml-2 badge badge-pill badge-end"
                    	],
                    status_list:[
                    	"나눔대기","나눔진행","나눔중단","나눔완료"
                    ],
                    category:"",
                    loading:true,
                    errored:false,
                    userId:storage.getItem("login_user")
                }
            },
            computed: {
                isLogin: function () {
                 	if(this.userId==null||this.userId=='')	
                 		return false;
                 	else
                 		return true;
                }
              },
            filters:{
            	formatDate(value){
            		if (value) {
            		    return moment(String(value)).format('MMMM DD, YYYY')
            		  }
            	},
            	splitContent(value){
            		if (value) {
            		    return String(value).substr(0,70) + "……"; 
            		  }
            	}
            },
            mounted(){
                axios
             	 .get('http://127.0.0.1:7788/board/getAllBoard',
             		{
     	  			headers : {
     	  				"jwt-auth-token":storage.getItem("jwt-auth-token")
     	  			}
     	  		})
                .then(response=>{this.info = response.data; console.log(this.info);})
                .catch(error=>{
                    console.log(error);
                    this.errored = true
                })
                .finally(()=>this.loading = false)
                
                
            },
            methods:{
            	findByCategory(cateNum){
            		axios
            			.get('http://127.0.0.1:7788/board/findByCategory/'+cateNum)
            			.then(response=>(this.info= response.data))
		                .catch(error=>{
		                    console.log(error);
		                    this.errored = true
		                })
            		.finally(()=>this.loading = false)
            	}
            }
            
        })
        
    </script>
  </body>
</html>