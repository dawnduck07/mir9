package com.naedam.mir9.member.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
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
	
	@RequestMapping("/list")
	public String memberList() {
		
		return "member/memberList";
	}
	
	@GetMapping("/wdw")
	public String withdarawalMemberList() {
		
		return "member/withdrawalMemberList";
	}
	
	@GetMapping("/accesshistory")
	public String memberAccessHistory() {
		
		return "member/memberAccessHistory";
	}
	
	@GetMapping("/grade")
	public String memberGrade() {
		
		return "member/memberGrade";
	}
	
	@GetMapping("/pointList")
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
	
	// 로그인
	@PostMapping("/memberLogin.do")
	public String memberLogin(@RequestParam String id, @RequestParam String password) {
		
		// 1. 업무로직 - 사용자 데이터 가져오기
		Member member = memberService.selectOneMember(id);
		log.debug("member = {}", member);
		
		// 2. DB정보 비교하기(로그인 성공여부 판단)
		
		
		return "redirect:/";
	}
	
	
}
