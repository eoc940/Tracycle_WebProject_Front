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
 <div class="wrap wd668" id='app'>
      <div class="container">
        <div class="form_txtInput">
          <h2 class="sub_tit_txt">회원가입</h2>
          <div class="join_form" >
            <table>
              <colgroup>
                <col width="30%"/>
                <col width="auto"/>
              </colgroup>
              <tbody @input="pressbutton" @click="pressbutton">
                <tr>
                  <th><span class="essential">아이디</span></th>
                  <td>
	                  <input type="text" placeholder="ID 를 입력하세요. (영문 또는 숫자 5자 이상/특수문자, 공백 사용 불가)" minlength="5" class="inputId"  v-model.trim="userid"  @change="checkId" @input="[idcnt(),againCheckId()]" required="required">
	                  <span class="message" v-html="idinvalidmessage" ></span>
	                  <div class="idCheck">
	                  <button v-if="idcntOk==false" class="notIdCheckButton" >ID Check</button>
	                  <button v-if="idcntOk==true" @click= "validationId" class="idCheckButton" style="cursor:pointer;">ID Check</button></div>
                  </td>
                </tr>
               
                <tr>
                  <th><span class="essential">닉네임</span></th>
                  <td><input type="text" v-model="username" required class="nickName"></td>
                </tr>
                <tr>
                  <th><span class="essential">비밀번호</span></th>
                  <td><input type="password" v-model="userpass" @input="passCheck" placeholder="비밀번호를 입력해주세요. (6자리 이상)"  class="inputPass" required><span class="passmessage" v-html="passinvalidmessage1"></span></td>
                </tr>
                <tr>
                  <th><span class="essential">비밀번호 확인</span></th>
                  <td><input type="password"  v-model="userpasscheck" @input="passCheck" placeholder="비밀번호를 확인하세요"  class="passCheck" required><span class="passmessage" v-html="passinvalidmessage2"></span></td>
                </tr>
                 <tr>
                  <th><span>주  소</span></th>
                  <td><input type="text" placeholder="주소를 입력하세요." v-model="useraddr" class="inputAddr" ></td>
                </tr>
                
              </tbody>
            </table>
            <div class="exform_txt"><span>표시는 필수적으로 입력해주셔야 가입이 가능합니다.</span></div>
          </div>
          <!-- join_form E  -->
          
          <div class="btn_wrap">
         	  <div class="homeNregister">
	          <span><a href="../main/index.jsp" class="home-btn">HOME</a></span>
	          <span><a href="login.jsp" class="register-btn">로그인</a></span>
	          </div>
          
            	<button type="submit" v-if="pass==true" class="submit-btn" @click="[invalidIdMessage(),checkId()]" style="cursor:pointer;">가입</button>
         
            	<button v-else class="not-submit-btn">가입</button>
          
          </div>
        </div> <!-- form_txtInput E -->
      </div><!-- content E-->
    </div> <!-- container E -->
    

 <script>

