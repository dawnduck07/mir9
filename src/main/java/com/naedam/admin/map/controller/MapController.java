package com.naedam.admin.map.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.naedam.admin.map.model.service.MapService;
import com.naedam.admin.map.model.vo.Maps;

import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/admin/map")
@Slf4j
public class MapController {

	@Autowired
	private MapService mapService;

	/**
	 * 모달창 약도 조회
	 * @param mapNo
	 * @return map.jsp
	 */
	@PostMapping("/getMap")
	@ResponseBody
	public Maps getMap(int mapNo) {
		Maps map = mapService.selectOneMapByMapNo(mapNo);
		return map;
	}

	/**
	 * 공통 : 약도 등록, 수정, 삭제
	 * @param request
	 * @param map
	 * @param redirectAttr
	 * @return map.jsp
	 */
	@PostMapping("/map_process")
	public String map_process(HttpServletRequest request, Maps map, RedirectAttributes redirectAttr) {
		Map<String, Object> param = new HashMap<>();
		param.put("mode", request.getParameter("mode"));
		param.put("map", map);
		param.put("request", request);
		Map<String, Object> resultMap = mapService.mapProcess(param);		
		redirectAttr.addFlashAttribute("msg", resultMap.get("msg"));
		return "redirect:/admin/setting/map";
	}
	
}
