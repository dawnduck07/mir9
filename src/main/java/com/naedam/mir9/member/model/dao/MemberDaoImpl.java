package com.naedam.mir9.member.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.naedam.mir9.member.model.vo.Member;
import com.naedam.mir9.member.model.vo.MemberEntity;
import com.naedam.mir9.member.model.vo.MemberGrade;

@Repository
public class MemberDaoImpl implements MemberDao {
	
	@Autowired
	private SqlSession session;

	// 회원가입
	@Override
	public int insertMember(Member member) {
		return session.insert("member.insertMember", member);
	}

	// 로그인 - 해당 id정보 가져오기
	@Override
	public Member selectOneMember(String id) {
		return session.selectOne("member.selectOneMember", id);
	}

	// 회원 리스트 전체 게시물 목록
	@Override
	public List<MemberEntity> selectMemberList() {
		return session.selectList("member.selectMemberList");
	}

	// 회원 리스트 전체 게시물 수
	@Override
	public int selectMemberListCount() {
		return session.selectOne("member.selectMemberListCount");
	}


	
	
}
