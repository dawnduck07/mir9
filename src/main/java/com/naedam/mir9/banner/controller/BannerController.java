package com.naedam.mir9.banner.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.naedam.mir9.banner.model.service.BannerService;
import com.naedam.mir9.banner.model.vo.Banner;

import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/banner")
@Slf4j
public class BannerController {
	@Autowired
	private BannerService bannerService;
	
	@PostMapping("/getBenner")
	@ResponseBody
	public Banner getBanner(int bannerNo) {
		Banner banner = bannerService.selectOneBannerByBannerNo(bannerNo);
		
		return banner;
	}
	
	@GetMapping("/img_view")
	public String img_view() {
		
		return "/setting/img_view";
	}
}
