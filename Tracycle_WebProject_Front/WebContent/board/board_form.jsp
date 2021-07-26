<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
  <title>Tracycle</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
   
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

  </head>
  <body>

   <jsp:include page="../header.jsp"></jsp:include>
  
  
  <div id="blog" class="site-section">
    <div class="container">
            
            <div class="row">
            <div class=" col-md-12 mb-3">
		           <div class="comment-form-wrap pt-5">
                    <h3 class="mb-3">  <label for="name" class="label-font-bold">제목</label> <input type="text" class="form-control" ></h3>
                    <form action="#" class="">
                      <div class="form-group right">
                        <label for="name" class="label-font-bold">작성자 아이디</label> <a>abcd1234</a>
                      </div>
                      <div class="form-group">
                        <label for="content" class="label-font-bold">내용</label>
                        <textarea name="" id="content" cols="30" rows="20" class="form-control"></textarea>
                      </div>
                
					<div class="form-group">
					  <label for="formFile" class="form-label label-font-bold">대표 이미지</label>
					  <input class="form-control" type="file" id="formFile">
					</div>
					<div class="form-group">
					  <label for="formFile" class="form-label label-font-bold">이미지 (최대 4장)</label>
					  <input class="form-control" multiple="multiple" type="file" id="formFile">
					</div>
					
					<div class="form-group">
                        <label for="content" class="label-font-bold">나눔 상태</label><br>
						    <select class="selectpicker">
 							   <option data-content="<span class='badge badge-pill badge-warning'>나눔대기</span>">나눔대기</option>
 							   <option data-content="<span class='badge badge-pill badge-success'>나눔진행</span>">나눔진행</option>
 							   <option data-content="<span class='badge badge-pill badge-danger'>나눔중단</span>">나눔대기</option>
 							   <option data-content="<span class='badge badge-pill badge-end'>나눔완료</span>">나눔완료 </option>
  							</select>
                      </div>
                      
					 <!-- 작성시 게시글 작성 버튼 -->
					  <div class="form-group text-center pt-5 pb-5">
					  	<input type="submit" value="Cancel" class="btn py-3 px-4 btn-cancel">	
                        <input type="submit" value="Write Post" class="btn py-3 px-4 btn-primary">
                      </div>
                      <!-- 수정시 게시글 수정 버튼 -->
					  <!-- <div class="form-group text-center pt-5 pb-5">
                        <input type="submit" value="Cancel" class="btn py-3 px-4 btn-cancel">
                        <input type="submit" value="Update Post" class="btn py-3 px-4 btn-primary">
                      </div> -->
                    </form>
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
  <script src="../js/main.js"></script>\
  
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.13.18/js/bootstrap-select.min.js" integrity="sha512-yDlE7vpGDP7o2eftkCiPZ+yuUyEcaBwoJoIhdXv71KZWugFqEphIS3PU60lEkFaz8RxaVsMpSvQxMBaKVwA5xg==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.13.18/css/bootstrap-select.min.css" integrity="sha512-ARJR74swou2y0Q2V9k0GbzQ/5vJ2RBSoCWokg4zkfM29Fb3vZEQyv0iWBMW/yvKgyHSR/7D64pFMmU8nYmbRkg==" crossorigin="anonymous" referrerpolicy="no-referrer" />


</body>
</html>