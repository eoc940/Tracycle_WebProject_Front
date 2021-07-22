<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Login</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no">
    <link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Nunito:wght@200;300;600&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="css/member-style.css"> <!--폰트 및 기본 css -->
</head>

<body>

	<form action="login.do" class="signin-form" method="post">
		
		<section class="ftco-section">
			<h3 class="header"><b>LOGIN</b></h3>
			
			
			<input type="text" name="" class="form-control" placeholder="UserID" required ></br>
			<input id="password" type="" class="form-control" name="password"  placeholder="Password" required></br>
		   
		    <button type="submit" >Sign In</button><br/>
		    
			<span class="index">
					 <a href="index.jsp" >HOME</a>
			</span>
			
			<span class = "registerForm">
			 		<a href="" >REGISTER</a> 
			</span>
		</section>
	</form>

</body>
</html>