package com.naedam.user.user.model.service;

import com.naedam.admin.member.model.vo.Member;

public interface UserService {

	// 회원가입
	int insertUser(Member member);
}
