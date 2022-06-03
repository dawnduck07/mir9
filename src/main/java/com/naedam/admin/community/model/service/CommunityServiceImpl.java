package com.naedam.admin.community.model.service;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.poi.util.SystemOutLogger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.naedam.admin.common.Mir9Utils;
import com.naedam.admin.community.model.dao.CommunityDao;
import com.naedam.admin.community.model.vo.Email;
import com.naedam.admin.community.model.vo.EmailSetting;
import com.naedam.admin.community.model.vo.MsgInfo;
import com.naedam.admin.community.model.vo.Review;
import com.naedam.admin.community.model.vo.ReviewImg;
import com.naedam.admin.community.model.vo.Sms;
import com.naedam.admin.community.model.vo.SmsSetting;
import com.naedam.admin.member.model.dao.MemberDao;

@Service
public class CommunityServiceImpl implements CommunityService {
	
	@Autowired
	private CommunityDao communityDao;
	
	@Autowired
	private MemberDao memberDao;
	
	// SMS 인증키
	private static String smsKey = "cuyb2ATgfZrgb0LF";
	private static String smsSecret = "3VxajYQb";	
	
	// MAIL 인증키
	private static String mailKey = "s3b1XpsH6BR8yT4S";
	private static String mailSecret = "phiu4e0M";
		
	// JsonParser
	private JsonParser parser = new JsonParser();

	// v_msg_info 조회
	@Override
	public MsgInfo selectMsgInfo(long orderNo) {
		return communityDao.selectMsgInfo(orderNo);
	}
	
	// sms 특정 설정값 조회
	@Override
	public List<SmsSetting> smsCheck(String templateId) {
		return communityDao.smsCheck(templateId);
	}

	// email 특정 설정값 조회
	@Override
	public List<EmailSetting> emailCheck(String templateId) {
		return communityDao.emailCheck(templateId);
	}	
	
	// email 자동 발송 여부 수정
	@Override
	public int mailAutoSend(HashMap<String, String> param) {
		return communityDao.mailAutoSend(param);
	}

	// sms 이용 내역 조회
	@Override
	public int countBySendPhone(String phone) {
		return communityDao.countBySendPhone(phone);
	}
	
	/**
	 * 공통 : 목록 + 검색 + 페이징
	 */
	@Override
	public Map<String, Object> selectCommunityList(
			String mode, int cPage, String field, String keyword, HttpServletRequest request){
		int total = 0; // 목록 개수		
		Map<String, Object> param = makePageParam(cPage, field, keyword); // 공통 조회 param
		List<Object> commList = new ArrayList<>(); // 목록 조회

		if(mode.equals("smsList")) { // SMS 목록
			total = communityDao.totalSmsCount(param);
			commList = communityDao.selectSmsList(param);
		}
		else if(mode.equals("emailList")) { // Email 목록
			total = communityDao.totalEmailCount(param); 
			commList = communityDao.selectEmailList(param); 
		}
		else if(mode.equals("review")) { // 후기 목록
			total = communityDao.totalReviewCount(param);
			commList = communityDao.reviewList(param);
		}
		
		String uri = request.getRequestURI();
		if((field != null && field != "") && (keyword != null && keyword != "")) {
			uri += "?field=" + field + "&keyword=" + keyword; // 검색 조건 쿼리스트링 처리
		}
		String pagebar = Mir9Utils.getPagebar(cPage, Integer.parseInt(param.get("limit").toString()), total, uri);
		
		Map<String, Object> listParam = new HashMap<>();
		listParam.put("commList", commList);
		listParam.put("total", total);
		listParam.put("param", param);
		listParam.put("pagebar", pagebar);
		
		return listParam;
	}
	
