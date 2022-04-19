package com.naedam.mir9.menu.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

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
	
	@RequestMapping(value="menu")
	public String listMenu() throws Exception{
		
		return "menu/menu";
	}
	
	@RequestMapping(value="menuList")
	public String menuList(Model model, HttpServletRequest request) throws Exception{
		
		return "menu/menuList";
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

















