package com.naedam.mir9.community.model.service;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.naedam.mir9.community.model.dao.CommunityDao;
import com.naedam.mir9.community.model.vo.Review;
import com.naedam.mir9.community.model.vo.ReviewImg;

import net.sf.json.JSONObject;

@Service
public class CommunityServiceImpl implements CommunityService {
	@Autowired
	private CommunityDao communityDao;

	// 리뷰 조회 + 검색
	@Override
	public List<Review> reviewList(Map<Object, String> param) {
		return communityDao.reviewList(param);
	}

	// 모달 정보
	@Override
	public List<Review> reviewModal(int reviewCode) {
		return communityDao.reviewModal(reviewCode);
	}

	// 모달 이미지
	@Override
	public List<ReviewImg> reviewImgModal(int reviewCode) {
		return communityDao.reviewImgModal(reviewCode);
	}

	// 카테고리 조회
	@Override
	public int selectCategory(String reviewCode) {
		return communityDao.selectCategory(reviewCode);
	}	
	
	// 이미지 삭제
	@Override
	public int imgDelete(String reviewCode) {
		return communityDao.imgDelete(reviewCode);
	}	
	
	// 리뷰 삭제
	@Override
	public int selectDelete(String reviewCode) {
		return communityDao.selectDelete(reviewCode);
	}

	// sms 기본 문구(78519)
	@Override
	public HashMap<String, Object> originSms(String smsKey, String smsSecret) {
		
		HashMap<String, Object> originSms = new HashMap<>();
		String getUrl = "https://api-sms.cloud.toast.com/sms/v3.0/appKeys/" + smsKey + "/templates?categoryId=78519&pageSize=24";
		
		try {
			// url
			URL url = new URL(getUrl);
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();	
			
			// method
			conn.setRequestMethod("GET");
			
			// headers
			conn.setRequestProperty("Content-Type", "application/json; charset=UTF-8");
			conn.setRequestProperty("X-Secret-Key", smsSecret);
			
			// 결과값 받기
			BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream(), "UTF-8"));
			
			String line = "";
			String result = "";
			
			while((line = br.readLine()) != null) {
				result += line;
			}
			
			/* 확인
			System.out.println("=====Service:response=====");
			System.out.println(result);
			*/
			
			// JsonParser
			JsonParser parser = new JsonParser();
			JsonElement element = parser.parse(result);
			
			// JSON>body>data에 접근
			JsonObject bodyElement = element.getAsJsonObject().get("body").getAsJsonObject();
			JsonArray data = bodyElement.getAsJsonObject().get("data").getAsJsonArray();

			// templateId, body 값을 담을 List 선언
			List<String> templateId = new ArrayList<>();
			List<String> body = new ArrayList<>();;
			
			for(int i = 0; i < data.size(); i++) {
				templateId.add((data.getAsJsonArray().get(i).getAsJsonObject()).get("templateId").getAsString());
			}
			for(int i = 0; i < data.size(); i++) {
				body.add((data.getAsJsonArray().get(i).getAsJsonObject()).get("body").getAsString());			
			}
			
			/* 확인
			System.out.println("=====Service:templateId=====");
			System.out.println(templateId); 
			System.out.println("=====Service:body=====");
			System.out.println(body);
			*/
			
			originSms.put("templateId", templateId);
			originSms.put("body", body);
			
