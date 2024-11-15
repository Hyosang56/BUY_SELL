<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기</title>

<script type="text/javascript" src="../resources/js/findinfo.js?v=<%=System.currentTimeMillis() %>"> <%-- 서버연동 정보확인 자바스크립트 --%>
</script>

</head>
<body>

<form name="pwfindscreen" method = "POST">
			<div class = "search-title">
				<h3>등록한 정보로 인증</h3>
			</div>
		<section class = "form-search">
			<div class = "find-id">
				<label>아이디</label>
				<input type="text" name="userid" class = "btn-name" placeholder = "아이디를 입력하세요.">
			<br>
			</div>
		
		 <div class = "find-phone">
				<label>휴대폰 번호</label>
				<input type="text" name="userphone" class = "btn-phone" placeholder = "휴대폰번호를 '-'없이 입력">
			</div> 
			<br>
	</section>
	<div class ="btnSearch">
		<input type="button" name="enter" value="찾기"  onClick="pw_search()">
		<input type="button" name="cancle" value="취소" onClick="history.back()">
 	</div>
 </form>
 
</body>
</html>