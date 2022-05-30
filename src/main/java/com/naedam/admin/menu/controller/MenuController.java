package com.naedam.admin.menu.controller;

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

import com.naedam.admin.board.model.vo.Board;
import com.naedam.admin.menu.model.service.MenuService;
import com.naedam.admin.menu.model.vo.Head;
import com.naedam.admin.menu.model.vo.Menu;
import com.naedam.admin.menu.model.vo.MenuCategory;



@Controller
@RequestMapping("/admin/menu/*")
public class MenuController {

	@Autowired	
	private MenuService menuService;
	
	@PostMapping("menuProcess")
	public String menuProcess(@ModelAttribute("menu") Menu menu,
							  @ModelAttribute("head") Head head,
							  @RequestParam("mode") String mode,
							  @RequestParam("part") String part) throws Exception{
		Map<String, Object> menuMap = new HashMap<>();
		System.out.println("mode 확인 === "+mode);
		System.out.println("part 확인 === "+part);
		menuMap.put("menu", menu);
		menuMap.put("head", head);
		menuMap.put("mode", mode);
		menuMap.put("part", part);
		menuService.menuProcess(menuMap);
		return "admin/menu/menu";
	}
	
	@RequestMapping(value="menu")
	public String listMenu(Menu menu, Model model) throws Exception{
		System.out.println("menu 시작");
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		Map<String, Object> resultMap = menuService.getMenuList(map);
		Map<String, Object> resultMap2 = menuService.getHeadList(map);
		
		model.addAttribute("list", resultMap.get("list"));
		model.addAttribute("list2", resultMap2.get("list"));
		
		return "admin/menu/menu";
	}
	
	@RequestMapping(value="menu2")
	public String listMenu2(@ModelAttribute("menu") Menu menu, Model model) throws Exception{
		System.out.println("menu2 시작");
		menu.setOrd(menu.getOrd()+1);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("menu", menu);
		
		if(menu.getOrd() == 2) {
			Map<String, Object> resultMap = menuService.getMenuList2(map);
			Map<String, Object> resultMap2 = menuService.getHeadList(map);
			model.addAttribute("menu", menu);
			model.addAttribute("list", resultMap.get("list"));
			model.addAttribute("list2", resultMap2.get("list"));
		}else if(menu.getOrd() == 3) {
			menu.setOriginNo(menu.getCode());
			Map<String, Object> resultMap = menuService.getMenuList3(map);
			Map<String, Object> resultMap2 = menuService.getHeadList(map);
			model.addAttribute("menu", menu);
			model.addAttribute("list", resultMap.get("list"));
			model.addAttribute("list2", resultMap2.get("list"));
		}
	
		return "admin/menu/menuList";
	}	
	
	@RequestMapping(value="menuList")
	public String menuList(Menu menu, Model model, HttpServletRequest request) throws Exception{
		System.out.println("menuList 시작");
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		Map<String, Object> resultMap = menuService.getMenuList(map);
		Map<String, Object> resultMap2 = menuService.getHeadList(map);
		model.addAttribute("list", resultMap.get("list"));
		model.addAttribute("list2", resultMap2.get("list"));
		
		return "admin/menu/menuList";
	}
	
	@GetMapping("tree")
	public String tree(Model model, MenuCategory menuCategory) throws Exception{
		System.out.println("menuCategory/tree 시작");
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		Map<String, Object> resultMap = menuService.getMenuCategoryList(map);
		Map<String, Object> resultMap2 = menuService.getMenuCategoryList2(map);
		model.addAttribute("list", resultMap.get("list"));
		model.addAttribute("list2", resultMap2.get("list"));
		
		return "admin/menu/tree";
	}

}
