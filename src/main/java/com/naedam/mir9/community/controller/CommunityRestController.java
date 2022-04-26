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
	
	// 인증키
	private String appKey = "pDjJmaKLu6bg9i9j";
	private String secretKey = "YRs5WbpK";	
	
	// 리뷰 모달창 조회
	@GetMapping("/review_modal")
	public Map<Object, Object> commReviewModal(int reviewCode) {
		
		List<Review> review = communityService.reviewModal(reviewCode);
		List<ReviewImg> reviewImg  = communityService.reviewImgModal(reviewCode);
		
		System.out.println(reviewImg);
		
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
			result += communityService.updateSms(appKey, secretKey, code.get(i), is_send.get(i), content.get(i));
		}
		
		/* 확인
		System.out.println("=====Controller:result=====");
		System.out.println(result); 
		*/
		
		return result;
	}	
	
}
