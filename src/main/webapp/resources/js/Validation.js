/* function checkLogin(){                                  //로그인 미입력시 알람
	
	if(document.loginForm.userid.value ==""){
		alert("아이디를 입력하세요");
		document.loginForm.userid.focus();
		return false;
	}
	else if(document.loginForm.userpw.value == ""){
		alert("비밀번호를 입력하세요");
		document.loginForm.userpw.focus();
		return false;		
		
	}
	else{
		document.loginForm.submit();
		return true;
	}	
	
}
*/



function checkJoin(){                                         //회원가입 미입력시 알람 
	
	
	if(document.joinForm.userid.value == ""){
			alert("아이디를 입력하세요.");
		document.joinForm.userid.focus();
	}
	else if(document.joinForm.userpw.value == ""){
		alert("비밀번호를 입력하세요.");
	}
	else if(document.joinForm.userpw.value != document.joinForm.reuserpw.value){
		alert("확인 비밀번호가 맞지 않습니다.");
	}
	else if(document.joinForm.useremail.value == ""){
		alert("이메일을 입력하세요.");
	}
	else if(document.joinForm.username.value == ""){
		alert("이름을 입력하세요.");
	}
	else if(document.joinForm.userdob.value == ""){
		alert("생년월일을 입력하세요.");
		}
	else if(document.joinForm.userphone.value == ""){
		alert("휴대폰번호를 입력하세요.");
		}	
	else	{
		document.joinForm.submit();
	}
}

function CheckID(){                                  //회원가입 시 아이디 미입력 후 체크시 알람
	var sId = document.joinForm.userid.value;
	if(sId ==""){
		alert("먼저 아이디를 입력하세요");
	}else {
		window.open("CheckID.jsp?userid=" + sId, "" ,"width = 350 height=100 left=500 top=200")
	}
}