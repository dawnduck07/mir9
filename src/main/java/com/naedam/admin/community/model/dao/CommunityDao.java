package com.naedam.admin.community.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.naedam.admin.community.model.vo.Email;
import com.naedam.admin.community.model.vo.EmailSetting;
import com.naedam.admin.community.model.vo.MsgInfo;
import com.naedam.admin.community.model.vo.Review;
import com.naedam.admin.community.model.vo.ReviewImg;
import com.naedam.admin.community.model.vo.Sms;
import com.naedam.admin.community.model.vo.SmsSetting;

public interface CommunityDao {

	// review
	List<Object> reviewList(Map<String, Object> param);

	List<Review> reviewModal(int reviewCode);

	List<ReviewImg> reviewImgModal(int reviewCode);

	int selectCategory(String reviewCode);	
	
	int imgDelete(String reviewCode);	
	
	int selectDelete(String reviewCode);
	
	int totalReviewCount(Map<String, Object> param);

	// sms
	MsgInfo selectMsgInfo(long orderNo);
	
	List<SmsSetting> smsCheck(String templateId);	
	
	int smsAutoSend(Map<String, Object> setMod);
	
	int insertSms(HashMap<String, Object> param2);
	
	List<Object> selectSmsSetting();
	List<Object> selectSmsList(Map<String, Object> param);
	
	int countBySendPhone(String phone);
	
	int totalSmsCount(Map<String, Object> param);
	
	// email
	List<EmailSetting> emailCheck(String templateId);
	
	int mailAutoSend(HashMap<String, String> param);

	int insertEmail(HashMap<String, Object> param2);

	List<Object> selectEmailSetting();
	List<Object> selectEmailList(Map<String, Object> param);

	int totalEmailCount(Map<String, Object> param);

}
