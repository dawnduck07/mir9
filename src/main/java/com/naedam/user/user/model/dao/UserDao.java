package com.naedam.user.user.model.dao;

import com.naedam.admin.member.model.vo.Member;

public interface UserDao {

	// 회원가입
	int insertUser(Member member);
}
