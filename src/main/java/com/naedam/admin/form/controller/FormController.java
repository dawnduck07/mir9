package com.naedam.admin.form.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.naedam.admin.form.model.service.FormService;
import com.naedam.admin.form.model.vo.Form;
import com.naedam.admin.form.model.vo.FormPost;
import com.naedam.admin.form.model.vo.Item;

@Controller
@RequestMapping("/admin/form/*")
public class FormController {
	@Autowired
	private FormService formService;
	
	@PostMapping("addForm")
	public String addFrom(@ModelAttribute("form") Form form) throws Exception{
		System.out.println("form/addForm 시작");
		formService.addForm(form);
		return "redirect:/admin/form/formList";
	}
	
	@PostMapping("addFormPost")
	public String addFormPost(@ModelAttribute("formPost") FormPost formPost, 
			  				  @RequestParam("formNo") int formNo,
			  				  Form form) throws Exception{
		System.out.println("form/addFormPost 시작");
		form.setFormNo(formNo);
		formPost.setForm(form);
		formService.addFormPost(formPost);
		return "redirect:/admin/form/formPostList";
	}
	
	@PostMapping("addItem")
	public String addItem(@ModelAttribute("item") Item item, @RequestParam("formNo") int formNo, Form form) throws Exception{
		System.out.println("form/addItem 시작");
		form.setFormNo(formNo);
		item.setForm(form);
		formService.addItem(item);
		return "redirect:/admin/form/itemList?formNo="+formNo;
	}
	
	@PostMapping("updateForm")
	public String updateForm(@ModelAttribute("form") Form form) throws Exception{
		System.out.println("form/updateForm 시작");
		formService.updateForm(form);
		return "redirect:/admin/form/formList";
	}
	
	@PostMapping("updateItem")
	public String updateItem(@ModelAttribute("item") Item item, @RequestParam("formNo") int formNo) throws Exception{
		System.out.println("form/updateItem 시작");
		formService.updateItem(item);
		return "redirect:/admin/form/itemList?formNo="+formNo;
	}
	
	@PostMapping("updateFormDesign")
	public void updateFormDesign(@ModelAttribute("form") Form form) throws Exception{
		System.out.println("form/updateFormDesign 시작");
		System.out.println("form 확인 ::: "+form);
		formService.updateFormDesign(form);
	}
	
	@GetMapping("list")
	public String formList(Model model) throws Exception {
		System.out.println("formList 시작");
		List<Form> formList = formService.formList();
		model.addAttribute("list", formList);
		return "admin/form/formList";
	}
		
	@GetMapping("formPostList")
	public String formPostList(@RequestParam("formNo") int formNo, Model model) throws Exception {
		System.out.println("formPostList 시작");
		List<FormPost> formPostList = formService.formPostList(formNo);
		model.addAttribute("formNo", formNo);
		model.addAttribute("list", formPostList);
		return "admin/form/formPostList";
	}
	
	@GetMapping("itemList")
	public String itemList(@RequestParam("formNo") int formNo, Model model) throws Exception {
		System.out.println("form/itemList 시작");
		List<Item> itemList = formService.itemList(formNo);
		Form form = formService.getForm(formNo);
		model.addAttribute("list",itemList);
		model.addAttribute("formNo", formNo);
		model.addAttribute("form", form);
		return "admin/form/itemList";
	}
	
	@PostMapping("deleteChoiceForm")
	public void deleteChoiceForm(@RequestParam(value="formArr[]") List<String> formArr, Form form)
								 throws Exception{
		System.out.println("form/deleteChoiceForm 시작");
		int formNo = 0;
		for(String i : formArr) {
			formNo = Integer.parseInt(i);
			form.setFormNo(formNo);
			formService.deleteChoiceForm(formNo);
		}

	}
	
	@PostMapping("deleteChoiceItem")
	public void deleteChoiceItem(@RequestParam(value="itemArr[]") List<String> itemArr, Item item)
								 throws Exception{
		System.out.println("form/deleteChoiceItem 시작");
		int itemNo = 0;
		for(String i : itemArr) {
			itemNo = Integer.parseInt(i);
			item.setItemNo(itemNo);
			formService.deleteChoiceItem(itemNo);
		}

	}	


}
