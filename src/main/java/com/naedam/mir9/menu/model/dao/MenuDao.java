package com.naedam.mir9.menu.model.dao;

import java.util.List;
import java.util.Map;

import com.naedam.mir9.menu.model.vo.Menu;

public interface MenuDao {
	
	
	//메뉴관리 등록
	public int addMenu(Menu menu) throws Exception;
	
	//리비젼 생성
	public int addRevision(Menu menu) throws Exception;
	
	//메뉴 리스트
	public List<Menu> getMenuList(Map<String, Object> map) throws Exception;
	
	//리비젼 리스트
	public List<Menu> getRevisionList(Map<String, Object> map) throws Exception;
	
	//리비젼 리스트
	public List<Menu> deleteRevisionList(Map<String, Object> map) throws Exception;
	
	//메뉴 수정
	public int updateMenu(Menu menu) throws Exception;

	//메뉴 정보
	public Menu getMenu(int code) throws Exception;
	
	//리비젼 가져오기
	public Menu getRevision(Menu menu) throws Exception;
	
	//선택삭제
	public void updateChoiceMenu(int code) throws Exception;
	

}
