package com.naedam.mir9.community.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.JsonParser;
import com.naedam.mir9.community.model.service.CommunityService;
import com.naedam.mir9.community.model.vo.EmailSetting;
import com.naedam.mir9.community.model.vo.MsgInfo;
import com.naedam.mir9.community.model.vo.Review;
import com.naedam.mir9.community.model.vo.ReviewImg;
import com.naedam.mir9.community.model.vo.SmsSetting;

@RestController
@RequestMapping("/comm")
public class CommunityRestController {
	
	@Autowired
	private CommunityService communityService;

	// MAIL 인증키
	private static String mailKey = "s3b1XpsH6BR8yT4S";
	private static String mailSecret = "phiu4e0M";
	
	// SMS 인증키
	private static String smsKey = "cuyb2ATgfZrgb0LF";
	private static String smsSecret = "3VxajYQb";
	
	// 리뷰 모달창 조회
	@GetMapping("/review_modal")
	public Map<Object, Object> commReviewModal(int reviewCode) {
		
		List<Review> review = communityService.reviewModal(reviewCode);
		List<ReviewImg> reviewImg  = communityService.reviewImgModal(reviewCode);

		Map<Object, Object> result = new HashMap<>();
		result.put("review", review);
		result.put("reviewImg", reviewImg);
		
		return result;
	}
	
	// sms 문구 수정
	@PostMapping("/sms")
	public int modifySms(
			@RequestBody String jsonStr) {

		// code, is_send, content 선언
		List<String> code = new ArrayList<>();
		List<String> templateId = new ArrayList<>();
		List<String> is_send = new ArrayList<>();
		List<String> is_send_admin = new ArrayList<>();
		List<String> content = new ArrayList<>();
		
		// JsonParser
		JsonParser parser = new JsonParser();
		JsonElement element = parser.parse(jsonStr);
		
		JsonArray codeArr = element.getAsJsonObject().get("code").getAsJsonArray();
		
		System.out.println("Controller code");
		for(int i = 0; i < codeArr.size(); i++) {
			code.add((element.getAsJsonObject().get("code").getAsJsonArray()).get(i).getAsString());
			content.add((element.getAsJsonObject().get("content").getAsJsonArray()).get(i).getAsString());
			
			if(i == 0 || i%2 == 0) {
				templateId.add((element.getAsJsonObject().get("code").getAsJsonArray()).get(i).getAsString());
				is_send.add((element.getAsJsonObject().get("is_send").getAsJsonArray()).get(i).getAsString());
			}
			else {
				is_send_admin.add((element.getAsJsonObject().get("is_send").getAsJsonArray()).get(i).getAsString());
			}
		}

		int result1 = 0;
		
		for(int i = 0; i < code.size(); i++) {
			result1 += communityService.updateSms(smsKey, smsSecret, code.get(i), content.get(i));
		}

		// sms 자동 발송 여부
		int result2 = 0;
		HashMap<String, String> param = new HashMap<>();
		
		for (int i = 0; i < is_send_admin.size(); i++) {
			param.put("templateId", templateId.get(i));
			param.put("send", is_send.get(i));
			param.put("sendAdmin", is_send_admin.get(i));

			result2 += communityService.smsAutoSend(param);
		}
		
		int result = result1 * result2;

		return result;
	}
	
	// mail 모달창 저장 문구 조회
	@GetMapping("/email_modal")
	public HashMap<String, Object> commEmailModal(String templateId) {

		// templateId 전달
		HashMap<String, Object> savedMail = communityService.savedMail(mailKey, mailSecret, templateId);

		return savedMail;
	}
	
	// mail 모달창 문구 수정
	@PostMapping("/email_modal")
	public int commEmailModify(@RequestBody String jsonStr) {
		
		// JsonParser
		JsonParser parser = new JsonParser();
		JsonElement element = parser.parse(jsonStr);
		
		String templateId = element.getAsJsonObject().get("templateId").getAsString();
		String title = element.getAsJsonObject().get("title").getAsString();
		String content = element.getAsJsonObject().get("content").getAsString();
		
		// templateId 전달
		int result = communityService.modifyMail(mailKey, mailSecret, templateId, title, content);

		return result;
	}

	// mail 모달창 기본 문구 조회
	@GetMapping("/email_origin")
	public HashMap<String, Object> commEmailOrigin(String templateId) {

		// templateId 전달
		HashMap<String, Object> originMail = communityService.originMail(mailKey, mailSecret, templateId);

		return originMail;
	}
	
