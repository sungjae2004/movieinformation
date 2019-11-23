<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>게시물 상세보기</title>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<style>
div {height =500px;
	
}

</style>
</head>
<body>

	<h1 align="center">게시물 상세보기</h1>
	<div>
		<table align="center" border="1" class="table table-bordered">

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
int no = Integer.parseInt(request.getParameter("no"));
String refresh = request.getParameter("refresh");
PreparedStatement pstmt = null;
if(refresh == null){
	pstmt = con.prepareStatement(
		"update board set hit = hit + 1 where no = ?");
	pstmt.setInt(1, no);
	pstmt.executeUpdate();
	pstmt.close();
}
pstmt = con.prepareStatement(
		"select * from board where no = ?");
pstmt.setInt(1, no);

ResultSet rs = pstmt.executeQuery();
if(rs.next()){
	out.println("<tr><td width='20%'>&nbsp;&nbsp;제목</td><td width='80%'>&nbsp;&nbsp;" + rs.getString("title") +"</td></tr>");
	out.println("<tr><td width='20%'>&nbsp;&nbsp;작성자 이메일</td><td width='80%'>&nbsp;&nbsp;" + rs.getString("email") +"</td></tr>");
	out.println("<tr><td width='20%'>&nbsp;&nbsp;조회수:" + rs.getInt("hit") + "</td><td width='80%'>&nbsp;&nbsp; 작성일:" + rs.getString("regdate") +"</td></tr>");
	out.println("<tr><td width='20%'>&nbsp;&nbsp;내용</td><td width='80%'>&nbsp;&nbsp;" + rs.getString("content") +"</td>");
	out.println("<tr><td colspan='2' align='center'>&nbsp;&nbsp;"+"<a href='boardupdate.jsp?no=" + rs.getInt("no") +"'>수정</a>&nbsp;&nbsp;" + 
	"<a href='boardremove.jsp?no=" + rs.getInt("no") +"'>삭제</a>" +"</td></tr>");
	
}
rs.close();
pstmt.close();

%>

		</table>
	</div>
	
	<div><h3>댓글 목록</h3><table>
				<%
pstmt = con.prepareStatement(
		"select * from reply where no = ? order by replyno desc");
pstmt.setInt(1, no);

rs = pstmt.executeQuery();
while(rs.next()){
	out.println("<tr><td>" + rs.getString("email") + ":" + rs.getString("content") +"</td></tr>");
	out.println("<tr></tr>");
}
rs.close();
pstmt.close();
con.close();
%>
</table>
</div>
<table>
<form action="replywriteprocess.jsp">
	<input type='hidden' name="no" value='<%=no%>' />
	<tr>
	<td align='right'>이메일</td><td><input type="email" length="40" required="required" name="email"/></td></tr>
	<tr>
	<td align='right'>댓글</td><td><textarea name="content" rows="3" cols="40" required='required'></textarea> </td></tr>
	<tr><td colspan='2' align='right'><input type="submit" value="댓글작성" /></td></tr>
</form>
</table>
</body>
</html>


