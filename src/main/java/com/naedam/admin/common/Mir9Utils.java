package com.naedam.admin.common;

import java.io.IOException;
import java.text.DecimalFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;

import lombok.extern.slf4j.Slf4j;

@Slf4j
public class Mir9Utils {
	/**
	 * 
	 *  
	 * @param cPage
	 * @param numPerPage
	 * @param totalContents
	 * @param url
	 * @return
	 */

	public static String getPagebar(int cPage, int numPerPage, int totalContents, String url) {
		StringBuilder pagebar = new StringBuilder();
		
		// 전체페이지수
		int totalPage = (int) Math.ceil((double) totalContents / numPerPage);
		
		// 페이지번호를 클릭했을 때 링크
		String delimeter = url.contains("?") ? "&" : "?";
		url = url + delimeter + "cPage="; // /spring/board/boardList.do?cPage=
		
		// 페이지바 크기 
		int pagebarSize = 5;
		
		/* 
		 		1 2 3 4 5 >>
		 		
		 	<<	6 7 8 9 10 >>
		 	
		 	<< 11 12
		 	
		 	pageStart : 시작하는 pageNo
		 		- cPage와 pagebarSize에 의해 결정
		 */
		int pageStart = (cPage - 1) / pagebarSize * pagebarSize + 1;
		int pageEnd = pageStart + pagebarSize - 1;
		
		int pageNo = pageStart;
		
		/*
		 *  ● disabled : 필요 없는 목록 비활성화 처리
		 *  ● tabindex = "-1" : tab을 해도 건너 띄게끔 처리(disabled 처리 할 때 같이 처리) 
		 *  ● <span aria-hidden="true">&laquo;</span> : << 꺽쇠
		 *  ● <span aria-hidden="true">&raquo;</span> : >> 꺽쇠
		 */
		
		/*
		 <nav aria-label="Page navigation example">
		  <ul class="pagination justify-content-center">
		  
		  	// 이전 영역
		    <li class="page-item disabled">
		      <a class="page-link" href="#" aria-label="Previous" tabindex="-1">
		        <span aria-hidden="true">&laquo;</span>
		        <span class="sr-only">Previous</span>
		      </a>
		    </li>
		    
		    // 페이지바 영역
		    <li class="page-item"><a class="page-link" href="#">1</a></li>
		    <li class="page-item"><a class="page-link" href="#">2</a></li>
		    <li class="page-item"><a class="page-link" href="#">3</a></li>
		    
		    // 다음 영역
		    <li class="page-item">
		      <a class="page-link" href="#" aria-label="Next">
		        <span aria-hidden="true">&raquo;</span>
		        <span class="sr-only">Next</span>
		      </a>
		    </li>
		    
		  </ul>
		</nav>
		<script>
		const paging = (cPage) => {
			location.href = url + cPage;
		}
		</script>
		
		 */
		
		// \n : 마지막에 개행문자를 붙혀준다. --> 확인 용이.
		pagebar.append("<nav aria-label=\"Page navigation example\">\n"
				+ "		  <ul class=\"pagination justify-content-center\">\n");
		
		// 1. 이전
		/*
		 * ● pageNo == 1 이전 페이지가 없으므로,
		 * ● disabled & tabindex="-1" 처리
		 */
		if(pageNo == 1) {
			pagebar.append("<li class=\"page-item disabled\">\r\n"
					+ "		      <a class=\"page-link\" href=\"#\" aria-label=\"Previous\" tabindex=\"-1\">\r\n"
					+ "		        <span aria-hidden=\"true\">&laquo;</span>\r\n"
					+ "		        <span class=\"sr-only\">Previous</span>\r\n"
					+ "		      </a>\r\n"
					+ "		    </li>\n");
		}
		/*
		 * ● 자바 스크립트 함수 호출 : href=\"javascript:paging(" + (pageNo - 1) + ") --> 이전 페이지로.
		 */
		else {
			pagebar.append("<li class=\"page-item \">\r\n"
					+ "		      <a class=\"page-link\" href=\"javascript:paging(" + (pageNo - 1) + ")\" aria-label=\"Previous\" >\r\n"
					+ "		        <span aria-hidden=\"true\">&laquo;</span>\r\n"
					+ "		        <span class=\"sr-only\">Previous</span>\r\n"
					+ "		      </a>\r\n"
					+ "		    </li>\n");
		}
		
		// 2. pageNo
		while(pageNo <= pageEnd && pageNo <= totalPage) {
			if(pageNo == cPage) {
				/*
				 * ● 현재 페이지인 경우 링크 제공안함.
				 * ● class 값으로 active 추가
				 * ● a 태그 안에 pageNo
				 */
				pagebar.append("<li class=\"page-item active\"><a class=\"page-link\" href=\"#\">" + pageNo + "<span class=\"sr-only\">(current)</span></a></li>\n");
			}
			else {
				/*
				 * ● 현재 페이지가 아닌 경우 링크를 제공.
				 * ● href=\"javascript:paging(" + pageNo + ")
				 */
				pagebar.append("<li class=\"page-item\"><a class=\"page-link\" href=\"javascript:paging(" + pageNo + ")\">" + pageNo + "</a></li>\n");
			}
			
			pageNo++;
		}
		
		// 3. 다음
		/* 
		 * ● pageNO > totalPage 인 경우 다음 페이지로 이동 없게끔 조치.
		 * ● disabled & tabindex="-1" 처리
		 */
		if(pageNo > totalPage) {
			pagebar.append("<li class=\"page-item disabled\">\r\n"
					+ "		      <a class=\"page-link\" href=\"#\" tabindex=\"-1\" aria-label=\"Next\">\r\n"
					+ "		        <span aria-hidden=\"true\">&raquo;</span>\r\n"
					+ "		        <span class=\"sr-only\">Next</span>\r\n"
					+ "		      </a>\r\n"
					+ "		    </li>\n");
		}
		/*
		 * ● 자바 스크립트 함수 호출 : href=\"javascript:paging(" + (pageNo) + ") --> 다음 페이지로.
		 */
		else {
			pagebar.append("<li class=\"page-item\">\r\n"
					+ "		      <a class=\"page-link\" href=\"javascript:paging(" + pageNo + ")\" aria-label=\"Next\">\r\n"
					+ "		        <span aria-hidden=\"true\">&raquo;</span>\r\n"
					+ "		        <span class=\"sr-only\">Next</span>\r\n"
					+ "		      </a>\r\n"
					+ "		    </li>\n");
		}
		
		pagebar.append("		  </ul>\r\n"
				+ "		</nav>\r\n"
				+ "		<script>\r\n"
				+ "		const paging = (cPage) => {\r\n"
				+ "			location.href = '" + url + "' + cPage;\r\n"
				+ "		}\r\n"
				+ "		</script>\n");
		// '" + url + "' : 문자열로 처리되어야 하기때문
		return pagebar.toString();
	}

