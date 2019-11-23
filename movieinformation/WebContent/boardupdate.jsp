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
		"select * from board where no = ?");
pstmt.setInt(1, no);

ResultSet rs = pstmt.executeQuery();
rs.next();
String title = rs.getString("title");
String email = rs.getString("email");
String content = rs.getString("content");
String password = rs.getString("password");

rs.close();
pstmt.close();
con.close();
%>

<!DOCTYPE html>
<html>
<head>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>


<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>글쓰기</title>
</head>
<body>
<form action="boardupdateprocess.jsp" id='updateform' method="post">
	<table>
		<thead>
			<caption><h3>영화 감상평</h3></caption>
			<div id='disp'></div>
			<input type='hidden' name='no' value=<%=no %> />
		</thead>
		<tbody>
			
				<tr>
					<th>제목:</th>
					<td><input type="text"  name="title" value=<%=title %>
						size="100" required="required" /></td>
				</tr>
				<tr>
					<th>내용:</th>
					<td><textarea rows="15" cols="100" 
							name="content"><%=content %></textarea></td>
				</tr>
				<tr>
					<th>작성자 이메일:</th>
					<td><input type="email" name="email" required="required"
						value = '<%=email %>' /></td>
				</tr>
				<tr>
					<th>비밀번호:</th>
					<td><input type="password" id="password" name="password" required="required"
						placeholder="비밀번호를 입력하세요" /></td>
				</tr>
				<tr>
					<td colspan="2">
					<input class="btn btn-default" type="submit" value="수정" /> 
					<input class="btn btn-default" type="reset" value="다시 작성" /> 
					<input class="btn btn-default" type="button" value="글 목록으로... "onclick="javascript:location.href='boardlist.jsp'" />
					</td>
				</tr>
			
		</tbody>

	</table>
</form>

<script>
	var pw = '<%=password %>'
	document.getElementById('updateform').addEventListener('submit', function(e){
		var password = document.getElementById('password');
		if(password.value != pw){
			document.getElementById('disp').innerHTML = '비밀번호가 일치하지 않으면 수정되지 않습니다.'
			e.preventDefault();
			return false;
		}
	})
</script>

</body>
</html>








