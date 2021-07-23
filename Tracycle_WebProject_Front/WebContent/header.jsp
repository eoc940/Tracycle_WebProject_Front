<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

  <head>
  <meta charset="UTF-8">
   <script src="../js/jquery.min.js"></script>
    <script type="text/javascript">
    var url = window.location.pathname;
    var menu= url.split("/")[2];
    $(function() {
    	$('li a[href^="../' + menu + '"]').parent().addClass('active');
    	if(menu.includes("about")){
    		$("#header_title").text("About us");
    		$("#background_image").addClass("bg1")
    		
   		}
      	else if(menu.includes("board")){
      		$("#background_image").addClass("bg2")
      		$("#header_title").text("Board");
      	}
      	else if(menu.includes("service")){
      		$("#background_image").addClass("bg3")
      		$("#header_title").text("Service");
      	}
      	else if(menu.includes("report")){
      		$("#background_image").addClass("bg4")
      		$("#header_title").text("Report");
      	}
      	else if(menu.includes("login")){
      		$("#header_title").text("Login");
      	}
      	else{
      		$("#header_title").text("Main");
      	}
    	});
	
    </script>
  </head>
  <body>
    
  <nav class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light" id="ftco-navbar">
    <div class="container">
     	<a class="navbar-brand" href="../main/index.jsp"></a>
      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#ftco-nav" aria-controls="ftco-nav" aria-expanded="false" aria-label="Toggle navigation">
        <span class="oi oi-menu"></span> Menu
      </button>

      <div class="collapse navbar-collapse" id="ftco-nav">
        <ul class="navbar-nav ml-auto">

          <li class="nav-item"><a href="../main/index.jsp"  class="nav-link">Home</a></li>
          <li class="nav-item"><a href="../about_us/about_us.jsp"  class="nav-link">About us</a></li>
          <li class="nav-item"><a href="../board/board_list.jsp"  class="nav-link">Board</a></li>
          <li class="nav-item"><a href="../service/service.jsp" class="nav-link">Service</a></li> 
          <li class="nav-item"><a href="../report/report.jsp"  class="nav-link">Report</a></li>
          <li class="nav-item"><a href="../login.jsp" class="nav-link">Login</a></li>

        </ul>
      </div>
    </div>
  </nav>
  <!-- END nav -->
  
  <div class="block-31" style="position: relative;">
    <div class="owl-carousel loop-block-31 ">
      <div class="block-30 block-30-sm item" id="background_image" data-stellar-background-ratio="0.5">
        <div class="container">
           <div class="col-md-3">
             <h1 class="heading1 pt-5">Tracycle</h1>
           </div>
         </div>
         
           <div class="container">
	           <div class="col-md-3">
	           		<h1 id="header_title" class="title">Report</h1>
	           </div>
	       </div>
	       
        </div>
      </div>   
    </div>
  </div>



  </body>

</html>
