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
          <h2 class="sub_tit_txt">회원 탈퇴</h2>
          <div class="join_form_modify">
            <table @input="pressbutton">
              <colgroup>
                <col width="30%"/>
                <col width="auto"/>
              </colgroup>
              <tbody>  
             	<tr>
                  <th><span>현재 비밀번호 확인</span></th>
                  <td><input type="password"  placeholder="비밀번호를 입력해주세요." v-model="inputpassword1" @input="noticeInvalidPw"></td>
                </tr>
                <tr>
                  <th><span>비밀번호 확인</span></th>
                  <td><input type="password" @input="noticeInvalidPw" placeholder="비밀번호를 다시 한번 입력해주세요." v-model="inputpassword2" ><p v-html="notice"></p> </td>                 
                </tr>               
              </tbody>
            </table>
            <div class="exform_txt"></div>
          </div>          
          <div class="btn_wrap">
            <button type="submit" v-if="pass==true" class="submit-btn" @click="deleteUser()">회원 탈퇴</button>        
            <button v-else class="not-submit-btn">회원 탈퇴</button>
          </div>
        </div> <!-- form_txtInput E -->
      </div><!-- content E-->
    </div> <!-- container E -->  
 <script>  
 const storage = window.sessionStorage;
 
 new Vue({
  		el:"#app",
  		data() {
  			return {  
  				userId: storage.getItem("login_user"),
  				jwtauthtoken: storage.getItem("jwt-auth-token"),  				  				
  				userInfo:[],
  				inputpassword1:'',
  				inputpassword2:'',
  				pass:'',  
  				notice:''
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
         		
         		if(this.inputpassword1==this.userInfo.password && this.inputpassword1==this.inputpassword2)
         			this.pass = true;
         		
         		else
         			this.pass=false;	
	
         	},
         	
         	deleteUser(userId){
        		if(confirm("계정을 삭제 하시겠습니까?")){
        			axios
        			.delete('http://127.0.0.1:7788/user/deleteUser/'+this.userId,
        			{
        				headers : {
          	  				"jwt-auth-token":storage.getItem("jwt-auth-token")
          	  			}
        			})
        			.then(response=>{this.result= response.data
        				storage.setItem("jwt-auth-token", "");
        	  			storage.setItem("login_user", "");
        	  			})
        			.catch(error=>{
                        console.log(error);
                        this.errored = true
                    })
                    .finally(()=>location.href="../main/index.jsp") 
        		}
        	},
        	
        	noticeInvalidPw(){
        		if(this.inputpassword1!=this.inputpassword2)
        			this.notice ="입력한 두 비밀번호가 일치하지 않습니다.";
        		else if(this.inputpassword1!=this.userInfo.password)
        			this.notice ="틀린 비밀번호입니다.";
        		else this.notice ="";
        	}         	
        }       
  	});
</script> 
</body>
</html>