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
						<input type="text" class="form-control" value=<%=user.getID()%> name="userid" maxlength="20">
					</div>
					<div class="form-group">
						<input type="password" class="form-control" value=<%=user.getPW()%> name="userpw" maxlength="20">
					</div>
					<div class="form-group">
						<input type="text" class="form-control" value=<%=user.getNAME()%> name="username" maxlength="20">
					</div>
					<div class="form-group" style="text-align:center;">
						<div class="btn-group" data-toggle="buttons">
						<%
							if(user.getGENDER().equals("남자")){
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
							if(user.getGENDER().equals("여자")){
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
						<input type="email" class="form-control" value=<%=user.getEMAIL()%> name="userEmail" maxlength="20">
					</div>
					<input type="submit" class="btn btn-success form-control" value="수정하기"></form>
					<br>
            <form method="post" action="userDeleteAction.jsp">
            <input type="submit" class="btn btn-danger pull-right" value="탈퇴하기">
            </form>

					</div></div>


</body>
</html>