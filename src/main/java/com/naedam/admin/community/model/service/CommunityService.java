package com.naedam.admin.community.model.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

import com.google.gson.JsonObject;
import com.naedam.admin.community.model.vo.Email;
import com.naedam.admin.community.model.vo.EmailSetting;
import com.naedam.admin.community.model.vo.MsgInfo;
import com.naedam.admin.community.model.vo.Review;
import com.naedam.admin.community.model.vo.ReviewImg;
import com.naedam.admin.community.model.vo.Sms;
import com.naedam.admin.community.model.vo.SmsSetting;

public interface CommunityService {

	// sms
	MsgInfo selectMsgInfo(long orderNo); // 주문 정보 조회
	List<SmsSetting> smsCheck(String templateId); // 특정 설정값 조회

	// email
	List<EmailSetting> emailCheck(String templateId); // 특정 설정값 조회

	//int sendSms(JsonObject json); // sms 발송
	//int sendEmail(JsonObject json); // email 발송 
	
	
	// 공통 : 목록 + 검색 + 페이징
	Map<String, Object> selectCommunityList(
			String mode, int cPage, String field, String keyword, HttpServletRequest request); 
	
	// ajax 요청
	Map<String, Object> load(String mode, Map<String, Object> param); 
	// Map<String, Object> send(String mode, Map<String, Object> param); 
	
	// 후기 삭제
	String selectDelete(HttpServletRequest request); 
	
	
	


}
