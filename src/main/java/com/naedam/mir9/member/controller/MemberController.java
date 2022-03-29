package com.naedam.mir9.member.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.naedam.mir9.member.model.service.MemberService;
import com.naedam.mir9.member.model.vo.Member;

import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/member")
@Slf4j
public class MemberController {
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private BCryptPasswordEncoder passwordEncoder;
	
	// 회원 리스트
	@RequestMapping("/list")
	public String memberList() {
		
		return "member/memberList";
	}
	
	// 탈퇴회원 리스트
	@GetMapping("/withdraw_list")
	public String withdarawalMemberList() {
		
		return "member/withdrawalMemberList";
	}
	
	// 회원 접속이력 관리
	@GetMapping("/log")
	public String memberAccessHistory() {
		
		return "member/memberAccessHistory";
	}
	
	// 등급 관리
	@GetMapping("/level")
	public String memberGrade() {
		
		return "member/memberGrade";
	}
	
	// 회원 적립금 관리
	@GetMapping("/point")
	public String memberPointList() {
		
		return "member/memberPointList";
	}
	
	// 회원가입
	@GetMapping("/memberEnroll.do")
	public String memberEnroll() {
		return "member/memberEnroll";
	}
	
	// 회원가입
	@PostMapping("/memberEnroll.do")
	public String memberEnroll(Member member, RedirectAttributes redirectAttr) {
		log.debug("member = {}", member);
		
		try {
			// 0. 비밀번호 암호화 처리
			log.info("{}", passwordEncoder);
			String rawPassword = member.getPassword();
			String encryptedPassword = passwordEncoder.encode(rawPassword);
			member.setPassword(encryptedPassword);
			log.info("{} -> {}", rawPassword, encryptedPassword);
			
			// 1.업무로직
			int result = memberService.insertMember(member);
			
			// 2.리다이렉트 & 사용자피드백 전달
			redirectAttr.addFlashAttribute("msg", "회원가입 성공!");
		} catch (Exception e) {
			e.printStackTrace();
			// spring에서 처리하라고 오류를 던짐
			throw e;
		}
		
		return "redirect:/";
	}
	
	@GetMapping("/memberLogin.do")
	public String memberLoginPage() {
		return "redirect:/";
	}
	
	@PostMapping("/memberLogin.do")
	public String memberLogin() {
		return "redirect:/dashBoard";
	}

}
