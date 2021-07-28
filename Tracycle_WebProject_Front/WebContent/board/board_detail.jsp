<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
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
  
  
  <div id="blog" class="site-section">
    <div class="container">
            
            <div class="row">
			    <div class="col-md-12">
				<h2 class="mb-3 mt-5">{{board.title}}</h2>
				 <h4 class="date d-block text-muted">{{board.date | formatDate}}<span :class="status_class[board.status]" v-text="status_list[board.status]"></span></h4>
                <div class="site-section">
				    <div class="container">
				      <div class="block-31 mb-5" style="position: relative;">
				          <div class="owl-carousel loop-block-31">
				            <div class="block-30 no-overlay item" style="background-image: url('../images/about1.jpg');"></div>
				            <div class="block-30 no-overlay item" style="background-image: url('../images/main2.jpg');"></div>
				            <div class="block-30 no-overlay item" style="background-image: url('../images/about2.jpg');"></div>
				            <div class="block-30 no-overlay item" style="background-image: url('../images/nature.jpg');"></div>
				          </div>
				        </div>
				    </div>
			  </div>
       
                <p>{{board.content}}</p>
                
                  <img src="images/image_10.jpg" alt="" class="img-fluid">
          

                <div class="pt-5 mt-5">
                  <h3 class="mb-5">2 Comments</h3>
                  <ul class="comment-list">
                    <li class="comment">
                      <div class="vcard bio">
                        <img src="../images/user.png" alt="Image placeholder">
                      </div>
                      <div class="comment-body">
                        <h3>Jean Doe</h3> <p><a href="#" class="reply">비밀댓글</a></p>
                        <div class="meta">January 9, 2018 at 2:21pm</div>
                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Pariatur quidem laborum necessitatibus, ipsam impedit vitae autem, eum officia, fugiat saepe enim sapiente iste iure! Quam voluptas earum impedit necessitatibus, nihil?</p>
                       
                      </div>
                    </li>

                   
                    <li class="comment">
                      <div class="vcard bio">
                        <img src="../images/user.png" alt="Image placeholder">
                      </div>
                      <div class="comment-body">
                        <h3>Jean Doe</h3>
                        <div class="meta">January 9, 2018 at 2:21pm</div>
                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Pariatur quidem laborum necessitatibus, ipsam impedit vitae autem, eum officia, fugiat saepe enim sapiente iste iure! Quam voluptas earum impedit necessitatibus, nihil?</p>
                       
                      </div>
                    </li>
                  </ul>
                  <!-- END comment-list -->
                  
                  <div class="comment-form-wrap pt-5">
                    <h3 class="mb-5">Leave a Comment</h3>
                    <form action="#" class="">
                      <div class="form-group">
                        <label for="name" class="label-font-bold">아이디</label> <a>abcd1234</a>
                      </div>

                      <div class="form-group">
                        <label for="message" class="label-font-bold">댓글 내용</label> <input type="checkbox"> 비밀글
                        <textarea name="" id="message" cols="30" rows="10" class="form-control"></textarea>
                      </div>
                      <div class="form-group text-center">
                        <input type="submit" value="Write Comment" class="btn py-3 px-4 btn-primary">
                      </div>

                    </form>
                  </div>
                </div>

              </div>
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
  <script src="../js/jquery.animateNumber.min.js"></script>
  <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
  <script src="../js/google-map.js"></script>
  <script src="../js/main.js"></script>
  <script src="../js/moment.js"></script>
  
    <script>

        new Vue({
            el: "#blog",
            data(){
                return {
                	board:[ ],
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
                    errored:false
                }
            }, 
            filters:{
            	formatDate(value){
            		if (value) {
            		    return moment(String(value)).format('MMMM DD, YYYY')
            		  }
            	}
            },
            mounted(){
                axios
             	 .get('http://127.0.0.1:7788/board/getBoard/'+${param.boardId})
                .then(response=>(this.board = response.data))
                .catch(error=>{
                    console.log(error);
                    this.errored = true
                })
                .finally(()=>this.loading = false)
            },
            methods:{
           
            },
            
            
        })
    </script>
    
  </body>
</html>