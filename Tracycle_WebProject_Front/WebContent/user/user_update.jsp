<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
                  <td><input type="text" ></td>
                </tr>
                <tr>
                  <th><span>비밀번호</span></th>
                  <td><input type="text" placeholder="비밀번호를 입력해주세요." ></td>
                </tr>
                <tr>
                  <th><span>비밀번호 확인</span></th>
                  <td><input type="text" placeholder="비밀번호를 확인하세요" ></td>
                </tr>
                 <tr>
                  <th><span>주  소</span></th>
                  <td><input type="text" placeholder="주소를 입력하세요." ></td>
                </tr>
               
              </tbody>
            </table>
            <div class="exform_txt"></div>
          </div>
          <!-- join_form E  -->
          
          <div class="btn_wrap">
            <a href="javascript:;" class="submit-btn">저장</a>
          </div>
        </div> <!-- form_txtInput E -->
      </div><!-- content E-->
    </div> <!-- container E -->
</body>
</html>