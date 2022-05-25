package com.naedam.user.user.model.dao;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.naedam.admin.member.model.vo.Member;
import com.naedam.user.user.model.vo.User;

@Repository
public class UserDaoImpl implements UserDao {

	@Autowired SqlSession session;

	// 회원가입
	@Override
	public int insertUser(User user) {
		return session.insert("user.insertUser", user);
	}

	// 이메일 중복검사
	@Override
	public User selectOneMemberByEmail(Map<String, Object> param) {
		return session.selectOne("user.selectOneMemberByEmail", param);
	}

	// 아이디 중복검사
	@Override
	public User selectOneUserById(Map<String, Object> param) {
		return session.selectOne("user.selectOneUserById", param);
	}
}
