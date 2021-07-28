<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 <title>지구를 위한 Tracycle</title>
 	<script src="https://cdnjs.cloudflare.com/ajax/libs/axios/0.18.0/axios.js"></script>
  	<script src="https://cdn.jsdelivr.net/npm/vue"></script>
 
 
    <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no">
    	<!--한글폰트 링크 -->
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic:wght@400;700&family=Nanum+Myeongjo:wght@400;700&family=Song+Myung&display=swap" rel="stylesheet">
    
    <link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Nunito:wght@200;300;600&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="../css/user-style.css"> <!--폰트 및 기본 css -->
</head>
<body>
 <div class="wrap wd668" id="app">
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
                  <td><input type="text" placeholder="ID 를 입력하세요." class="inputId"  v-model="userid" required></td>
                </tr>
                <tr>
                  <th><span>비밀번호</span></th>
                  <td><input type="password" placeholder="비밀번호를 입력해주세요." class="inputPass"  v-model="userpass" required></td>
                </tr>
              </tbody>
            </table>
            <div class="exform_txt"></div>
          </div>
          <!-- join_form E  -->
          
          <div class="btn_wrap">
	          <div class="homeNregister">
	          <span><a href="../main/index.jsp" class="home-btn">HOME</a></span>
	          <span><a href="register.jsp" class="register-btn">회원가입</a></span>
	          </div>
	          
           	  <button type="submit" class="submit-btn" @click="login">Login</button>
          </div>
        </div> <!-- form_txtInput E -->
      </div><!-- content E-->
    </div> <!-- container E -->
    

  
  
  <script>

  
  new Vue({
      el: "#app",           
      data(){
          return {
        	 
        	  userid:'',
              userpass:'',  
         	
              usercheck:{},
              errored:false,
              empEmpty:true
          }
      },


      methods:{

          	login(){
          		
          		var params = new URLSearchParams();
                params.append('userId', this.userid);
                params.append('password', this.userpass);
                axios.post('http://127.0.0.1:7788/user/login'
                  ,params)
		            .then(function (response) {
		                console.log(response);
		            })
		            .catch(error=>{
		             	console.log(error);
		             	this.errored = true
		             	alert("로그인 실패");
		             })                    
          			.finally(()=>location.href="../main/index.jsp")   
          }
          
        
          
         /* login : function () {
              if (this.user.userid == '') {alert('아이디를 입력해주세요.');return;}
              if (this.user.userpass == '') {alert('비밀번호를 입력해주세요.');return;}
              this.$http.post('/127.0.0.1:7788/user/login', {loginUser:this.user}).then((response) => {
                  if (response.data.success == true) {
                      alert(response.data.message);
                      this.$router.push('index.jsp'); //로그인 성공시 index 페이지로 이동
                  } else {
                      alert(response.data.message);
                  }
              });
          }*/
      }  
  })
  </script>    
</body>
</html>