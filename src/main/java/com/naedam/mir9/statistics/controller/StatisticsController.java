package com.naedam.mir9.statistics.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.naedam.mir9.statistics.model.service.StatisticsService;

@Controller
@RequestMapping("/statistics")
public class StatisticsController {
	@Autowired
	private StatisticsService statisticsService;
	
	@GetMapping("/period_day")
	public String statisticsPeriod_day() {
		
		return "statistics/period_day";
	}
	
	@GetMapping("/period_month")
	public String statisticsPeriod_month() {
		
		return "statistics/period_month";
	}
	
	@GetMapping("/period_year")
	public String statisticsPeriod_year() {
		
		return "statistics/period_year";
	}
	
	@GetMapping("/product")
	public String statisticsProduct() {
		
		return "statistics/product";
	}
	
	@GetMapping("/member")
	public String statisticsMember() {
		
		return "statistics/member";
	}
	
	@GetMapping("/address_day")
	public String statisticsAddress_day() {
		
		return "statistics/address_day";
	}
	
	@GetMapping("/address_month")
	public String statisticsAddress_month() {
		
		return "statistics/address_month";
	}
	
	@GetMapping("/address_year")
	public String statisticsAddress_year() {
		
		return "statistics/address_year";
	}
}
