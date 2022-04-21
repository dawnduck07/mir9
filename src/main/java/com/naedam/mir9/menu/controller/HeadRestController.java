package com.naedam.mir9.menu.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.naedam.mir9.menu.model.service.MenuService;
import com.naedam.mir9.menu.model.vo.Head;

@RestController
@RequestMapping("/head/*")
public class HeadRestController {
	
	@Autowired
	private MenuService menuService;
	
	@PostMapping(value="json/getHead")
	public Head getHead(@RequestParam("headNo") int headNo) throws Exception{
		System.out.println("/json/getHead 시작");
		return menuService.getHead(headNo);
	}
}
