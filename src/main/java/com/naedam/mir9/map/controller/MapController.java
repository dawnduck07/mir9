package com.naedam.mir9.map.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

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
}
