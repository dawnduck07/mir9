package com.naedam.admin.schedule.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.naedam.admin.schedule.model.service.ScheduleService;

@Controller
@RequestMapping("/admin/schedule/*")
public class ScheduleController {
	
	@Autowired
	private ScheduleService scheduleService;
	
	/*
	 * 일정관리 화면을 출력하기 위한 메소드
	 */
	@GetMapping("schedule")
	public String schedule() {
		return "admin/schedule/schedule";
	}
}