			/* 확인
			System.out.println("=====Service:originSms=====");
			System.out.println(originSms); 
			*/

		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return originSms;
	}

	// sms 저장 문구(78520)
	@Override
	public HashMap<String, Object> savedSms(String smsKey, String smsSecret) {
		
		HashMap<String, Object> savedSms = new HashMap<>();
		String getUrl = "https://api-sms.cloud.toast.com/sms/v3.0/appKeys/" + smsKey + "/templates?categoryId=78520&pageSize=24";
		
		try {
			// url
			URL url = new URL(getUrl);
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();	
			
			// method
			conn.setRequestMethod("GET");
			
			// headers
			conn.setRequestProperty("Content-Type", "application/json; charset=UTF-8");
			conn.setRequestProperty("X-Secret-Key", smsSecret);
			
			// 결과값 받기
			BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream(), "UTF-8"));
			
			String line = "";
			String result = "";
			
			while((line = br.readLine()) != null) {
				result += line;
			}
			
			/* 확인
			System.out.println("=====Service:response=====");
			System.out.println(result);
			*/
			
			// JsonParser
			JsonParser parser = new JsonParser();
			JsonElement element = parser.parse(result);
			
			// JSON>body>data에 접근
			JsonObject bodyElement = element.getAsJsonObject().get("body").getAsJsonObject();
			JsonArray data = bodyElement.getAsJsonObject().get("data").getAsJsonArray();
			
			// templateId, body 값을 담을 List 선언
			List<String> savedTemplateId = new ArrayList<>();
			List<String> savedBody = new ArrayList<>();
			
			for(int i = 0; i < data.size(); i++) {
				savedTemplateId.add((data.getAsJsonArray().get(i).getAsJsonObject()).get("templateId").getAsString());
			}
			for(int i = 0; i < data.size(); i++) {
				savedBody.add((data.getAsJsonArray().get(i).getAsJsonObject()).get("body").getAsString());			
			}
			
			/* 확인
			System.out.println("=====Service:savedTemplateId=====");
			System.out.println(savedTemplateId); 
			System.out.println("=====Service:body=====");
			System.out.println(body);
			*/
			
			savedSms.put("savedTemplateId", savedTemplateId);
			savedSms.put("savedBody", savedBody);
			
			/* 확인
			System.out.println("=====Service:originSms=====");
			System.out.println(savedSms);
			*/
			
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return savedSms;	
	}

	// sms 문구 수정
	@Override
	public int updateSms(String smsKey, String smsSecret, String code, String content) {
		
		int result = 0;
		String codeMod = code.concat("_mod");
		
		// 수정용
		String put = "https://api-sms.cloud.toast.com/sms/v3.0/appKeys/" + smsKey + "/templates/" + codeMod;
		// 응답용
		String get = "https://api-sms.cloud.toast.com/sms/v3.0/appKeys/" + smsKey + "/templates/" + codeMod;

		try {
			// url
			URL putUrl = new URL(put); 
			HttpURLConnection putConn = (HttpURLConnection) putUrl.openConnection(); 
			
			// method
			putConn.setRequestMethod("PUT");
			
			// header
			putConn.setRequestProperty("Content-Type", "application/json; charset=UTF-8");
			putConn.setRequestProperty("X-Secret-Key", smsSecret);
			
			// doOutput : OutputStream으로 데이터를 넘겨주겠다
			putConn.setDoOutput(true);
			
			// data
			JsonObject json = new JsonObject();
			json.addProperty("templateName", codeMod); // 템플릿ID
			json.addProperty("sendNo", "01042026201"); // 발신 번호
			json.addProperty("sendType", "0"); // 발송 유형
			json.addProperty("body", content); // 문구 내용
			json.addProperty("useYn", "Y"); // 사용 유무
			
			// 데이터 전송 준비
			OutputStreamWriter os = new OutputStreamWriter(putConn.getOutputStream());
			os.write(json.toString());
			os.flush();
			os.close();
			
			int responseCode = putConn.getResponseCode();
			String responseMsg = putConn.getResponseMessage();
			
			/*
			System.out.println("=====Service:responseCode=====");
			System.out.println(responseCode); // 200	
			*/
			
			// PUT 요청에 대한 응답 GET 요청
			URL getUrl = new URL(get);
			HttpURLConnection getConn = (HttpURLConnection) getUrl.openConnection();
			
			// method
			getConn.setRequestMethod("GET");
			
			// header
			getConn.setRequestProperty("Content-Type", "application/json; charset=UTF-8");
			getConn.setRequestProperty("X-Secret-Key", smsSecret);	
			
			// 응답데이터 얻기
			BufferedReader br = new BufferedReader(new InputStreamReader(getConn.getInputStream(), "UTF-8"));
			StringBuffer sb = new StringBuffer();
			// getInputStream() 메소드를 통해 응답 데이터를 읽을 수 있는 InputStream 객체를 얻을 수 있다
			// 응답을 문자열 타입으로 얻기 위해 BufferedReader 객체를 사용할 수 있다
			
			String line = "";
			String response = "";
			
			while((line = br.readLine()) != null) {
				sb.append(line);
			}

			response = sb.toString();
			br.close();

			// JsonParser
			JsonParser parser = new JsonParser();
			JsonElement element = parser.parse(response);
			
			// JSON>header>resultMessage에 접근
			JsonObject header = element.getAsJsonObject().get("header").getAsJsonObject();
			String str = header.getAsJsonObject().get("resultMessage").getAsString();
			
			/* 확인
			System.out.println("=====Service:header=====");
			System.out.println(header);
			System.out.println("=====Service:str=====");
			System.out.println(str);
			*/
			
			// 성공 시
			if(str.equals("success")) {
				result = 1;
			}
			
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	// mail 저장 문구 (49064)
	@Override
	public HashMap<String, Object> savedMail(String mailKey, String mailSecret, String templateId) {
		
		HashMap<String, Object> savedMail = new HashMap<>();
		String template = templateId.concat("_mod"); // 저장 템플릿명
		String getUrl = "https://api-mail.cloud.toast.com/email/v2.0/appKeys/" + mailKey + "/templates/" + template + "?categoryId=49064";

		try {
			// url
			URL url = new URL(getUrl);
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();	
			
			// method
			conn.setRequestMethod("GET");
			
			// headers
			conn.setRequestProperty("Content-Type", "application/json; charset=UTF-8");
			conn.setRequestProperty("X-Secret-Key", mailSecret);
			
			// 결과값 받기
			BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream(), "UTF-8"));
			
			String line = "";
			String result = "";
			
			while((line = br.readLine()) != null) {
				result += line;
			}
			
			/* 확인
			System.out.println("=====Service:response=====");
			System.out.println(result);
			*/
			
			// JsonParser
			JsonParser parser = new JsonParser();
			JsonElement element = parser.parse(result);
			
			// JSON>body>data>title, body에 접근
			JsonObject bodyElement = element.getAsJsonObject().get("body").getAsJsonObject();
			JsonObject data = bodyElement.getAsJsonObject().get("data").getAsJsonObject();
			 
			String title = (data.getAsJsonObject().getAsJsonObject()).get("title").getAsString();
			String body = (data.getAsJsonObject().getAsJsonObject()).get("body").getAsString();
			
			/* 확인
			System.out.println("=====Service:title=====");
			System.out.println(title); 
			System.out.println("=====Service:body=====");
			System.out.println(body);
			*/

			savedMail.put("title", title);
			savedMail.put("content", body);
			
			/* 확인
			System.out.println("=====Service:savedMail=====");
			System.out.println(savedMail); 
			*/

		} catch (IOException e) {
			e.printStackTrace();
		}
			
		return savedMail;
	}

	// mail 기본 문구 (48300)
	@Override
	public HashMap<String, Object> originMail(String mailKey, String mailSecret, String templateId) {
		
		HashMap<String, Object> originMail = new HashMap<>();
		String getUrl = "https://api-mail.cloud.toast.com/email/v2.0/appKeys/" + mailKey + "/templates/" + templateId + "?categoryId=48300";

		try {
			// url
			URL url = new URL(getUrl);
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();	
			
			// method
			conn.setRequestMethod("GET");
			
			// headers
			conn.setRequestProperty("Content-Type", "application/json; charset=UTF-8");
			conn.setRequestProperty("X-Secret-Key", mailSecret);
			
			// 결과값 받기
			BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream(), "UTF-8"));
			
			String line = "";
			String result = "";
			
			while((line = br.readLine()) != null) {
				result += line;
			}
			
			/* 확인
			System.out.println("=====Service:response=====");
			System.out.println(result);
			*/
			
			// JsonParser
			JsonParser parser = new JsonParser();
			JsonElement element = parser.parse(result);
			
			// JSON>body>data>title, body에 접근
			JsonObject bodyElement = element.getAsJsonObject().get("body").getAsJsonObject();
			JsonObject data = bodyElement.getAsJsonObject().get("data").getAsJsonObject();
			
			String title = (data.getAsJsonObject().getAsJsonObject()).get("title").getAsString();
			String body = (data.getAsJsonObject().getAsJsonObject()).get("body").getAsString();
			
			/* 확인
			System.out.println("=====Service:title=====");
			System.out.println(title); 
			System.out.println("=====Service:body=====");
			System.out.println(body);
			*/
			
			originMail.put("title", title);
			originMail.put("content", body);
			
			/* 확인
			System.out.println("=====Service:originMail=====");
			System.out.println(originMail); 
			*/
			
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return originMail;
	}

	// mail 문구 수정
	@Override
	public int modifyMail(String mailKey, String mailSecret, String templateId, String title, String content) {
	
		int result = 0;
		String template = templateId.concat("_mod");
		String putUrl = "https://api-mail.cloud.toast.com/email/v2.0/appKeys/" + mailKey + "/templates/" + template;
		
		try {
			// url
			URL url = new URL(putUrl);
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			
			// method
			conn.setRequestMethod("PUT");
			
			// header
			conn.setRequestProperty("Content-Type", "application/json; charset=UTF-8");
			conn.setRequestProperty("X-Secret-Key", mailSecret);
			
			// doOutput : OutputStream으로 데이터를 넘겨주겠다
			conn.setDoOutput(true);
			
			// data
			JsonObject json = new JsonObject();
			json.addProperty("templateName", template); // 템플릿ID
			json.addProperty("useYn", "Y"); // 사용 유무
			json.addProperty("title", title); // 발송 제목
			json.addProperty("body", content); // 문구 내용
			
			// 확인
			System.out.println("=====Service:json=====");
			System.out.println(json);
			//
			
			// 데이터 전송 준비
			OutputStreamWriter os = new OutputStreamWriter(conn.getOutputStream());
			os.write(json.toString());
			os.flush();
			os.close();
			
			int responseCode = conn.getResponseCode();
			
			// 확인
			System.out.println("=====Service:responseCode=====");
			System.out.println(responseCode); // 200	
			//
			
			// 응답데이터 얻기
			BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream(), "UTF-8"));
			StringBuffer sb = new StringBuffer();
			
			String line = "";
			String response = "";
			
			while((line = br.readLine()) != null) {
				sb.append(line);
			}

			response = sb.toString();
			br.close();

			// JsonParser
			JsonParser parser = new JsonParser();
			JsonElement element = parser.parse(response);
			
			// JSON>header>resultMessage에 접근
			JsonObject header = element.getAsJsonObject().get("header").getAsJsonObject();
			String str = header.getAsJsonObject().get("resultMessage").getAsString();
			
			// 확인
			System.out.println("=====Service:header=====");
			System.out.println(header);
			System.out.println("=====Service:str=====");
			System.out.println(str);
			//
			
			// 성공 시
			if(str.equals("success")) {
				result = 1;
			}
			
		} catch(IOException e) {
			e.printStackTrace();
		}
		
		return result;
	}

}
