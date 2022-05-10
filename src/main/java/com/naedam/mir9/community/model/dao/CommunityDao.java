package com.naedam.mir9.community.model.dao;

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
	
	List<SmsSetting> smsCheck(String templateId);	
	
	int insertSms(HashMap<String, Object> param2);
	
	List<Sms> selectSmsList(HashMap<String, Object> param);
	
	List<SmsSetting> selectSmsSetting();
	
	// mail
	int mailAutoSend(HashMap<String, String> param);

	List<EmailSetting> emailCheck(String templateId);

	MsgInfo selectMsgInfo(long orderNo);

	int insertEmail(HashMap<String, Object> param2);

	List<Email> selectEmailList(HashMap<String, Object> param);

	List<EmailSetting> selectEmailSetting();



}
