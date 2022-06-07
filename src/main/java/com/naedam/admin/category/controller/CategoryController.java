package com.naedam.admin.category.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.naedam.admin.category.model.service.CategoryService;
import com.naedam.admin.category.model.vo.Category;
import com.naedam.admin.common.Mir9Utils;

@Controller
@RequestMapping("/admin/category")
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
		Map<String, Object> param = Mir9Utils.parseJsonStr(jsonStr);
		int result = categoryService.updateProductCategoryByParam(param);
		return result;
	}
	
	@GetMapping("/insert")
	@ResponseBody
	public int insertCategory(String jsonStr) {
		Map<String, Object> param = Mir9Utils.parseJsonStr(jsonStr);
		int result = categoryService.insertProductCategoryByParam(param);
		return result;
	}
	
	@PostMapping("/delete")
	public String deleteCategory(HttpServletRequest request, RedirectAttributes redirectAttr) {
		int result = categoryService.deleteCategoryByCteNo(request);
		if(result > 0) redirectAttr.addFlashAttribute("msg", "삭제되었습니다.!!!");
		return "redirect:/admin/product/productCategory_sub?stp=pc";
	}
	
	@PostMapping("/getCategory")
	@ResponseBody
	public Map<String, Object> getCategory(String cteNo){
		Map<String, Object> map = categoryService.getCategory(cteNo);
		return map;
	}
}