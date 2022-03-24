package com.naedam.mir9.member.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.naedam.mir9.member.model.dao.MemberDao;
import com.naedam.mir9.member.model.vo.Member;
import com.naedam.mir9.member.model.vo.MemberGrade;

@Service
public class MemberServiceImpl implements MemberService {
	
	@Autowired
	private MemberDao memberDao;

	// 회원가입
	@Override
	public int insertMember(Member member) {
		return memberDao.insertMember(member);
	}

	// 로그인 - 해당 id정보 가져오기
	@Override
	public Member selectOneMember(String id) {
		return memberDao.selectOneMember(id);
	}


	
}
