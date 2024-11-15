<%@page import="member.dao.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8");
%>

<%
//데이터
String id = request.getParameter("userid");

//DB
MemberDAO memberDAO = new MemberDAO();
boolean exist = memberDAO.isExistId(id);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>중복 검증</title>

<script type="text/javascript">
	function CheckIDClose(){
		opener.joinForm.userid.value = '<%=id%>';
		window.close();
		opener.joinForm.userpw.focus();
	}
</script>

</head>
<body>

	<form name="" method="post" action="CheckID.jsp">
		<%
		if (exist) {
		%>
		<%=id%>는 사용중입니다.
		<br>
		<br> 아이디 <input type="text" name="userid"> 
		<input type="submit" value="중복체크">
		<%
		} 
		else {
		%>
		<%=id%>는 사용 가능합니다.<br>
		<br> 
		<input type="button" value="사용" onclick="CheckIDClose()">
		<%
		}
		%>



	</form>



</body>
</html>