<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://cdnjs.cloudflare.com/ajax/libs/axios/0.18.0/axios.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue"></script>
<meta charset="UTF-8">
 <title>지구를 위한 Tracycle</title>
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
          <h2 class="sub_tit_txt">정보 수정</h2>
          <div class="join_form_modify">
            <table>
              <colgroup>
                <col width="30%"/>
                <col width="auto"/>
              </colgroup>
              <tbody>            
                <tr>
                  <th><span>닉네임</span></th>
                  <td><input type="text" name = "nickname" v-model = "mynickname"></td>
                </tr>
                 <tr>
                  <th><span>주  소</span></th>
                  <td><input type="text" placeholder="주소를 입력하세요." name = "address" v-model = "myaddress"></td>
                </tr>
                <tr>
                  <th><span>비밀번호</span></th>
                  <td><input type="text" placeholder="비밀번호를 입력해주세요." ></td>
                </tr>
               
              </tbody>
            </table>
            <div class="exform_txt"></div>
          </div>
          <!-- join_form E  -->
          
          <div class="btn_wrap">
          <a href = "mypage.jsp" v-on:click="submitPost()"  class="submit-btn">저장</a>
          </div>
        </div> <!-- form_txtInput E -->
      </div><!-- content E-->
    </div> <!-- container E -->
    <script>
        new Vue ({
        	el : "#app",
            data() {
        		return {
        			loading: true,
        			errored: false,
        			mynickname: '',
        			myaddress: '',
        			user:{"userId":"gogilbert"},
        			password:{"password":"1234qwer"}
        			result:''
        		}
        	},
        	methods: {
        		updateUser(){
        			axios
            		.put('http://127.0.0.1:7788/user/updateUser',
            			{nickname : this.mynickname,
            			 address : this.myaddress})
            		.then(response=>(this.result = response.data))
        			.catch(error=>{
        			console.log(error);
        			this.errored = true
        		})	 
        			.finally(()=>location.href="mypage.jsp")
            }
         }
      })
   </script>
</body>
</html>