	// mail 설정 수정
	@PostMapping("/email")
	public int commEmail(
			@RequestBody String jsonStr) {
		
		// templateId, is_send, is_send_admin 선언
		List<String> templateId = new ArrayList<>();
		List<String> is_send = new ArrayList<>();
		List<String> is_send_admin = new ArrayList<>();
		
		// JsonParser
		JsonParser parser = new JsonParser();
		JsonElement element = parser.parse(jsonStr);
		
		// list에 담기
		JsonArray codeArr = element.getAsJsonObject().get("code").getAsJsonArray();
		
		for(int i = 0; i < codeArr.size(); i++) {
			if(i == 0 || i%2 == 0) {
				templateId.add((element.getAsJsonObject().get("code").getAsJsonArray()).get(i).getAsString());
				is_send.add((element.getAsJsonObject().get("is_send").getAsJsonArray()).get(i).getAsString());
			}
			else {
				is_send_admin.add((element.getAsJsonObject().get("is_send").getAsJsonArray()).get(i).getAsString());
			}
		}

		// mail 자동 발송 여부
		int result = 0;
		
		HashMap<String, String> param = new HashMap<>();
		
		for (int i = 0; i < is_send_admin.size(); i++) {
			param.put("templateId", templateId.get(i));
			param.put("send", is_send.get(i));
			param.put("sendAdmin", is_send_admin.get(i));

			result += communityService.mailAutoSend(param);
		}

		return result;
	}	
	
	// 주문 관련 msg 발송
	@PostMapping("/sendMsg")
	public int sendMsg(String orderNo, int statusNo) {
	
		int result = 0; 
		int sms = 0;
		int email = 0;
		String templateId = "";
		
		// statusNo 값으로 자동 발송 체크여부 확인
		switch(statusNo) {
			case 1 : templateId="order"; break; 
			case 2 : templateId="pay_done"; break; 
			case 3 : templateId="delivery_ready"; break; 
			case 4 : templateId="delivery_ing"; break; 
			case 5 : templateId="delivery_done"; break; 
			case 6 : templateId="order_cancel"; break; 
			case 7 : templateId="refund"; break; 
		}
		
		// 자동 발송 여부 조회
		List<SmsSetting> smsCheck = communityService.smsCheck(templateId);
		List<EmailSetting> emailCheck = communityService.emailCheck(templateId);

		// 주문 정보 조회
		MsgInfo msgInfo = communityService.selectMsgInfo(Long.parseLong(orderNo));	

		HashMap<String, Object> param = new HashMap<String, Object>();
		param.put("orderNo", msgInfo.getOrderNo());
		param.put("statusName", msgInfo.getStatusName());
		param.put("orderDate", msgInfo.getOrderDate());
		param.put("firstName", msgInfo.getFirstName());
		param.put("lastName", msgInfo.getLastName());
		param.put("name", msgInfo.getLastName().concat(msgInfo.getFirstName()));
		param.put("email", msgInfo.getEmail());
		param.put("phone", msgInfo.getPhone());
		param.put("imgUrl", msgInfo.getImgUrl());
		param.put("productName", msgInfo.getProductName());
		param.put("salePrice", msgInfo.getSalePrice());
		param.put("payAmount", msgInfo.getPayAmount());
		param.put("receiver", msgInfo.getReceiver());
		param.put("receiverEmail", msgInfo.getReceiverEmail());
		param.put("receiverPhone", msgInfo.getReceiverPhone());
		param.put("shippingAddress", msgInfo.getShippingAddress());
		param.put("memo", msgInfo.getMemo());
		param.put("payType", msgInfo.getPayType());
		param.put("payMethod", msgInfo.getPayMethod());
		param.put("account", msgInfo.getAccount());
		param.put("bankName", msgInfo.getBankName());
		param.put("owner", msgInfo.getOwner());
		param.put("buyerName", msgInfo.getBuyerName());
		param.put("paidAt", msgInfo.getPaidAt());
		param.put("templateId", templateId);

		// 자동 발송 체크된 경우만 메시지 보내기
		if(smsCheck.get(0).getTemplateId().equals(templateId)) {
			if(smsCheck.get(0).getIsSend().equals("y")) {
				param.put("templateId", templateId.concat("_mod"));
				sms += communityService.sendOrderSms(smsKey, smsSecret, param);
			}
			else if(smsCheck.get(0).getIsSendAdmin().equals("y")) {
				param.put("templateId", templateId.concat("_admin_mod"));
				sms += communityService.sendOrderSms(smsKey, smsSecret, param);
			}
		}
		
		if(emailCheck.get(0).getTemplateId().equals(templateId)) {
			if(emailCheck.get(0).getIsSend().equals("y")) {
				param.put("templateId", templateId.concat("_mod"));
				email += communityService.sendOrderEmail(mailKey, mailSecret, param);
			}
			else if(emailCheck.get(0).getIsSendAdmin().equals("y")) {
				param.put("templateId", templateId.concat("_admin_mod"));
				email += communityService.sendOrderEmail(mailKey, mailSecret, param);
			}
		}
		
		if(sms > 0 || email > 0) {
			result += 1;
		}

		return result;
	}
	
	// 회원가입, 아이디 찾기, 비밀번호 찾기는 프론트단 구현 후
	
	// 적립금 관련 msg 발송
	
	
	// 쿠폰 관련 msg 발송

	
	
}
