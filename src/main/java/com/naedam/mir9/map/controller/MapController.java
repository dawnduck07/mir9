package com.naedam.mir9.map.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.naedam.mir9.map.model.service.MapService;
import com.naedam.mir9.map.model.vo.Maps;

import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/map")
@Slf4j
public class MapController {

	@Autowired
	private MapService mapService;

	@PostMapping("/getMap")
	@ResponseBody
	public Maps getMap(int mapNo) {
		Maps map = mapService.selectOneMapByMapNo(mapNo);

		return map;
	}

	@PostMapping("/map_process")
	public String map_process(HttpServletRequest request, Maps map, RedirectAttributes redirectAttr) {
		int result = 0;
		String msg = "";
		if(request.getParameter("mode").equals("update")) {
			result = mapService.updateMapByMap(map);
			msg = "약도 정보가 수정되었습니다.";
		}else if(request.getParameter("mode").equals("insert")) {
			//result = mapService.insertMap(map);
			log.debug("map = {}", map);
		}else if(request.getParameter("mode").equals("delete")) {
			log.debug("check========================");
		}
		
		redirectAttr.addFlashAttribute("msg", msg);
		return "redirect:/setting/map";
	}
	

}
