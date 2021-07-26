<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 <title>지구를 위한 Tracycle</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no">
    <link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Nunito:wght@200;300;600&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="../css/user-style.css"> <!--폰트 및 기본 css -->
</head>
<body>
 <div class="wrap wd668">
      <div class="container">
        <div class="form_txtInput">
          <h2 class="sub_tit_txt">LOGIN</h2>
          <div class="join_form_modify">
            <table>
              <colgroup>
                <col width="30%"/>
                <col width="auto"/>
              </colgroup>
              <tbody>            
                <tr>
                  <th><span>아이디</span></th>
                  <td><input type="text" placeholder="ID 를 입력하세요." class="inputId" required></td>
                </tr>
                <tr>
                  <th><span>비밀번호</span></th>
                  <td><input type="text" placeholder="비밀번호를 입력해주세요." class="inputPass" required></td>
                </tr>
              </tbody>
            </table>
            <div class="exform_txt"></div>
          </div>
          <!-- join_form E  -->
          
          <div class="btn_wrap">
	          <div class="homeNregister">
	          <span><a href="../index.jsp" class="home-btn">HOME</a></span>
	          <span><a href="" class="register-btn">회원가입</a></span>
	          </div>
	          
           	  <a href="javascript:;" class="submit-btn">Login</a>
          </div>
        </div> <!-- form_txtInput E -->
      </div><!-- content E-->
    </div> <!-- container E -->
    
    
 <script
  src="https://code.jquery.com/jquery-3.2.1.min.js"
  integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4="
  crossorigin="anonymous"></script>
  
  
  <script>
 
  $('.inputId').on('input',pressButton);
  $('.inputPass').on('input',pressButton);
    
  function pressButton(){  
    if($('.inputId').val()!='' && $('.inputPass').val()!=''){
      $('.submit-btn').css('background-color','#4A7B4C');
    }else{
      $('.submit-btn').css('background-color','#9B9B9B');
    }
  }
  </script>    
</body>
</html>