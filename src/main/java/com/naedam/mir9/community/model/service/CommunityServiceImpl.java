package com.naedam.mir9.community.model.service;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
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

	// sms 기본 문구
	@Override
	public HashMap<String, Object> originSms(String appKey, String secretKey) {
		
		HashMap<String, Object> originSms = new HashMap<>();
		String getUrl = "https://api-sms.cloud.toast.com/sms/v3.0/appKeys/" + appKey + "/templates";
		
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
			BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
			
			String line = "";
			String result = "";
			
			while((line = br.readLine()) != null) {
				result += line;
			}
			
			System.out.println("=====response=====");
			System.out.println("response : " + result);
			
			// JsonParser
			JsonParser parser = new JsonParser();
			JsonElement element = parser.parse(result);
			
			// JSON>body>data에 접근
			System.out.println("=====Json.body=====");
			JsonObject bodyElement = element.getAsJsonObject().get("body").getAsJsonObject();
			// System.out.println("bodyElement : " + bodyElement); -> 확인
			
			System.out.println("=====Json.body.data=====");
			JsonArray data = bodyElement.getAsJsonObject().get("data").getAsJsonArray();
			// System.out.println("data : " + data); -> 확인
			
			// templateId, body 값을 담을 List 선언
			List<String> templateId = new ArrayList<>();
			List<String> body = new ArrayList<>();;
			
			System.out.println("=====Json.body.data.templateId=====");
			for(int i = 0; i < data.size(); i++) {
				templateId.add((data.getAsJsonArray().get(i).getAsJsonObject()).get("templateId").getAsString());
			}
			// System.out.println("templateId : " + templateId); -> 확인

			System.out.println("=====Json.body.data.body=====");
			for(int i = 0; i < data.size(); i++) {
				body.add((data.getAsJsonArray().get(i).getAsJsonObject()).get("body").getAsString());			
			}
			// System.out.println("body : " + body); -> 확인
			
			// originSms에 key+value로 저장
			originSms.put("templateId", templateId);
			originSms.put("body", body);
			
			System.out.println("=====Service:originSms=====");
			System.out.println("originSms : " + originSms); // -> 확인

		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return originSms;
	}

}
