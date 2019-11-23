<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>영화 검색</title>

<style>

.image {
	height: 726px;
	background:
		moive.jpg
		no-repeat center center;
	-webkit-background-size: cover;
	-moz-background-size: cover;
	-o-background-size: cover;
	background-size: cover;
	background-position: center;
}

body {
	background: #654ea3; /* fallback for old browsers */
	background: -webkit-linear-gradient(to right, #eaafc8, #654ea3);
	/* Chrome 10-25, Safari 5.1-6 */
	background: linear-gradient(to right, #eaafc8, #654ea3);
	/* W3C, IE 10+/ Edge, Firefox 16+, Chrome 26+, Opera 12+, Safari 7+ */
}

form {
	display: inline-block;
	width: 600px;
	height: 60px;
	border: 3px solid black;
	background: whizte;
}

.input_text {
	width: 348px;
	height: 21px;
	margin: 6px 0 0 9px;
	border: 0;
	line-height: 21px;
	font-weight: bold;
	font-size: 16px;
	outline: none;
}

.sch_smit {
	width: 54px;
	height: 21px;
	margin: 0;
	border: 0;
	vertical-align: top;
	background: black;
	color: white;
	font-weight: bold;
	border-radius: 1px;
	cursor: pointer;
}

.sch_smit:hover {
	background: green;
}
</style>


</head>
<body>
	<h1 align="center">영화 검색화면</h1>
	<div align="center">

		<form action="movielist.jsp">
			<br /> <select name="searchtype">
				<option value="title">영화명</option>
				<option value="director">감독이름</option>
				<option value="actor">배우명</option>
				<option value="keyword">영화 키워드</option>
				<option value="genre">영화 장르</option>
			</select> <input type="text" name="searchtext" size="30" required="required" />

			<button type='submit' class='sch_smit'>검색</button>
		</form>
	</div>

	<p align="center">
		<img src="images/movie.jpg" width="400" height="400" />
	</p>
	<p align="center">
	한국영화 데이터베이스 api사용
	</p>
</body>
</html>
