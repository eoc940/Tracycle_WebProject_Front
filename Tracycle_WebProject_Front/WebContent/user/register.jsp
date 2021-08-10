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
              <tbody @input="pressbutton">
                <tr>
                  <th><span>아이디</span></th>
                  <td><input type="text" placeholder="ID 를 입력하세요. (영문, 숫자 조합 5자 이상/특수문자, 공백 사용 불가)" minlength="5" class="inputId"  v-model.trim="userid"  @blur="[checkId(), idcnt()]" @change="againCheckId" required="required"><p v-html="idinvalidmessage" ></p><div class="idCheck"><button @click= "validationId" class="idCheckButton" style="cursor:pointer;">ID Check</button></div></td>
                </tr>
               
                <tr>
                  <th><span>닉네임</span></th>
                  <td><input type="text" v-model="username" required class="nickName"></td>
                </tr>
                <tr>
                  <th><span>비밀번호</span></th>
                  <td><input type="password" v-model="userpass" placeholder="비밀번호를 입력해주세요. (6자리 이상)" @blur="passcnt" class="inputPass" required></td>
                </tr>
                <tr>
                  <th><span>비밀번호 확인</span></th>
                  <td><input type="password" @change="passCheck" v-model="userpasscheck" placeholder="비밀번호를 확인하세요"  class="passCheck" required></td>
                </tr>
                 <tr>
                  <th><span>주  소</span></th>
                  <td><input type="text" @change="useraddrcheck" placeholder="주소를 입력하세요." v-model="useraddr" class="inputAddr" required></td>
                </tr>
                
              </tbody>
            </table>
            <div class="exform_txt"><span>표시는 필수적으로 입력해주셔야 가입이 가능합니다.</span></div>
          </div>
          <!-- join_form E  -->
          
          <div class="btn_wrap">
          
            	<button type="submit" v-if="pass==true" class="submit-btn" @click="[invalidIdMessage(),checkId()]">가입</button>
         
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
                     check:''

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
             		
             		if(this.userpass != this.userpasscheck){
             			this.check=false;
             			alert("비밀번호가 일치하지 않습니다.");
             		}else if(this.userpass ==''){
             			this.check=false;
             			alert("비밀번호를 입력해주세요.");
             		}else{
             			this.check = true;
             			
             		}
             	},
             	
             	pressbutton(){
             		
             		if(this.userid.length >= 5 && this.userpass.length >= 6 && this.username !='' && this.useraddr !='' && this.check==true && this.userpasscheck != ''){
             			this.pass = true;
             		}else{
             			this.pass=false;	
             		}
             	},
             	
             	idcnt(){
             		if(this.userid.length < 5) alert("아이디는 5자 이상 입력해주새요.");
            
            	},
            	
            	passcnt(){
            		if(this.userpass.length < 6) alert("비밀번호는 6자 이상 입력해주새요.");
            	},
            	
            	useraddrcheck(){
            		if(this.useraddr =='') alert("주소를 입력해주세요.");
            	},
      		
             	validationId(){
             		
             		if(this.useridcheck == true){
             			this.idpass=true;
             			alert("사용가능한 아이디입니다.");
             			this.idinvalidmessage="";
             		}else{
             			this.idpass=false;
             			alert("이미 사용중인 아이디입니다.");
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
             	}
 		 },
 		 
 		watch:{
 			userid(val){
 			        const reg = /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/;
					const space = /\s/;;
					const specialCharacters = /[~!@\#$%^&*\()\-=+_']/gi; 
					
 			      if(reg.exec(val)!==null || space.exec(val)!==null || specialCharacters.exec(val)!==null){
 			       this.idinvalidmessage = "영문, 숫자 조합 5자 이상 입력해주세요. (특수문자, 공백 사용 불가)";
 			       return this.userid = this.userid.slice(0,-1);
 			      }else{
 			    	 //this.idinvalidmessage = "";
 			      }
 			  }
 			}
  })



 </script>
</body>
</html>