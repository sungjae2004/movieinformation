<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<style>
.btn {
	display: block;
	border: 1px #3399dd solid;;
	
	text-align: center;
	cursor: pointer;
	color: #333;
	transition: all 0.9s, color 0.3;
}

.btn:hover {
	color: #ffffff;
}

.hover4:hover {
	box-shadow: 200px 0 0 0 rgba(0, 0, 0, 0.25) inset,
	-200px 0 0 0 rgba(0, 0, 0, 0.25) inset;
}

</style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>글쓰기</title>
</head>
<body>
	<table >
		<thead>
			<caption><h3>영화 감상평</h3></caption>
		</thead>
		
			<form action="boardwriteprocess.jsp" method="post">
				<tr>
					<th>제목:</th>
					<td><input type="text" class="form-control" placeholder="제목을 입력하세요." name="title"
						size="100" required="required" /></td>
				</tr>
				<tr>
					<th>내용:</th>
					<td><textarea class="form-control"  rows="15" cols="100" placeholder="내용을 입력하세요."
							name="content"></textarea></td>
				</tr>
				<tr>
					<th>작성자 이메일:</th>
					<td><input class="form-control" type="email" name="email" required="required"
						placeholder="이메일을 입력하세요. " /></td>
				</tr>
				<tr>
					<th>비밀번호:</th>
					<td><input class="form-control" type="password" name="password" required="required"
						placeholder="비밀번호를 입력하세요" /></td>
				</tr>
				<tr>
					<td colspan="2" align='center'>
					<p>
					<input  class="btn btn-default" type="submit" value="등록" /> 
					<input  class="btn btn-default" type="reset"value="reset" /> 
					<input  class="btn btn-default" type="button" value="글 목록으로... "onclick="javascript:location.href='boardlist.jsp'" />
					</p>
					</td>
				</tr>
			</form>
	</table>
</body>
</html>