	/**
	 * ajax 요청
	 */
	@Override
	public Map<String, Object> load(
			String mode, Map<String, Object> param) {
		int res = 0;
		Map<String, Object> setMod = new HashMap<>();
		List<String> codeList = new ArrayList<>();
		List<String> temList = new ArrayList<>();
		List<String> sendList = new ArrayList<>();
		List<String> sendAdminList = new ArrayList<>();
		List<String> contentList = new ArrayList<>();
		
		// json
		JsonObject json = new JsonObject();
		if(param.get("jsonStr") != null && param.get("jsonStr") != "") {
			json = (JsonObject) parser.parse(param.get("jsonStr").toString());
		}
		
		// 맵핑에 따른 결과값
		Map<String, Object> result = new HashMap<>();
		if(mode.equals("charge")) { // SMS 이용 요금
			String id = (String) param.get("id");
			String memPhone = memberDao.getPhoneById(id);
			String phone = memPhone.substring(0, 3) + "-" + memPhone.substring(3, 7) + "-" + memPhone.substring(7);
			int sendCount = communityDao.countBySendPhone(phone);
			result.put("sendCount", sendCount);
		}
		else if(mode.equals("smsAutoSendCheck")) { // SMS 자동발송
			List<Object> smsSetting = communityDao.selectSmsSetting();
			result.put("smsSetting", smsSetting);
		}
		else if(mode.equals("originSms")) { // SMS 기본문구
			int category = 81149; // 기본 카테고리
			result.put("originSms", loadSms(category));
		}
		else if(mode.equals("savedSms")) { // SMS 저장문구
			int category = 81150; // 저장 카테고리
			result.put("savedSms", loadSms(category));
		}
		else if(mode.equals("smsSettingModify")) { // SMS 설정 저장
			JsonElement element = parser.parse(param.get("jsonStr").toString());
			JsonArray code = element.getAsJsonObject().get("code").getAsJsonArray();
			JsonArray templateId = element.getAsJsonObject().get("templateId").getAsJsonArray();
			JsonArray isSend = element.getAsJsonObject().get("isSend").getAsJsonArray();
			JsonArray content = element.getAsJsonObject().get("content").getAsJsonArray();

			// list로 가공
			for(int i = 0; i < code.size(); i ++) {
				codeList.add(code.get(i).getAsString());
			}
			for(int i = 0; i < templateId.size(); i++) {
				if(i == 0 || i%2 == 0) {
					sendList.add(isSend.get(i).getAsString());
				}
				else {
					sendAdminList.add(isSend.get(i).getAsString());
				}
				
				temList.add(templateId.get(i).getAsString());
				contentList.add(content.get(i).getAsString());
				res += modifySms(temList.get(i), contentList.get(i));
			}

			// 자동발송 여부 수정
			for(int i = 0; i < codeList.size(); i++) {
				setMod.put("templateId", codeList.get(i));
				setMod.put("send", sendList.get(i));
				setMod.put("sendAdmin", sendAdminList.get(i));
				res += communityDao.smsAutoSend(setMod);
			}
			if(res > 0) {
				result.put("modify", "success");
			}
		}
		else if(mode.equals("emailModal")) { // Email 상세보기
			
		}
		else if(mode.equals("emailAutoSendCheck")) { // Email 자동발송
			List<Object> emailSetting = communityDao.selectEmailSetting();
			result.put("emailSetting", emailSetting);
		}
		else if(mode.equals("originEmail")) { // Email 기본문구
			int category = 48300; // 기본 카테고리
			String templateId = ((List<String>) param.get("templateId")).get(0);
			result.put("originEmail", loadEmail(templateId, category));
		}
		else if(mode.equals("savedEmail")) { // Email 저장문구
			int category = 49064; // 저장 카테고리
			String templateId = ((List<String>) param.get("templateId")).get(0);
			result.put("savedEmail", loadEmail(templateId, category));
		}
		else if(mode.equals("emailModalModify")) { // Email 발송문구 수정
			// 템플릿 수정
		}
		else if(mode.equals("emailSettingModify")) { // Email 설정 저장
			// email_setting 수정
		}
		else if(mode.equals("reviewModal")) { // 후기 상세보기
			int reviewCode = (int) param.get("reviewCode");
			List<Review> review = communityDao.reviewModal(reviewCode);
			List<ReviewImg> reviewImg = communityDao.reviewImgModal(reviewCode);
			result.put("review", review);
			result.put("reviewImg", reviewImg);
		}
		return result;
	}
	
	/**
	 * 후기 삭제
	 */
	@Override
	public String selectDelete(HttpServletRequest request) {
		int result = 0;
		String msg = "";
		List<String> selectedCode = Arrays.asList(request.getParameterValues("list[]"));
		
		for(String reviewCode : selectedCode) {
			int categoryNo = communityDao.selectCategory(reviewCode);
			if(categoryNo == 1) { // 포토 상품평의 경우
				result += communityDao.imgDelete(reviewCode);
			}
			result += communityDao.selectDelete(reviewCode);
		}
		
		if(result > 0) {
			msg = "후기를 성공적으로 삭제했습니다.";
		}
		else {
			msg = "선택한 후기를 삭제할 수 없습니다.\n관리자에게 문의하세요.";
		}
		return msg;
	}	
	
