package com.naedam.admin.banner.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.naedam.admin.banner.model.service.BannerService;
import com.naedam.admin.banner.model.vo.Banner;

import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/admin/banner")
@Slf4j
public class BannerController {
	@Autowired
	private BannerService bannerService;
	
	/**
	 * 배너 조회
	 * @param bannerNo
	 * @return
	 */
	@PostMapping("/getBenner")
	@ResponseBody
	public Banner getBanner(int bannerNo) {
		Map<String, Object> resultMap = bannerService.selectOneBannerByBannerNo(bannerNo);
		return (Banner)resultMap.get("banner");
	}
	
	/**
	 * 배너 이미지 조회
	 * @param bannerNo
	 * @param model
	 * @return
	 */
	@GetMapping("/img_view")
	public String img_view(
			@RequestParam(defaultValue = "0") int bannerNo, 
			Model model) {
		Map<String, Object> resultMap = bannerService.selectOneBannerByBannerNo(bannerNo);
		model.addAttribute("url",resultMap.get("url"));
		return "/admin/setting/img_view";
	}
	
	/**
	 * 공통 : 배너 메시지
	 * @param request
	 * @param banner
	 * @param redirectAttr
	 * @return
	 * @throws Exception
	 */
	@PostMapping("/banner_process")
	public String banner_process(
			HttpServletRequest request, 
			Banner banner, 
			RedirectAttributes redirectAttr) throws Exception {
		Map<String, Object> map = new HashMap<>();
		map.put("mode", request.getParameter("mode"));
		map.put("banner", banner);
		map.put("request", request);
		Map<String, Object> resultMap = bannerService.bannerProcess(map);
		redirectAttr.addFlashAttribute("msg", resultMap.get("msg"));
		return "redirect:/admin/setting/banner";
	}
}
