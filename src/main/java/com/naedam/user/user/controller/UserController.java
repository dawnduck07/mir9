package com.naedam.user.user.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.naedam.admin.member.model.vo.Member;
import com.naedam.user.user.model.service.UserService;

import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/user/user")
@Slf4j
public class UserController {

	@Autowired
	private UserService userService;
	
	@Autowired
	private BCryptPasswordEncoder passwordEncoder;
	
	// 회원가입
	@GetMapping("/userEnroll.do")
	public String userEnroll() {
		log.debug("{}, userEnroll.do");
		return "user/user/userEnroll";
	}
	
	// 회원가입
	@PostMapping("/userEnroll.do")
	public String userEnroll(Member member, RedirectAttributes redirectAttribute) {
		
		try {
			// 0. 비밀번호 암호화 처리
			String rawPassword = member.getPassword();
			String encryptedPassword = passwordEncoder.encode(rawPassword);
			member.setPassword(encryptedPassword);
			
			// 1.업무로직
			int result = userService.insertUser(member);
			
			// 2.리다이렉트 & 사용자피드백 전달
			redirectAttribute.addFlashAttribute("msg", "회원가입 성공!");
		} catch (Exception e) {
			log.error("회원가입 실패", e);
			throw e;
		}
		
		return "redirect:/";
	}
	
}
