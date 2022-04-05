package com.naedam.mir9.member.controller;

import java.beans.PropertyEditor;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.security.core.Authentication;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.naedam.mir9.member.model.service.MemberService;
import com.naedam.mir9.member.model.vo.Member;
import com.naedam.mir9.member.model.vo.MemberEntity;

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
	public String memberList(Model model, HttpServletRequest request) {
		
		// 회원 리스트 전체 게시물 목록
		List<MemberEntity> memberList = memberService.selectMemberList();
		log.debug("memberList = {}", memberList);
		model.addAttribute("memberList", memberList);
		
		// 전체 게시물 수
		int totalMemberListCount = memberService.selectMemerListCount();
		log.debug("totalMemberListCount = {}", totalMemberListCount);
		model.addAttribute("totalMemberListCount", totalMemberListCount);
		
		return "member/memberList";
	}
	
	// 회원 적립금 내역보기
	@GetMapping("/memberPointList/{memberNo}")
	public String memberPointList(
			@PathVariable int memberNo,
			Model model,
			HttpServletRequest request,
			HttpServletResponse response) {
		
		log.debug("memberNo = {}", memberNo);
		
		// 업무로직
		
		
		return "member/memberPointList";
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
			log.error("회원가입 실패", e);
			throw e;
		}
		
		return "redirect:/";
	}
	
	// 로그인 화면 요청
	@GetMapping("/memberLogin.do")
	public String memberLoginPage() {
		
		
		return "redirect:/";
	}
	
	@PostMapping("/memberLogin.do")
	public String memberLogin() {
		return "redirect:/dashBoard";
	}
	
	/**
	 * 
	 * @param binder
	 * @InitBinder
	 * 	사용자 요청을 커맨드 객체 바인딩 시 Validator 객체, 특정타입별 editor 객체 설정
	 * 
	 */
	@InitBinder
	public void initBinder(WebDataBinder binder) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd HH:mm");
		// 형식객체, 빈값허용여부("" -> null)
		PropertyEditor editor = new CustomDateEditor(sdf, true);
		binder.registerCustomEditor(Date.class, editor);
	}

}
