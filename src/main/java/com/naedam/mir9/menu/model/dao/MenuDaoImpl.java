package com.naedam.mir9.menu.model.dao;


import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.naedam.mir9.menu.model.vo.Menu;


@Repository
public class MenuDaoImpl implements MenuDao {
	
	@Autowired
	@Qualifier("sqlSessionTemplate")
	private SqlSession sqlSession;
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	//메뉴관리 등록
	@Override
	public int addMenu(Menu menu) throws Exception {
		return sqlSession.insert("menu.addMenu", menu);
	}



	
}
