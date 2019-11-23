<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>	
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
PreparedStatement pstmt = con.prepareStatement(
		"select password from board where no = ?");
pstmt.setInt(1, no);

ResultSet rs = pstmt.executeQuery();
rs.next();
String password = rs.getString("password");

rs.close();
pstmt.close();
con.close();
%>

<!DOCTYPE html>
<html>
<head>
<style>
.btn {
	display: block;
	border: 1px #3399dd solid;;
	margin: 15px auto;
	background-color: #66aaff;
	text-align: center;
	cursor: pointer;
	color: #333;
	transition: all 0.9s, color 0.3;
}

.btn:hover {
	color: #fff;
}

.hover4:hover {
	box-shadow: 200px 0 0 0 rgba(0, 0, 0, 0.25) inset,
	-200px 0 0 0 rgba(0, 0, 0, 0.25) inset;
}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>글삭제</title>
</head>
<body>
<form action="boardremoveprocess.jsp" id='deleteform' method="post">
	<table>
		<thead>
			<caption><h3>감상평 삭제</h3></caption>
			<div id='disp'></div>
			<input type='hidden' name='no' value=<%=no %> />
		</thead>
		<tbody>
				<tr>
					<th>비밀번호:</th>
					<td><input type="password" id="password" name="password" required="required"
						placeholder="비밀번호를 입력하세요" /></td>
				</tr>
				<tr>
					<td colspan="2">
					<input class="btn hover4" type="submit" value="삭제" /> 
					<input class="btn hover4" type="button" value="글 목록으로... "onclick="javascript:location.href='boardlist.jsp'" />
					</td>
				</tr>
			
		</tbody>

	</table>
</form>

<script>
	var pw = '<%=password %>'
	document.getElementById('deleteform').addEventListener('submit', function(e){
		var password = document.getElementById('password');
		if(password.value != pw){
			document.getElementById('disp').innerHTML = '비밀번호가 일치하지 않으면 삭제되지 않습니다.'
			e.preventDefault();
			return false;
		}
	})
</script>

</body>
</html>








