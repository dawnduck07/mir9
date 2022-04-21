package com.naedam.mir9.menu.model.dao;


import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.naedam.mir9.menu.model.vo.Head;
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
	
	//헤더관리 등록
	@Override
	public int addHead(Head head) throws Exception {
		return sqlSession.insert("menu.addHead", head);
	}
	
	//리비젼 생성
	@Override
	public int addRevision(Menu menu) throws Exception {
		return sqlSession.insert("menu.addRevision", menu);
	}
	
	//메뉴 리스트 출력
	@Override
	public List<Menu> getMenuList(Map<String, Object> map) throws Exception {
		return sqlSession.selectList("menu.getMenuList");
	}
	
	//리비젼 리스트
	@Override
	public List<Menu> getRevisionList(Map<String, Object> map) throws Exception {
		return sqlSession.selectList("menu.getRevisionList", map);
	}
	
	//삭제된 리비젼 리스트
	@Override
	public List<Menu> deleteRevisionList(Map<String, Object> map) throws Exception {
		return sqlSession.selectList("menu.deleteRevisionList", map);
	}
	
	//헤더 리스트
	@Override
	public List<Head> getHeadList(Map<String, Object> map) throws Exception {
		return sqlSession.selectList("menu.getHeadList", map);
	}
	
	//메뉴 수정
	@Override
	public int updateMenu(Menu menu) throws Exception {
		return sqlSession.update("menu.updateMenu", menu);
	}
	
	//헤더 수정
	@Override
	public int updateHead(Head head) throws Exception {
		return sqlSession.update("menu.updateHead", head);
	}
	
	//메뉴 정보
	@Override
	public Menu getMenu(int code) throws Exception {
		return sqlSession.selectOne("menu.getMenu", code);
	}
	
	//헤더 정보
	@Override
	public Head getHead(int headNo) throws Exception {
		return sqlSession.selectOne("menu.getHead", headNo);
	}
	
	//리비젼 가져오기
	@Override
	public Menu getRevision(Menu menu) throws Exception {
		return sqlSession.selectOne("menu.getRevision", menu);
	}

	@Override
	public void updateChoiceMenu(int code) throws Exception {
		sqlSession.update("menu.updateChoiceMenu", code);
	}
	
	//헤더관리 선택삭제
	@Override
	public void deleteChoiceHead(int headNo) throws Exception {
		sqlSession.delete("menu.deleteChoiceHead", headNo);
	}

















	
}









