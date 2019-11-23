package movieinfomation;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;

public class MaxMovie {
	public String getMaxMovie() {
		String content="";
		try {
			String addr = "http://www.maxmovie.com/chart/boomup/history";
			URL url = new URL(addr);
			HttpURLConnection con = (HttpURLConnection)url.openConnection();
			con.setConnectTimeout(30000);
			BufferedReader br = new BufferedReader(new InputStreamReader(con.getInputStream()));
			StringBuilder sb = new StringBuilder();
			while(true) {
				String line = br.readLine();
				if(line == null) {
					break;
				}
				sb.append(line + "\n");
			}
			content = sb.toString();
			br.close();
			con.disconnect();
		}catch(Exception e) {
			System.out.println(e.getMessage());
		}
		System.out.println(content);
		return content;
	}
}
