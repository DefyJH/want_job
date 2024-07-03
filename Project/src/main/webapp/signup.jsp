<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="userDB.dao.signupDAO" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<link rel="stylesheet" type="text/css" href="./css/signup.css">
</head>
<body>
    <form action="signup_action.jsp" method="post" id="frm_signup">
    <div class="signupMain">
    <div class="title"><h1>회원가입</h1></div>
        <label class="mainID">
        	ID : <input type="text" id="input_id" name="user_id" placeholder="영어+숫자를 이용해 입력해주세요.">
			<button type="button" 
			onclick="fn_dbCheckId()"
			id = checkID>
				중복확인
			</button>		
        </label><br>
        
        <label class="mainPW">
        	PW : <input type="text" id="input_pw" name="user_pw" placeholder="영어+숫자+특수문자를 이용해 8자리를 입력해주세요.">
        </label ><br>
        
        <label class="mainName">
        	이름 : <input type="text" id="input_name" name="user_name">
        </label ><br>
        
        <label class="mainNickname">
        	닉네임 : <input type="text" id="input_nickname" name="user_nickname">
        </label ><br>
        
        <label class="jumin">
        	주민번호 : <input type="text" id="input_jumin" name="user_regno" placeholder="주민번호 뒤 1자리까지 입력해주세요.">XXXXXX
        </label><br>
        
        <label  class="hp">
        	핸드폰번호 : <input type="text" id="input_phone" name="user_tel" placeholder="- 제외하고 입력해주세요.">
        </label><br>
        
        <label class="mainAd">
        	주소 : <input type="text" id="input_ad" name="user_address" placeholder="시군구까지 입력해주세요.">
        </label><br>
        
        <label class="mail">
        	email : <input type="text" id="input_email" name="user_email" placeholder="ex. example01@naver.com">
        </label><br>
        
        <label> 
        	<button class="submit" id="bt_submit" type="submit">
        		가입하기 
        	</button>
        </label>
    </div>
    </form>
    
    <script>
		const frm_signup = document.querySelector('#frm_signup');
		
		
		<%-- function fn_dbCheckId() {
			
			let id = document.querySelector('#input_id').value;
			if(id.length == 0  || id == ""){
				alert("아이디를 입력해주세요.");
				document.querySelector('#input_id').focus();
			} else{
				<%
				signupDAO check = new signupDAO();
				check.confirmID(%> id <%);
				%>
			} 
		} --%>
		

		frm_signup.addEventListener('submit', (e)=>{
			e.preventDefault(); //기본 이벤트 중지  submit 폼 전송 막기!
			
			let input_id = document.getElementById('input_id');
			let input_pw = document.querySelector('#input_pw');
			let input_name = document.querySelector('#input_name');
			let input_jumin = document.querySelector('#input_jumin');
			let input_phone = document.querySelector('#input_phone');
			let input_email = document.querySelector('#input_email');
			let input_nickname = document.querySelector('#input_nickname');
			
			
			input_id.value = input_id.value.trim();
			input_pw.value = input_pw.value.trim();
			input_name.value = input_name.value.trim();
			input_jumin.value = input_jumin.value.trim();
			input_phone.value = input_phone.value.trim();
			input_email.value = input_email.value.trim();
			input_nickname.value = input_nickname.value.trim();
			
			if(input_id.value.trim() == '' || input_id.value.trim() == null ){
				alert('id는 필수입력입니다.');
				input_id.focus();
				return false;
			}
			
			if(input_pw.value.trim() == '' || input_pw.value.trim() == null ){
				alert('pw는 필수입력입니다.');
				input_dname.focus();
				return false;
			}
			
			if(input_name.value.trim() == '' || input_name.value.trim() == null ){
				alert('이름은 필수입력입니다.');
				input_name.focus();
				return false;
			}
			
			if(input_jumin.value.trim() == '' || input_jumin.value.trim() == null ){
				alert('주민번호는 필수입력입니다.');
				input_jumin.focus();
				return false;
			}
			
			if(input_phone.value.trim() == '' || input_phone.value.trim() == null ){
				alert('핸드폰번호는 필수입력입니다.');
				input_phone.focus();
				return false;
			}
			
			if(input_nickname.value.trim() == '' || input_nickname.value.trim() == null ){
				alert('닉네임은 필수입력입니다.');
				input_nickname.focus();
				return false;
			}
			
			
			//검증 모두 통과
			//저장하는 단계 진행!
			frm_signup.submit();
		});
// 		document.querySelector('#btn_submit').addEventListener('click', ()=>{
			
// 		});
		
	</script>
</body>
</html>