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
import com.naedam.mir9.member.model.vo.MemberListExcelForm;
import com.naedam.mir9.member.model.vo.MemberMemo;
import com.naedam.mir9.member.model.vo.WithdrawalMember;
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
		return session.update("member.memberUpdate", paramMember);
	}
	
	// 회원 적립금 관리
	@Override
	public List<MemberPoint> selectMemberPointListByParam(Map<String, Object> param) {
		// TODO Auto-generated method stub
		return session.selectList("member.selectMemberPointListByParam", param);
	}

	// 회원주소 수정(상세보기)
	@Override
	public int addressUpdate(Address paramAddress) {
		return session.update("member.addressUpdate", paramAddress);
	}

	// 권한(Authorities) 수정
	@Override
	public int authoritiesUpdate(Authorities paramAuthorities) {
		return session.update("member.authoritiesUpdate", paramAuthorities);
	}

	// 메모(MemberMemo) 수정
	@Override
	public int memberMemoUpdate(MemberMemo paramMemberMemo) {
		return session.update("member.memberMemoUpdate", paramMemberMemo);
	}

	// 엑셀 다운로드
	@Override
	public List<MemberListExcelForm> selectMemberListExcelForm() {
		return session.selectList("member.selectMemberListExcelForm");
	}

	// 회원 삭제
	@Override
	public int memberWithdrawal(String id) {
		return session.delete("member.memberWithdrawal", id);
	}

	// 주소 삭제
	@Override
	public int deleteAddress(int addressNo) {
		return session.delete("member.deleteAddress", addressNo);
	}

	// 주소록 조회
	@Override
	public AddressBook selectOneAddressBook(int memberNo) {
		return session.selectOne("member.selectOneAddressBook", memberNo);
	}

	// 주소록 삭제
	@Override
	public int deleteAddressBook(int addressBookNo) {
		return session.delete("member.deleteAddressBook", addressBookNo);
	}

	// 권한 삭제
	@Override
	public int deleteAuthorties(int memberNo) {
		return session.delete("member.deleteAuthorties", memberNo);
	}

	// 탈퇴 사유
	@Override
	public int updateReason(Map<String, Object> param) {
		return session.update("member.updateReason", param);
	}

	// 탈퇴 회원 리스트
	@Override
	public List<WithdrawalMember> selectWithdrawalMemberList() {
		return session.selectList("member.selectWithdrawalMemberList");
	}

	// 탈퇴 회원 전체 게시물 수
	@Override
	public int selectWithdrawalCount() {
		return session.selectOne("member.selectWithdrawalCount");
	}

	// 탈퇴회원 검색 게시물 
	@Override
	public List<WithdrawalMember> selectSearchWithdrawalList(Map<String, Object> param) {
		return session.selectList("member.selectSearchWithdrawalList", param);
	}

	// 탈퇴회원 검색 게시물 수
	@Override
	public int selectSearchWithdrawalListCount(Map<String, Object> param) {
		return session.selectOne("member.selectSearchWithdrawalListCount", param);
	}

	


	@Override
	public int selectMemberTotalPoint(int memberNo) {
		// TODO Auto-generated method stub
		return session.selectOne("member.selectMemberTotalPoint", memberNo);
	}



	
}
