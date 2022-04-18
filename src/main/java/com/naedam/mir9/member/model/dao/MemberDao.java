package com.naedam.mir9.member.model.dao;

import java.util.List;
import java.util.Map;
import java.util.Set;

import com.naedam.mir9.member.model.vo.Address;
import com.naedam.mir9.member.model.vo.AddressBook;
import com.naedam.mir9.member.model.vo.Authorities;
import com.naedam.mir9.member.model.vo.Member;
import com.naedam.mir9.member.model.vo.MemberEntity;
import com.naedam.mir9.member.model.vo.MemberGrade;
import com.naedam.mir9.member.model.vo.MemberMemo;

public interface MemberDao {

	// 회원가입
	int insertMember(Member member);

	// 로그인 - 해당 id정보 가져오기
	Member selectOneMember(String id);

	// 회원 리스트 전체 게시물 목록
	List<MemberEntity> selectMemberList();

	// 회원 리스트 전체 게시물 수
	int selectMemberListCount();

	// id 중복 검사
	Member selectOneMemberByMap(Map<String, Object> param);

	// 타입별 검색 게시물
	List<MemberEntity> selectSearchMemberList(Map<String, Object> param);

	// 검색 게시물 수
	int selectSearchListCount(Map<String, Object> param);

	// 회원 삭제
	int deleteMember(int[] memberNo);

	// 회원 등급 리스트
	List<MemberGrade> selectMemberGradeList();

	// 회원 등급 수정
	int memberGradeUpdate(MemberGrade paramGrade);

	// 주소 입력
	int insertAddress(Address address);

	// 메모 입력
	int insertMemberMemo(MemberMemo memberMemo);

	// 회원 등록
	int insertRegisterMember(Member paramMember);

	// 주소록 입력
	int insertAddressBook(AddressBook paramAddressBook);

	// 권한 입력
	int insertAuthorities(Authorities paramAuthorities);



	

}
