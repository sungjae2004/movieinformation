<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%
//MySQL 드라이버 로드
Class.forName("com.mysql.jdbc.Driver");
// 데이터베이스 접속 객체 생성
Connection con = DriverManager.getConnection(
		                      // 서버주소/포트번호/데이터베이스 이름
		 "jdbc:mysql://localhost:3306/sungjae4251?useUnicode=true&characterEncoding=UTF-8", "sungjae4251", "sungjae2004"
		);
// 입력한 데이터 가져오기
int no = Integer.parseInt(request.getParameter("no"));
request.setCharacterEncoding("utf-8");
String content = request.getParameter("content");
if(content.trim().length() == 0){
	content = "냉무";
}
String email = request.getParameter("email");
PreparedStatement pstmt = con.prepareStatement(
		"insert into reply(no, content, email, regdate) values(?,?,?,curdate())");
pstmt.setInt(1, no);
pstmt.setString(2, content);
pstmt.setString(3, email);
pstmt.executeUpdate();

pstmt.close();
con.close();

response.sendRedirect("boarddetail.jsp?no=" + no + "&refresh=1");
%>

