package com.naedam.admin.community.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.naedam.admin.community.model.service.CommunityService;
import com.naedam.admin.community.model.vo.EmailSetting;
import com.naedam.admin.community.model.vo.MsgInfo;
import com.naedam.admin.community.model.vo.Review;
import com.naedam.admin.community.model.vo.ReviewImg;
import com.naedam.admin.community.model.vo.SmsSetting;
import com.naedam.admin.coupon.model.service.CouponService;
import com.naedam.admin.coupon.model.vo.Coupon;
import com.naedam.admin.coupon.model.vo.MemberCoupon;
import com.naedam.admin.member.model.service.MemberService;
import com.naedam.admin.member.model.vo.Member;
import com.naedam.admin.point.model.service.PointService;
import com.naedam.admin.point.model.vo.MemberPoint;

@RestController
@RequestMapping("/admin/comm")
public class CommunityRestController {
	
	@Autowired
	private CommunityService communityService;
	
	@Autowired
	private MemberService memberService;

	@Autowired
	private PointService pointService;
	
	@Autowired
	private CouponService couponService;
	
	// JsonParser
	private JsonParser parser = new JsonParser();
	
	/*
	// 주문 관련 msg 발송
	@PostMapping("/sendMsg")
	public int sendMsg(String orderNo, int statusNo) {
		int result = 0; 
		int sms = 0;
		int email = 0;
		String templateId = "";
		
		// 주문 templateId
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

		// 데이터 가공
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		String orderDate = format.format(msgInfo.getOrderDate());
		String paidAt = format.format(msgInfo.getPaidAt());
		String memo = msgInfo.getMemo();
		if(memo == null) { memo = " ";}
		String pay = "결제 금액 " + msgInfo.getPayAmount() + "원, 결제 방법 " + msgInfo.getPayType();
		pay += ", 계좌번호 " + msgInfo.getAccount() + ", 은행명 " + msgInfo.getBankName();
		pay += ", 예금주 " + msgInfo.getOwner() + ", 입금자명 " + msgInfo.getBuyerName() + ", 입금일 " + paidAt;
	
		// 주문 sms 발송
		if((smsCheck.get(0).getTemplateId()).equals(templateId)) {
			JsonObject tem = new JsonObject();
			tem.addProperty("shop_name", "ND이커머스"); //  => 수정 필요
			tem.addProperty("order_name", msgInfo.getReceiver()); 
			tem.addProperty("order_number", msgInfo.getOrderNo());
			
			JsonArray recipientList = new JsonArray();
			JsonObject recip = new JsonObject();
			recip.addProperty("recipientNo", msgInfo.getReceiverPhone());
			recip.add("templateParameter", tem);
			recipientList.add(recip); 
			
			JsonObject json = new JsonObject();
			json.addProperty("templateId", templateId.concat("_mod")); 
			json.add("recipientList", recipientList);
			sms = communityService.sendSms(json);
			
			if(smsCheck.get(0).getIsSendAdmin().equals("y")) {
				json.addProperty("templateId", templateId.concat("_admin_mod"));
				json.add("recipientList", recipientList);
				sms = communityService.sendSms(json);
			}
		}
		
		// 주문 email 발송
		if((emailCheck.get(0).getTemplateId()).equals(templateId)) {
			JsonObject tem = new JsonObject(); 
			tem.addProperty("shop_name", "ND이커머스"); // => 수정 필요 
			tem.addProperty("payment_status", msgInfo.getStatusName()); 
			tem.addProperty("order_number", msgInfo.getOrderNo()); 
			tem.addProperty("order_date", orderDate); 
			tem.addProperty("order_first_name", msgInfo.getFirstName()); 
			tem.addProperty("order_name", msgInfo.getLastName()); 
			tem.addProperty("order_email", msgInfo.getEmail()); 
			tem.addProperty("order_mobile", msgInfo.getPhone()); 
			tem.addProperty("order_list", msgInfo.getProductName()); // + 옵션 정보 추가 
			tem.addProperty("receiver_first_name", (msgInfo.getReceiver()).substring(1)); 
			tem.addProperty("receiver_name", (msgInfo.getReceiver()).substring(0, 1)); 
			tem.addProperty("receiver_email", msgInfo.getReceiverEmail()); 
			tem.addProperty("receiver_mobile", msgInfo.getReceiverPhone()); 
			tem.addProperty("receiver_addr", msgInfo.getShippingAddress()); 
			tem.addProperty("request_message", memo); 
			tem.addProperty("payment_info", pay); 
		
			JsonArray receiverList = new JsonArray(); 
			JsonObject recip = new JsonObject();
			recip.addProperty("receiveMailAddr", msgInfo.getReceiverEmail());
			recip.addProperty("receiveType", "MRT0");
			receiverList.add(recip); 
			
			JsonObject json = new JsonObject(); 
			json.addProperty("templateId", templateId.concat("_mod"));
			json.add("templateParameter", tem); 
			json.add("receiverList", receiverList);
			email = communityService.sendEmail(json);

			if(emailCheck.get(0).getIsSendAdmin().equals("y")) {
				json.addProperty("templateId", templateId.concat("_admin_mod"));
				json.add("templateParameter", tem); 
				json.add("receiverList", receiverList);
				email = communityService.sendEmail(json);
			}
		}
		
		if(sms > 0 || email > 0) {
			result = 1;
		}
		return result;
	}
	
	/*
	// 회원가입, 아이디 찾기, 비밀번호 찾기 => 프론트단 구현 후
	@PostMapping("/sendRegistMsg")
	public int sendRegistMsg(@RequestBody String jsonStr) {
		int result = 0;
		// sms
		// shop_name, user_name
		
		// email
		// shop_name, user_name, user_id
		// + tmp_password
		return result;
	}
	*/
	