//Vue 비동기 연결
  new Vue({
             el: "#app",           
             data(){
                 return {
                	 useridcheck:'',
                     userid:'',
                     useraddr:'',
                     username:'',
                     userpass:'',
                     userpasscheck:'',
                     errored:false,
                     empEmpty:true,
                     pass:'',
                     idpass:'',
                     idinvalidmessage:"",
                     check:'',
                     passinvalidmessage1:'',
                     passinvalidmessage2:'',
                     idcntOk:''
                 }
             },

   
             methods:{

                 	checkId(){
                 		
                 		axios
     		            .get('http://127.0.0.1:7788/user/checkUserId/'+this.userid)
     		            .then(response=>(this.useridcheck = response.data))
     		            .catch(error=>{
     		             	console.log(error);
     		             	this.errored = true
     		             })
     		            .finally(()=>this.loading = false)   
                 },
                 

                 addUser(){
             		axios
 						   .post('http://127.0.0.1:7788/user/addUser',
 						  {
 							userId: this.userid,
 							nickName: this.username,
 					        password: this.userpass,
 					        address: this.useraddr
 					   
 						  })
 						  .then(response=>(this.result= response.data))
 			              .catch(error=>{
 			                   console.log(error);
 			                   this.errored = true
 			                   alert("등록 실패!");
 			                })
 			              .finally(()=>location.href="login.jsp")
 						 
             	},
             	
             	passCheck(){
             		
             		if(this.userpass == this.userpasscheck && this.userpass.length >= 6){
             			this.check = true;
             			this.passinvalidmessage1 = "";
             			this.passinvalidmessage2 = "";  
             			console.log("1");
             		}else if(this.userpass.length < 6 && this.userpass.length >=1 && this.userpass && this.userpasscheck==''){
             			this.check=false;
         				this.passinvalidmessage1 = "비밀번호는 6자 이상 입력해주세요.";
         				console.log("2");
             		}else if(this.userpass.length < 6 && this.userpass.length >=1 && this.userpass && this.userpasscheck==this.userpass){
             			this.check=false;
         				this.passinvalidmessage1 = "비밀번호는 6자 이상 입력해주세요.";
         				this.passinvalidmessage2 = "";
         				console.log("3");
             		}else if(this.userpass.length < 6 && this.userpass.length >=1 && this.userpass && this.userpasscheck!=this.userpass){
             			this.check=false;
         				this.passinvalidmessage1 = "비밀번호는 6자 이상 입력해주세요.";
         				this.passinvalidmessage2 = "비밀번호가 일치하지 않습니다.";
         				console.log("4");
             		}else if(this.userpass.length >= 6 && this.userpasscheck ==''){             	
             			this.passinvalidmessage1 = "";
             			this.passinvalidmessage2 = "비밀번호를 다시 한번 입력해주세요."; 
             			this.check=false;
             			console.log("5");
             		}else if(this.userpass.length >=6 && this.userpass != this.userpasscheck ){
             			this.check=false;
             			this.passinvalidmessage1 = "";
             			this.passinvalidmessage2 = "비밀번호가 일치하지 않습니다.";     
             			console.log("6");             		
             		}else if(this.userpasscheck.length <6 && this.userpass == this.userpasscheck ){
             			this.check=false;
             			this.passinvalidmessage1 = "비밀번호는 6자 이상 입력해주세요.";
             			this.passinvalidmessage2 = "";     
             			console.log("8");
             		}else if(this.userpass ==''){
             			this.check=false;
             			this.passinvalidmessage1 ="비밀번호를 입력해주세요.";  
             			console.log("9");
             		}else if(this.userpass == this.userpasscheck && this.userpass == ''){
             			this.check = false;
             			this.passinvalidmessage2 = "";
             			this.passinvalidmessage1 = "";
             			console.log("10");
             		}else if(this.userpasscheck ==''){
             			this.check = false;
             			this.passinvalidmessage2 = "비밀번호를 다시 한번 입력해주세요.";  
             			console.log("11");
             		 
             		}else{
             			console.log("12");
             		}
             		
             		console.log(this.passinvalidmessage2);
             	},

             	pressbutton(){
             		
             		if(this.userid.length >= 5 && this.username !='' && this.check==true  && this.idpass==true){
             			this.pass = true;
             		}else{
             			this.pass=false;	
             		}
             		console.log(this.pass);
             		console.log(this.check);
             		
             	},
             	
             	idcnt(){
             		if(this.userid.length < 5){
             			this.idinvalidmessage="아이디는 5자 이상 입력해주새요.";
             			this.idcntOk=false;
             		}else{
             			this.idcntOk=true;
             			this.idinvalidmessage="";
             		}
            
            	},

             	validationId(){
             		
             		if(this.useridcheck == true){
             			this.idpass=true;
             			//alert("사용가능한 아이디입니다.");
             			this.idinvalidmessage="사용가능한 아이디입니다.";
             		}else{
             			this.idpass=false;
             			//alert("이미 사용중인 아이디입니다.");
             			this.idinvalidmessage="이미 사용중인 아이디입니다.";
             		}
             		
             	},
             	
             	invalidIdMessage(){
             		if(this.idpass!=true){
             			this.idinvalidmessage="아이디 중복 체크를 해주세요.";
             		}else{
             			alert("가입을 축하합니다.");
             			this.addUser();
             		}
             	},
             	
             	againCheckId(){
             		this.idpass=false;
             		if(this.idcntOk!=false)
             			this.idinvalidmessage="아이디 중복 체크를 해주세요.";	
             	}
 		 },
 		 
 		watch:{
 			userid(val){
 			        const reg = /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/;
					const space = /\s/;;
					const specialCharacters = /[~!@\#$%^&*\()\-=+_']/gi; 
					
 			      if(reg.exec(val)!==null || space.exec(val)!==null || specialCharacters.exec(val)!==null){
 			       this.idinvalidmessage = "영문 또는 숫자 5자 이상 입력해주세요. (특수문자, 공백 사용 불가)";
 			       return this.userid = this.userid.slice(0,-1);
 			      }else{
 			    	 //this.idinvalidmessage = "";
 			      }
 			  },
 			  
 			 userpass(val){
 				 const reg = /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/;
				 const space = /\s/;;
				 
				 if(reg.exec(val)!==null || space.exec(val)!==null){
	 			       this.passinvalidmessage1 = "공백 사용 불가";
	 			       return this.userpass = this.userpass.slice(0,-1);
	 			      }else{
	 			    	 //this.idinvalidmessage = "";
	 			      }
 			  }  
 			  
 			}
  })



 </script>
</body>
</html>