	/**
	 * 공통 : 조회 => param
	 * @param cPage
	 * @param field
	 * @param keyword
	 * @return
	 */
	public Map<String, Object> makePageParam(int cPage, String field, String keyword) {
		int limit = 15;
		int startRow = (cPage - 1) * limit + 1;
		int endRow = startRow + limit -1;
	
		Map<String, Object> param = new HashMap<>();
		param.put("field", field);
		param.put("keyword", keyword);
		param.put("startRow", startRow);
		param.put("endRow", endRow);
		param.put("limit", limit);
		
		return param;
	}
	
	/**
	 * SMS 템플릿 문구 조회
	 * @param category
	 * @return
	 */
	public Map<String, Object> loadSms(int category) {
		// url
		String getUrl = "https://api-sms.cloud.toast.com/sms/v3.0/appKeys/" + smsKey + "/templates?categoryId=" + category + "&pageSize=24";

		// get 요청 : JSON>body>data
		JsonElement element = parser.parse(getRequest(getUrl, smsSecret));
		JsonObject bodyElement = element.getAsJsonObject().get("body").getAsJsonObject();
		JsonArray data = bodyElement.getAsJsonObject().get("data").getAsJsonArray();

		// templateId, content
		List<String> templateId = new ArrayList<>();
		List<String> content = new ArrayList<>();
		for(int i = 0; i < data.size(); i++) {
			templateId.add((data.getAsJsonArray().get(i).getAsJsonObject()).get("templateId").getAsString());
			content.add((data.getAsJsonArray().get(i).getAsJsonObject()).get("body").getAsString());			
		}

		Map<String, Object> loadSms = new HashMap<>();
		loadSms.put("templateId", templateId);
		loadSms.put("content", content);
		
		return loadSms;
	}
	
	/**
	 * Email 템플릿 문구 조회
	 * @param templateId
	 * @param category
	 * @return
	 */
	public Map<String, Object> loadEmail(String templateId, int category) {
		// url
		String getUrl = "https://api-mail.cloud.toast.com/email/v2.0/appKeys/" + mailKey + "/templates/" + templateId + "?categoryId=" + category;

		// get 요청 : JSON>body>data>title, body
		JsonElement element = parser.parse(getRequest(getUrl, mailSecret));
		JsonObject bodyElement = element.getAsJsonObject().get("body").getAsJsonObject();
		JsonObject data = bodyElement.getAsJsonObject().get("data").getAsJsonObject();
		 
		String title = (data.getAsJsonObject().getAsJsonObject()).get("title").getAsString();
		String body = (data.getAsJsonObject().getAsJsonObject()).get("body").getAsString();

		Map<String, Object> loadEmail = new HashMap<>();
		loadEmail.put("title", title);
		loadEmail.put("content", body);

		return loadEmail;
	}
	
	/**
	 * SMS 템플릿 문구 수정
	 * @param templateId
	 * @param content
	 * @return
	 */
	public int modifySms(String templateId, String content) {
		int result = 0;
		String putUrl = "https://api-sms.cloud.toast.com/sms/v3.0/appKeys/" + smsKey + "/templates/" + templateId;
		
		// data
		JsonObject json = new JsonObject();
		json.addProperty("templateName", templateId); // 템플릿ID
		json.addProperty("sendNo", "01042026201"); // 발신 번호 => 수정 필요
		json.addProperty("sendType", "0"); // 발송 유형
		json.addProperty("body", content); // 문구 내용
		json.addProperty("useYn", "Y"); // 사용 유무

		// put 요청 : JSON>header>resultMessage
		JsonElement element = parser.parse(putRequest(putUrl, smsSecret, json));
		JsonObject header = element.getAsJsonObject().get("header").getAsJsonObject();
		String str = header.getAsJsonObject().get("resultMessage").getAsString();

		if(str.equals("success")) {
			result = 1;
		}
		return result;
	}

