<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<link rel="shortcut icon" type="image/x-icon" href="../favicon.ico">
<title>지구를 위한 Tracycle</title>
<script src="https://cdnjs.cloudflare.com/ajax/libs/axios/0.18.0/axios.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.min.js"></script>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!--한글폰트 링크 -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Nanum+Gothic:wght@400;700&family=Nanum+Myeongjo:wght@400;700&family=Song+Myung&display=swap"
	rel="stylesheet">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
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
<link rel="stylesheet" href="../css/flaticon.css">
<link rel="stylesheet" href="../css/icomoon.css">
<link rel="stylesheet" href="../css/fancybox.min.css">
<link rel="stylesheet" href="../css/bootstrap.css">
<link rel="stylesheet" href="../css/style.css">
<link rel="stylesheet" href="../test.css">
<!-- selectpicker -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.13.18/css/bootstrap-select.css"
	integrity="sha512-03p8fFZpOREY+YEQKSxxretkFih/D3AVX5Uw16CAaJRg14x9WOF18ZGYUnEqIpIqjxxgLlKgIB2kKIjiOD6++w=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
</head>
<body>
	<jsp:include page="../header.jsp"></jsp:include>
	<div id="blog" class="site-section">
		<div class="container">
			<div class="row">
				<div class=" col-md-12 mb-3">
					<div class="comment-form-wrap pt-5">
						<h3 class="mb-3">
							<label for="name" class="label-font-bold">제목</label> <a
								class="titleLength">[{{titleLength}}/100]</a> <input type="text"
								@input="checkTitleLength" class="form-control"
								v-model="board.title">
						</h3>
						<form action="#" class="">
							<div class="form-group right">
								<h6>
									<label for="name" class="label-font-bold">작성자 아이디</label> <a>{{userId}}</a>
								</h6>
							</div>
							<div class="form-group">
								<h6>
									<label for="content" class="label-font-bold">내용</label><a>[{{contentLength}}/1000]</a>
								</h6>
								<textarea name="" id="content" cols="30" rows="20"
									@input="checkContentLength" class="form-control"
									v-model="board.content"></textarea>
							</div>
							<div class="form-group">
								<label for="content" class="label-font-bold">지역 </label><br>
								<select class="selectpicker" name="selectedArea"
									v-model="area.areaId">
									<option v-for="sarea in areaList" :value="sarea.areaId">
										{{sarea.areaName}}</option>
								</select>
							</div>
							<div class="form-group">
								<label for="content" class="label-font-bold">카테고리</label><br>
								<select class="selectpicker" name="selectedCategory"
									v-model="category.categoryId">
									<option v-for="scategory in categoryList"
										:value="scategory.categoryId">
										{{scategory.categoryName}}</option>
								</select>
							</div>
							<div class="form-group">
								<label for="content" class="label-font-bold">나눔 상태</label><br>
								<select class="selectpicker" v-model="board.status">
									<option
										data-content="<span class='badge badge-pill badge-warning'>나눔대기</span>"
										:value=0>나눔대기</option>
									<option
										data-content="<span class='badge badge-pill badge-success'>나눔진행</span>"
										:value=1>나눔진행</option>
									<option
										data-content="<span class='badge badge-pill badge-danger'>나눔중단</span>"
										:value=2>나눔중단</option>
									<option
										data-content="<span class='badge badge-pill badge-end'>나눔완료</span>"
										:value=3>나눔완료</option>
								</select>
							</div>
							<h6>
								<label for="formFile1" class="form-label label-font-bold">대표
									이미지</label>
							</h6>
							<div class="file_input">
								<label> 파일 선택 <input type="file" id="formFile1"
									ref="mainFile" v-on:change="mainFileUpload">
								</label> <input type="text" for="formFile1" readonly="readonly"
									:value=file_name>
							</div>
							<h6>
								<label for="formFile2" class="form-label label-font-bold">이미지
									(최대 4장)</label>
							</h6>
							<div class="file_input">
								<label> 파일 선택 <input multiple="multiple" type="file"
									id="formFile2" ref="subFile" v-on:change="subFileUpload">
								</label> <input type="text" readonly="readonly" title="File Route"
									:value=subfileslength>
							</div>
							<div class="form-group text-center pt-5 pb-5">
								<input type="submit" value="Cancel"
									class="btn py-3 px-4 btn-cancel"> <input type="button"
									v-on:click="submitPost()" value="Write Post"
									class="btn py-3 px-4 btn-primary">
							</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	</div>
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
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.13.18/js/bootstrap-select.js"
		integrity="sha512-t2sE4D8vBHZoytr423dbCPmX8MUKM9bNiVKGOMpqFYEsV8/GilxvresTtCsv9RDzqGMcizOd7EuXssJUtaGZLg=="
		crossorigin="anonymous" referrerpolicy="no-referrer"></script>
	<script>
	//const storage = window.sessionStorage;
	new Vue({
		el: "#blog",
		data(){
			return {
				board:{},
				areaList:[],
				categoryList:[],
				mainFile:[],
				subFile:[],
				user:{"userId":storage.getItem("login_user")},
				area:{},
				category:{},
				titleLength:0,
				contentLength:0,
				result:'',
				loading:true,
				errored:false,
				userId:storage.getItem("login_user"),
				file_name: "파일을 선택하세요.",	
				subfileslength:"파일을 선택하세요."
			}
		},
		
		mounted(){
			axios
			.get('http://127.0.0.1:7788/board/getAllArea',{
 	  			headers : {
 	  				"jwt-auth-token":storage.getItem("jwt-auth-token")
 	  			}
 	  		})
			.then(response=>(this.areaList = response.data))
			.catch(error=>{
				alert(error);
				console.log(error);
				this.errored = true;
			})
			.finally(()=>this.loading = false),
			axios
			.get('http://127.0.0.1:7788/board/getAllCategory',{
 	  			headers : {
 	  				"jwt-auth-token":storage.getItem("jwt-auth-token")
 	  			}
 	  		})
			.then(response=>{this.categoryList = response.data;})
			.catch(error=>{
				alert(error);
				console.log(error);
				this.errored = true;
			})
			.finally(()=>this.loading = false)
		},
		
		methods:{
			checkTitleLength() {
				this.titleLength = this.board.title.length;
			},
			checkContentLength() {
				this.contentLength = this.board.content.length;
			},
			mainFileUpload(e){
				this.mainFile = this.$refs.mainFile.files[0];
				this.file_name =e.target.files[0].name;
				if (this.mainFile.length > 1) {
					this.mainFile = [];
					alert("메인 이미지는 1장만 가능합니다");
				}

				console.log(this.mainFile);
				
			},
			
			subFileUpload(){
				this.subFile = this.$refs.subFile.files;
				this.subfileslength = "선택한 파일은 "+this.subFile.length+"개 입니다.";
				if (this.subFile.length > 4) {
					this.subFile = [];
					alert("이미지는 4개 이하로 올려주세요");
					this.subfileslength = "파일을 선택하세요.";
				}
				for(var i=0; i<this.subFile.length; i++) {
					console.log(this.subFile[i])
					
				}
			},
			
			validation() {
				if(this.board.title == null || this.board.title.trim()=="") {
					alert("제목을 입력해 주세요"); return false;
				} else if(this.titleLength > 100) {
					alert("제목을 100자 이하로 입력하세요"); return false;
				} else if (this.board.content == null || this.board.content.trim()=="") {
					alert("내용을 입력해 주세요"); return false;
				} else if(this.contentLength > 1000) {
					alert("내용을 1000자 이하로 입력하세요"); return false;
				} else if (this.area.areaId == null){
					alert("지역을 선택해 주세요"); return false;
				} else if (this.category.categoryId == null) {
					alert("품목을 선택해 주세요"); return false;
				} else if (this.board.status == null) {
					alert("상태를 선택해 주세요"); return false;
				} else if (this.mainFile.length == 0) {
					alert("메인 이미지를 업로드해 주세요"); return false;
				} else if (this.subFile.length == 0) {
					alert("이미지를 업로드해 주세요"); return false;
				}
				return true;
			},
			
			submitPost(){
				var today = new Date();
				var year = today.getFullYear();
				var month = ('0' + (today.getMonth() + 1)).slice(-2);
				var day = ('0' + today.getDate()).slice(-2);
				var hours = today.getHours(); 
				var minutes = today.getMinutes(); 
				var seconds = today.getSeconds();
				var dateString = year + '-' + month  + '-' + day + ' ' + hours + ':' + minutes + ':' + seconds;
				
				if(this.validation()) {
					const formData = new FormData();
					formData.append("title",this.board.title);
					formData.append("content",this.board.content);
					formData.append("areaId",this.area.areaId);
					formData.append("categoryId",this.category.categoryId);
					formData.append("viewCount",0);
					formData.append("userId",this.userId);
					formData.append("date",dateString);
					formData.append("status",this.board.status);
					formData.append("mainFile",this.mainFile);
					for(var i=0; i<this.subFile.length; i++) {
						formData.append("file", this.subFile[i]);
					}
					for(var key of formData.entries()) {
						console.log(key[0]+', '+key[1]);
					}
					axios.post('http://127.0.0.1:7788/board/writeBoard', formData,
							{headers:{ 'Content-Type': 'multipart/form-data',
								"jwt-auth-token":storage.getItem("jwt-auth-token")}})
					.then(response=>{
						this.result= response.data
					}).catch(error=>{
						console.log(error);
	                    this.errored = true
					})
					.finally(()=>location.href="board_list.jsp")
				}
			}
		},
		
		updated: function(){
			  this.$nextTick(function(){ $('.selectpicker').selectpicker('refresh'); });
			}
	})
</script>
</body>
</html>