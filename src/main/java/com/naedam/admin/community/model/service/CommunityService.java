package com.naedam.admin.community.model.service;

import java.util.Map;
import javax.servlet.http.HttpServletRequest;

public interface CommunityService {

	// 공통 : 목록 + 검색 + 페이징
	Map<String, Object> selectCommunityList(
			String mode, int cPage, String field, String keyword, HttpServletRequest request); 
	
	// ajax 요청
	Map<String, Object> load(String mode, Map<String, Object> param); 
	
	// 메시지 발송
	Map<String, Object> send(String mode, String jsonStr); 
	
	// 후기 삭제
	String selectDelete(HttpServletRequest request);
	
}
