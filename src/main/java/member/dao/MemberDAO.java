package member.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import member.bean.MemberDTO;


public class MemberDAO {
	private String diver = "com.mysql.jdbc.Driver";
	private String DBURL = "jdbc:mysql://localhost:3306/buynselldb";
	private String DBUser = "dbmgrid";
	private String DBPassword = "dbmgrpw";
	
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	public MemberDAO(){
		try{
			Class.forName(diver);
			
		}catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}
	public Connection getConnection(){
		try {
			conn = DriverManager.getConnection(DBURL, DBUser, DBPassword);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return conn;
	}
	
	public int write(MemberDTO memberDTO){
		int su = 0;
		conn = getConnection();
		String sql =
				"Insert into userdb values (?,?,?,?,?,?,?)";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, memberDTO.getID());
			pstmt.setString(2, memberDTO.getPW());
			pstmt.setString(3, memberDTO.getNAME());
			pstmt.setString(4, memberDTO.getGENDER());
			pstmt.setString(5, memberDTO.getEMAIL());
			pstmt.setString(6, memberDTO.getDOB());
			pstmt.setString(7, memberDTO.getPHONE());
			su = pstmt.executeUpdate();
			
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally{
			try {
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
				
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			}
		}
		return su;
	}
	
	
	public String login(String userid, String userpw){
		String name="null";
		conn = getConnection();
		String sql = "select * from userdb where userid=? and userpw=?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userid);
			pstmt.setString(2, userpw);
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				name = rs.getString("username"); //rs.getString(1);
			}
			
		} catch(SQLException e){
			e.printStackTrace();
		}
		finally {
			// TODO: handle finally clause
			try{
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
				
			}catch(Exception e){
				e.printStackTrace();
			}
		}
		return name;
	}
	
	///////////////////////////////////////////////////
	public boolean isExistId(String userid){
		boolean exist = false;
		conn = getConnection();
		String sql = "select * from userdb where userid=?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userid);
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				exist = true;
			}
			
		} catch(SQLException e){
			e.printStackTrace();
		}
		finally {
			// TODO: handle finally clause
			try{
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
				
			}catch(Exception e){
				e.printStackTrace();
			}
		}
		return exist;
	}
	///////////////////////////////////////////////////////////
	
	public String findId(String username, String userphone) {                         //아이디 DB에서 찾는 DAO
		conn = getConnection();
		String mid = null;
		String sql = "select userid from userdb where username=? and userphone=? ";
		
		try {
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, username);
			pstmt.setString(2, userphone);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				mid = rs.getString("userid");
			}
				
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mid;
	}
	//////////////////////////////////////////////
	
	public String findPW(String userid, String userphone) {                         //아이디 DB에서 찾는 DAO
		conn = getConnection();
		String mid = null;
		String sql = "select userpw from userdb where userid=? and userphone=? ";
		
		try {
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userid);
			pstmt.setString(2, userphone);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				mid = rs.getString("userpw");
			}
				
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mid;
	}
	
	////////////////////////////////////////////////
	
	public MemberDTO getUser(String userid) {//하나의 글 내용을 불러오는 함수
		String SQL="SELECT * from userdb where userid = ?";
		try {
			PreparedStatement pstmt=conn.prepareStatement(SQL);
			pstmt.setString(1, userid);//물음표
			rs = pstmt.executeQuery();//select
			if(rs.next()) {//결과가 있다면
				MemberDTO user = new MemberDTO();
				user.setID(rs.getString(1));//첫 번째 결과 값
				user.setPW(rs.getString(2));
				user.setNAME(rs.getString(3));
				user.setGENDER(rs.getString(4));
				user.setEMAIL(rs.getString(5));
				return user;//6개의 항목을 user인스턴스에 넣어 반환한다.
			}			
		} catch(Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
    ////////////////////////////////////////////////
	
	public int update(String userid, String userpw, String username, String usergender, String useremail ) {
		String SQL="update userdb set userpw = ?, username = ?, usergender = ?, useremail = ? where userid = ?";//특정한 아이디에 해당하는 제목과 내용을 바꿔준다. 
		try {
			PreparedStatement pstmt=conn.prepareStatement(SQL);
			pstmt.setString(1, userpw);
			pstmt.setString(2, username);
			pstmt.setString(3, usergender);
			pstmt.setString(4, useremail);
			pstmt.setString(5, userid);
			return pstmt.executeUpdate();		
		} catch(Exception e) {
			e.printStackTrace();
		}
		return -1;//데이터베이스 오류
	}
	
    ////////////////////////////////////////////////
	
	public int delete(String userid) {
		String SQL="delete from userdb where userid = ?";//특정한 아이디에 해당하는 제목과 내용을 바꿔준다. 
		try {
			PreparedStatement pstmt=conn.prepareStatement(SQL);
			pstmt.setString(1, userid);
			return pstmt.executeUpdate();
		} 
		catch(Exception e) {
			e.printStackTrace();
		}
		return -1;//데이터베이스 오류
	}
	
	/////////////////////////////////////////////
	
	public UserDAO() {//mysql에 접속을 하게 해줌,자동으로 데이터베이스 커넥션이 일어남
		try {//예외처리
			String dbURL = "jdbc:mysql://localhost:3306/BBS?serverTimezone=UTC";
			String dbID="root";
			String dbPasseord="1248";
			Class.forName("com.mysql.jdbc.Driver");//mysql드라이버를 찾는다.
			//드라이버는 mysql에 접속할 수 있도록 매개체 역할을 하는 하나의 라이브러리
			conn=DriverManager.getConnection(dbURL,dbID,dbPasseord);
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
/////////////////////////////////////////////
	
	public int login1(String userid, String userpw) {//로그인을 시도하는 함수
		String SQL="SELECT userpw FROM userdb WHERE userid = ?";
		try {
			pstmt=conn.prepareStatement(SQL);
			pstmt.setString(1,userid);//아이디가 일치하면 비밀번호를 가져온다.
			rs = pstmt.executeQuery();//rs에 실행한 결과를 넣어준다.
			if(rs.next()) {//결과가 존재한다면
				if(rs.getString(1).equals(userpw))//sql문장을 실행해서 나온 결과와 접속을 시도했던 passwd비교
					return 1;//로그인 성공
				else
					return 0; //비밀번호 불일치
			}
			return -1;//아이디가 없음,rs의 결과가 존재 하지 않음
		} 
		catch(Exception e) {
			e.printStackTrace();
		}
		return -2; //데이터베이스 오류
	}

	
	
}







