<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

  <head>
  <meta charset="UTF-8">
   <script src="../js/jquery.min.js"></script>
    <script type="text/javascript">
    var url = window.location.pathname;
    	if(url.includes("about")){
    		$('[name="about"]').addClass('active');
    	}
    	else if(url.includes("board")){
    		console.log(url);
    		console.log($('[name="board"]').attr('name'));
    		$('[name="board"]').addClass('active');
    	}
    	else if(url.includes("service")){
    		$('[name="service"]').addClass('active');
    	}
    	else if(url.includes("report")){
    		$('[name="report"]').addClass('active');
    	}
    	else if(url.includes("login")){
    		$('[name="login"]').addClass('active');
    	}
    	else{
    		$('[name="index"]').addClass('active');
    	}
    </script>
  </head>
  <body>
    
  <nav class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light" id="ftco-navbar">
    <div class="container">
      <a class="navbar-brand" href="index.html"></a>
      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#ftco-nav" aria-controls="ftco-nav" aria-expanded="false" aria-label="Toggle navigation">
        <span class="oi oi-menu"></span> Menu
      </button>

      <div class="collapse navbar-collapse" id="ftco-nav">
        <ul class="navbar-nav ml-auto">

          <li class="nav-item"><a href="../main/index.jsp" name="index" class="nav-link">Home</a></li>
          <li class="nav-item"><a href="about.html" name="about" class="nav-link">About us</a></li>
          <li class="nav-item"><a href="../board/board_list.jsp" name="board" class="nav-link">Board</a></li>
          <li class="nav-item"><a href="../service/service.jsp" name="service" class="nav-link">Service</a></li> 
          <li class="nav-item"><a href="../report/report.jsp" name="report" class="nav-link">Report</a></li>
          <li class="nav-item"><a href="login.jsp" name="login" class="nav-link">Login</a></li>

        </ul>
      </div>
    </div>
  </nav>
  <!-- END nav -->
  
  <div class="block-31" style="position: relative;">
    <div class="owl-carousel loop-block-31 ">
      <div class="block-30 block-30-sm item" style="background-image: url('../images/header1.jpg');" data-stellar-background-ratio="0.5">
        <div class="container">
           <div class="col-md-2">
              <h1 class="heading1 pt-5">Tracycle</h1>
           </div>
         </div>
         
           <div class="container">
	           <div class="col-md-2">
	           		<h1 class="title">Report</h1>
	           </div>
	       </div>
	       
        </div>
      </div>   
    </div>
  </div>



  </body>

</html>
