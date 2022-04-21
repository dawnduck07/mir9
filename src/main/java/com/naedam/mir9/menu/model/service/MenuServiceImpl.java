package com.naedam.mir9.menu.model.service;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.naedam.mir9.menu.model.dao.MenuDao;
import com.naedam.mir9.menu.model.vo.Head;
import com.naedam.mir9.menu.model.vo.Menu;

@Service
public class MenuServiceImpl implements MenuService {
	
	@Autowired
	private MenuDao menuDao;
	
	//메뉴 등록
	@Override
	public int addMenu(Menu menu) throws Exception {
		return menuDao.addMenu(menu);
	}
	
	@Override
	public int addHead(Head head) throws Exception {
		return menuDao.addHead(head);
	}
	
	//헤더관리 등록
	@Override
	public int addRevision(Menu menu) throws Exception {
		return menuDao.addRevision(menu);
	}
	
	//메뉴 리스트 출력
	@Override
	public Map<String, Object> getMenuList(Map<String,Object> map) throws Exception{
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("list", menuDao.getMenuList(map));
		
		return resultMap;
	}
	
	//리비젼 리스트
	@Override
	public Map<String, Object> getRevisionList(Map<String, Object> map) throws Exception {
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("list", menuDao.getRevisionList(map));
		
		return resultMap;
	}

	//삭제된 리비젼 리스트
	@Override
	public Map<String, Object> deleteRevisionList(Map<String, Object> map) throws Exception {
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("list", menuDao.deleteRevisionList(map));
		
		return resultMap;
	}
	
	//헤더관리 리스트
	@Override
	public Map<String, Object> getHeadList(Map<String, Object> map) throws Exception {
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("list", menuDao.getHeadList(map));
		
		return resultMap;
	}
	
	//메뉴 수정
	@Override
	public int updateMenu(Menu menu) throws Exception {
		return menuDao.updateMenu(menu);
	}
	
	//헤더 수정
	@Override
	public int updateHead(Head head) throws Exception {
		return menuDao.updateHead(head);
	}
	
	//메뉴 정보
	@Override
	public Menu getMenu(int code) throws Exception {
		return menuDao.getMenu(code);
	}
	
	//헤더 정보
	@Override
	public Head getHead(int headNo) throws Exception {
		return menuDao.getHead(headNo);
	}
	
	//리비젼 가져오기
	@Override
	public Menu getRevision(Menu menu) throws Exception {
		return menuDao.getRevision(menu);
	}
	
	//선택삭제
	@Override
	public void updateChoiceMenu(int code) throws Exception {
		menuDao.updateChoiceMenu(code);
	}
	
	//헤더관리 선택삭제
	@Override
	public void deleteChoiceHead(int headNo) throws Exception {
		menuDao.deleteChoiceHead(headNo);
	}


















	
}
