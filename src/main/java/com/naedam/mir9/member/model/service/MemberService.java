package com.naedam.mir9.member.model.service;

import com.naedam.mir9.member.model.vo.Member;
import com.naedam.mir9.member.model.vo.MemberGrade;

public interface MemberService {

	// 회원가입
	int insertMember(Member member);

	// 로그인 - 해당 id정보 가져오기
	Member selectOneMember(String id);

	

}
