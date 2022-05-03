package com.naedam.mir9.community.model.service;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.naedam.mir9.community.model.dao.CommunityDao;
import com.naedam.mir9.community.model.vo.EmailSetting;
import com.naedam.mir9.community.model.vo.MsgInfo;
import com.naedam.mir9.community.model.vo.Review;
import com.naedam.mir9.community.model.vo.ReviewImg;
import com.naedam.mir9.community.model.vo.Sms;
import com.naedam.mir9.community.model.vo.SmsSetting;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

@Service
public class CommunityServiceImpl implements CommunityService {
	@Autowired
	private CommunityDao communityDao;

	// 리뷰 조회 + 검색
	@Override
	public List<Review> reviewList(Map<Object, String> param) {
		return communityDao.reviewList(param);
	}

	// 모달 정보
	@Override
	public List<Review> reviewModal(int reviewCode) {
		return communityDao.reviewModal(reviewCode);
	}

	// 모달 이미지
	@Override
	public List<ReviewImg> reviewImgModal(int reviewCode) {
		return communityDao.reviewImgModal(reviewCode);
	}

	// 카테고리 조회
	@Override
	public int selectCategory(String reviewCode) {
		return communityDao.selectCategory(reviewCode);
	}	
	
	// 이미지 삭제
	@Override
	public int imgDelete(String reviewCode) {
		return communityDao.imgDelete(reviewCode);
	}	
	
	// 리뷰 삭제
	@Override
	public int selectDelete(String reviewCode) {
		return communityDao.selectDelete(reviewCode);
	}

	// sms 기본 문구(81149)
	@Override
	public HashMap<String, Object> originSms(String smsKey, String smsSecret) {
		
		HashMap<String, Object> originSms = new HashMap<>();
		String getUrl = "https://api-sms.cloud.toast.com/sms/v3.0/appKeys/" + smsKey + "/templates?categoryId=81149&pageSize=24";
		
		try {
			// url
			URL url = new URL(getUrl);
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();	
			
			// method
			conn.setRequestMethod("GET");
			
			// headers
			conn.setRequestProperty("Content-Type", "application/json; charset=UTF-8");
			conn.setRequestProperty("X-Secret-Key", smsSecret);
			
			// 결과값 받기
			BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream(), "UTF-8"));
			
			String line = "";
			String result = "";
			
			while((line = br.readLine()) != null) {
				result += line;
			}
			
			// JsonParser
			JsonParser parser = new JsonParser();
			JsonElement element = parser.parse(result);
			
			// JSON>body>data에 접근
			JsonObject bodyElement = element.getAsJsonObject().get("body").getAsJsonObject();
			JsonArray data = bodyElement.getAsJsonObject().get("data").getAsJsonArray();

			// templateId, body 값을 담을 List 선언
			List<String> templateId = new ArrayList<>();
			List<String> body = new ArrayList<>();;
			
			for(int i = 0; i < data.size(); i++) {
				templateId.add((data.getAsJsonArray().get(i).getAsJsonObject()).get("templateId").getAsString());
			}
			for(int i = 0; i < data.size(); i++) {
				body.add((data.getAsJsonArray().get(i).getAsJsonObject()).get("body").getAsString());			
			}
			
