package com.naedam.user.user.model.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.naedam.admin.member.model.vo.Member;

@Repository
public class UserDaoImpl implements UserDao {

	@Autowired SqlSession session;

	// 회원가입
	@Override
	public int insertUser(Member member) {
		return session.insert("user.insertUser", member);
	}
}
