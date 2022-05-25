package com.naedam.user.user.model.dao;

import java.util.Map;

import com.naedam.admin.member.model.vo.Address;
import com.naedam.admin.member.model.vo.AddressBook;
import com.naedam.admin.member.model.vo.Authorities;
import com.naedam.user.user.model.vo.User;

public interface UserDao {

	// 이메일 중복검사
	User selectOneMemberByEmail(Map<String, Object> param);

	// 아이디 중복검사
	User selectOneUserById(Map<String, Object> param);

	// 회원 등록
	int userEnroll(User paramUser);

	// 주소 등록
	int userAddressEnroll(Address address);

	// 주소록 등록
	int userAddressBookEnroll(AddressBook paramAddressBook);

	// 회원 등록
	int userAuthoritiesEnroll(Authorities paramAuthorities);
}
