package com.naedam.mir9.community.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.naedam.mir9.community.model.vo.Review;
import com.naedam.mir9.community.model.vo.ReviewImg;

public interface CommunityDao {

	// review
	List<Review> reviewList(Map<Object, String> param);

	List<Review> reviewModal(int reviewCode);

	List<ReviewImg> reviewImgModal(int reviewCode);

	int selectCategory(String reviewCode);	
	
	int imgDelete(String reviewCode);	
	
	int selectDelete(String reviewCode);

	// sms
	int smsAutoSend(HashMap<String, String> param);
	
}
