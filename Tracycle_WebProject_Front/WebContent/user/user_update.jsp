<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://cdnjs.cloudflare.com/ajax/libs/axios/0.18.0/axios.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue"></script>
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
      <div class="container">
        <div class="form_txtInput">
          <h2 class="sub_tit_txt">정보 수정</h2>
          <div class="join_form_modify">
            <table>
              <colgroup>
                <col width="30%"/>
                <col width="auto"/>
              </colgroup>
              <tbody>  
             	<tr>
                  <th><span>아이디</span></th>
                  <td><input type="text" :value=userId readonly /></td>     
                <tr>
                  <th><span>닉네임</span></th>
                  <td><input type="text" :placeholder=userInfo.nickName v-model="newNickName"></td>
                </tr> 
                 <tr>
                  <th><span>주  소</span></th>
                  <td><input type="text" :placeholder=userInfo.address v-model="newAddress"></td>
                </tr>                
                <tr>
                  <th><span>현재 비밀번호 확인</span></th>
                  <td><input type="password" @input="pressbutton" placeholder="비밀번호를 확인하세요" v-model="inputpassword"></td>
                </tr>
              </tbody>
            </table>
            <div class="exform_txt"></div>
          </div>        
          <div class="btn_wrap">
            <button type="submit" v-if="pass==true" class="submit-btn" @click="updateUser">저장</button>        
            <button v-else class="not-submit-btn">저장</button>
          </div>
        </div>
      </div>
    </div> 
 <script>  
 
 const storage = window.sessionStorage;
 
 new Vue({
  		el:"#app",
  		data() {
  			return {  
  				userId: storage.getItem("login_user"),
  				jwtauthtoken: storage.getItem("jwt-auth-token"),  				  				
  				userInfo:[],
  				inputpassword:'',			
  				pass:'',
  				newNickName:'',
  				newAddress:'',
  				nextpage:'mypage.jsp'
  			}
  		},
  		
  		mounted(){
            axios          
	            .get('http://127.0.0.1:7788/user/findByUserId/'+this.userId,
	            		{
	              	   headers : {
	              	  		"jwt-auth-token":storage.getItem("jwt-auth-token")
	              	   }
	            })
	            .then(response=>(this.userInfo = response.data))
	            .catch(error=>{
	                console.log(error);
	                this.errored = true
	            })
	            .finally(()=>this.loading = false)
        },
        
        methods:{

        	pressbutton(){
         		
         		if(this.inputpassword==this.userInfo.password){
         			this.pass = true;
         		}else{
         			this.pass=false;	
         		}
         	},
         	
         	updateUser(){
         		axios
    			 .put('http://127.0.0.1:7788/user/updateUser',
    				{			  		
    					userId: this.userId,
    					nickName: this.newNickName,				        
    				    address: this.newAddress
    				   
    				})
    			.then(response=>(this.result= response.data))   							
    		    .catch(error=>{
    		        console.log(error);
    		        this.errored = true
    		        alert("정보 변경 실패!");
    		        this.nextpage="user_update.jsp";
    		    })
    		    .finally(()=>location.href=this.nextpage)    					 
         	}        	
        }       
  	});
 </script> 
</body>
</html>