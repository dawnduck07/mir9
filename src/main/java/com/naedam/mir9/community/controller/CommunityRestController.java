package com.naedam.mir9.community.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.naedam.mir9.community.model.service.CommunityService;
import com.naedam.mir9.community.model.vo.Review;
import com.naedam.mir9.community.model.vo.ReviewImg;

@RestController
@RequestMapping("/comm")
public class CommunityRestController {
	@Autowired
	private CommunityService communityService;
	
	// 리뷰 모달창 조회
	@GetMapping("/review_modal")
	public Map<Object, Object> commReviewModal(int reviewNo) {
		
		List<Review> review = communityService.reviewModal(reviewNo);
		List<ReviewImg> reviewImg  = communityService.reviewImgModal(reviewNo);
		
		System.out.println(reviewImg);
		
		Map<Object, Object> result = new HashMap<>();
		result.put("review", review);
		result.put("reviewImg", reviewImg);
		
		return result;
	}

	
}
