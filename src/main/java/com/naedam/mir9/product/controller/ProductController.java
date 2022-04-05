package com.naedam.mir9.product.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.naedam.mir9.category.model.service.CategoryService;
import com.naedam.mir9.category.model.vo.Category;
import com.naedam.mir9.option.model.service.OptionService;
import com.naedam.mir9.option.model.vo.Option;
import com.naedam.mir9.product.model.service.ProductService;
import com.naedam.mir9.product.model.vo.ProductDetail;

import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/product")
@Slf4j
public class ProductController {
	@Autowired
	private ProductService productService;
	@Autowired
	private OptionService optionService;
	@Autowired
	private CategoryService categoryService;
	
	@GetMapping("/list")
	public String productList() {
		
		return "product/productList";
	}
	
	@GetMapping("/category")
	public String productCategory() {
		
		return "product/productCategory";
	}
	
	@GetMapping("/option")
	public String productOption(Model model) {
		List<Option> optionList = optionService.selectOptionList();
		
		model.addAttribute("optionList", optionList);
		
		
		return "product/option";
	}
	
	@GetMapping("/list_sub")
	public void list_sub(Model model) {
		List<ProductDetail> productList = productService.selectAllProductList();
		int productListCnt = productList.size();
		
		model.addAttribute("productList",productList);
		model.addAttribute("productListCnt",productListCnt);
		
	}
	
	@GetMapping("/tree_model")
	public void tree_model(Model model) {
		StringBuilder sb = new StringBuilder();
		String type = "product";
		List<Category> categoryList = categoryService.selectProductCategory(type);
		Map<String, Integer> cte = new HashMap<String, Integer>();
		Boolean flag = false;
		sb.append("['Home', ' '\n");
		
		for(Category c1 : categoryList) {
			if(c1.getLevel() == 1) {
				sb.append(",['"+ c1.getCategoryName() + "',' '" );
				for(Category c2 : categoryList) {
					if(c2.getLevel() == 2) {
						if(c1.getCategoryNo() == c2.getParentNo()) {
							sb.append(",\n\t['"+ c2.getCategoryName()+ "',' '");
							for(Category c3 : categoryList) {
								if(c3.getLevel() == 3) {
									if(c2.getCategoryNo() == c3.getParentNo()) {
										sb.append("\n\t\t,['"+ c3.getCategoryName()+ "',' ']" );
									}
								}
							}
							sb.append(",]\n");
							flag = true;
						}else {
							sb.append("]");
							flag = false;
							break;
						}
					}
				}
				if(flag) {
					sb.append(",]");					
				}
			}
			
		}
		sb.append(",]");
		
		String result = sb.toString();
		
		
		model.addAttribute("result",result);
		
	}
}
