package com.naedam.mir9.community.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.JsonParser;
import com.naedam.mir9.community.model.service.CommunityService;
import com.naedam.mir9.community.model.vo.Review;
import com.naedam.mir9.community.model.vo.ReviewImg;

@RestController
@RequestMapping("/comm")
public class CommunityRestController {
	
	@Autowired
	private CommunityService communityService;
	
	// MAIL 인증키
	private static String mailKey = "s3b1XpsH6BR8yT4S";
	private static String mailSecret = "phiu4e0M";
	
	// SMS 인증키
	private static String smsKey = "pDjJmaKLu6bg9i9j";
	private static String smsSecret = "YRs5WbpK";
	
	// 리뷰 모달창 조회
	@GetMapping("/review_modal")
	public Map<Object, Object> commReviewModal(int reviewCode) {
		
		List<Review> review = communityService.reviewModal(reviewCode);
		List<ReviewImg> reviewImg  = communityService.reviewImgModal(reviewCode);
		
		// System.out.println(reviewImg);
		
		Map<Object, Object> result = new HashMap<>();
		result.put("review", review);
		result.put("reviewImg", reviewImg);
		
		return result;
	}
	
	// sms 문구 수정
	@PostMapping("/sms")
	public int modifySms(
			@RequestBody String jsonStr) {

		// code, is_send, content 선언
		List<String> code = new ArrayList<>();
		List<String> is_send = new ArrayList<>();
		List<String> content = new ArrayList<>();
		
		// JsonParser
		JsonParser parser = new JsonParser();
		JsonElement element = parser.parse(jsonStr);
		
		JsonArray codeArr = element.getAsJsonObject().get("code").getAsJsonArray();
		
		for(int i = 0; i < codeArr.size(); i++) {
			code.add((element.getAsJsonObject().get("code").getAsJsonArray()).get(i).getAsString());
			is_send.add((element.getAsJsonObject().get("is_send").getAsJsonArray()).get(i).getAsString());
			content.add((element.getAsJsonObject().get("content").getAsJsonArray()).get(i).getAsString());
		}
		
		/* 확인
		System.out.println("=====Controller:code=====");
		System.out.println(code);
		System.out.println("=====Controller:is_send=====");
		System.out.println(is_send);
		System.out.println("=====Controller:content=====");
		System.out.println(content);
		*/
		
		int result = 0;
		
		for(int i = 0; i < code.size(); i++) {
			result += communityService.updateSms(smsKey, smsSecret, code.get(i), content.get(i));
		}
		
		// int result2 = communityService.updateSmsSetting(code, is_send);
		// int result = result * result2
		
		return result;
	}
	
	// mail 모달창 저장 문구 조회
	@GetMapping("/email_modal")
	public HashMap<String, Object> commEmailModal(String templateId) {

		// templateId 전달
		HashMap<String, Object> savedMail = communityService.savedMail(mailKey, mailSecret, templateId);
		
		/* 확인
		System.out.println("=====Controller:savedMail=====");
		System.out.println(templateId);
		System.out.println(savedMail.get("title"));
		System.out.println(savedMail.get("content"));
		*/
		
		return savedMail;
	}
	
	// mail 모달창 문구 수정
	// mail 모달창 저장 문구 조회
	@PostMapping("/email_modal")
	public int commEmailModify(@RequestBody String jsonStr) {
		
		// JsonParser
		JsonParser parser = new JsonParser();
		JsonElement element = parser.parse(jsonStr);
		
		String templateId = element.getAsJsonObject().get("templateId").getAsString();
		String title = element.getAsJsonObject().get("title").getAsString();
		String content = element.getAsJsonObject().get("content").getAsString();

		// templateId 전달
		int result = communityService.modifyMail(mailKey, mailSecret, templateId, title, content);
				
		// 확인
		System.out.println("=====Controller:modifyMail=====");
		System.out.println(result);
		//
		
		return result;
	}

	// mail 모달창 기본 문구 조회
	@GetMapping("/email_origin")
	public HashMap<String, Object> commEmailOrigin(String templateId) {

		// templateId 전달
		HashMap<String, Object> originMail = communityService.originMail(mailKey, mailSecret, templateId);

		/* 확인
		System.out.println("=====Controller:originMail=====");
		System.out.println(templateId);
		System.out.println(originMail.get("title"));
		System.out.println(originMail.get("content"));
		*/
		
		return originMail;
	}
	
	// mail 설정 수정
	@PostMapping("/email")
	public int commEmail(
			@RequestBody String jsonStr) {

		// code, is_send 선언
		List<String> code = new ArrayList<>();
		List<String> is_send = new ArrayList<>();
		
		// JsonParser
		JsonParser parser = new JsonParser();
		JsonElement element = parser.parse(jsonStr);
		
		// list에 담기
		JsonArray codeArr = element.getAsJsonObject().get("code").getAsJsonArray();
		
		for(int i = 0; i < codeArr.size(); i++) {
			code.add((element.getAsJsonObject().get("code").getAsJsonArray()).get(i).getAsString());
			is_send.add((element.getAsJsonObject().get("is_send").getAsJsonArray()).get(i).getAsString());
		}
		
		/* 확인
		System.out.println("=====Controller:data=====");
		System.out.println(code);
		System.out.println(is_send);
		*/
		
		// int result = communityService.updateMailSetting(code, is_send);
		
		return 0;
	}	
}
