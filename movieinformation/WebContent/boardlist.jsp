<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>게시물 목록</title>
<style>
	div{
		height=500px;
	}
	table.type09 {
    border-collapse: collapse;
    text-align: left;
    line-height: 1.5;

}
table.type09 thead th {
    padding: 10px;
    font-weight: bold;
    vertical-align: top;
    color: #369;
    border-bottom: 3px solid #036;
}
table.type09 tbody th {
    width: 150px;
    padding: 10px;
    font-weight: bold;
    vertical-align: top;
    border-bottom: 1px solid #ccc;
    background: #f3f6f7;
}
table.type09 td {
    width: 350px;
    padding: 10px;
    vertical-align: top;
    border-bottom: 1px solid #ccc;
}
</style>
</head>
<body>
<h1 align="center">게시물 목록</h1>
<div>
<table class="type09" align="center" border="1">
<tr>
	<th width="50%">제목</th>
	<th width="40%">작성자 이메일</th>
	<th width="10%">조회수</th>
</tr>	
<%
//MySQL 드라이버 로드
Class.forName("com.mysql.jdbc.Driver");
// 데이터베이스 접속 객체 생성
Connection con = DriverManager.getConnection(
		                      // 서버주소/포트번호/데이터베이스 이름
		 "jdbc:mysql://localhost:3306/sungjae4251?useUnicode=true&characterEncoding=UTF-8", "sungjae4251", "sungjae2004"
		);
// 입력한 데이터 가져오기
request.setCharacterEncoding("utf-8");

PreparedStatement pstmt = con.prepareStatement(
		"select * from board order by regdate desc");

ResultSet rs = pstmt.executeQuery();
while(rs.next()){
	out.println("<tr><td>&nbsp;&nbsp;<a href='boarddetail.jsp?no=" + rs.getInt("no") + "'>" + rs.getString("title") + "</a></td>");
	out.println("<td>&nbsp;&nbsp;" + rs.getString("email") + "</td>");
	out.println("<td align='right'>" + rs.getString("hit") + "</td></tr>");
}
pstmt.close();
con.close();
%>
</table>	

</div>
</body>
</html>