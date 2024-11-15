<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="member.dao.MemberDAO"%>
    <%@ page import="member.bean.MemberDTO"%>
    <%@ page import="java.io.PrintWriter" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%
		String userid = null;
		if(session.getAttribute("userid")!=null){
			userid=(String)session.getAttribute("userid");
		}
		if(userid == null){
			PrintWriter script=response.getWriter();
			script.println("<script>");
			script.println("alert('로그인을 하세요.')");
			script.println("location.href='login.jsp'");
			script.println("</script>");
		}
		MemberDTO user = new MemberDAO().getUser(userid);
			if(request.getParameter("userID")==null||request.getParameter("userPassword")==null||request.getParameter("userName")==null
			||request.getParameter("userGender")==null||request.getParameter("userEmail")==null){
			PrintWriter script=response.getWriter();
			script.println("<script>");
			script.println("alert('입력이 안 된 사항이 있습니다.')");
			script.println("history.back()");
			script.println("</script>");
		}else{
			MemberDAO MemberDAO=new MemberDAO();//하나의 인스턴스
			int result=MemberDAO.update(userid,request.getParameter("userpw"),request.getParameter("username"),request.getParameter("usergender"),request.getParameter("useremail"));
			if(result == -1){//데이터 베이스 오류가 날 때
				PrintWriter script=response.getWriter();
				script.println("<script>");
				script.println("alert('회원정보 수정에 실패했습니다.')");
				script.println("history.back()");
				script.println("</script>");
			}
			else{
				PrintWriter script=response.getWriter();
				script.println("<script>");
				script.println("alert('회원정보 수정에 성공했습니다.')");
				script.println("location.href='main.jsp'");
				script.println("</script>");
			}
		
		}
	%>

</body>
</html>