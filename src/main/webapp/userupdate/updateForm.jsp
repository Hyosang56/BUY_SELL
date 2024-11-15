<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="member.bean.MemberDTO"%>
<%@ page import="member.dao.MemberDAO"%>
<%@ page import="java.io.PrintWriter" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보 수정 페이지</title>

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


</head>
<body>


    <% 
	String userid = null;
	if(session.getAttribute("userid")!=null){
		userid = (String)session.getAttribute("userid");
	}
	
	MemberDTO user = new MemberDAO().getUser(userid);
	
	%>

	<div class="container">
		<div class="col-lg-4"></div>
		<div class="col-lg-4">
			<div class="jumbotron" style="padding-top: 20px;">
			
				<form method="post" action="updateaction.jsp">
					<h3 style="text-align:center;">내 정보</h3>
					<div class = "form-group">
						회원ID <input type="text" class="form-control" value=<%=user.getuserid()%> name="userid" maxlength="20" disabled>
					</div>
					<div class="form-group">
						비밀번호 <input type="password" class="form-control" value=<%=user.getuserpw()%> name="userpw" maxlength="20">
					</div>
					<div class="form-group">
						유저 이름 <input type="text" class="form-control" value=<%=user.getusername()%> name="username" maxlength="20">
					</div>
					<div class="form-group" style="text-align:center;">
						<div class="btn-group" data-toggle="buttons">
						<%
							if(user.getusergender().equals("남자")){
						%>
							<label class="btn btn-success active">
						<%
							} 
							else{
						%>
							<label class="btn btn-success">
						<%
							}
						%>		
								<input type="radio" name="usergender" autocomplete="off" value="남자" checked>남자
							</label>
						<%
							if(user.getusergender().equals("여자")){
						%>
								<label class="btn btn-success active">
						<%
							} else{
						%>
								<label class="btn btn-success">
						<%
							}
						%>	
								<input type="radio" name="usergender" autocomplete="off" value="여자" checked>여자
							</label>
						</div>
					</div>
					<div class="form-group">
						이메일<input type="email" class="form-control" value=<%=user.getuseremail()%> name="userEmail" maxlength="20">
					</div>
					<input type="submit" class="btn btn-success form-control" value="수정하기"></form>
					<br>
            <form method="post" action="userDeleteAction.jsp">
            <input type="submit" class="btn btn-danger pull-right" value="탈퇴하기">
            </form>

					</div></div>


</body>
</html>