package com.naedam.mir9.community.model.service;

import java.util.List;
import java.util.Map;

import com.naedam.mir9.community.model.vo.Review;
import com.naedam.mir9.community.model.vo.ReviewImg;

public interface CommunityService {

	List<Review> reviewList(Map<Object, String> param);
	
	List<Review> reviewModal(int reviewCode);

	List<ReviewImg> reviewImgModal(int reviewCode);

}
