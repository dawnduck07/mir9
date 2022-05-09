package com.naedam.mir9.community.model.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.naedam.mir9.community.model.vo.Email;
import com.naedam.mir9.community.model.vo.EmailSetting;
import com.naedam.mir9.community.model.vo.MsgInfo;
import com.naedam.mir9.community.model.vo.Review;
import com.naedam.mir9.community.model.vo.ReviewImg;
import com.naedam.mir9.community.model.vo.Sms;
import com.naedam.mir9.community.model.vo.SmsSetting;

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

	List<SmsSetting> smsCheck(String templateId);
	
	List<Sms> selectSmsList(HashMap<String, Object> param);	
	
	List<SmsSetting> selectSmsSetting();
	
	int sendPointSms(String smsKey, String smsSecret, HashMap<String, Object> param);

	int sendCouponSms(String smsKey, String smsSecret, HashMap<String, Object> param);	
	
	// mail
	HashMap<String, Object> savedMail(String mailKey, String mailSecret, String templateId);

	HashMap<String, Object> originMail(String mailKey, String mailSecret, String templateId);

	int modifyMail(String mailKey, String mailSecret, String templateId, String title, String content);

	int mailAutoSend(HashMap<String, String> param);

	List<EmailSetting> emailCheck(String templateId);

	MsgInfo selectMsgInfo(long orderNo);

	int sendOrderSms(String smsKey, String smsSecret, HashMap<String, Object> param);

	int sendOrderEmail(String mailKey, String mailSecret, HashMap<String, Object> param);

	List<Email> selectEmailList(HashMap<String, Object> param);

	List<EmailSetting> selectEmailSetting();

	int sendPointEmail(String mailKey, String mailSecret, HashMap<String, Object> param);

	int sendCouponEmail(String mailKey, String mailSecret, HashMap<String, Object> param);



}
