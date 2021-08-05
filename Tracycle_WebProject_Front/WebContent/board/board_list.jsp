<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
  <head>
    <title>지구를 위한 Tracycle</title>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/axios/0.18.0/axios.js"></script>
  	<script src="https://cdn.jsdelivr.net/npm/vue"></script>
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
	       <div class="serachbar">	       			       		
	       		<form action="id" method="get">
	       			<select name = "searchField" id = "searchField" v-model="selected" @change="selectedOk">	
	       			    <option value = "search-id">전체</option> 				
	       				<option value = "search-id">아이디</option>
	       				<option value = "search-title">제목</option>
	       				<option value = "search-content">내용</option>
	       				<option value = "search-category">카테고리</option>
	       				<option value = "search-area">지역</option>
	       			</select>
	       		
		       		<select name="category" v-model="category" v-if="useOptional=='categoryOptional'" @change="findByCategory">
						<option v-for="category in categoryInfo" :value="category.categoryId" >
							{{category.categoryId}}:{{category.categoryName}}
						</option>
					</select>
					
					<select name="area" v-model="areaNum" v-else-if="useOptional=='areaOptional'"  @change="findByAreaInMethods">
						<option v-for="area in areaInfo" :value="area.areaId">
							{{area.areaId}}:{{area.areaName}}
						</option>
					</select>
					
						<input type = "text" id="searchText" name ="searchText" v-if="useOptional=='notOptional'" placeholder="검색어를 입력하세요"  v-model="keyword">
		       			<input type = "button"  v-if="selected=='search-id'" value="검색"  @click="findById">
		       			<input type = "button"  v-if="selected=='search-title'" value="검색"  @click="findByTitle">
		       			<input type = "button"  v-if="selected=='search-content'" value="검색"  @click="findByContent">    		
		       	</form>
	       </div>
	    </div>
     	<div v-for="board in info" class="col-12 col-sm-6 col-md-6 col-lg-4 mb-4 mb-lg-0">
        	<div class="post-entry">
		    	<a :href=("board_detail.jsp?boardId="+board.boardId) class="mb-3 img-wrap">
		       	<img class="list_image img-fluid" v-if="board.picture==null" src="../images/non-image.png" alt="Image placeholder">
		       	<img class="list_image img-fluid" v-else :src=("http://127.0.0.1:7788/board/getFile/"+board.picture) alt="Image placeholder">
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
		    <li class="page-item disabled" v-if="prev">
		      <a class="page-link" href="#" tabindex="-1" aria-disabled="true"> &laquo; </a>
		    </li>
		    <!-- <li class="page-item"><a class="page-link main-color" href="#">1</a></li>   -->
		    <li v-for="index in endPageIndex-startPageIndex + 1 " :key="index" class="page-item" :class="{active:( (startPageIndex + index - 1) == currentPageIndex)}">
     		 <a href="#" class="page-link main-color"  @click.prevent="movePage(startPageIndex + index - 1)">{{ startPageIndex + index - 1 }}</a>
    		</li>
		    <li class="page-item" v-if="next">
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

    Vue.config.devtools = true;

        new Vue({
            el: "#app",           
            data(){
                return {
                    info:[ ],
                    areaInfo:[ ],
                    categoryInfo:[],
                    selected:'',
                    useOptional:'notOptional',
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
                    areaNum:"",
                    loading:true,
                    errored:false,
                    userId:storage.getItem("login_user"),                   
                    keyword:'',
                    /* pagination */
                    totalListItemCount: 0,//전체 게시글 갯수 
                    listRowCount: 6,//한페이지에 몇개 limit
                    pageLinkCount: 10, //<< >> 사이에 들어갈 페이지 개수 
                    currentPageIndex: 1,//현재페이지
                    pageCount: 0,//총페이지 갯수
                    startPageIndex: 0, //시작페이지 인덱스 
                    endPageIndex: 0, //끝페이지 인덱스 
                    prev: false, //<< 출력 
                    next: false //>> 출력 

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

            	offset=(this.currentPageIndex-1)*this.listRowCount;
        		axios
            	.get('http://127.0.0.1:7788/board/getBoardLimitOffset/'+offset)
               .then(response=>{this.info = response.data;})
               .catch(error=>{
                   console.log(error);
                   this.errored = true
               })
               .finally(()=>this.loading = false),
                
                axios
             	 .get('http://127.0.0.1:7788/board/getAllArea')
                 .then(response=>(this.areaInfo = response.data))
                 .catch(error=>{
                    console.log(error);
                    this.errored = true
                })
                 .finally(()=>this.loading = false),
                 
                 
                axios
                 .get('http://127.0.0.1:7788/board/getAllCategory')
                 .then(response=>(this.categoryInfo = response.data))
                 .catch(error=>{
                    console.log(error);
                    this.errored = true
                })
                 .finally(()=>this.loading = false)

            },
            methods:{
            	findByCategory(category){
            		axios
        			.get('http://127.0.0.1:7788/board/findByCategory/'+this.category)
        			.then(response=>(this.info= response.data))
	                .catch(error=>{
	                    console.log(error);
	                    this.errored = true
	                })
        		.finally(()=>this.loading = false)
            	},
            	
            	getBoard(){
            		offset=(this.currentPageIndex-1)*this.listRowCount;
            		axios
                	.get('http://127.0.0.1:7788/board/getBoardLimitOffset/'+offset)
                   .then(response=>{this.info = response.data;})
                   .catch(error=>{
                       console.log(error);
                       this.errored = true
                   })
                   .finally(()=>this.loading = false)
            	},

            	findById(keyword){
            		axios
        			.get('http://127.0.0.1:7788/board/findById/'+this.keyword)
        			.then(response=>(this.info= response.data))
	                .catch(error=>{
	                    console.log(error);
	                    this.errored = true
	                })
        		.finally(()=>this.loading = false)
            	},
            	
            	findByTitle(keyword){
            		axios
        			.get('http://127.0.0.1:7788/board/findByTitle/'+this.keyword)
        			.then(response=>(this.info= response.data))
	                .catch(error=>{
	                    console.log(error);
	                    this.errored = true
	                })
        		.finally(()=>this.loading = false)
            	},
            	
            	findByContent(keyword){
            		axios
        			.get('http://127.0.0.1:7788/board/findByContent/'+this.keyword)
        			.then(response=>(this.info= response.data))
	                .catch(error=>{
	                    console.log(error);
	                    this.errored = true
	                })
        		.finally(()=>this.loading = false)
            	},
            	
            	selectedOk(){
            		if(this.selected=="search-area")
            			this.useOptional = "areaOptional"
            		else if(this.selected=="search-category") 
            			this.useOptional = "categoryOptional"           		       		
            		else
            			this.useOptional = "notOptional"
            	},
           	
            	/*keywordSearch(){           		
            		if(this.selected=="search-id")
            			this.findById();
            		else if(this.selected=="search-title") 
            			this.findByTitle();           		       		
            		else if(this.selected=="search-content")
            			this.findByContent();
            	},*/
            	
            	/* pagination */
            	
            	initPagination(){
            		axios
            		.get('http://127.0.0.1:7788/board/getBoardTotalCount')
            			.then(response=>{this.totalListItemCount= response.data;
            			 this.initUI();
            			 })
		                .catch(error=>{
		                    console.log(error);
		                    this.errored = true
		                })
            		.finally(()=>this.loading = false)
            	},

            	findByAreaInMethods(areaNum){
            		axios
            			.get('http://127.0.0.1:7788/board/findByArea/'+this.areaNum)
            			.then(response=>(this.info= response.data))
            			.catch(error=>{
            				console.log(error);
            				this.errored = true
            			})
            		.finally(()=>this.loading = false)
            	},      	

                initUI(){

            	      this.pageCount = Math.ceil(this.totalListItemCount/this.listRowCount);

            	      if( (this.currentPageIndex % this.pageLinkCount) == 0 ){
            	        this.startPageIndex = ((this.currentPageIndex / this.pageLinkCount)-1)*this.pageLinkCount + 1
            	      }else{
            	        this.startPageIndex = Math.floor(this.currentPageIndex / this.pageLinkCount)*this.pageLinkCount + 1
            	      }

            	      if( (this.currentPageIndex % this.pageLinkCount) == 0 ){ //10, 20...맨마지막
            	        this.endPageIndex = ((this.currentPageIndex / this.pageLinkCount)-1)*this.pageLinkCount + this.pageLinkCount
            	      }else{
            	        this.endPageIndex =  Math.floor(this.currentPageIndex / this.pageLinkCount)*this.pageLinkCount + this.pageLinkCount;
            	      }

            	      if(this.endPageIndex > this.pageCount){
            	        this.endPageIndex = this.pageCount
            	      }

            	      if( this.currentPageIndex <= this.pageLinkCount ){
            	        this.prev = false;
            	      }else{
            	        this.prev = true;
            	      }

            	      if(this.endPageIndex >= this.pageCount){
            	        this.endPageIndex = this.pageCount;
            	        this.next = false;
            	      }else{
            	        this.next = true;
            	      }
            	    },
            	    movePage(param) {
            	       this.currentPageIndex = param;
            	       this.getBoard();
            	    },            	
                	findByArea(areaNum){
                		axios
                			.get('http://127.0.0.1:7788/board/findByArea/'+this.areaNum)
                			.then(response=>(this.info= response.data))
                			.catch(error=>{
                				console.log(error);
                				this.errored = true
                			})
                		.finally(()=>this.loading = false)
                	}
            }, 
            created() {
                this.initPagination();
                this.getBoard();

                
            }
        })
        
    </script>
  </body>
</html>