	// 파일 업로드 유틸
	public static String getRenamedFilename(String originalFilename) {
		// 확장자 가져오기
		// 확장자 문자열 변수를 하나 만들어 놓는다.
		String ext = ""; 
		
		// 매개변수로 넘어온 originalFilename에서 마지막 "." index를 찾는다.
		int dot = originalFilename.lastIndexOf(".");
		
		// 확장자가 있다면, "." index 이후로 잘라내기를 한다. 
		if(dot > -1)
			ext = originalFilename.substring(dot); // .txt
		
		// 형식지정
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd_HHmmssSSS_");
		// 난수 생성(무조건 세자리)
		DecimalFormat df = new DecimalFormat("000"); // 30 -> 030
		
		// 새 파일명
		return sdf.format(new Date()) + df.format(Math.random() * 999) + ext;
	}
	
	public static Map<String, Object> parseJsonStr(String jsonStr) {
		ObjectMapper mapper = new ObjectMapper();
		HashMap<String, Object> map = new HashMap<String, Object>();
		try {
			map = mapper.readValue(jsonStr, 
			        new TypeReference<HashMap<String, Object>>() {});
		} catch (IOException e) {
			
		}
		
		return map;
	}
	
	
	public static Date stringToDate(String dateStr) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date date = new Date();
		try {
			date = sdf.parse(dateStr);
		} catch (ParseException e) {}
		return date;
	}
	
	// 접속 IP 구하기 
	public static String getClientIP(HttpServletRequest request) {
	    
		String ip = request.getHeader("X-Forwarded-For");
	    log.debug("> X-FORWARDED-FOR : = {}", ip);
	   
	    if (ip == null) {
	        ip = request.getHeader("Proxy-Client-IP");
	        log.debug("> Proxy-Client-IP : = {}", ip);
	    }
	    if (ip == null) {
	        ip = request.getHeader("WL-Proxy-Client-IP");
	        log.debug("> WL-Proxy-Client-IP : = {}", ip);
	    }
	    if (ip == null) {
	        ip = request.getHeader("HTTP_CLIENT_IP");
	        log.debug("> HTTP_CLIENT_IP : = {}", ip);
	    }
	    if (ip == null) {
	        ip = request.getHeader("HTTP_X_FORWARDED_FOR");
	        log.debug("> HTTP_X_FORWARDED_FOR : = {}", ip);
	    }
	    if (ip == null) {
	        ip = request.getRemoteAddr();
	        log.debug("> getRemoteAddr : = {}", ip);
	    }
	    log.debug("> Result : IP Address : = {}", ip);

	    return ip;
	}
}
