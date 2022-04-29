package com.naedam.mir9.community.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
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
	private static String smsKey = "cuyb2ATgfZrgb0LF";
	private static String smsSecret = "3VxajYQb";
	
	// 리뷰 모달창 조회
	@GetMapping("/review_modal")
	public Map<Object, Object> commReviewModal(int reviewCode) {
		
		List<Review> review = communityService.reviewModal(reviewCode);
		List<ReviewImg> reviewImg  = communityService.reviewImgModal(reviewCode);

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
		List<String> templateId = new ArrayList<>();
		List<String> is_send = new ArrayList<>();
		List<String> is_send_admin = new ArrayList<>();
		List<String> content = new ArrayList<>();
		
		// JsonParser
		JsonParser parser = new JsonParser();
		JsonElement element = parser.parse(jsonStr);
		
		JsonArray codeArr = element.getAsJsonObject().get("code").getAsJsonArray();
		
		System.out.println("Controller code");
		for(int i = 0; i < codeArr.size(); i++) {
			code.add((element.getAsJsonObject().get("code").getAsJsonArray()).get(i).getAsString());
			content.add((element.getAsJsonObject().get("content").getAsJsonArray()).get(i).getAsString());
			
			if(i == 0 || i%2 == 0) {
				templateId.add((element.getAsJsonObject().get("code").getAsJsonArray()).get(i).getAsString());
				is_send.add((element.getAsJsonObject().get("is_send").getAsJsonArray()).get(i).getAsString());
			}
			else {
				is_send_admin.add((element.getAsJsonObject().get("is_send").getAsJsonArray()).get(i).getAsString());
			}
		}

		int result1 = 0;
		
		for(int i = 0; i < code.size(); i++) {
			result1 += communityService.updateSms(smsKey, smsSecret, code.get(i), content.get(i));
		}
		
		// sms 자동 발송 여부
		int result2 = 0;
		HashMap<String, String> param = new HashMap<>();
		
		for (int i = 0; i < is_send_admin.size(); i++) {
			param.put("templateId", templateId.get(i));
			param.put("send", is_send.get(i));
			param.put("sendAdmin", is_send_admin.get(i));
			
			System.out.println("=====param=====");
			System.out.println(templateId);
			
			result2 += communityService.smsAutoSend(param);
		}
		
		System.out.println("=====Controller:result2=====");
		System.out.println(result2);
		
		int result = result1 * result2;
		
		return result;
	}
	
	// mail 모달창 저장 문구 조회
	@GetMapping("/email_modal")
	public HashMap<String, Object> commEmailModal(String templateId) {

		// templateId 전달
		HashMap<String, Object> savedMail = communityService.savedMail(mailKey, mailSecret, templateId);

		return savedMail;
	}
	
	// mail 모달창 문구 수정
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

		return result;
	}

	// mail 모달창 기본 문구 조회
	@GetMapping("/email_origin")
	public HashMap<String, Object> commEmailOrigin(String templateId) {

		// templateId 전달
		HashMap<String, Object> originMail = communityService.originMail(mailKey, mailSecret, templateId);

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
