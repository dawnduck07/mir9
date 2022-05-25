package com.naedam.user.user.model.service;

import java.util.Map;

import com.naedam.admin.member.model.vo.Member;
import com.naedam.user.user.model.vo.User;

public interface UserService {

	// 회원가입
	int insertUser(User user);

	// 이메일 중복검사
	User selectOneMemberByEmail(Map<String, Object> param);

	// 아이디 중복검사
	User selectOneUserById(Map<String, Object> param);
}
