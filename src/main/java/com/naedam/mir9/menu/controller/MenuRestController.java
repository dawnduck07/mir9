package com.naedam.mir9.menu.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.naedam.mir9.menu.model.service.MenuService;
import com.naedam.mir9.menu.model.vo.Menu;

@RestController
@RequestMapping("/menu/*")
public class MenuRestController {
	
	@Autowired
	private MenuService menuService;
	
	
	@PostMapping(value="json/getMenu")
	public Menu getMenu(@RequestParam("code") int code) throws Exception{
		System.out.println("/json/getMenu 시작");
		
		return menuService.getMenu(code);
		
		
	}
	
	@PostMapping(value="json/getRevisionList")
	public Map getRevisionList(@RequestParam("code") int code) throws Exception{
		System.out.println("/json/getRevisionList 시작");
		
		Menu menu = new Menu();
		menu.setCode(code);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("menu", menu);
		
		Map<String, Object> resultMap = menuService.getRevisionList(map);
		
		return resultMap;
		
		
	}
	
	@PostMapping(value="json/deleteRevisionList")
	public Map deleteRevisionList() throws Exception{
		System.out.println("/json/getRevisionList 시작");
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		Map<String, Object> resultMap = menuService.deleteRevisionList(map);
		
		return resultMap;
		
		
	}	
	
}