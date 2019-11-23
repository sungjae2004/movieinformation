<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page
	import="java.net.*, java.io.*,  javax.xml.parsers.*,  org.w3c.dom.*"%>
<%
	String xml = ""; 
	String searchtype = request.getParameter("searchtype");
	String searchtext = request.getParameter("searchtext");
	StringBuilder sb = new StringBuilder();
	String addr = "http://api.koreafilm.or.kr/openapi-data2/wisenut/search_api/search_xml.jsp?collection=kmdb_new&detail=N&" + searchtype + "=" + URLEncoder.encode(searchtext, "utf-8") + "&ServiceKey=CC0996869UG6I499BZI8";
	
	URL url = new URL(addr);
	
	HttpURLConnection conn = (HttpURLConnection)url.openConnection();
	if (conn != null) {
	conn.setConnectTimeout(10000);
	conn.setUseCaches(false);
	if (conn.getResponseCode() ==
	HttpURLConnection.HTTP_OK) {
	BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream(), "utf-8"));

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
	xml = sb.toString();

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
</head>
<body>


	<%
	
if (xml != null) {
	//DOM - XML 파싱을 위한 객체를 생성
	DocumentBuilderFactory factory =
	DocumentBuilderFactory.newInstance();
	DocumentBuilder documentBuilder =
	factory.newDocumentBuilder();
	//문자열을 스트림으로 변환
	InputStream is = new ByteArrayInputStream(xml.getBytes("utf-8"));
	//파싱을 할 수 있도록 메모리에 모두 펼침
	Document doc = documentBuilder.parse(is);
	//루트를 찾아서 element에 저장
	Element element = doc.getDocumentElement();
	//tmx 태그를 전부 찾아서 items에 저장
	NodeList items = element.getElementsByTagName("Row");
	int n = items.getLength();
	
	out.println("<table class='table table-striped'>");
	out.println("<table align='center' border='1' width='1200'>");
	out.println("<tr><th width='20%'>영화제목</th><th width='60%'>줄거리</th></tr>");
	for (int i = 0; i < n; i++) {
		Node item = items.item(i);
		NodeList childeren = item.getChildNodes();
		for(int a = 0; a < childeren.getLength(); a++){
			
			Node node = childeren.item(a);
			String actor = "";
			if(node.getNodeType() == Node.ELEMENT_NODE){
				Element ele = (Element)node;
				String nodeName2 = ele.getNodeName();
				if(nodeName2.equals("title")){
					out.println("<tr>");
					out.println("<td>");
					Node text = ele.getFirstChild();
					String itemValue = text.getNodeValue();
					out.println(itemValue);
					out.println("</td>");
				}
				
				else if(nodeName2.equals("actors")){
					Node text = ele.getFirstChild();
					String itemValue = text.getNodeValue();
					actor = actor + itemValue + " ";
				}
				else if(nodeName2.equals("posterUrl")){
					Node text = ele.getFirstChild();
					String itemValue = text.getNodeValue();
					System.out.println(itemValue);
				}
				else if(nodeName2.equals("plot")){
					
					out.println("<td>");
					Node text = ele.getFirstChild();
					String itemValue = text.getNodeValue();
					out.println(itemValue);
					out.println("</td>");
					out.println("</tr>");
					
				}
			}
			
		}	
		
	}
	out.println("</table>");
}

%>


</body>
</html>