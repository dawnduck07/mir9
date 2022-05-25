package com.naedam.user.user.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.naedam.admin.member.model.vo.Member;
import com.naedam.user.user.model.service.UserService;
import com.naedam.user.user.model.vo.User;

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
		log.debug("{}", "userEnroll.do 실행!");
		return "user/user/userEnroll";
	}
	
	// id 중복 검사
	@ResponseBody
	@GetMapping("/checkIdDuplicate.do")
	public Map<String, Object> checkIdDuplicate(@RequestParam Map<String, Object> param) {
		log.debug("{}", "checkIdDuplicate.do 실행!");
		Map<String, Object> map = new HashMap<>();
		User user = userService.selectOneUserById(param);
		map.put("available", user == null);
		return map;
	}
	
	
	// 회원가입
	@PostMapping("/userEnroll.do")
	public String userEnroll(User user, RedirectAttributes redirectAttribute) {
		
		try {
			// 0. 비밀번호 암호화 처리
			String rawPassword = user.getPassword();
			String encryptedPassword = passwordEncoder.encode(rawPassword);
			user.setPassword(encryptedPassword);
			
			// 1.업무로직
			int result = userService.insertUser(user);
			
			// 2.리다이렉트 & 사용자피드백 전달
			redirectAttribute.addFlashAttribute("msg", "회원가입 성공!");
		} catch (Exception e) {
			log.error("회원가입 실패", e);
			throw e;
		}
		
		return "redirect:/";
	}
	
	// 이메일 중복 검사
	@ResponseBody
	@GetMapping("/checkEmailDuplicate.do")
	public Map<String, Object> checkEmailDuplicate(@RequestParam Map<String, Object> param) {
		log.debug("{}", "checkEmailDuplicate.do 실행!");
		log.debug("param = {}", param);
		Map<String, Object> map = new HashMap<>();
		User user = userService.selectOneMemberByEmail(param);
		map.put("available", user == null);
		return map;
	}
	
}
