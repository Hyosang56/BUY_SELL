<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<html>
<head>

<%-- Bootstrap 가져오기 --%>
<link rel="stylesheet" href="./resources/css/bootstrap.min.css" />
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
	crossorigin="anonymous"></script>
<%-- Bootstrap 가져오기 --%>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>Buy & Sell 회원가입</title>

<link href="Design CSS/join.css?v=<%=System.currentTimeMillis() %>" rel="stylesheet">          <%-- 스타일을 위한 css 시트 버전--%>

<script type="text/javascript" src="../resources/js/Validation.js?v=<%=System.currentTimeMillis() %>"> <%-- 입력값 확인 증명 자바스크립트 --%>
</script>

</head>

<body>

<jsp:include page="/login/Topbar.jsp" />

<div class="text-center">
<div class="contentmain">

<main class="form-join">
        <h3>회원가입 해주세요.</h3>
		<form class="form-join" name = "joinForm" method="post" action="joinaction.jsp">
					
			    <div class="form-id">
				<div class="form-floating">
				<input type="id" class="form-control" id="userid" name="userid" placeholder="ID" required> 
				<label for="floatingInput">아이디</label>
				</div>
				<button type="button" onclick="CheckID()" class="btn btn-outline-secondary">중복체크</button>
				</div>
				
							
				<div class="form-floating">
				<input type="password" class="form-control" id="userpw" name="userpw" placeholder="password" size = "30" required>
				<label for="floatingPassword">비밀번호</label>
				</div>
				
				<div class="form-floating">
				<input type="password" class="form-control" id="reuserpw" name="reuserpw" placeholder="repassword" size = "30" required>
				<label for="floatingPassword">비밀번호 확인</label>
				</div>
							
				<div class="form-floating">
				<input type="email" class="form-control" id="useremail" name="useremail" placeholder="name@example.com" required> 
				<label for="floatingInput">이메일 주소</label>
				</div>				
				
				<div class="form-floating">
				<input type="name" class="form-control" id="username" name="username" placeholder="name" required> 
				<label for="floatingInput">이름</label> 
				</div>
							
				<div class="form-radio">
                <input type="radio" class="form-check-input" id="usergender" name="usergender" value="man" checked required>
                <label class="form-check-label" for="usergender1"> 남자 </label>
                </div>
                            
                <div class="form-radio">
                <input type="radio" class="form-check-input" id="usergender" name="usergender" value="woman" required>
                <label class="form-check-label" for="usergender2"> 여자 </label>
                </div>
				
				<div class="form-floating">
				<input type="dob" class="form-control" id="userdob" name="userdob" placeholder="dob" required> 
				<label for="floatingInput"> 생년월일 6자리 </label> 
				</div>
				
				<div class="form-floating">
				<input type="phone" class="form-control" id="userphone" name="userphone" placeholder="phone" required> 
				<label for="floatingInput">휴대폰번호</label> 
				</div>
										
			    <div class="d-grid gap-2">
				<button class="btn btn-outline-dark btn-lg" type="submit" value="회원가입" onclick="javascript:checkJoin()">회원가입</button>
				</div>
				
		        </form>
		</main>
		</div>
		</div>
</body>
</html>