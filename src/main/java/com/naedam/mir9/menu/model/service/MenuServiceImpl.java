package com.naedam.mir9.menu.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.naedam.mir9.menu.model.dao.MenuDao;
import com.naedam.mir9.menu.model.vo.Menu;

@Service
public class MenuServiceImpl implements MenuService {
	
	@Autowired
	private MenuDao menuDao;

	@Override
	public int addMenu(Menu menu) throws Exception {
		return menuDao.addMenu(menu);
	}





	
}
