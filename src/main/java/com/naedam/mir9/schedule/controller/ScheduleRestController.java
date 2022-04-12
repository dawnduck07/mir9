package com.naedam.mir9.schedule.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.naedam.mir9.schedule.model.service.ScheduleService;
import com.naedam.mir9.schedule.model.vo.Schedule;

@RestController
@RequestMapping("/schedule/*")
public class ScheduleRestController {
	
	@Autowired
	private ScheduleService scheduleService;
	
	@PostMapping(value="json/addSchedule")
	@ResponseBody
	public Boolean addSchedule(@RequestBody Schedule schedule) throws Exception{;
		System.out.println("/json/addSchedule 시작");
		System.out.println("확인 ::: === "+schedule);
		
		Boolean result = false;
		
		if(schedule != null) {
			scheduleService.addSchedule(schedule);
			result = true;
		}
		
		
		return result; 
	}
	
}
