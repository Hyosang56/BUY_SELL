package member.bean;

public class MemberDTO {
	
	private String userid;
	private String userpw;
	private String username;
	private String usergender;
	private String useremail;
	private String userdob;
	private String userphone;
	
	public String getID() {
		return userid;
	}
	public void setID(String id) {
		this.userid = id;
	}
	
	public String getPW() {
		return userpw;
	}
	public void setPW(String pw) {
		this.userpw = pw;
	}
	
	public String getNAME() {
		return username;
	}
	public void setNAME(String name) {
		this.username = name;
	}
	
	public String getGENDER() {
		return usergender;
	}
	public void setGENDER(String gender) {
		this.usergender = gender;
	}
	
	public String getEMAIL() {
		return useremail;
	}
	public void setEMAIL(String email) {
		this.useremail = email;
	}
	
	public String getDOB() {
		return userdob;
	}
	public void setDOB(String dob) {
		this.userdob = dob;
	}
	
	public String getPHONE() {
		return userphone;
	}
	public void setPHONE(String phone) {
		this.userphone = phone;
	}


}