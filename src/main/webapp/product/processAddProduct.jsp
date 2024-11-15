<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.oreilly.servlet.*" %>
<%@ page import="com.oreilly.servlet.multipart.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>
<%@ include file="dbconn.jsp" %>
<%
	
	// 전달받은 파라미터 인코딩 방식 설정
	request.setCharacterEncoding("UTF-8");
	
	//파일을 전달받기 위한 작업
	// 이미지 경로 지정
	String path= "../resources/images";
	String savedir= request.getServletContext().getRealPath(path);
	// 최대 파일 크기, 인코딩 유형
		int maxSize = 5*1024*1024;
		String encType = "UTF-8";
		// getServletContext() : 서버가 실행되고 있는 경로 얻기
		
		// 전달값 접근을 위한 MultipartRequest 객체 생성
	MultipartRequest multi = new MultipartRequest(request, savedir, maxSize, encType);
	// new DefaultFileRenamePolicy()을 파라미터로 추가하면 덮어쓰지 않음
	
	// 전달받은 파라미터 담기
	String productId = multi.getParameter("productId");
	String name = multi.getParameter("name");
	String price = multi.getParameter("price");
	String description = multi.getParameter("description");
	
	
	// Product 객체에 set하기 위해 일부 값은 형변환 필요
	Integer defaultPrice;
	
	if(price.isEmpty()) {
		// 가격 입력값이 null 이거나 비어있으면 0으로 설정
		defaultPrice = 0;
	} else {
		// 가격 입력값(String)을 Integer 타입으로 변환
		defaultPrice = Integer.valueOf(price);
	}
	
	
	String productImage = multi.getFilesystemName("productImage");
	
	// SQL 사용해 DB에 상품 등록하기
	PreparedStatement pstmt= null;
	String sql= "insert into product values(?,?,?,?,?)";
	pstmt= conn.prepareStatement(sql);
	
	pstmt.setString(1, productId);
	pstmt.setString(2, name);
	pstmt.setInt(3, defaultPrice);
	pstmt.setString(4, description);
	pstmt.setString(5, productImage);
	
	// SQL 실행
	pstmt.executeUpdate();
	
	if(pstmt != null){
		pstmt.close();
	} if(conn != null){
		conn.close();
	}
	
	
	// 상품 목록 페이지로 이동
	response.sendRedirect("products.jsp");
%>