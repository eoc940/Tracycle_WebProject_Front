<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
      <!-- favicon -->
    <link rel="shortcut icon" type="image/x-icon" href="../favicon.ico">
 
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
			    <div class="board-title">
					<h2 class="mb-3 mt-5">{{board.title}}</h2>
					 <div v-if="writer==userId"> <a href="#" class="board_edit" @click.prevent="deleteBoard(board.boardId)" >삭제</a><a href="board_update.jsp?boardId=${param.boardId}" class="board_edit">수정</a></div>
					<h4 class="date d-block text-muted">{{board.date | formatDate}}<span :class="status_class[board.status]" v-text="status_list[board.status]"></span></h4>
	                <h6>조회수 : {{board.viewCount}}</h6>
	                <h3 class="right d-block writer">{{writer}}</h3>
               </div>
                <div class="site-section">
				    <div class="container">
				      <div class="block-31 mb-5" style="position: relative;">
				      	<div v-for="image in images">
				       	  <img class="detail_image" alt="" :src=("http://127.0.0.1:7788/board/getFile/"+image) width="600" height="400">
				       	  </div>
				       	  <!--
				          <div v-for="image in images" class="owl-carousel loop-block-31">
				          	
				             
				          	<div><img alt="" :src=("http://127.0.0.1:7788/board/getFile/"+image)>
				          	
				          	<div class="block-30 no-overlay item" ><img alt="" :src=("http://127.0.0.1:7788/board/getFile/"+image)></div>
				          	<div class="block-30 no-overlay item" ><img alt="" :src=("http://127.0.0.1:7788/board/getFile/"+image)></div>
				          	 
				            <div class="block-30 no-overlay item" style="background-image: url('http://127.0.0.1:7788/board/getFile/46fa23ea8d48e73cfb743d623c3e6661');"></div>
				            
				            <div class="block-30 no-overlay item" style="background-image: url('../images/main2.jpg');"></div>
				            <div class="block-30 no-overlay item" style="background-image: url('../images/about2.jpg');"></div>
				            <div class="block-30 no-overlay item" style="background-image: url('../images/nature.jpg');"></div>
				              
				          </div>-->
				           
				        </div>
				    </div>
			  </div>
       
                <p class="board-content">{{board.content}}</p>
               
                <div class="pt-5 mt-5">
                  <h3 class="mb-5">Comments</h3>
                  <ul class="comment-list">
                  	<p v-if="comments.length==0">등록된 댓글이 없습니다.</p>
                    <li  v-for="cmt in comments" class="comment">
                      <div class="vcard bio">
                        <img src="../images/user.png" alt="Image placeholder">
                      </div>
                      <div v-if="editId!=cmt.commentId" class="comment-body">
                        <h3>{{cmt.user.userId}} <div v-if="userId==cmt.user.userId"> <a href="#" @click.prevent="deleteComment(cmt.commentId)" class="edit">삭제</a><a href="#" @click.prevent="openEdit(cmt)" class="edit">수정</a></div> </h3>
                         <div v-if="cmt.secret==1">
                         	<div v-if="userId==cmt.user.userId">
	                         	 <a class="reply">비밀댓글</a>
	                        	<div class="meta">{{cmt.date | formatDateComment}}</div>
	                        	<p>{{cmt.content}}</p>
                         	</div>
                         	<div v-else-if="userId==writer">
	                         	 <a class="reply">비밀댓글</a>
	                        	<div class="meta">{{cmt.date | formatDateComment}}</div>
	                        	<p>{{cmt.content}}</p>
                         	</div>
                         	<div v-else >
                         		<a class="reply">비밀댓글</a>
                         	</div>
                         </div>
                         <div v-else>
	                        <div class="meta">{{cmt.date | formatDateComment}}</div>
	                        <p>{{cmt.content}}</p>
                        </div>
                      </div>
                      
                      <div v-else class="comment-body">
	                      <form action="#" class="">
		                      <h3>{{userId}}</h3>
		                      <div class="form-group">
		                        <label for="message" class="label-font-bold">댓글 내용</label> <h6>[{{commentLength}}/500]</h6><input type="checkbox" v-model="editInfo.secret" true-value="1" false-value="0"> 비밀글
		                        <textarea name="" id="message" cols="30" rows="5" class="form-control" @onload="initCommentLength" @input="checkEditCommentLength" v-model="editInfo.content"></textarea>
		                      </div>
		                      <div class="form-group text-center">
		                        <input type="button" value="Cancel" @click="cancelComment()" class="btn py-2 px-3 btn-primary">
		                        <input type="button" value="Update" @click="updateComment()" class="btn py-2 px-3 btn-primary">
		                      </div>
	                 	   </form>
                      </div>
                    </li>

                  </ul>
                  <!-- END comment-list -->
         <div class="comment-form-wrap">
         
        <nav aria-label="Page navigation example">
		  <ul class="pagination justify-content-center">
		    <li class="page-item disabled" v-if="page.prev">
		      <a class="page-link" href="#" tabindex="-1" aria-disabled="true"> &laquo; </a>
		    </li>
		    <li v-for="index in page.endPageIndex-page.startPageIndex + 1 " :key="index" class="page-item" :class="{active:( (page.startPageIndex + index - 1) == page.currentPageIndex)}">
     		 <a href="#" class="page-link main-color"  @click.prevent="movePage(page.startPageIndex + index - 1)">{{ page.startPageIndex + index - 1 }}</a>
    		</li>
		    <li class="page-item" v-if="page.next">
		      <a class="page-link main-color" href="#">&raquo;</a>
		    </li>
		  </ul>
		</nav>
		</div>
                  <div v-if="isLogin" class="comment-form-wrap pt-5">
                  
                    <h3 class="mb-5">Leave a Comment</h3>
                    <form action="#" class="">
                      <div class="form-group">
                        <label for="name" class="label-font-bold" >아이디</label> <a>{{userId}}</a>
                      </div>

                      <div class="form-group">
                        <label for="message" class="label-font-bold">댓글 내용</label> <a class="commentLength">[{{commentLength}}/500]</a><input type="checkbox" v-model="info.secret" true-value="1" false-value="0"> 비밀글
		                <textarea name="" id="message" cols="30" rows="5" class="form-control" @input="checkCommentLength" v-model="info.content"></textarea>
                      </div>
                      <div class="form-group text-center mb-5">
		                        <input type="button" value="Write Comment" @click="submitComment()" class="btn py-3 px-4 btn-primary">
		              </div>

                    </form>
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
  <script src="../js/jquery.animateNumber.min.js"></script>
  <script src="../js/main.js"></script>
  <script src="../js/moment.js"></script>
  
    <script>
    Vue.config.devtools = true;

    //const storage = window.sessionStorage;
		Vue.config.devtools = true;
        new Vue({
            el: "#blog",
            data(){
                return {
                	board:[ ],
                	writer:"",
                	comments:[ ],
                	commentLength:0,
                	
                	images:[ ],
                    status_class:[
                    	"ml-2 badge badge-pill badge-warning",
                    	"ml-2 badge badge-pill badge-success",   	
                    	"ml-2 badge badge-pill badge-danger",
                    	"ml-2 badge badge-pill badge-end"
                    	],
                    status_list:[
                    	"나눔대기","나눔진행","나눔중단","나눔완료"
                    ],
                    loading:true,
                    errored:false,
                    info:{"secret":0,user:{"userId":storage.getItem("login_user")},board:{boardId:${param.boardId}}},
                    result:'',
                    userId:storage.getItem("login_user"),
                    editId:0,
                    editInfo:{},
                    /* pagination */
                    page:{
                    totalListItemCount: 0,//전체 게시글 갯수 
                    listRowCount: 10,//한페이지에 몇개 limit
                    pageLinkCount: 10, //<< >> 사이에 들어갈 페이지 개수 
                    currentPageIndex: 1,//현재페이지
                    pageCount: 0,//총페이지 갯수
                    startPageIndex: 0, //시작페이지 인덱스 
                    endPageIndex: 0, //끝페이지 인덱스 
                    prev: false, //<< 출력 
                    next: false //>> 출력 
                    }
                }
            },            
            filters:{
            	formatDate(value){
            		if (value) {
            		    return moment(String(value)).format('MMMM DD, YYYY')
            		  }
            	},
            	formatDateComment(value){
            		if (value) {
            		    return moment(String(value)).format('MMMM DD, YYYY h:mm a')
            		  }
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
            mounted(){

                /*  axios
             	 .get('http://127.0.0.1:7788/comment/getAllComment/'+${param.boardId})
                .then(response=>(this.comments = response.data))
                .catch(error=>{
                    console.log(error);
                    this.errored = true
                })
                .finally(()=>this.loading = false),  */
                
                offset=(this.page.currentPageIndex-1)*this.page.listRowCount;
        		axios
            	.get('http://127.0.0.1:7788/comment/getCommentLimitOffset/'+${param.boardId}+'/'+offset)
               .then(response=>{this.comments = response.data;})
               .catch(error=>{
                   console.log(error);
                   this.errored = true
               })
               .finally(()=>this.loading = false),
                
                axios
            	 .get('http://127.0.0.1:7788/board/getBoard/'+${param.boardId} +'/add', 
                 		{
     	  			headers : {
     	  				"jwt-auth-token":storage.getItem("jwt-auth-token")
     	  			}
     	  		})
               .then(response=>{this.board = response.data;
               this.writer=this.board.user.userId;
               })
               .catch(error=>{
                   console.log(error);
                   this.errored = true
               })
               .finally(()=>this.loading = false),
                
                axios
                .get('http://127.0.0.1:7788/board/getFiles/'+${param.boardId},
                	
                	{
      	  			headers : {
      	  				"jwt-auth-token":storage.getItem("jwt-auth-token")
      	  			}}
                )
                .then(response=>{this.images = response.data; console.log(this.images);})
                .catch(error=>{
                	console.log(error);
                	console.log(this.images);

                	this.errored = true
                })
                .finally(()=>this.loading = false)
                
                
            },
            methods:{
            	initCommentLength() {
            		this.commentLength = this.editInfo.content.length;
            	},
            	checkCommentLength() {
            		this.commentLength = this.info.content.length;
            	},
            	checkEditCommentLength() {
            		this.commentLength = this.editInfo.content.length;
            	},
            	validation() {
            		if(this.info.content==null||this.info.content.trim()==""){
           				alert("댓글을 입력해주세요"); return false;
            		} else if (this.commentLength > 500) {
            			alert("댓글은 500자 이하로 입력해주세요"); return false;
            		}
            		return true;
            	},
            	updateValidation() {
            		if(this.editInfo.content==null||this.editInfo.content.trim()==""){
           				alert("댓글을 입력해주세요"); return false;
            		} else if (this.commentLength > 500) {
            			alert("댓글은 500자 이하로 입력해주세요"); return false;
            		}
            		return true;
            	},
           		submitComment(){
           			if (this.validation()) {
           				var today = new Date();
        				var year = today.getFullYear();
        				var month = ('0' + (today.getMonth() + 1)).slice(-2);
        				var day = ('0' + today.getDate()).slice(-2);
        				var hours = today.getHours(); 
        				var minutes = today.getMinutes(); 
        				var seconds = today.getSeconds();
        				var dateString = year + '-' + month  + '-' + day + ' ' + hours + ':' + minutes + ':' + seconds;
    	           		axios
    	             	 .post('http://127.0.0.1:7788/comment/writeComment',
    	             	 {date:dateString,
    	             	  content:this.info.content,
    	             	  secret:this.info.secret,
    	             	  user:this.info.user,
    	             	  board:this.info.board
    	             	 },
    	             		{
    	      	  			headers : {
    	      	  				"jwt-auth-token":storage.getItem("jwt-auth-token")
    	      	  			}
    	      	  		}
    	             	 ).then(response=>(this.result= response.data))
    	                .catch(error=>{
    	                    console.log(error);
    	                    this.errored = true
    	                })
    	                .finally(()=>location.href="board_detail.jsp?boardId="+${param.boardId})
           			}
           			 
          	 	},
           		deleteComment(commentId){
          	 		if(confirm("댓글을 삭제 하시겠습니까?")){
	           		axios
	             	 .delete('http://127.0.0.1:7788/comment/deleteComment/'+commentId,
	                  		{
	      	  			headers : {
	      	  				"jwt-auth-token":storage.getItem("jwt-auth-token")
	      	  			}
	      	  		})
	             	 .then(response=>(this.result= response.data))
	                 .catch(error=>{
	                     console.log(error);
	                     this.errored = true
	                 })
	           		.finally(()=>location.href="board_detail.jsp?boardId="+${param.boardId})
          	 	}},
           		deleteBoard(boardId){
          	 		if(confirm("게시글을 삭제 하시겠습니까?")){
	           		axios
	             	 .delete('http://127.0.0.1:7788/board/deleteBoard/'+boardId,
	                  		{
	      	  			headers : {
	      	  				"jwt-auth-token":storage.getItem("jwt-auth-token")
	      	  			}
	      	  		})
	             	 .then(response=>(this.result= response.data))
	                 .catch(error=>{
	                     console.log(error);
	                     this.errored = true
	                 })
	           		.finally(()=>location.href="board_list.jsp")
          	 	}},
           		openEdit(cmt){
          	 	this.editId=cmt.commentId;
        		this.editInfo=cmt;
        		this.commentLength=cmt.content.length;
        		
          	 	},
          	 	cancelComment(){
          	 	this.editId=0;
        		this.editInfo={};
          	 	},
          	 	updateComment(){
          	 		if (this.updateValidation()) {
          	 			if(confirm("댓글을 수정 하시겠습니까?")){
              	 			var today = new Date();
            				var year = today.getFullYear();
            				var month = ('0' + (today.getMonth() + 1)).slice(-2);
            				var day = ('0' + today.getDate()).slice(-2);
            				var hours = today.getHours(); 
            				var minutes = today.getMinutes(); 
            				var seconds = today.getSeconds();
            				var dateString = year + '-' + month  + '-' + day + ' ' + hours + ':' + minutes + ':' + seconds;
        	           		axios
        	             	 .put('http://127.0.0.1:7788/comment/updateComment',
        	             	 {date:dateString,
        	             	  commentId:this.editId,
        	             	  content:this.editInfo.content,
        	             	  secret:this.editInfo.secret,
        	             	  user:this.editInfo.user,
        	             	  board:this.editInfo.board
        	             	 },
        	             		{
        	      	  			headers : {
        	      	  				"jwt-auth-token":storage.getItem("jwt-auth-token")
        	      	  			}
        	      	  		}
        	             	 ).then(response=>(this.result= response.data))
        	                .catch(error=>{
        	                    console.log(error);
        	                    this.errored = true
        	                })
        	                .finally(()=>location.href="board_detail.jsp?boardId="+${param.boardId}) 
              	 		
              	 		}
          	 		}
          	 		

            },
            getComment(){
            	offset=(this.page.currentPageIndex-1)*this.page.listRowCount;
        		axios
            	.get('http://127.0.0.1:7788/comment/getCommentLimitOffset/'+${param.boardId}+'/'+offset)
               .then(response=>{this.comments = response.data;})
               .catch(error=>{
                   console.log(error);
                   this.errored = true
               })
               .finally(()=>this.loading = false)
        	},
            initPagination(){
        		axios
        		.get('http://127.0.0.1:7788/comment/getCommentTotalCount/'+${param.boardId})
        			.then(response=>{this.page.totalListItemCount= response.data;
        			 this.initUI();
        			 })
	                .catch(error=>{
	                    console.log(error);
	                    this.errored = true
	                })
        		.finally(()=>this.loading = false)
        	},
            initUI(){

      	      this.page.pageCount = Math.ceil(this.page.totalListItemCount/this.page.listRowCount);

      	      if( (this.page.currentPageIndex % this.page.pageLinkCount) == 0 ){
      	        this.page.startPageIndex = ((this.page.currentPageIndex / this.page.pageLinkCount)-1)*this.page.pageLinkCount + 1
      	      }else{
      	        this.page.startPageIndex = Math.floor(this.page.currentPageIndex / this.page.pageLinkCount)*this.page.pageLinkCount + 1
      	      }

      	      if( (this.page.currentPageIndex % this.page.pageLinkCount) == 0 ){ //10, 20...맨마지막
      	        this.page.endPageIndex = ((this.page.currentPageIndex / this.page.pageLinkCount)-1)*this.page.pageLinkCount + this.page.pageLinkCount
      	      }else{
      	        this.page.endPageIndex =  Math.floor(this.page.currentPageIndex / this.page.pageLinkCount)*this.page.pageLinkCount + this.page.pageLinkCount;
      	      }

      	      if(this.page.endPageIndex > this.page.pageCount){
      	        this.page.endPageIndex = this.page.pageCount
      	      }

      	      if( this.page.currentPageIndex <= this.page.pageLinkCount ){
      	        this.page.prev = false;
      	      }else{
      	        this.page.prev = true;
      	      }

      	      if(this.page.endPageIndex >= this.page.pageCount){
      	        this.page.endPageIndex = this.page.pageCount;
      	        this.page.next = false;
      	      }else{
      	        this.page.next = true;
      	      }
      	    },
      	    movePage(param) {
      	       this.page.currentPageIndex = param;
      	       this.getComment();
      	    }
          },
          
          created() {
              this.initPagination();
              this.getComment();
          }

        })
    </script>
    
  </body>
</html>