			originSms.put("templateId", templateId);
			originSms.put("body", body);

		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return originSms;
	}

	// sms 저장 문구(81150)
	@Override
	public HashMap<String, Object> savedSms(String smsKey, String smsSecret) {
		
		HashMap<String, Object> savedSms = new HashMap<>();
		String getUrl = "https://api-sms.cloud.toast.com/sms/v3.0/appKeys/" + smsKey + "/templates?categoryId=81150&pageSize=24";
		
		try {
			// url
			URL url = new URL(getUrl);
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();	
			
			// method
			conn.setRequestMethod("GET");
			
			// headers
			conn.setRequestProperty("Content-Type", "application/json; charset=UTF-8");
			conn.setRequestProperty("X-Secret-Key", smsSecret);
			
			// 결과값 받기
			BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream(), "UTF-8"));
			
			String line = "";
			String result = "";
			
			while((line = br.readLine()) != null) {
				result += line;
			}
			
			// JsonParser
			JsonParser parser = new JsonParser();
			JsonElement element = parser.parse(result);
			
			// JSON>body>data에 접근
			JsonObject bodyElement = element.getAsJsonObject().get("body").getAsJsonObject();
			JsonArray data = bodyElement.getAsJsonObject().get("data").getAsJsonArray();
			
			// templateId, body 값을 담을 List 선언
			List<String> savedTemplateId = new ArrayList<>();
			List<String> savedBody = new ArrayList<>();
			
			for(int i = 0; i < data.size(); i++) {
				savedTemplateId.add((data.getAsJsonArray().get(i).getAsJsonObject()).get("templateId").getAsString());
			}
			for(int i = 0; i < data.size(); i++) {
				savedBody.add((data.getAsJsonArray().get(i).getAsJsonObject()).get("body").getAsString());			
			}

			savedSms.put("savedTemplateId", savedTemplateId);
			savedSms.put("savedBody", savedBody);
			
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return savedSms;	
	}

	// sms 문구 수정
	@Override
	public int updateSms(String smsKey, String smsSecret, String code, String content) {
		
		int result = 0;
		String codeMod = code.concat("_mod");
		
		// 수정용
		String put = "https://api-sms.cloud.toast.com/sms/v3.0/appKeys/" + smsKey + "/templates/" + codeMod;
		// 응답용
		String get = "https://api-sms.cloud.toast.com/sms/v3.0/appKeys/" + smsKey + "/templates/" + codeMod;

		try {
			// url
			URL putUrl = new URL(put); 
			HttpURLConnection putConn = (HttpURLConnection) putUrl.openConnection(); 
			
			// method
			putConn.setRequestMethod("PUT");
			
			// header
			putConn.setRequestProperty("Content-Type", "application/json; charset=UTF-8");
			putConn.setRequestProperty("X-Secret-Key", smsSecret);
			
			// doOutput : OutputStream으로 데이터를 넘겨주겠다
			putConn.setDoOutput(true);
			
			// data
			JsonObject json = new JsonObject();
			json.addProperty("templateName", codeMod); // 템플릿ID
			json.addProperty("sendNo", "01042026201"); // 발신 번호
			json.addProperty("sendType", "0"); // 발송 유형
			json.addProperty("body", content); // 문구 내용
			json.addProperty("useYn", "Y"); // 사용 유무
			
			// 데이터 전송 준비
			OutputStreamWriter os = new OutputStreamWriter(putConn.getOutputStream());
			os.write(json.toString());
			os.flush();
			os.close();
			
			int responseCode = putConn.getResponseCode();
			String responseMsg = putConn.getResponseMessage();

			// PUT 요청에 대한 응답 GET 요청
			URL getUrl = new URL(get);
			HttpURLConnection getConn = (HttpURLConnection) getUrl.openConnection();
			
			// method
			getConn.setRequestMethod("GET");
			
			// header
			getConn.setRequestProperty("Content-Type", "application/json; charset=UTF-8");
			getConn.setRequestProperty("X-Secret-Key", smsSecret);	
			
			// 응답데이터 얻기
			BufferedReader br = new BufferedReader(new InputStreamReader(getConn.getInputStream(), "UTF-8"));
			StringBuffer sb = new StringBuffer();
			
			String line = "";
			String response = "";
			
			while((line = br.readLine()) != null) {
				sb.append(line);
			}

			response = sb.toString();
			br.close();

			// JsonParser
			JsonParser parser = new JsonParser();
			JsonElement element = parser.parse(response);
			
			// JSON>header>resultMessage에 접근
			JsonObject header = element.getAsJsonObject().get("header").getAsJsonObject();
			String str = header.getAsJsonObject().get("resultMessage").getAsString();

			// 성공 시
			if(str.equals("success")) {
				result = 1;
			}
			
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	// sms 자동 발송 여부
	@Override
	public int smsAutoSend(HashMap<String, String> param) {
		return communityDao.smsAutoSend(param);
	}
	
	// mail 저장 문구 (49064)
	@Override
	public HashMap<String, Object> savedMail(String mailKey, String mailSecret, String templateId) {
		
		HashMap<String, Object> savedMail = new HashMap<>();
		String template = templateId.concat("_mod"); // 저장 템플릿명
		String getUrl = "https://api-mail.cloud.toast.com/email/v2.0/appKeys/" + mailKey + "/templates/" + template + "?categoryId=49064";

		try {
			// url
			URL url = new URL(getUrl);
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();	
			
			// method
			conn.setRequestMethod("GET");
			
			// headers
			conn.setRequestProperty("Content-Type", "application/json; charset=UTF-8");
			conn.setRequestProperty("X-Secret-Key", mailSecret);
			
			// 결과값 받기
			BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream(), "UTF-8"));
			
			String line = "";
			String result = "";
			
			while((line = br.readLine()) != null) {
				result += line;
			}

			// JsonParser
			JsonParser parser = new JsonParser();
			JsonElement element = parser.parse(result);
			
			// JSON>body>data>title, body에 접근
			JsonObject bodyElement = element.getAsJsonObject().get("body").getAsJsonObject();
			JsonObject data = bodyElement.getAsJsonObject().get("data").getAsJsonObject();
			 
			String title = (data.getAsJsonObject().getAsJsonObject()).get("title").getAsString();
			String body = (data.getAsJsonObject().getAsJsonObject()).get("body").getAsString();

			savedMail.put("title", title);
			savedMail.put("content", body);

		} catch (IOException e) {
			e.printStackTrace();
		}
			
		return savedMail;
	}

	// mail 기본 문구 (48300)
	@Override
	public HashMap<String, Object> originMail(String mailKey, String mailSecret, String templateId) {
		
		HashMap<String, Object> originMail = new HashMap<>();
		String getUrl = "https://api-mail.cloud.toast.com/email/v2.0/appKeys/" + mailKey + "/templates/" + templateId + "?categoryId=48300";

		try {
			// url
			URL url = new URL(getUrl);
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();	
			
			// method
			conn.setRequestMethod("GET");
			
			// headers
			conn.setRequestProperty("Content-Type", "application/json; charset=UTF-8");
			conn.setRequestProperty("X-Secret-Key", mailSecret);
			
			// 결과값 받기
			BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream(), "UTF-8"));
			
			String line = "";
			String result = "";
			
			while((line = br.readLine()) != null) {
				result += line;
			}

			// JsonParser
			JsonParser parser = new JsonParser();
			JsonElement element = parser.parse(result);
			
			// JSON>body>data>title, body에 접근
			JsonObject bodyElement = element.getAsJsonObject().get("body").getAsJsonObject();
			JsonObject data = bodyElement.getAsJsonObject().get("data").getAsJsonObject();
			
			String title = (data.getAsJsonObject().getAsJsonObject()).get("title").getAsString();
			String body = (data.getAsJsonObject().getAsJsonObject()).get("body").getAsString();

			originMail.put("title", title);
			originMail.put("content", body);

		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return originMail;
	}

	// mail 문구 수정
	@Override
	public int modifyMail(String mailKey, String mailSecret, String templateId, String title, String content) {
	
		int result = 0;
		String template = templateId.concat("_mod");
		String putUrl = "https://api-mail.cloud.toast.com/email/v2.0/appKeys/" + mailKey + "/templates/" + template;
		String getUrl = "https://api-mail.cloud.toast.com/email/v2.0/appKeys/" + mailKey + "/templates/" + template;

		try {
			// url
			URL url = new URL(putUrl);
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			
			// method
			conn.setRequestMethod("PUT");
			
			// header
			conn.setRequestProperty("Content-Type", "application/json; charset=UTF-8");
			conn.setRequestProperty("X-Secret-Key", mailSecret);
			
			// doOutput : OutputStream으로 데이터를 넘겨주겠다
			conn.setDoOutput(true);
			
			// data
			JsonObject json = new JsonObject();
			json.addProperty("templateName", template); // 템플릿ID
			json.addProperty("useYn", "Y"); // 사용 유무
			json.addProperty("title", title); // 발송 제목
			json.addProperty("body", content); // 문구 내용
			
			// 데이터 전송 준비
			OutputStreamWriter os = new OutputStreamWriter(conn.getOutputStream());
			os.write(json.toString());
			os.flush();
			os.close();
			
			int responseCode = conn.getResponseCode();

			// PUT 요청에 대한 응답 GET 요청
			URL get = new URL(getUrl);
			HttpURLConnection getConn = (HttpURLConnection) get.openConnection();
			
			// method
			getConn.setRequestMethod("GET");
			
			// header
			getConn.setRequestProperty("Content-Type", "application/json; charset=UTF-8");
			getConn.setRequestProperty("X-Secret-Key", mailSecret);	
			
			// 응답데이터 얻기
			BufferedReader br = new BufferedReader(new InputStreamReader(getConn.getInputStream(), "UTF-8"));
			StringBuffer sb = new StringBuffer();
			
			String line = "";
			String response = "";
			
			while((line = br.readLine()) != null) {
				sb.append(line);
			}

			response = sb.toString();
			br.close();

			// JsonParser
			JsonParser parser = new JsonParser();
			JsonElement element = parser.parse(response);
			
			// JSON>header>resultMessage에 접근
			JsonObject header = element.getAsJsonObject().get("header").getAsJsonObject();
			String str = header.getAsJsonObject().get("resultMessage").getAsString();

			// 성공 시
			if(str.equals("success")) {
				result = 1;
			}	
			
		} catch(IOException e) {
			e.printStackTrace();
		}
		
		return result;
	}

	@Override
	public int mailAutoSend(HashMap<String, String> param) {
		return communityDao.mailAutoSend(param);
	}

	// sms 자동 발송 체크 여부 조회
	@Override
	public List<SmsSetting> smsCheck(String templateId) {
		return communityDao.smsCheck(templateId);
	}

	// email 자동 발송 체크 여부 조회
	@Override
	public List<EmailSetting> emailCheck(String templateId) {
		return communityDao.emailCheck(templateId);
	}

	// v_msg_info 조회
	@Override
	public MsgInfo selectMsgInfo(long orderNo) {
		return communityDao.selectMsgInfo(orderNo);
	}

	// 조건별 메시지 발송
	// 주문 관련 sms 발송
	@Override
	public int sendOrderSms(String smsKey, String smsSecret, HashMap<String, Object> param) {

		int result = 0;
		String postUrl = "https://api-sms.cloud.toast.com/sms/v3.0/appKeys/" + smsKey +  "/sender/sms";
		
		try {
			// url
			URL url = new URL(postUrl);
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			
			// method
			conn.setRequestMethod("POST");
			
			// header
			conn.setRequestProperty("Content-Type", "application/json; charset=UTF-8");
			conn.setRequestProperty("X-Secret-Key", smsSecret);
			
			// doOutput : OutputStream으로 데이터를 넘겨주겠다
			conn.setDoOutput(true);
			
			// data
			JSONObject templateParameter = new JSONObject(); // 치환문구 설정
			templateParameter.put("shop_name", "ND이커머스"); 
			templateParameter.put("order_name", (String) param.get("name")); 
			templateParameter.put("order_number", (long) param.get("orderNo"));
			
			JSONObject recip = new JSONObject();
			recip.put("recipientNo", "01042026201");
			recip.put("templateParameter", templateParameter);
			
			JSONArray recipientList = new JSONArray(); // 수신자 정보 -> 배열 형태
			recipientList.add(recip);
			
			JSONObject json = new JSONObject();
			json.put("templateId", (String) param.get("templateId")); // 템플릿ID
			json.put("sendNo", "01042026201"); // 발송 번호
			json.put("recipientList", recipientList); // 수신자 정보
			
			// 데이터 전송 준비
			OutputStreamWriter os = new OutputStreamWriter(conn.getOutputStream());
			os.write(json.toString());
			os.flush();
			os.close();
			
			// 응답 데이터 반환
			BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream(), "UTF-8"));
			
			String line = "";
			String str = "";
			
			while((line = br.readLine()) != null) {
				str += line;
			}
			
			br.close();
			
			// JsonParser
			JsonParser parser = new JsonParser();
			JsonElement element = parser.parse(str);
			
			// element>body>data>requestId
			JsonObject bodyElement = element.getAsJsonObject().get("body").getAsJsonObject();
			JsonObject data = bodyElement.getAsJsonObject().get("data").getAsJsonObject();	
			String requestId = data.getAsJsonObject().get("requestId").getAsString();
			
			// requestId를 이용해서 전달한 내용 조회 및 DB에 저장
			// 발송 메시지 상세 조회
			String getUrl = "https://api-sms.cloud.toast.com/sms/v3.0/appKeys/" + smsKey + "/sender/sms?pageSize=1000&requestId=" + requestId;
			
			// url
			URL get = new URL(getUrl);
			HttpURLConnection getConn = (HttpURLConnection) get.openConnection();	
			
			// method
			getConn.setRequestMethod("GET");
			
			// headers
			getConn.setRequestProperty("Content-Type", "application/json; charset=UTF-8");
			getConn.setRequestProperty("X-Secret-Key", smsSecret);
			
			// 결과값 받기
			BufferedReader br2 = new BufferedReader(new InputStreamReader(getConn.getInputStream(), "UTF-8"));
			
			String line2 = "";
			String result2 = "";
			
			while((line2 = br2.readLine()) != null) {
				result2 += line2;
			}

			br2.close();
			
			// JsonParser
			JsonElement element2 = parser.parse(result2);
					
			// JSON>body>data>messageType, recipientNo, templateId, body, requestDate
			JsonObject bodyElement2 = element2.getAsJsonObject().get("body").getAsJsonObject();
			int total = bodyElement2.getAsJsonObject().get("totalCount").getAsInt(); // 총 개수
			
			JsonArray data2 = bodyElement2.getAsJsonObject().get("data").getAsJsonArray();
			String type = (data2.get(0).getAsJsonObject()).get("messageType").getAsString(); // 발송 타입

			// 수정 보완 : 테이블 조인해서 이름값으로 조회해오기
			List<String> phone = new ArrayList<>();
			List<String> title = new ArrayList<>();
			List<String> content = new ArrayList<>();
			List<String> requestDate = new ArrayList<>();
			
			for(int i = 0; i < total; i++) {
				phone.add(i, (data2.get(i).getAsJsonObject()).get("recipientNo").getAsString());
				content.add(i, (data2.get(i).getAsJsonObject()).get("body").getAsString());
				requestDate.add(i, (data2.get(i).getAsJsonObject()).get("requestDate").getAsString());
				
				String template = (data2.get(i).getAsJsonObject()).get("templateId").getAsString();
				String templateId = template.substring(0, template.lastIndexOf("_"));

				List<SmsSetting> smsSet = communityDao.smsCheck(templateId);
				title.add(i, smsSet.get(i).getTemplateName());
			}
			
			System.out.println("=====Service title=====");
			System.out.println(title);

			// 조회한 데이터 넘겨서 db에 저장하기
			int insert = 0;
			List<Sms> smsList = null;
			
			HashMap<String, Object> param2 = new HashMap<String, Object>();
			
			for(int i = 0; i < total; i++) {
				param2.put("type", type);
				param2.put("requestId", requestId);
				param2.put("phone", phone.get(i));
				param2.put("title", title.get(i));
				param2.put("content", content.get(i));
				param2.put("date", requestDate.get(i));
				
				insert += communityDao.insertSms(param2);
			}
			
			if(insert > 0) {
				result = 1;
			}
			
			System.out.println("=====Service result=====");
			System.out.println(result);
			
		} catch(IOException e) {
			e.printStackTrace();
		}

		return result;
	}

	// 주문 관련 mail 발송
	@Override
	public int sendOrderEmail(String mailKey, String mailSecret, HashMap<String, Object> param) {
		
		int result = 0;
		String postUrl = "https://api-mail.cloud.toast.com/email/v2.0/appKeys/" + mailKey +  "/sender/mail";

		try {
			// url
			URL url = new URL(postUrl);
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			
			// method
			conn.setRequestMethod("POST");
			
			// header
			conn.setRequestProperty("Content-Type", "application/json; charset=UTF-8");
			conn.setRequestProperty("X-Secret-Key", mailSecret);
			
			// doOutput : OutputStream으로 데이터를 넘겨주겠다
			conn.setDoOutput(true);
			
			// data
			SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
			String orderDate = format.format(param.get("orderDate"));
			String paidDate = format.format(param.get("paidAt"));
			String memo = (String) param.get("memo");
			if(memo == null) { // memo 값이 null일 경우
				memo = " ";
			}
			
			String pay = param.get("payAmount") + " " + param.get("payType") + " " + param.get("account") + " ";
			pay += param.get("bankName") + " " + param.get("owner") + " "; 
			pay += param.get("buyerName") + " " + paidDate;

			JSONObject templateParameter = new JSONObject(); // 치환문구 설정
			templateParameter.put("shop_name", "ND이커머스"); 
			templateParameter.put("payment_status", param.get("statusName")); 
			templateParameter.put("order_number", param.get("orderNo")); 
			templateParameter.put("order_date", orderDate); 
			templateParameter.put("order_first_name", param.get("firstName")); 
			templateParameter.put("order_name", param.get("lastName")); 
			templateParameter.put("order_email", param.get("email")); 
			templateParameter.put("order_mobile", param.get("phone")); 
			templateParameter.put("order_list", param.get("productName")); // + 옵션 정보 추가 
			templateParameter.put("receiver_first_name", param.get("receiver")); 
			templateParameter.put("receiver_name", param.get("receiver")); 
			templateParameter.put("receiver_email", param.get("email")); 
			templateParameter.put("receiver_mobile", param.get("receiverPhone")); 
			templateParameter.put("receiver_addr", param.get("shippingAddress")); 
			templateParameter.put("request_message", memo); 
			templateParameter.put("payment_info", pay); 
			
			JSONObject recip = new JSONObject();
			recip.put("receiveMailAddr", "lovefun33@naver.com");
			recip.put("receiveType", "MRT0");
			
			JSONArray receiverList = new JSONArray(); // 수신자 정보 -> 배열 형태
			receiverList.add(recip);
			
			JSONObject json = new JSONObject();
			json.put("templateId", (String) param.get("templateId")); // 템플릿ID
			json.put("templateParameter", templateParameter); // 치환
			json.put("receiverList", receiverList); // 수신자 정보
			
			// 데이터 전송 준비
			OutputStreamWriter os = new OutputStreamWriter(conn.getOutputStream());
			os.write(json.toString());
			os.flush();
			os.close();
			
			int responseCode = conn.getResponseCode();

			if(responseCode == 200) {
				result = 1;
			}
			
		} catch(IOException e) {
			e.printStackTrace();
		}
		
		return result;
	}

	// sms list 조회
	@Override
	public List<Sms> selectSmsList(HashMap<String, Object> param) {
		return communityDao.selectSmsList(param);
	}

}
