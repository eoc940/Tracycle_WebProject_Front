
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
  
  <div class="site-header-section" >
    <div class="container">
      <div class="row">
        <div class="col-md-12">
          <h3 class="pt-5 pb-5 text-left"> 폐기할 물품의 사진을 업로드 해주세요. </h3>
        </div>
      </div>
      
      
   <!--   <div class ="row" id="app">
      	<select name="area">
 				<option v-for="area in info" :value="area.area_name">
 				{{area.area_name}}
 				</option>
  		</select>
      </div> -->
      
      	<div class="form-group">
    		<select class="selectpicker mb-5 rounded float-right ml-1" style="width: 250px; height:40px;" >
    		   <option>지역구를 선택해주세요</option>
			   <option>강남구</option>
	      		<option>강동구</option>
	      		<option>강북구</option>
	      		<option>강서구</option>
	      		<option>관악구</option>
	      		<option>광진구</option>
	      		<option>구로구</option>
	      		<option></option>
	      		<option></option>
	      		<option></option>
	      		<option></option>
	      		<option></option>
	      		<option></option>
	      		<option></option>
	      		<option></option>
	      		<option></option>
	      		<option></option>
	      		<option></option>
	      		<option></option>
	      		<option></option>
	      		<option></option>
	      		<option></option>
	      		<option></option>
	      		<option></option>
	      		<option></option>
	      		<option></option>
	      		<option></option>
	      	</select>
          </div>
          
          	<div class="form-group">
          		<h1 class="h3 mb-3 font-weight-normal">Upload any image</h1>
				<input type="file" name="file" id="file_upload"/>
    			<input type="button" value="upload image" id="upload"/> 
    			
			</div>
			
			 <button onclick="onDisplay()">UPLOAD</button>
          
 	</div>
 </div>
  <div class="site-section-img">
	  <div class="container mt-5 mb-5">
	      <div class="row">
	      	<div id="noneDiv" style="display:none;">
	        	<img src=http://localhost:8085/static/result0.jpg style="width: 600px; height:auto;">
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
  	
 	<script>
/*       new Vue({
            el: "#app",           
            data(){
                return {
                    info:[ ],
                    loading:true,
                    errored:false,
                   
   */
   
   function onDisplay() {
	    $('#noneDiv').show();
	}
         
      </script>
      
<script type="text/javascript">
    $(function() { 
        function ajaxFileUpload(){
            var formData = new FormData();
            formData.append('file',$("#file_upload")[0].files[0]);    //Convert the file into binary form
            $.ajax({
                type:"post",
                url:"http://127.0.0.1：8085/",//Background interface
                async:false,
                contentType: false,    //This must be written
                processData: false, //This must also be written, otherwise an error will be reported
                data:formData,
                dataType:'text',    //Return type, including json, text, HTML. There is no jsonp format here
                success:function(data){
                    console.log(data);
                },
                error:function(XMLHttpRequest, textStatus, errorThrown, data){
                    console.log(errorThrown);
                }            
            });
        }
    

    $("#upload").click(function(){
        ajaxFileUpload();
    });

});
</script>
  </body>
</html>