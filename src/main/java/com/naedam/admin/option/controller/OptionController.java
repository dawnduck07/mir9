package com.naedam.admin.option.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.naedam.admin.common.Mir9Utils;
import com.naedam.admin.option.model.service.OptionService;
import com.naedam.admin.option.model.vo.Option;
import com.naedam.admin.product.model.vo.ProductDetail;

import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/admin/option")
@Slf4j
public class OptionController {
	@Autowired
	private OptionService optionService;

	@ResponseBody
	@PostMapping("/insert")
	public int insertOption(@RequestBody String jsonStr) {
		Map<String, Object> map = Mir9Utils.parseJsonStr(jsonStr);
		int result = optionService.insertOption(map);
		return result;
	}

	@ResponseBody
	@PostMapping("/list")
	public Map<String, Object> orderList(String optionNo){
		Map<String, Object> result = optionService.orderList(optionNo);
		return result;
	}
	
	@ResponseBody
	@PostMapping("/update")
	public int updateOption(@RequestBody String jsonStr) {
		Map<String, Object> map = Mir9Utils.parseJsonStr(jsonStr);
		log.debug("optionNo = {}",map.get("optionNo").getClass().getName());
		int result = optionService.updateOption(map);
		return result;
	}
	
	@GetMapping("/option_manager")
	public String option_manager(int optionNo, Model model) {
		Map<String, Object> map = optionService.option_manager(optionNo);
		model.addAllAttributes(map);	
		return "/admin/product/option_manager";
	}
	
	@GetMapping("/option_manager_bank")
	public String option_manager_bank(Model model) {
		List<Option> optionList = optionService.selectOptionList();
		model.addAttribute("optionList",optionList);
		return "/admin/product/option_manager_bank";
	}
	
	@GetMapping("/option_manager_product")
	public String option_manager_product(Model model) {
		List<ProductDetail> productList = optionService.selectProductDetailList();
		model.addAttribute("productList",productList);
		return "/admin/product/option_manager_product";
	}

}
