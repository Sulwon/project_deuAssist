package todolist;
import java.io.IOException;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;

public class Todo {

	private String userID;
	private String object1;
	private String object2;
	private String object3;
	private String object4;
	private String object5;
	private String object6;
	private String object7;
	private String object8;
	private String object9;
	private String object10;

	public String Crawling(int want) throws IOException {
		String URL = "https://search.naver.com/search.naver?sm=tab_hty.top&where=nexearch&query=%EB%B6%80%EC%82%B0%EC%A7%84%EA%B5%AC+%EB%82%A0%EC%94%A8&oquery=%EA%B8%B0%EC%83%81%EC%B2%AD&tqi=hjVSgsp0J14ssunNlXGssssst3Z-260274";
		Document doc = Jsoup.connect(URL).get();
		if (want == 1) { //현재 온도
			Elements get_today_weather = doc.getElementsByClass("weather_info").select("div.temperature_text");		
			String str = get_today_weather.text();
			String[] split = str.split(" 예");
			str = split[0];
			split = str.split("현재 온도");
			str = split[1];
			return str;
		} else if (want == 2) { //맑음, 흐림
			Elements get_today_weather = doc.getElementsByClass("weather before_slash");		
			String str = get_today_weather.text();
			switch(str) {
				case "맑음":
					str = "1";
					break;
				case "구름적음":
					str = "2";
					break;
				case "구름많음":
					str = "2";
					break;
				case "흐림":
					str = "3";
					break;
				case "비":
					str = "4";
					break;
				case "눈":
					str = "5";	
					break;		
				default:
					str = "1";
					break;
			}
			return str;
		} else { //강수 확률, 습도, 바람
			Elements get_today_weather = doc.getElementsByClass("summary_list");		
			String str = get_today_weather.text();
			String[] split = str.split(" 강수확률");
			str = split[0];
			str = str.replace("[ ]", "\n");
			return str;	
		}
	}
	
	public String getObject(int select_num) {
		switch(select_num) {
			case 1:
				return object1;
			case 2:
				return object2;
			case 3:
				return object3;
			case 4:
				return object4;
			case 5:
				return object5;
			case 6:
				return object6;
			case 7:
				return object7;
			case 8:
				return object8;
			case 9:
				return object9;
			case 10:
				return object10;
			default:
				return "에러";
		}
		
	}
	
	public String getUserID() {
		return userID;
	}
	public void setUserID(String userID) {
		this.userID = userID;
	}
	public String getObject1() {
		return object1;
	}
	public void setObject1(String object1) {
		this.object1 = object1;
	}
	public String getObject2() {
		return object2;
	}
	public void setObject2(String object2) {
		this.object2 = object2;
	}
	public String getObject3() {
		return object3;
	}
	public void setObject3(String object3) {
		this.object3 = object3;
	}
	public String getObject4() {
		return object4;
	}
	public void setObject4(String object4) {
		this.object4 = object4;
	}
	public String getObject5() {
		return object5;
	}
	public void setObject5(String object5) {
		this.object5 = object5;
	}
	public String getObject6() {
		return object6;
	}
	public void setObject6(String object6) {
		this.object6 = object6;
	}
	public String getObject7() {
		return object7;
	}
	public void setObject7(String object7) {
		this.object7 = object7;
	}
	public String getObject8() {
		return object8;
	}
	public void setObject8(String object8) {
		this.object8 = object8;
	}
	public String getObject9() {
		return object9;
	}
	public void setObject9(String object9) {
		this.object9 = object9;
	}
	public String getObject10() {
		return object10;
	}
	public void setObject10(String object10) {
		this.object10 = object10;
	}
	
}
