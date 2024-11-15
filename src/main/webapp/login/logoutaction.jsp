<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
Cookie user = new Cookie("id", ""); //새로운 user 인스턴스 생성 (값 초기화)
user.setMaxAge(0);
response.addCookie(user); //쿠키에 초기화된 user정보를 보냄
session.invalidate();
response.sendRedirect("loginForm.jsp"); //로그아웃 후 로그인페이지로 연결
%>
</body>
</html>