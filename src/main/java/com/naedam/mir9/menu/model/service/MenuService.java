package com.naedam.mir9.menu.model.service;

import com.naedam.mir9.menu.model.vo.Menu;

public interface MenuService {
	
	//메뉴관리 등록
	public int addMenu(Menu menu) throws Exception;
	
}