	/*
	// mail 문구 수정
	@Override
	public int modifyMail(String templateId, String title, String content) {
		int result = 0;
		String template = templateId.concat("_mod");
		String putUrl = "https://api-mail.cloud.toast.com/email/v2.0/appKeys/" + mailKey + "/templates/" + template;

		// data
		JsonObject json = new JsonObject();
		json.addProperty("templateName", template); // 템플릿ID
		json.addProperty("useYn", "Y"); // 사용 유무
		json.addProperty("title", title); // 발송 제목
		json.addProperty("body", content); // 문구 내용

		// put 요청
		String result2 = putRequest(putUrl, mailSecret, json);

		// JSON>header>resultMessage
		JsonElement element = parser.parse(result2);
		JsonObject header = element.getAsJsonObject().get("header").getAsJsonObject();
		String str = header.getAsJsonObject().get("resultMessage").getAsString();

		if(str.equals("success")) {
			result = 1;
		}	
		return result;
	}
	*/
	
	/*
	// sms 발송
	@Override
	public int sendSms(JsonObject json) {
		int result = 0;
		int insert = 0;

		// post 요청
		String postUrl = "https://api-sms.cloud.toast.com/sms/v3.0/appKeys/" + smsKey +  "/sender/sms";
		String response = postRequest(postUrl, smsSecret, json);

		// JSON>body>data>requestId
		JsonElement element = parser.parse(response);
		JsonObject bodyElement = element.getAsJsonObject().get("body").getAsJsonObject();
		JsonObject data = bodyElement.getAsJsonObject().get("data").getAsJsonObject();	
		String requestId = data.getAsJsonObject().get("requestId").getAsString();
		
		// get 요청
		String getUrl = "https://api-sms.cloud.toast.com/sms/v3.0/appKeys/" + smsKey + "/sender/sms?pageSize=1000&requestId=" + requestId;
		String response2 = getRequest(getUrl, smsSecret);

		// JSON>body>data>messageType, recipientNo, templateId, body, requestDate
		JsonElement element2 = parser.parse(response2);
		JsonObject bodyElement2 = element2.getAsJsonObject().get("body").getAsJsonObject();
		int total = bodyElement2.getAsJsonObject().get("totalCount").getAsInt(); // 총 개수
		JsonArray data2 = bodyElement2.getAsJsonObject().get("data").getAsJsonArray();
		String type = (data2.get(0).getAsJsonObject()).get("messageType").getAsString(); // 발송 타입

		List<String> send = new ArrayList<>();
		List<String> phone = new ArrayList<>();
		List<String> title = new ArrayList<>();
		List<String> content = new ArrayList<>();
		List<String> requestDate = new ArrayList<>();
		
		// 데이터 가공
		for(int i = 0; i < total; i++) {
			String sendStr = (data2.get(i).getAsJsonObject()).get("sendNo").getAsString();
			String recipStr = (data2.get(i).getAsJsonObject()).get("recipientNo").getAsString();
			String sendForm = sendStr.substring(0, 3) + "-" + sendStr.substring(3, 7) + "-" + sendStr.substring(7);
			String recipForm = recipStr.substring(0, 3) + "-" + recipStr.substring(3, 7) + "-" + recipStr.substring(7);

			send.add(i, sendForm);
			phone.add(i, recipForm);
			content.add(i, (data2.get(i).getAsJsonObject()).get("body").getAsString());
			requestDate.add(i, (data2.get(i).getAsJsonObject()).get("requestDate").getAsString());

			String temStr = (data2.get(i).getAsJsonObject()).get("templateId").getAsString();
			String templateId = temStr.substring(0, temStr.lastIndexOf("_"));

			List<SmsSetting> smsSet = communityDao.smsCheck(templateId);
			title.add(i, smsSet.get(i).getTemplateName());
		}

		// 조회한 데이터 넘겨서 db에 저장하기
		HashMap<String, Object> param2 = new HashMap<String, Object>();
		for(int i = 0; i < total; i++) {
			param2.put("type", type);
			param2.put("send", send.get(i));
			param2.put("requestId", requestId);
			param2.put("phone", phone.get(i));
			param2.put("title", title.get(i));
			param2.put("content", content.get(i));
			param2.put("date", requestDate.get(i));
			
			insert = communityDao.insertSms(param2);
		}
		
		if(insert > 0) {
			result = 1;
		}
		return result;
	}
	*/
	
