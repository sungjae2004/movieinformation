<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>Insert title here</title>
</head>
<body>
	<h4>게시글이 삭제되었습니다.<br/>
	5초 후에 감상평 목록으로 이동합니다.</h4>
</body>
<script>
	setTimeout(function(){
		location.href = 'boardlist.jsp'
	}, 5000)
</script>
</html>