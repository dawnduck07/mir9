package com.naedam.mir9.member.model.dao;

import java.util.List;

import com.naedam.mir9.member.model.vo.Member;
import com.naedam.mir9.member.model.vo.MemberEntity;

public interface MemberDao {

	// 회원가입
	int insertMember(Member member);

	// 로그인 - 해당 id정보 가져오기
	Member selectOneMember(String id);

	// 회원 리스트 전체 게시물 목록
	List<MemberEntity> selectMemberList();

	// 회원 리스트 전체 게시물 수
	int selectMemberListCount();

	

}
