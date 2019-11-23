<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page
	import="java.util.*, java.net.*, java.io.*, org.json.simple.*, org.json.simple.parser.*,javax.xml.parsers.* ,org.w3c.dom.*, java.text.*"%>

<%
	// json 파싱
	String json = ""; 
	StringBuilder sb = new StringBuilder();
	
	Calendar cal  = Calendar.getInstance();
	long time = cal.getTimeInMillis() - 86400000;
	Date d = new Date(time);
	SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
	String today = sdf.format(d);
	
	
	String addr = "http://www.kobis.or.kr/kobisopenapi/webservice/rest/boxoffice/searchDailyBoxOfficeList.json?key=52fcb7fa8d01b68705930bb894f1b1ac&targetDt=" + today;
	
	URL url = new URL(addr);
	
	HttpURLConnection conn = (HttpURLConnection)url.openConnection();
	if (conn != null) {
	conn.setConnectTimeout(10000); //서버에 연결되는 Timeout 시간 설정
	conn.setUseCaches(false);// InputStream 읽어 오는 Timeout 시간 설정
	if (conn.getResponseCode() ==
	HttpURLConnection.HTTP_OK) {
		BufferedReader br = new BufferedReader(new InputStreamReader((InputStream)conn.getContent(), "UTF-8"));
	
	while (true) {
		String line = br.readLine();
		if (line == null)
			break;
		sb.append(line + '\n');
	}
		br.close();
	}
		conn.disconnect();
	}
	json = sb.toString();
	JSONParser jsonParse = new JSONParser();

	JSONObject jsonList = (JSONObject)jsonParse.parse(json);
	JSONObject boxOfficeResult = (JSONObject)jsonList.get("boxOfficeResult");
	JSONArray dailyBoxOfficeList = (JSONArray)boxOfficeResult.get("dailyBoxOfficeList");
	
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>영화 목록</title>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<style>
</style>
</head>
<body>
<div>
	<h1>
		영화 평점 사이트
	</h1>
	<p>
		<a href="https://movie.naver.com/movie/point/af/list.nhn?target=after">네이버 영화 평점사이트</a>
	</p>
	</div>		
	<div>
		<table border="1" class="table table-hover">
			<tr>
				<th>순위</th>
				<th>영화제목</th>
			</tr>
			<%
	for(int i=0; i < dailyBoxOfficeList.size(); i++) 
	{ 
		out.println("<tr>");
		JSONObject bookObject = (JSONObject)dailyBoxOfficeList.get(i); 
		out.println("<td>" + bookObject.get("rnum") + "</td>"); 
		out.println("<td>" + bookObject.get("movieNm") + "</td>");
		out.println("</tr>");
	} 
	out.println("</table>");
	
	String xml = "";
	try {
		url = new URL("http://175.125.91.94/openapi/service/rest/meta/KFApost");
		conn = (HttpURLConnection) url.openConnection();
		sb = new StringBuilder();
		if (conn != null) {
			conn.setConnectTimeout(10000);
			conn.setUseCaches(false);
			
			if (conn.getResponseCode() == HttpURLConnection.HTTP_OK) {
				BufferedReader br = new BufferedReader(new InputStreamReader((InputStream)conn.getContent(), "UTF-8"));
				while (true) {
					String line = br.readLine();
					if (line == null)
						break;
					sb.append(line + '\n');
				}
				br.close();
			}
			conn.disconnect();
			xml = sb.toString();
		}
	}
	catch (Exception e) {
		System.out.printf("SampleHTTPClient",	"Exception in processing response.", e);
	}
	String imageList = "";
	if (xml != null) {
		//DOM - XML 파싱을 위한 객체를 생성
		DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
		DocumentBuilder documentBuilder = factory.newDocumentBuilder();
		//문자열을 스트림으로 변환
		InputStream is = new ByteArrayInputStream(xml.getBytes("utf-8"));
		//파싱을 할 수 있도록 메모리에 모두 펼침
		Document doc = documentBuilder.parse(is);
		//루트를 찾아서 element에 저장
		Element element = doc.getDocumentElement();
		//tmx 태그를 전부 찾아서 items에 저장
		NodeList items = element.getElementsByTagName("referenceIdentifier");
		int n = items.getLength();
		
		
		for (int i = 0; i < n; i++) {
			Node item = items.item(i);
			Node text = item.getFirstChild();
			String itemValue = text.getNodeValue();
			if(i == n-1){
				imageList = imageList + itemValue;
			}else{
				imageList = imageList + itemValue + ",";
			}
		}
	}
	%>
	</table>
	</div>
	
	<p align='center'>
		<img id='img' width="200" height="200" />
	</p>
	
</body>


</html>