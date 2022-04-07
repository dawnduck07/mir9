package com.naedam.mir9.product.controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpUtils;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.naedam.mir9.category.model.service.CategoryService;
import com.naedam.mir9.category.model.vo.Category;
import com.naedam.mir9.option.model.service.OptionService;
import com.naedam.mir9.option.model.vo.Option;
import com.naedam.mir9.option.model.vo.ProductOptionDetail;
import com.naedam.mir9.product.model.service.ProductService;
import com.naedam.mir9.product.model.vo.Product;
import com.naedam.mir9.product.model.vo.ProductDetail;
import com.naedam.mir9.product.model.vo.ProductDiscription;
import com.naedam.mir9.product.model.vo.ProductImg;

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
	public void list_sub(Model model, @RequestParam(defaultValue = "0") String cteNo) {
		log.debug("cteNo = {}",cteNo);
		List<ProductDetail> productList = new ArrayList<ProductDetail>();
		if(cteNo.equals("0")) {
			productList = productService.selectAllProductList();
		}else {
			productList = productService.selectProductListByCteNo(cteNo);			
		}
		
		int productListCnt = productList.size();
		
		try {
			int level = categoryService.selectCategoryLevel(cteNo);
			model.addAttribute("level",level);
		} catch (Exception e) {}
		
		model.addAttribute("productList",productList);
		model.addAttribute("productListCnt",productListCnt);
		
	}
	
	@GetMapping("/tree_model")
	public void tree_model(HttpServletRequest request,Model model, String stp) {
		StringBuilder sb = new StringBuilder();
		
		String type = "";
		StringBuffer url = request.getRequestURL();
		url.delete(url.indexOf("/tree"), url.indexOf("/tree")+11);
		
		if(stp.equals("pc")) {
			type = "product";
			url.append("/productCategory_sub?cteNo=");
		}else if(stp.equals("pl")) {
			type = "product";
			url.append("/list_sub?cteNo=");
		}
		
		List<Category> categoryList = categoryService.selectProductCategory(type);
		Boolean flag = false;
		sb.append("['Home', '" + url + "'\n");
		
		for(Category c1 : categoryList) {
			if(c1.getLevel() == 1) {
				sb.append(",['"+ c1.getCategoryName() + "','"+ url + c1.getCategoryNo() +"'" );
				for(Category c2 : categoryList) {
					if(c2.getLevel() == 2) {
						if(c1.getCategoryNo() == c2.getParentNo()) {
							sb.append(",\n\t['"+ c2.getCategoryName() + "','"+ url + c2.getCategoryNo() +"'");
							for(Category c3 : categoryList) {
								if(c3.getLevel() == 3) {
									if(c2.getCategoryNo() == c3.getParentNo()) {
										sb.append("\n\t\t,['"+ c3.getCategoryName() + "','"+ url + c3.getCategoryNo() +"&']" );
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
	
	@PostMapping("/delete")
	public String productDelete(HttpServletRequest request, RedirectAttributes redirectAttr) {
		List<String> productrNoList =  Arrays.asList(request.getParameterValues("list[]"));
		int result = 0;
		for(String productNo : productrNoList) {
			result = productService.deleteProductByProductNo(productNo);
		}
		
		if(result > 0) redirectAttr.addFlashAttribute("msg", "삭제되었습니다.");
		
		return "redirect:/product/list_sub";
	}
	
	@PostMapping("/fillForm")
	@ResponseBody
	public List<Object> fillForm(String productNo) {
		List<Object> productInfo = new ArrayList<Object>();
		Product product = productService.selectOneProductByProductNo(productNo);
		List<ProductImg> productImgs = productService.selectProductImgsByProductNo(productNo);
		List<ProductOptionDetail> option = productService.selectProductOptionDetailByOptionNo(product.getOptionNo());
		List<ProductDiscription> discriptions = productService.selectProductDiscriptionByProductNo(productNo);
		productInfo.add(product);
		productInfo.add(productImgs);
		productInfo.add(option);
		productInfo.add(discriptions);
		
		
		
		return productInfo;
	}
	
	@GetMapping("/productCategory_sub")
	public void productCategory_sub(@RequestParam(defaultValue = "0") int cteNo, Model model) {
		List<Category> cteList = new ArrayList<Category>(); 
		
		if(cteNo == 0) {
			cteList = categoryService.selectProductCategoryByLevel(1);
		}else {
			cteList = categoryService.selectProductCategoryChildByParentNo(cteNo);
		}
		
		model.addAttribute("cteList",cteList);
		model.addAttribute("parentNo",cteNo);
	}
}
