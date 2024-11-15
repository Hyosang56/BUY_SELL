<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>	
<%@ page import="member.dao.MemberDAO" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 찾기 결과</title>

<script type="text/javascript" src="../resources/js/findinfo.js?v=<%=System.currentTimeMillis() %>"> <%-- 서버연동 정보확인 자바스크립트 --%>
</script>

</head>
<body>

<%
    request.setCharacterEncoding("UTF-8");
    String user_name = request.getParameter("username");
    String user_phone = request.getParameter("userphone");
     
    MemberDAO dao = new MemberDAO();
    String userid = dao.findId(user_name, user_phone); //아이디를 디비에서 가져옴..실패시 널
 
%>

  <form name="idsearch" method="post">
      <%
       if (userid != null) {
      %>
      
      <div class = "container">
      	<div class = "found-success">
	      <h4>  회원님의 아이디는 </h4>  
	      <div class ="found-id"><%=userid%></div>
	      <h4>  입니다 </h4>
	     </div>
	     <div class = "found-login">
 		    <input type="button" id="btnLogin" value="로그인" onClick = "location.href='../login/loginForm.jsp'"/>
       	</div>
       </div>
      <%
  } else {
 %>
        <div class = "container">
      	<div class = "found-fail">
	      <h4>  등록된 정보가 없습니다 </h4>  
	     </div>
	     <div class = "found-login">
 		    <input type="button" id="btnback" value="다시 찾기" onClick="history.back()"/>
 		    <input type="button" id="btnjoin" value="회원가입" onClick="location.href='../login/joinForm.jsp'"/>
       	</div>
       </div>
       <%
  }
 %> 
      </form>
      
</body>
</html>