	/*
	// mail 발송
	@Override
	public int sendEmail(JsonObject json) {
		int result = 0;
		int insert = 0;
		String template = json.getAsJsonObject().get("templateId").getAsString();
		
		// post 요청
		String postUrl = "https://api-mail.cloud.toast.com/email/v2.0/appKeys/" + mailKey +  "/sender/mail";
		String response = postRequest(postUrl, mailSecret, json);

		// Json>element>body>data>requestId
		JsonElement element = parser.parse(response);
		JsonObject bodyElement = element.getAsJsonObject().get("body").getAsJsonObject();
		JsonObject data = bodyElement.getAsJsonObject().get("data").getAsJsonObject();
		String requestId = data.getAsJsonObject().get("requestId").getAsString();
		JsonArray arr = data.getAsJsonObject().get("results").getAsJsonArray();
		
		// 발송 메시지 상세 조회
		for(int j = 0; j < arr.size(); j++) {
			int mailSeq = j;
			// get 요청
			String getUrl = "https://api-mail.cloud.toast.com/email/v2.0/appKeys/" + mailKey + "/sender/mail/" + requestId + "/" + mailSeq + "?pageSize=1000";
			String response2 = getRequest(getUrl, mailSecret);

			System.out.println("=====Service mail : get 결과=====");
			System.out.println(response2);
			
			// JSON>body>data>mailStatusCode, title, body, requestDate
			JsonElement element2 = parser.parse(response2);
			JsonObject bodyElement2 = element2.getAsJsonObject().get("body").getAsJsonObject();
			JsonObject data2 = bodyElement2.getAsJsonObject().get("data").getAsJsonObject();
			String sendEmail = data2.getAsJsonObject().get("senderAddress").getAsString();
			JsonObject tem = json.getAsJsonObject().get("templateParameter").getAsJsonObject();
			
			// JSON>body>data>receiverList>receiveMailAddr
			JsonArray receiver = data2.getAsJsonObject().get("receiverList").getAsJsonArray();
		
			// content
			String contentStr = "";
			if(template.contains("point")) { // 적립금
				contentStr = "적립금 " + tem.getAsJsonObject().get("point_type").getAsString() + " : 적립금 " 
							+ tem.getAsJsonObject().get("point").getAsString() + "원, 종류 " 
							+ tem.getAsJsonObject().get("point_type").getAsString();
			}
			else if(template.contains("coupon")) { // 쿠폰
				contentStr = "쿠폰 발급 : 쿠폰명 " + tem.getAsJsonObject().get("coupon_name").getAsString() + ", 유효기간 " 
							+ tem.getAsJsonObject().get("date").getAsString();
			}
			else if(template.contains("join") || template.contains("findid")) { // 회원가입, 아이디 찾기
				contentStr = "회원 정보 : 회원명 " + tem.getAsJsonObject().get("user_name").getAsString() + ", 아이디 " 
							+ tem.getAsJsonObject().get("user_id").getAsString();
			}
			else if(template.contains("findpw")) { // 임시 비밀번호
				contentStr = "회원 정보 : 아이디 " + tem.getAsJsonObject().get("user_id").getAsString() + ", 임시 비밀번호 " 
							+ tem.getAsJsonObject().get("tmp_password").getAsString();
			}
			else { // 주문 관련
				contentStr = "주문 정보 : 상태 " + tem.get("payment_status").getAsString() + ", 주문 번호 " 
							+ tem.getAsJsonObject().get("order_number").getAsString() + ", 주문 일자 " 
							+ tem.getAsJsonObject().get("order_date").getAsString() + "\n주문자 정보 : 이름 " 
							+ tem.getAsJsonObject().get("order_name").getAsString() 
							+ tem.getAsJsonObject().get("order_first_name").getAsString()  + ", 이메일 " 
							+ tem.getAsJsonObject().get("order_email").getAsString()  + ", 휴대폰 번호 " 
							+ tem.getAsJsonObject().get("order_mobile").getAsString() + ", 주문 상품 " 
							+ tem.getAsJsonObject().get("order_list").getAsString() + "\n받는사람 정보 : 이름 " 
							+ tem.getAsJsonObject().get("receiver_name").getAsString() 
							+ tem.getAsJsonObject().get("receiver_first_name").getAsString() + ", 이메일 " 
							+ tem.getAsJsonObject().get("receiver_email").getAsString() + ", 휴대폰 번호 " 
							+ tem.getAsJsonObject().get("receiver_mobile").getAsString() + ", 주소 " 
							+ tem.getAsJsonObject().get("receiver_addr").getAsString() + ", 배송 메시지 " 
							+ tem.getAsJsonObject().get("request_message").getAsString() + "\n결제 정보 : " 
							+ tem.getAsJsonObject().get("payment_info").getAsString();
			}
			
			// 저장할 데이터
			List<String> email = new ArrayList<>();
			List<String> title = new ArrayList<>();
			List<String> content = new ArrayList<>();
			List<String> requestDate = new ArrayList<>();
			
			for(int i = 0; i < receiver.size(); i++) {
				email.add(i, (receiver.getAsJsonArray().get(i).getAsJsonObject()).get("receiveMailAddr").getAsString());
				title.add(i, data2.getAsJsonObject().get("title").getAsString());
				content.add(i, contentStr);
				requestDate.add(i, data2.getAsJsonObject().get("requestDate").getAsString());
			}
			
			// 조회한 데이터 넘겨서 db에 저장하기
			HashMap<String, Object> param2 = new HashMap<String, Object>();
			for(int i = 0; i < receiver.size(); i++) {
				param2.put("send", sendEmail);
				param2.put("requestId", requestId);
				param2.put("email", email.get(i));
				param2.put("title", title.get(i));
				param2.put("content", content.get(i));
				param2.put("date", requestDate.get(i));

				insert = communityDao.insertEmail(param2);
			}
		}
		
		if(insert > 0) {
			result = 1;
		}
		return result;
	}
	*/

	
	/**
	 * 공통 : GET 요청
	 * @param url
	 * @param secret
	 * @return
	 */
	public String getRequest(String url, String secret) {
		String line = ""; 
		String result = "";
		
		try {
			// url
			URL get = new URL(url);
			HttpURLConnection getConn = (HttpURLConnection) get.openConnection();	
			
			// method
			getConn.setRequestMethod("GET");
			
			// headers
			getConn.setRequestProperty("Content-Type", "application/json;charset=UTF-8");
			getConn.setRequestProperty("X-Secret-Key", secret);
			
			// 결과값 받기
			BufferedReader br = new BufferedReader(new InputStreamReader(getConn.getInputStream(), "UTF-8"));
			while((line = br.readLine()) != null) {
				result += line;
			}
			br.close();

			int ResponseCode = getConn.getResponseCode();
			
			getConn.disconnect();
		} catch (IOException e) {
			e.printStackTrace();
		} 
		
		return result;
	}
	
