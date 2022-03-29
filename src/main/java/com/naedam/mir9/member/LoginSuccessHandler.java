package com.naedam.mir9.member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;

import com.naedam.mir9.member.model.vo.Member;

public class LoginSuccessHandler implements AuthenticationSuccessHandler {
	
	@Override
	public void onAuthenticationSuccess(
			HttpServletRequest req, 
			HttpServletResponse res, 
			Authentication authdata) throws IOException, ServletException {
		// 인증된 사용자의 정보를 추출
		//Member member = (Member)
	}
}
