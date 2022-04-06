package com.naedam.mir9.category.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.annotation.JsonProperty;
import com.naedam.mir9.category.model.service.CategoryService;
import com.naedam.mir9.category.model.vo.Category;
import com.naedam.mir9.common.Mir9Utils;

import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/category")
@Slf4j
public class CategoryController {
	@Autowired
	private CategoryService categoryService;
	
	@PostMapping("/info")
	@ResponseBody
	public Category categoryInfo(String cteNo){
		Category cte = categoryService.selectOneProductCategoryByCteNo(cteNo);
		return cte;
	}
	
	@GetMapping("/update")
	@ResponseBody
	public int updateCategory(String jsonStr) {
		int result = 0;
		Map<String, Object> param = Mir9Utils.parseJsonStr(jsonStr);
		
		result = categoryService.updateProductCategoryByParam(param);
		
		return result;
	}
}