	/*
	// 적립금 관련 msg 발송 
	@PostMapping("/sendPointMsg")
	public int sendPointMsg(@RequestBody String jsonStr) {
		int result = 0;
		int sms = 0;
		int email = 0;

		// JsonParser
		JsonElement element = parser.parse(jsonStr);
		
		// memberCode 값 분리
		String str = element.getAsJsonObject().get("memberCode").getAsString();
		List<String> codeList = Arrays.asList(str.split(","));
		
		// data 가공
		String mode = element.getAsJsonObject().get("mode").getAsString();
		String content = element.getAsJsonObject().get("content").getAsString();
		String pointVal = element.getAsJsonObject().get("point").getAsString();
		String typeCode = element.getAsJsonObject().get("type").getAsString();
		String type = "";
		if(typeCode.equals("+")) {
			type = "지급";
		}
		else if(typeCode.equals("-")) {
			type = "차감";
		}
		
		// 발송 선택 여부
		String smsSend = element.getAsJsonObject().get("smsCheck").getAsString();
		String emailSend = element.getAsJsonObject().get("emailCheck").getAsString();

		// 자동 발송 여부 조회
		String templateId = "point";
		List<SmsSetting> smsCheck = communityService.smsCheck(templateId);
		List<EmailSetting> emailCheck = communityService.emailCheck(templateId);
		
		// memberCode로 회원 이름 조회
		List<Member> member = new ArrayList<>(); 
		List<String> name = new ArrayList<>();
		for(int i = 0; i < codeList.size(); i++) {
			member.addAll(memberService.selectMemberInfo(codeList.get(i)));
			name.add((member.get(i).getLastName()).concat(member.get(i).getFirstName()));
		}

		// 적립금 sms 발송
		if(smsSend.equals("y")) {
			for(int i = 0; i < name.size(); i++) {
				JsonObject tem = new JsonObject();
				tem.addProperty("shop_name", "ND이커머스"); // => 수정 필요
				tem.addProperty("user_name", name.get(i));
				tem.addProperty("point", pointVal);
				tem.addProperty("point_type", type);

				JsonArray recipientList = new JsonArray();
				JsonObject recip = new JsonObject();
				recip.addProperty("recipientNo",  member.get(i).getPhone()); 
				recip.add("templateParameter", tem);
				recipientList.add(recip);
				
				JsonObject json = new JsonObject();
				json.addProperty("templateId", templateId.concat("_mod"));
				json.add("recipientList", recipientList);
				sms = communityService.sendSms(json);
				
				if((smsCheck.get(0).getIsSendAdmin()).equals("y")) {
					json.addProperty("templateId", templateId.concat("_admin_mod"));
					json.add("recipientList", recipientList);
					sms = communityService.sendSms(json);
				}
			}
		}
		
		// 적립금 email 발송 
		if(emailSend.equals("y")) {
			for(int i = 0; i < name.size(); i++) {
				JsonObject tem = new JsonObject();
				tem.addProperty("shop_name", "ND이커머스"); // => 수정 필요
				tem.addProperty("user_name", name.get(i));
				tem.addProperty("point", pointVal);
				tem.addProperty("point_type", type);

				JsonArray receiverList = new JsonArray();
				JsonObject recip = new JsonObject();
				recip.addProperty("receiveMailAddr", member.get(i).getEmail());
				recip.addProperty("receiveType", "MRT0");
				receiverList.add(recip);
				
				JsonObject json = new JsonObject();
				json.addProperty("templateId", templateId.concat("_mod"));
				json.add("templateParameter", tem);
				json.add("receiverList", receiverList);
				email = communityService.sendEmail(json);
				
				if((emailCheck.get(0).getIsSendAdmin()).equals("y")) {
					json.addProperty("templateId", templateId.concat("_admin_mod"));
					json.add("templateParameter", tem);
					json.add("receiverList", receiverList);
					email = communityService.sendEmail(json);
				}
			}
		}

		// 회원 적립금 지급 및 차감 
		if(mode.equals("point")) {
			int point = Integer.parseInt(pointVal.replace(",", ""));
			
			// 차감일 경우, 음수로 변환
			if(typeCode.equals("-")) {
				point *= -1;
			}
			
			MemberPoint memberPoint = new MemberPoint();
			memberPoint.setPointAmount(point);
			memberPoint.setPointTitle(content);
			
			for(String memberNo : codeList) {
				memberPoint.setMemberNo(Integer.parseInt(memberNo));
				result = pointService.insertMemberPoint(memberPoint);
			}
		}
		
		if((sms > 0 || email > 0) && result != 0) {
			result = 1;
		}
		return result;
	}
	*/
	/*
	// 쿠폰 관련 msg 발송
	@PostMapping("/sendCouponMsg")
	public int sendCouponMsg(@RequestBody String jsonStr) {
		int result = 0;
		int sms = 0;
		int email = 0;
		
		// JsonParser
		JsonElement element = parser.parse(jsonStr);
		
		// data 가공
		String str = element.getAsJsonObject().get("memberCode").getAsString();
		List<String> codeList = Arrays.asList(str.split(",")); // 회원번호
		List<Member> member = new ArrayList<>(); 
		List<String> name = new ArrayList<>();
		for(int i = 0; i < codeList.size(); i++) {
			member.addAll(memberService.selectMemberInfo(codeList.get(i))); 
			name.add((member.get(i).getLastName()).concat(member.get(i).getFirstName()));
		}
		
		String mode = element.getAsJsonObject().get("mode").getAsString();
		String code = element.getAsJsonObject().get("couponCode").getAsString();
		List<Coupon> coupon = couponService.getCoupon(code);
		String couponName = coupon.get(0).getCouponName();
		String expirDate = "";
		if(coupon.get(0).getExpiryType().equals("unlimited")) {
			expirDate = "제한 없음";
		}
		else {
			SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
			expirDate = format.format(coupon.get(0).getExpiryEndDate()); // 쿠폰 만료일
		}

		// 발송 선택 여부
		String smsSend = element.getAsJsonObject().get("smsCheck").getAsString();
		String emailSend = element.getAsJsonObject().get("emailCheck").getAsString();

		// 자동 발송 여부 조회
		String templateId = "coupon";
		List<SmsSetting> smsCheck = communityService.smsCheck(templateId);
		List<EmailSetting> emailCheck = communityService.emailCheck(templateId);
		
		// 쿠폰 sms 발송 
		if(smsSend.equals("y")) {
			for(int i = 0; i < name.size(); i++) {
				JsonObject tem = new JsonObject();
				tem.addProperty("shop_name", "ND이커머스"); // => 수정 필요
				tem.addProperty("user_name", name.get(i));
				tem.addProperty("coupon_name", couponName);
				
				JsonArray recipientList = new JsonArray();
				JsonObject recip = new JsonObject();
				recip.addProperty("recipientNo", member.get(i).getPhone());
				recip.add("templateParameter", tem);
				recipientList.add(recip);
	
				JsonObject json = new JsonObject();
				json.addProperty("templateId", templateId.concat("_mod"));
				json.add("recipientList", recipientList);
				sms = communityService.sendSms(json);
				
				if((emailCheck.get(0).getIsSendAdmin()).equals("y")) {
					json.addProperty("templateId", templateId.concat("_admin_mod"));
					json.add("recipientList", recipientList);
					sms = communityService.sendSms(json);
				}
			}
		}	
		
		// 쿠폰 email 발송 
		if(emailSend.equals("y")) {
			for(int i = 0; i < name.size(); i++) {
				JsonObject tem = new JsonObject();
				tem.addProperty("shop_name", "ND이커머스"); // => 수정 필요
				tem.addProperty("user_name", name.get(i));
				tem.addProperty("coupon_name", couponName);
				tem.addProperty("date", expirDate);
	
				JsonArray receiverList = new JsonArray();
				JsonObject recip = new JsonObject();
				recip.addProperty("receiveMailAddr", member.get(i).getEmail()); 
				recip.addProperty("receiveType", "MRT0");
				receiverList.add(recip);
				
				JsonObject json = new JsonObject();
				json.addProperty("templateId", templateId.concat("_mod"));
				json.add("templateParameter", tem);
				json.add("receiverList", receiverList);
				email = communityService.sendEmail(json);
				
				if((emailCheck.get(0).getIsSendAdmin()).equals("y")) {
					json.addProperty("templateId", templateId.concat("_admin_mod"));
					json.add("templateParameter", tem);
					json.add("receiverList", receiverList);
					email = communityService.sendEmail(json);
				}
			}
		}
		
		// 쿠폰 지급 등록
		if(mode.equals("coupon")) {
			for(String memberNo : codeList) {
				MemberCoupon memberCoupon = new MemberCoupon(0, Integer.parseInt(memberNo), Integer.parseInt(code), null);
				result = couponService.insertMemberCoupon(memberCoupon);
			}
		}
				
		if((sms > 0 || email > 0) && result != 0) {
			result = 1;
		}
		return result;
	}
	*/
}
