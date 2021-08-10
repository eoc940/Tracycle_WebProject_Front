
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
  
  <div id="blog" class="site-header-section" >
    <div class="container">
      <div class="row">
        <div class="col-md-12">
          <h3 class="pt-5 pb-5 text-left"> 폐기할 물품의 사진을 업로드 해주세요. </h3>
        </div>
      </div>
      
      <div class="form-group">
          <label for="content" class="label-font-bold">지역 </label><br>
               <select class="selectpicker" name="selectedArea" v-model="area.areaId">
					<option v-for="sarea in areaList" :value="sarea.areaId">
					    {{sarea.areaName}}
					</option>
				</select>

       </div>
     
       <div class="form-group">
         	<h1 class="h3 mb-3 font-weight-normal">Upload any image</h1>
			<input type="file" name="file" accept="image/*" id="file_upload" ref="mainFile" v-on:change="mainFileUpload()"/>
   			<input type="button" v-on:click="submit()" value="upload" id="upload"/> 
	   </div>
		
		<!-- 이미지 컴포넌트 추가 -->
		<div id="viewer">
		<img id="img" v-if="image != ''" :src="image" style="width:50%; height:50%" >
		</div>
		
		<!-- 테이블 -->
  		<table class="table text-center pt-5 pb-5 mt-5 mb-5">
		    <thead>
		      <tr>
		        <th>Category</th>
		        <th>Standard</th>
		        <th>Price</th>
		        <th>Description</th>
		      </tr>
		    </thead>
		    <tbody class="tbody  pt-5 pb-5 mt-5 mb-5">
		      <tr v-for="info in result">
		        <td v-html="info[3]"></td>
		        <td v-html="info[1]"></td>
		        <td v-html="info[0]"></td>
		        <td v-html="info[2]"></td>
		        
		      </tr>
		    </tbody>
		 </table>
		 
	<div class="bannerContainer">
       <div class="row d-flex">
		 <!-- url -->
		 <div class="row d-flex">
          <div class="col-md-4 d-flex align-self-stretch">
            <div class="media block-7">
              <div class="media-body p-3 mt-3">
             	<span style="color:rgba(128, 156, 168, 1)"><i class="fa fa-globe fa-5x" aria-hidden="true" style="width:100px; height:150px;"></i></span>
                <h6 class="heading mb-4">폐기물 인터넷 접수 바로가기</h6>
                <p class="heading-2">{{url}}</p>
              </div>
            </div>      
          </div>
          
          <!-- 게시판 -->
          <div class="col-md-4 d-flex align-self-stretch">
            <div class="media block-7">
              <div class="media-body p-3 mt-3">
              	<a href="../board/board_form.jsp">
              	<span style="color:rgba(128, 156, 168, 1)"><i class="fa fa-heart-o fa-5x" aria-hidden="true" style="width:100px; height:150px;"></i></span>
                <h6 class="heading mb-4" style="color:black">작은 실천이 큰 힘이 됩니다</h6>
                <p class="heading-2" style="color:black">무료 나눔 하기</p></a>
              </div>
            </div>    
          </div>
		 
		 <!-- 전화번호 -->
		 <div class="col-md-4 d-flex align-self-stretch">
            <div class="media block-7 ">
              <div class="media-body p-3 mt-3">
              <span style="color:rgba(128, 156, 168, 1)"><i class="fa fa-volume-control-phone fa-5x" aria-hidden="true" style="width:100px; height:150px;"></i></span>
               <h6 class="heading mb-4">폐기물 전화 접수하기</h6>
                <p class="heading-2">{{telephone}}</p>
              </div>
            </div>    
          </div>
		
		
		
          
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
  <script src="https://cdn.bootcss.com/jquery/1.12.4/jquery.min.js"></script>
 
  <script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
  
 
  	
  <script type="text/javascript">

  
  	new Vue({
  		el: "#blog",
  		data() {
  			return {
  				areaList:[],
  				area:{},
  				mainFile:[],
  				user:{"userId":storage.getItem("login_user")},
  				result:[],
  				url:'',
  				telephone:'',
  				image:'',
  				loading:true,
				errored:false
  			}
  		},
  		mounted() {
  			
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
			.finally(()=>this.loading = false)
  		},
  		methods:{
  			mainFileUpload(){
				this.mainFile = this.$refs.mainFile.files[0];
				
				if (this.mainFile.length > 1) {
					this.mainFile = [];
					alert("메인 이미지는 1장만 가능합니다");
				}
				console.log(this.mainFile);
			},
			validation(){
				if(storage.getItem("jwt-auth-token")=="") {
					alert("로그인 해주세요");
					location.href="../user/login.jsp";
				} else if(this.area.areaId == null) {
					alert("지역을 선택해 주세요"); return false;
				} else if(this.mainFile.length == 0) {
					alert("이미지를 업로드해 주세요"); return false;
				}
				return true;
			},
			submit() {

				if(this.validation()) {
					const formData = new FormData();
					formData.append("areaId",this.area.areaId);
					formData.append("mainFile",this.mainFile);
					formData.append("userId",this.user.userId);
					for(var key of formData.entries()) {
						console.log(key[0]+', '+key[1]);
					}

					axios.post('http://127.0.0.1:8085/service', formData)
					.then(response=>{
						this.result= response.data;
						if(this.result.length > 0) {
							this.url = this.result[0][5];
							this.telephone = this.result[0][6];
						}
						this.image = "http://127.0.0.1:8085/static/result0.jpg?a=" + Math.random();
						
						console.log(this.result);
					}).catch(error=>{
						console.log(error);
						alert(error);
	                    this.errored = true;
					})
					
					
				}
			}
  		}
  	});
  
  
  </script>
   

  </body>
</html>