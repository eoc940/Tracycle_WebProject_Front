<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="shortcut icon" type="image/x-icon" href="../favicon.ico">
<title>지구를 위한 Tracycle</title>
<script src="https://cdnjs.cloudflare.com/ajax/libs/axios/0.18.0/axios.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue"></script>
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no">
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
      <div class="container" >
        <div class="form_txtInput">
          <h2 class="sub_tit_txt">LOGIN</h2>
          <div class="join_form_modify">
            <table @input="bothPass">
              <colgroup>
                <col width="30%"/>
                <col width="auto"/>
              </colgroup>
              <tbody>            
                <tr>
                  <th><span>아이디</span></th>
                  <td><input type="text" placeholder="ID를 입력하세요." class="inputId"  v-model="userId"  required></td>
                </tr>
                <tr>
                  <th><span>비밀번호</span></th>
                  <td><input type="password" placeholder="비밀번호를 입력해주세요." class="inputPass"  v-model="password"  required  @keyup.enter.prevent="login"></td>
                </tr>
              </tbody>
            </table>
            <div class="exform_txt"></div>
          </div>
          <div class="btn_wrap">
	          <div class="homeNregister">
	          <span><a href="../main/index.jsp" class="home-btn">HOME</a></span>
	          <span><a href="register.jsp" class="register-btn">회원가입</a></span>
	          </div>	          
           	  <button type="submit" v-if="bothpass==true" class="submit-btn" @click="login">Login</button>
           	  <button v-else class="not-submit-btn">Login</button>
          </div>
        </div> 
      </div>
    </div>
  <script>
  
  const storage = window.sessionStorage;
  
  new Vue({
      el: "#app",           
      data(){
          return {
        	  userId:'',
              password:'',  
         	  message : "로그인해주세요",
              usercheck:{},
              status:"",
              token:"",
              info:"",
              errored:false,
              nextpage:'',            
          	  bothpass:''
          }
      },
      
      methods:{
    	  	setInfo(status, token, info) {
    	  		this.status = status;
    	  		this.token = token;
    	  		this.info = info;
    	  	},
    	  	logout() {
    	  		storage.setItem("jwt-auth-token", "");
    	  		storage.setItem("login_user", "");
    	  		this.message = "로그인해주세요";
    	  		this.setInfo("로그아웃 성공", "", "");
    	  	},
    	  	getInfo() {
    	  		axios.post("http://127.0.0.1:7788/user/info", {
    	  			userId:this.userId,
    	  			password:this.password
    	  		},
    	  		{
    	  			headers : {
    	  				"jwt-auth-token":storage.getItem("jwt-auth-token")
    	  			}
    	  		}
    	  	)
    	  	.then(response=>{
    	  		this.setInfo(
    	  			"정보 조회 성공",
    	  			this.token,
    	  			JSON.stringify(response.data)
    	  		);
    	  	})
    	  	.catch(error=>{
    	  		this.setInfo("정보 조회 실패", "", error.response.data.message);
    	  	})
    	  	},

          	login(){
          		storage.setItem("jwt-auth-token", "");
          		storage.setItem("login_user", "");
          		axios.post("http://127.0.0.1:7788/user/login", {
          			userId:this.userId,
          			password:this.password
          		})
          		.then(response=>{
          			if(response.data.status) {
          				this.message = response.data.data.nickName + "님 로그인 되었습니다";
          				console.dir(response.headers["jwt-auth-token"]);
          				this.setInfo(
          					"로그인 성공",
          					response.headers["jwt-auth-token"],
          					JSON.stringify(response.data.data)
          				);
          				storage.setItem("jwt-auth-token", response.headers["jwt-auth-token"]);
          				storage.setItem("login_user", response.data.data.userId);

          				this.nextpage = "../main/index.jsp";
          			}else {
          				this.setInfo("","","");
          				this.message = "로그인해주세요";
          				alert("입력 정보를 확인하세요");
          			}
          		})
          		.catch(error=>{
          			this.setInfo("실패", "", JSON.stringify(error.response || error.message));
          			this.nextpage = "login.jsp";
          			alert("입력 정보를 확인하세요");
          		})
          		.finally(()=>location.href=this.nextpage);
   
          },
          
          init() {
        	  if(storage.getItem("jwt-auth-token")) {
        		  this.message = storage.getItem("login_user") + "로 로그인 되었습니다";
        	  }else {
        		  storage.setItem("jwt-auth-token", "");
        	  }
          },
          
          goHome(){
        	  location.href="login.jsp";
          },
    
	       bothPass(){
	    	   if(this.userId != '' && this.password != '') this.bothpass=true;
	    	   else this.bothpass=false;
	       }	      
      },

      mounted() {
    	  this.init();
      }
  })
</script>    
</body>
</html>