	/**
	 * 공통 : POST 요청
	 * @param url
	 * @param secret
	 * @param json
	 * @return
	 */
	public String postRequest(String url, String secret, JsonObject json) { 
		String line = "";
		String result = "";

		try {
			// url
			URL post = new URL(url);
			HttpURLConnection postConn = (HttpURLConnection) post.openConnection();
			
			// method
			postConn.setRequestMethod("POST");
			
			// header
			postConn.setRequestProperty("Content-Type", "application/json;charset=UTF-8");
			postConn.setRequestProperty("X-Secret-Key", secret);
			
			// doOutput : OutputStream으로 데이터를 넘겨주겠다
			postConn.setDoInput(true);
			postConn.setDoOutput(true);
			
			// 데이터 전송 준비
			OutputStreamWriter os = new OutputStreamWriter(postConn.getOutputStream(), "UTF-8");
			os.write(json.toString());
			os.flush();
			os.close();
			
			int ResponseCode = postConn.getResponseCode();
			
			// 응답 데이터 반환
			BufferedReader br = new BufferedReader(new InputStreamReader(postConn.getInputStream(), "UTF-8"));
			while((line = br.readLine()) != null) {
				result += line;
			}
			br.close();
			
			postConn.disconnect();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	/**
	 * 공통 : PUT 요청
	 * @param url
	 * @param secret
	 * @param json
	 * @return
	 */
	public String putRequest(String url, String secret, JsonObject json) {
		String result = "";
		
		try {
			// url
			URL put = new URL(url); 
			HttpURLConnection putConn = (HttpURLConnection) put.openConnection(); 
			
			// method
			putConn.setRequestMethod("PUT");
			
			// header
			putConn.setRequestProperty("Content-Type", "application/json;charset=UTF-8");
			putConn.setRequestProperty("X-Secret-Key", secret);
			
			// doOutput : OutputStream으로 데이터를 넘겨주겠다
			putConn.setDoOutput(true);
			
			// 데이터 전송 준비
			OutputStreamWriter os = new OutputStreamWriter(putConn.getOutputStream(), "UTF-8");
			os.write(json.toString());
			os.flush();
			os.close();
			
			// 응답 데이터 반환
			int ResponseCode = putConn.getResponseCode();
			result = getRequest(url, secret);
			
			putConn.disconnect();
		}catch(IOException e) {
			e.printStackTrace();
		}
		
		return result;
	}

}
