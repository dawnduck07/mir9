package com.naedam.mir9.community.controller;

import java.io.UnsupportedEncodingException;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;
import java.util.Arrays;
import java.util.Base64;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.crypto.Mac;
import javax.crypto.spec.SecretKeySpec;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.naedam.mir9.community.model.service.CommunityService;
import com.naedam.mir9.community.model.vo.Review;

@Controller
@RequestMapping("/comm")
public class CommunityController {

	@Autowired
	private CommunityService communityService;
	
	// MAIL 인증키
	private String access = "40cnTtyIUldTMRjjpSYu";
	private String secret = "zjDqLElCNgwzMUBrqBso3nLvLGLD2Kh6wOljQQjF";
	
	// SMS 인증키
	private String appKey = "pDjJmaKLu6bg9i9j";
	private String secretKey = "YRs5WbpK";	
	
	// 시그니처 키값 가져오기	
	@GetMapping("/email")
	public String commEmail(Model model) 
			throws UnsupportedEncodingException, NoSuchAlgorithmException, InvalidKeyException {
		
		long time = System.currentTimeMillis();
		String space = " "; // 공백
		String method = "POST"; // 메소드
	    String newLine = "\n"; // 줄바꿈
	    String url = "/api/v1/mails"; // 도메인을 제외한 "/" 아래 전체 url (쿼리스트링 포함)
	    String timestamp = String.valueOf(time); // 현재 타임스탬프 
	    String accessKey = access; // access 
	    String secretKey = secret; // secret
	    
	    String message = new StringBuilder()
	        .append(method)
	        .append(space)
	        .append(url)
	        .append(newLine)
	        .append(timestamp)
	        .append(newLine)
	        .append(accessKey)
	        .toString();

	    SecretKeySpec signingKey = new SecretKeySpec(secretKey.getBytes("UTF-8"), "HmacSHA256");
	    Mac mac = Mac.getInstance("HmacSHA256");
	    mac.init(signingKey);
	    
	    // POST
	    byte[] rawHmac = mac.doFinal(message.getBytes("UTF-8"));
	    String postSig = Base64.getEncoder().encodeToString(rawHmac);
	    
	    model.addAttribute("postSig", postSig);
	    model.addAttribute("timestamp", timestamp);
	    
		return "community/email";
	}
	
	@GetMapping("/email_list")
	public String commEmailList() {
		return "community/emailList";
	}
	
	// sms 설정 + 기본 문구 + 저장 문구
	@GetMapping("/sms")
	public String commSms(Model model) {
	
		// CORS 문제 해결
		// 기본 문구 (categodyId : 78519)
		HashMap<String, Object> originSms = communityService.originSms(appKey, secretKey); // 기존 양식
		
		// list에 담기
		List<String> templateId = (List<String>) originSms.get("templateId");
		List<String> content = (List<String>) originSms.get("body");
		
		model.addAttribute("templateId", templateId);
		model.addAttribute("content", content);
		
		/* 확인
		System.out.println("=====Controller:originSms=====");
		System.out.println("templateId : " + templateId);
		System.out.println("content : " + content);		
		*/
		
		// 저장 문구(categodyId : 78520)
		HashMap<String, Object> savedSms = communityService.savedSms(appKey, secretKey); // 저장 양식
		
		// list에 담기
		List<String> savedTemplateId = (List<String>) savedSms.get("savedTemplateId");
		List<String> savedContent = (List<String>) savedSms.get("savedBody");
		
		model.addAttribute("savedTemplateId", savedTemplateId);
		model.addAttribute("savedContent", savedContent);
		
		/* 확인
		System.out.println("=====Controller:savedSms=====");
		System.out.println("savedTemlateId : " + savedTemplateId);
		System.out.println("savedContent : " + savedContent);
		*/
		
		return "community/sms";
	}
	
	@GetMapping("/sms_list")
	public String commSmsList() {
		
		return "community/smsList";
	}
	
	// 리뷰 조회 + 검색
	@RequestMapping(value="/review", method={RequestMethod.GET, RequestMethod.POST})
	public String commReview(
			@RequestParam(required=false) String field,
			@RequestParam(required=false) String keyword,
			Model model) {
		
		Map<Object, String> param = new HashMap<>(); 
		param.put("field", field);
		param.put("keyword", keyword);
		
		List<Review> reviewList = communityService.reviewList(param);		
		model.addAttribute("reviewList", reviewList);
		
		return "community/review";
	}
		
	// 리뷰 삭제
	@PostMapping("/delete")
	public String selectDelete(
			HttpServletRequest request) {
		
		// 선택된 리뷰 번호
		List<String> selectedCode = Arrays.asList(request.getParameterValues("list[]"));

		int delImg = 0;
		int delReview = 0;
		int categoryNo = 0;
		
		for(String reviewCode : selectedCode) {
			// 카테고리 조회
			categoryNo = communityService.selectCategory(reviewCode);

			// 이미지 삭제
			if(categoryNo == 1) { // 포토 후기일 경우
				delImg = communityService.imgDelete(reviewCode);
			}
			
			// 리뷰 삭제
			delReview = communityService.selectDelete(reviewCode);
		}
		
		return "redirect:/comm/review";
	}
	
	// imgbb 테스트
	@RequestMapping(value="/imgbb", method={RequestMethod.GET, RequestMethod.POST}) 
	public String imgbbTest(){
		return "community/urlTest";
	}
	
}
