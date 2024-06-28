<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<link rel="stylesheet" type="text/css" href="./css/login.css">
</head>
<body>
	<div class="loginMain"><form action="login_action.jsp"  method="post" id="frm_login">
		<label class="loginId">
			ID : <input type="text" id="login_id" name="user_id">
		</label> <br>
		<label class="loginPw">
			PassWord : <input type="password" id="login_pw" name="user_pw">
		</label> <br>
		<div class="buttonGroup">
			<input type="button" value="회원가입" class="btn" >
			<input type="button" value="ID/PW 찾기" class="btn" >
		</div>
		<label>
			<button class="submit">로그인하기</button>
		</label>
	</form></div>
	<script>
	const frm_login = document.querySelector('#frm_login');
	
	frm_login.addEventListener('submit', (e)=>{
		e.preventDefault(); //기본 이벤트 중지  submit 폼 전송 막기!
		
		let input_id = document.querySelector('#login_id');
		let input_pw = document.querySelector('#login_pw');
		
		input_id.value = input_id.value.trim();
		input_pw.value = input_pw.value.trim();
		
		if(input_id.value.trim() == '' || input_id.value.trim() == null ){
			alert('id를 입력해주세요.');
			input_id.focus();
			return false;
		}
		
		if(input_pw.value.trim() == '' || input_pw.value.trim() == null ){
			alert('pw를 입력해주세요');
			input_dname.focus();
			return false;
		}
		
		frm_login.submit();
	});
	</script>
</body>
</html>