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
	public HashMap<String, Object> originSms(String appKey, String secretKey) {
		
		// 쿼리스트링 : categoryId=78519 & pageSize=24
		HashMap<String, Object> originSms = new HashMap<>();
		String getUrl = "https://api-sms.cloud.toast.com/sms/v3.0/appKeys/" + appKey + "/templates?categoryId=78519&pageSize=24";
		
		try {
			// url
			URL url = new URL(getUrl);
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();	
			
			// method
			conn.setRequestMethod("GET");
			
			// headers
			conn.setRequestProperty("Content-Type", "application/json; charset=UTF-8");
			conn.setRequestProperty("X-Secret-Key", secretKey);
			
			// 결과값 받기
			BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream(), "UTF-8"));
			
			String line = "";
			String result = "";
			
			while((line = br.readLine()) != null) {
				result += line;
			}
			
			/* 확인
			System.out.println("=====response=====");
			System.out.println("response : " + result);
			*/
			
			// JsonParser
			JsonParser parser = new JsonParser();
			JsonElement element = parser.parse(result);
			
			// JSON>body>data에 접근
			JsonObject bodyElement = element.getAsJsonObject().get("body").getAsJsonObject();
			JsonArray data = bodyElement.getAsJsonObject().get("data").getAsJsonArray();

			/* 확인
			System.out.println("=====Json.body=====");
			System.out.println("bodyElement : " + bodyElement);
			System.out.println("=====Json.body.data=====");
			System.out.println("data : " + data);
			*/
			
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
			System.out.println("=====Json.body.data.templateId=====");
			System.out.println("templateId : " + templateId); 
			System.out.println("=====Json.body.data.body=====");
			System.out.println("body : " + body);
			*/
			
			// originSms에 key+value로 저장
			originSms.put("templateId", templateId);
			originSms.put("body", body);
			
			/* 확인
			System.out.println("=====Service:originSms=====");
			System.out.println("originSms : " + originSms); 
			*/

		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return originSms;
	}

	// sms 저장 문구(78520)
	@Override
	public HashMap<String, Object> savedSms(String appKey, String secretKey) {
		
		// 쿼리스트링 : categoryId=78520 & pageSize=24
		HashMap<String, Object> savedSms = new HashMap<>();
		String getUrl = "https://api-sms.cloud.toast.com/sms/v3.0/appKeys/" + appKey + "/templates?categoryId=78520&pageSize=24";
		
		try {
			// url
			URL url = new URL(getUrl);
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();	
			
			// method
			conn.setRequestMethod("GET");
			
			// headers
			conn.setRequestProperty("Content-Type", "application/json; charset=UTF-8");
			conn.setRequestProperty("X-Secret-Key", secretKey);
			
			// 결과값 받기
			BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream(), "UTF-8"));
			
			String line = "";
			String result = "";
			
			while((line = br.readLine()) != null) {
				result += line;
			}
			
			/* 확인
			System.out.println("=====response=====");
			System.out.println("response : " + result);
			*/
			
			// JsonParser
			JsonParser parser = new JsonParser();
			JsonElement element = parser.parse(result);
			
			// JSON>body>data에 접근
			JsonObject bodyElement = element.getAsJsonObject().get("body").getAsJsonObject();
			JsonArray data = bodyElement.getAsJsonObject().get("data").getAsJsonArray();
			
			/* 확인
			System.out.println("=====Json.body=====");
			System.out.println("bodyElement : " + bodyElement); 
			System.out.println("=====Json.body.data=====");
			System.out.println("data : " + data); 
			*/
			
			// templateId, body 값을 담을 List 선언
			List<String> savedTemplateId = new ArrayList<>();
			List<String> savedBody = new ArrayList<>();;
			
			for(int i = 0; i < data.size(); i++) {
				savedTemplateId.add((data.getAsJsonArray().get(i).getAsJsonObject()).get("templateId").getAsString());
			}
			for(int i = 0; i < data.size(); i++) {
				savedBody.add((data.getAsJsonArray().get(i).getAsJsonObject()).get("body").getAsString());			
			}
			
			/* 확인
			System.out.println("=====Json.body.data.templateId=====");
			System.out.println("savedTemplateId : " + savedTemplateId); 

			System.out.println("=====Json.body.data.body=====");
			System.out.println("body : " + body);
			*/
			
			// originSms에 key+value로 저장
			savedSms.put("savedTemplateId", savedTemplateId);
			savedSms.put("savedBody", savedBody);
			
			/* 확인
			System.out.println("=====Service:originSms=====");
			System.out.println("savedSms : " + savedSms);
			*/
			
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return savedSms;	
	}

	// sms 문구 수정
	@Override
	public int updateSms(String appKey, String secretKey, String code, String is_send, String content) {
		
		int result = 0;
		String codeMod = code.concat("_mod");
		
		// 쿼리스트링 : categoryId=78520 
		String postUrl = "https://api-sms.cloud.toast.com/sms/v3.0/appKeys/" + appKey + "/templates/" + codeMod;

		try {
			URL url = new URL(postUrl);
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			
			// method
			conn.setRequestMethod("PUT");
			
			// header
			conn.setRequestProperty("Content-Type", "application/json; charset=UTF-8");
			conn.setRequestProperty("X-Secret-Key", secretKey);
			
			// doOutput : OutputStream으로 POST 데이터를 넘겨주겠다는 옵션
			conn.setDoOutput(true);
			
			// data
			JsonObject json = new JsonObject();
			json.addProperty("templateName", codeMod); // 템플릿ID
			json.addProperty("sendNo", "01042026201"); // 발신 번호
			json.addProperty("sendType", "0"); // 발송 유형
			json.addProperty("body", content); // 문구 내용
			json.addProperty("useYn", "Y"); // 사용 유무
			
			// 데이터 전송 준비
			OutputStreamWriter os = new OutputStreamWriter(conn.getOutputStream());
			os.write(json.toString());
			os.flush();
			
			// 확인
			System.out.println("=====Service:json.toString()=====");
			System.out.println(json.toString());
			
			
			BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream(), "UTF-8"));
			
			String line = "";
			String response = "";
			
			while((line = br.readLine()) != null) {
				response += line;
			}
			
			// 확인
			System.out.println("=====Service:response=====");
			System.out.println(response);
			
			// JsonParser
			JsonParser parser = new JsonParser();
			JsonElement element = parser.parse(response);
			
			// JSON>body>data에 접근
			JsonObject header = element.getAsJsonObject().get("header").getAsJsonObject();
			String str = header.getAsJsonObject().get("resultMessage").getAsString();
			
			// 확인
			System.out.println("=====Service:header=====");
			System.out.println(header);
			System.out.println("=====Service:str=====");
			System.out.println(str);

			
			// 성공 시
			if(str.equals("success")) {
				result = 1;
			}
			
			// 확인
			System.out.println("=====Service:result=====");
			System.out.println(result);
			
			br.close();
			
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return result;
	}

}
