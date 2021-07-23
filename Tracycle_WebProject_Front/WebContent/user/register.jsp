<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Register</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no">
    <link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Nunito:wght@200;300;600&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="../css/member-style.css"> <!--폰트 및 기본 css -->
   
</head>

<body>

	<div class="site-section section-counter" >
    	<div class="container">
      		<div class="row mb-5">
      			
				<form action="register" class="register-form" method="post">
					<section class="ftco-section">
						<h3 class="header"><b>REGISTER</b></h3>
						
						<input type="text" name="text" class="form-control-id" placeholder="UserID" required >
						<button class="idcheck-btn">ID check</button></br>
						<input type="text" name="nickname" class="form-control" placeholder="Nickname" required ></br>
						<input id="password" type="password" class="form-control" name="password"  placeholder="Password" required></br>
						<input id="passCheck" type="password" class="form-control" name="passCheck"  placeholder="Password check" required></br>
					    <input type="text" name="address" class="form-control" placeholder="address" required ></br>
					   
					    
					    <button type="submit" class="register-btn" >Register</button><br/>
					    
						<span class="index">
								 <a href="../index.jsp" class="user-a" >HOME</a>
						</span>
						
						<span class = "login">
						 		<a href="login.jsp" class="user-a" >LOGIN</a> 
						</span>
					</section>
				</form>
				
			</div>
		</div>
	</div>
</body>
</html>