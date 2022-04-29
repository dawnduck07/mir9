package com.naedam.mir9.community.model.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.naedam.mir9.community.model.vo.Review;
import com.naedam.mir9.community.model.vo.ReviewImg;

public interface CommunityService {

	// review
	List<Review> reviewList(Map<Object, String> param);
	
	List<Review> reviewModal(int reviewCode);

	List<ReviewImg> reviewImgModal(int reviewCode);

	int selectCategory(String reviewCode);
	
	int imgDelete(String reviewCode);	
	
	int selectDelete(String reviewCode);

	// sms
	HashMap<String, Object> originSms(String smsKey, String smsSecret);

	HashMap<String, Object> savedSms(String smsKey, String smsSecret);

	int updateSms(String smsKey, String smsSecret, String code, String content);

	int smsAutoSend(HashMap<String, String> param);	
	
	// mail
	HashMap<String, Object> savedMail(String mailKey, String mailSecret, String templateId);

	HashMap<String, Object> originMail(String mailKey, String mailSecret, String templateId);

	int modifyMail(String mailKey, String mailSecret, String templateId, String title, String content);



}
