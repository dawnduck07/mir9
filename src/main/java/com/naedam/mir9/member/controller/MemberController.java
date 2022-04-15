package com.naedam.mir9.member.controller;

import java.beans.PropertyEditor;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.naedam.mir9.member.model.service.MemberService;
import com.naedam.mir9.member.model.vo.Address;
import com.naedam.mir9.member.model.vo.Member;
import com.naedam.mir9.member.model.vo.MemberEntity;
import com.naedam.mir9.member.model.vo.MemberGrade;
import com.naedam.mir9.member.model.vo.MemberMemo;

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
	@RequestMapping("/list.do")
	public String memberList(Model model, HttpServletRequest request) {
		
		// 회원 리스트 전체 게시물 목록
		List<MemberEntity> memberList = memberService.selectMemberList();
		log.debug("memberList = {}", memberList);
		model.addAttribute("memberList", memberList);
		
		// 전체 게시물 수
		int totalMemberListCount = memberService.selectMemerListCount();
		log.debug("totalMemberListCount = {}", totalMemberListCount);
		model.addAttribute("totalMemberListCount", totalMemberListCount);
		
		// 명칭 가져오기
		List<MemberGrade> memberGradeList = memberService.selectMemberGradeList();
		log.debug("memberGradeList = {}", memberGradeList);
		model.addAttribute("memberGradeList", memberGradeList);
		
		return "member/memberList";
	}
	
	// id 중복 검사
	@ResponseBody
	@GetMapping("/checkIdDuplicate.do")
	public Map<String, Object> checkIdDuplicate(@RequestParam Map<String, Object> param) {
		log.debug("id = {}", param);
		Map<String, Object> map = new HashMap<>();
		Member member = memberService.selectOneMemberByMap(param);
		log.debug("member = {}", member);

		map.put("available", member == null);
		
		return map;
	}
	
	// 회원리스트 - 등록
	@PostMapping("/memberInsertModalFrm.do")
	public String memberInsertModalFrm(
						Member member, 
						Address address,
						MemberMemo memberMemo,
						MemberGrade memberGradeNo,
						@RequestParam String mobile1,
						@RequestParam String mobile2,
						@RequestParam String mobile3,
						RedirectAttributes redirectAttributes) {
		log.debug("{}", "memberInsertModalFrm.do 요청!");
		log.debug("memberEntity = {}", member);
		log.debug("memberMemo = {}", memberMemo);
		log.debug("memberGradeNo = {}", memberGradeNo);
		log.debug("mobile = {}", mobile1);
		log.debug("mobile = {}", mobile2);
		log.debug("mobile = {}", mobile3);
		log.debug("address = {}", address);
		
		String phone = mobile1 + mobile2 + mobile3;
		
		// 0. 비밀번호 암호화 처리
		log.debug("{}", passwordEncoder);
		String rawPassword = member.getPassword();
		String encryptedPassword = passwordEncoder.encode(rawPassword);
		member.setPassword(encryptedPassword);
		log.debug("{} -> {}", rawPassword, encryptedPassword);
		
		// 1. 회원(Member) 등록
		Member paramMember = new Member();
		
		paramMember.setFirstName(member.getFirstName());
		paramMember.setLastName(member.getLastName());
		paramMember.setEmail(member.getEmail());
		paramMember.setPhone(phone);
		paramMember.setStatus(member.getStatus());
		paramMember.setId(member.getId());
		paramMember.setPassword(member.getPassword());
		paramMember.setProfileImg(member.getProfileImg());
				
		int resultRegisterMember = memberService.insertMember(paramMember);
		log.debug("resultRegisterMember = {}", resultRegisterMember);
		
		// 2. 주소 입력
		int resultRegisterAddress = memberService.insertAddress(address);
		log.debug("resultRegisterAddress = {}", resultRegisterAddress);
		
		// 3. 메모 입력
		// 3.1. 회원 입력 시 생성된 회원번호(MemberNo) 설정
		memberMemo.setMemberNo(paramMember.getMemberNo());
		
		// 3.2. 메모 입력
		int resultRegisterMemberMemo = memberService.insertMemberMemo(memberMemo);
		log.debug("resultRegisterMemberMemo = {}", resultRegisterMemberMemo);
		
		return "redirect:/member/memberList";
	}
	
	// 타입별 검색
	@ResponseBody
	@GetMapping("/typeSearch.do")
	public Map<String, Object> typeSearch(
			@RequestParam String type, 
			@RequestParam String keyword,
			HttpServletRequest request){
		log.debug("{}", "타입별 검색 시작");
		log.debug("type = {}", type);
		log.debug("keyboard = {}", keyword);
		
		Map<String, Object> param = new HashMap<>();
		param.put("type", type);
		param.put("keyword", keyword);
		log.debug("param = {}", param);
		
		// 검색 게시물 
		List<MemberEntity> searchMemberList = memberService.selectSearchMemberList(param);
		log.debug("searchMemberList = {}", searchMemberList);

		// 검색 게시물 수
		int searchListCount = memberService.selectSearchListCount(param);
		log.debug("searchListCount = {}", searchListCount);
		
		Map<String, Object> resultMap = new HashMap<>();
		resultMap.put("searchMemberList", searchMemberList);
		resultMap.put("searchListCount", searchListCount);
		
		return resultMap;
	}
	
	// 회원 선택 삭제
	@PostMapping("/memberDelete.do")
	public String memberDelete(
						@RequestParam int[] memberNo,
						@RequestParam(required = false) String type,
						@RequestParam(required = false) String keyword,
						RedirectAttributes redirectAttr,
						HttpServletRequest request) throws Exception {
		log.debug("memberNo = {}", memberNo);
		log.debug("type = {}", type);
		log.debug("keyword = {}", keyword);
		
		try {
			// 회원 삭제
			int result = memberService.deleteMember(memberNo);
			log.debug("result = {}", result);
			
			redirectAttr.addFlashAttribute("msg", "해당 회원이 삭제되었습니다.");
		} catch (Exception e) {
			log.error("회원 삭제 실패", e);
			throw e; // spring container에게 예외상황 알림
		}
		
		String referer = request.getHeader("Referer");
		log.debug("referer = {}", referer);
		
		return "redirect:" + referer;
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
	
	// 등급 관리 조회(select)
	@GetMapping("/memberGrade.do")
	public Map<String, Object> memberGrade(Model model, HttpServletRequest request) {
		
		// 명칭 가져오기
		List<MemberGrade> memberGradeList = memberService.selectMemberGradeList();
		log.debug("memberGradeList = {}", memberGradeList);
		//model.addAttribute("memberGardeList", memberGradeList);
		
		Map<String, Object> resultMap = new HashMap<>();
		resultMap.put("memberGradeList", memberGradeList);

		return resultMap;
	}
	
	// 등급 수정(update)
	@SuppressWarnings("unchecked")
	@ResponseBody
	@PostMapping("/memberGradeUpdate.do")
	public String memberGradeUpdate(
				@RequestBody String data,
				RedirectAttributes redirectAttributes) {
		
		log.debug("{}", "memberGradeUpdate.do 요청!");
		log.debug("param = {}", data);
		ObjectMapper mapper = new ObjectMapper();
		
		try {
			Map<String, String> map = mapper.readValue(data, Map.class);
			log.debug("map = {}", map);
			
			MemberGrade paramGrade = new MemberGrade();
			
			Set<String> keySet = map.keySet();
			for(String key : keySet) {
				System.out.println(key + " : " + map.get(key));
				
				paramGrade.setMemberGradeNo(Integer.parseInt(key));
				paramGrade.setMemberGradeName(map.get(key));
				
				int resultMemberGradeUpdate = memberService.memberGradeUpdate(paramGrade);
				log.debug("resultMemberGradeUpdate = {}", resultMemberGradeUpdate);
			}
			
		
			} catch (IOException e) {}

		return "redirect:/member/memberGrade.do";
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
		
		
		return "member/memberList";
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
