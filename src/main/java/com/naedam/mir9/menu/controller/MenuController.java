package com.naedam.mir9.menu.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.naedam.mir9.board.model.vo.Board;
import com.naedam.mir9.menu.model.service.MenuService;
import com.naedam.mir9.menu.model.vo.Menu;



@Controller
@RequestMapping("/menu/*")
public class MenuController {

	@Autowired	
	private MenuService menuService;
	
	@PostMapping("addMenu")
	public String addMenu(@ModelAttribute("menu") Menu menu)throws Exception{
		
		System.out.println("menu/addMenu 시작");
		menuService.addMenu(menu);
		
		return "menu/menu";
	}
	
	@PostMapping("updateMenu")
	public String updateMenu(@ModelAttribute("menu") Menu menu)throws Exception{
		
		System.out.println("menu/updateMenu 시작");
		Menu menu2 = new Menu();
		menu2 = menuService.getRevision(menu);
		System.out.println("menu를 확인합시다. == ::: "+menu2);
		menuService.addRevision(menu2);
		
		menuService.updateMenu(menu);
		
		
		return "menu/menu";
	}	
	
	@RequestMapping(value="menu")
	public String listMenu(Menu menu, Model model) throws Exception{
		System.out.println("menu 시작");
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		Map<String, Object> resultMap = menuService.getMenuList(map);
		
		model.addAttribute("list", resultMap.get("list"));
		
		return "menu/menu";
	}
	
	@RequestMapping(value="menuList")
	public String menuList(Menu menu, Model model, HttpServletRequest request) throws Exception{
		System.out.println("menuList 시작");
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		Map<String, Object> resultMap = menuService.getMenuList(map);
		
		model.addAttribute("list", resultMap.get("list"));
		
		return "menu/menuList";
	}
	
	@PostMapping("updateChoiceMenu")
	public void updateChoiceMenu(@RequestParam(value = "menuArr[]") List<String> menuArr, 
								  Menu menu) throws Exception{
		
		System.out.println("updateChoiceMenu 시작");
		
		int result = 0;
		int code = 0;
		
		for(String i : menuArr) {
			code = Integer.parseInt(i);
			menu.setCode(code);
			menuService.updateChoiceMenu(menu.getCode());
		}
		result = 1;
		
	}
	
	@GetMapping("tree")
	public String tree(HttpServletRequest request,Model model) throws Exception{
		
		return "menu/tree";
	}
	
	@RequestMapping(value="head")
	public String header(HttpServletRequest request,Model model) throws Exception{
		
		return "menu/head";
	}
	
	@RequestMapping(value="bottom")
	public String bottom(HttpServletRequest request,Model model) throws Exception{
		
		return "menu/bottom";
	}
	
	@RequestMapping(value="meta")
	public String meta(HttpServletRequest request,Model model) throws Exception{
		
		return "menu/meta";
	}
}

















