package com.naedam.user.user.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.naedam.admin.member.model.vo.Member;
import com.naedam.user.user.model.dao.UserDao;

@Service
public class UserServiceImpl implements UserService {

	@Autowired
	private UserDao userDao;
	
	// 회원가입
	@Override
	public int insertUser(Member member) {
		return userDao.insertUser(member);
	}
}
