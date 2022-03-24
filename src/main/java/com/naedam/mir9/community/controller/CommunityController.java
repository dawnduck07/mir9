package com.naedam.mir9.community.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.naedam.mir9.community.model.service.CommunityService;
import com.naedam.mir9.community.model.vo.Review;

@Controller
@RequestMapping("/comm")
public class CommunityController {
	@Autowired
	private CommunityService communityService;
	
	@GetMapping("/email")
	public String commEmail() {
		
		return "community/email";
	}
	
	@GetMapping("/email_list")
	public String commEmailList() {
		return "community/emailList";
	}
	
	@GetMapping("/sms")
	public String commSms() {
		
		return "community/sms";
	}
	
	@GetMapping("/sms_list")
	public String commSmsList() {
		
		return "community/smsList";
	}
	
	// 리뷰 조회
	@GetMapping("/review")
	public String commReview(Model model) {
		
		List<Review> reviewList = communityService.reviewList();
		model.addAttribute("reviewList", reviewList);
		
		return "community/review";
	}
	
	// 리뷰 검색 조회
	@PostMapping("/review")
	public String commReview(
			@RequestParam String field,
			@RequestParam String keyword,
			Model model) {
		
		Map<Object, String> param = new HashMap<>(); 
		param.put("field", field);
		param.put("keyword", keyword);
		
		List<Review> reviewList = communityService.reviewSearch(param);
		model.addAttribute("reviewList", reviewList);
		
		return "community/review";
	}
	
}
