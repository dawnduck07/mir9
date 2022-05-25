package com.naedam.user.user.model.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.naedam.admin.member.model.vo.Member;
import com.naedam.user.user.model.dao.UserDao;
import com.naedam.user.user.model.vo.User;

@Service
public class UserServiceImpl implements UserService {

	@Autowired
	private UserDao userDao;
	
	// 회원가입
	@Override
	public int insertUser(User user) {
		return userDao.insertUser(user);
	}

	// 이메일 중복검사
	@Override
	public User selectOneMemberByEmail(Map<String, Object> param) {
		return userDao.selectOneMemberByEmail(param);
	}

	// 아이디 중복검사
	@Override
	public User selectOneUserById(Map<String, Object> param) {
		return userDao.selectOneUserById(param);
	}
}
