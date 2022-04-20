package com.naedam.mir9.member.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.naedam.mir9.member.model.vo.Address;
import com.naedam.mir9.member.model.vo.AddressBook;
import com.naedam.mir9.member.model.vo.Authorities;
import com.naedam.mir9.member.model.vo.Member;
import com.naedam.mir9.member.model.vo.MemberEntity;
import com.naedam.mir9.member.model.vo.MemberGrade;
import com.naedam.mir9.member.model.vo.MemberMemo;
import com.naedam.mir9.point.model.vo.MemberPoint;

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

	// id 중복 검사
	@Override
	public Member selectOneMemberByMap(Map<String, Object> param) {
		return session.selectOne("member.selectOneMemberByMap", param);
	}

	// 타입별 검색 게시물
	@Override
	public List<MemberEntity> selectSearchMemberList(Map<String, Object> param) {
		return session.selectList("member.selectSearchMemberList", param);
	}

	// 검색 게시물 수
	@Override
	public int selectSearchListCount(Map<String, Object> param) {
		return session.selectOne("member.selectSearchListCount", param);
	}

	// 회원 삭제
	@Override
	public int deleteMember(int[] memberNo) {
		return session.delete("member.deleteMember", memberNo);
	}

	// 회원 등급 리스트
	@Override
	public List<MemberGrade> selectMemberGradeList() {
		return session.selectList("member.selectMemberGradeList");
	}

	// 회원 등급 수정
	@Override
	public int memberGradeUpdate(MemberGrade paramGrade) {
		return session.update("member.memberGradeUpdate", paramGrade);
	}

	// 주소 입력
	@Override
	public int insertAddress(Address address) {
		return session.insert("member.insertAddress", address);
	}

	// 메모 입력
	@Override
	public int insertMemberMemo(MemberMemo memberMemo) {
		return session.insert("member.insertMemberMemo", memberMemo);
	}

	// 회원 입력
	@Override
	public int insertRegisterMember(Member paramMember) {
		return session.insert("member.insertRegisterMember", paramMember);
	}

	// 주소록 입력
	@Override
	public int insertAddressBook(AddressBook paramAddressBook) {
		return session.insert("member.insertAddressBook", paramAddressBook);
	}

	// 권한 입력
	@Override
	public int insertAuthorities(Authorities paramAuthorities) {
		return session.insert("member.insertAuthorities", paramAuthorities);
	}

	// 회원정보 조회(회원번호)
	@Override
	public Member selectOneMemberByMemberNo(int memberNo) {
		return session.selectOne("member.selectOneMemberByMemberNo", memberNo);
	}

	// 회원주소 조회
	@Override
	public Address selectOneAddress(int memberNo) {
		return session.selectOne("member.selectOneAddress", memberNo);
	}

	// 회원메모 조회
	@Override
	public MemberMemo selectOneMemo(int memberNo) {
		return session.selectOne("member.selectOneMemo", memberNo);
	}

	// 회원등급 조회
	@Override
	public Authorities selectOneAuthorities(int memberNo) {
		return session.selectOne("member.selectOneAuthorities", memberNo);
	}

	// 회원정보 수정(상세보기)
	@Override
	public int memberUpdate(Member paramMember) {
		return session.update(null);
	}
	
	// 회원 적립금 관리
	@Override
	public List<MemberPoint> selectMemberPointListByParam(Map<String, Object> param) {
		// TODO Auto-generated method stub
		return session.selectList("member.selectMemberPointListByParam", param);
	}
	
}
