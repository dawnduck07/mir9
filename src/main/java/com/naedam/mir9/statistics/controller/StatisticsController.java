package com.naedam.mir9.statistics.controller;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collections;
import java.util.Enumeration;

import java.util.GregorianCalendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.naedam.mir9.board.model.vo.Search;
import com.naedam.mir9.statistics.model.service.StatisticsService;
import com.naedam.mir9.statistics.model.vo.PeriodStatisticVo;
import com.naedam.mir9.statistics.model.vo.ProductStatisticVo;

import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/statistics")
@Slf4j
public class StatisticsController {
	@Autowired
	private StatisticsService statisticsService;
	
	@GetMapping("/period_day")
	public String statisticsPeriod_day(Model model) {
		Map<String, Object> param = new HashMap<String, Object>();
		List<PeriodStatisticVo> result = new ArrayList<PeriodStatisticVo>();
		param.put("type", "D");
		
		for(int i = 0; i < 7; i++) {
			Calendar cal = new GregorianCalendar();
			cal.add(GregorianCalendar.DATE, -i);
			param.put("date", cal.getTime());
			PeriodStatisticVo statistic = new PeriodStatisticVo();
			
			try {
				statistic = statisticsService.selectPeriodStatistics(param);
			
			} catch (Exception e) {}
			
			if(statistic == null) {
				statistic = new PeriodStatisticVo();
				statistic.setPaidAt(cal.getTime());
			}
			
			result.add(statistic);
		}
		
		Collections.reverse(result);
		model.addAttribute("result", result);
		

		return "statistics/period_day";
	}
	
	@GetMapping("/period_month")
	public String statisticsPeriod_month(Model model) {
		Map<String, Object> param = new HashMap<String, Object>();
		List<PeriodStatisticVo> result = new ArrayList<PeriodStatisticVo>();
		param.put("type", "M");
		for(int i = 0; i < 3; i++) {
			Calendar cal = new GregorianCalendar();
			cal.add(GregorianCalendar.MONTH, -i);
			param.put("date", cal.getTime());
			PeriodStatisticVo statistic = new PeriodStatisticVo();
			
			try {
				statistic = statisticsService.selectPeriodStatistics(param);
			
			} catch (Exception e) {}
			
			if(statistic == null) {
				statistic = new PeriodStatisticVo();
				statistic.setPaidAt(cal.getTime());
			}
			
			result.add(statistic);
		}
		
		Collections.reverse(result);
		model.addAttribute("result", result);

		return "statistics/period_month";
	}

	
	@GetMapping("/period_year")
	public String statisticsPeriod_year(Model model) {
		Map<String, Object> param = new HashMap<String, Object>();
		List<PeriodStatisticVo> result = new ArrayList<PeriodStatisticVo>();
		param.put("type", "Y");
		for(int i = 0; i < 5; i++) {
			Calendar cal = new GregorianCalendar();
			cal.add(GregorianCalendar.YEAR, -i);
			param.put("date", cal.getTime());
			PeriodStatisticVo statistic = new PeriodStatisticVo();
			
			try {
				statistic = statisticsService.selectPeriodStatistics(param);
			
			} catch (Exception e) {}
			
			if(statistic == null) {
				statistic = new PeriodStatisticVo();
				statistic.setPaidAt(cal.getTime());
			}
			
			result.add(statistic);
		}
		
		Collections.reverse(result);
		model.addAttribute("result", result);

		return "statistics/period_year";
	}
	
	@PostMapping("/period_process")
	public String statisticsPeriod_day(Model model, HttpServletRequest request) {
		String type = request.getParameter("statistics_type");
		String startDateStr = request.getParameter("start_date");
		String endDateStr = request.getParameter("end_date");
		GregorianCalendar startDate = strToIntDate(startDateStr, type);
		GregorianCalendar endDate = strToIntDate(endDateStr, type);
		log.debug("type = {}", type);
		Map<String, Object> param = new HashMap<String, Object>();
		List<PeriodStatisticVo> result = new ArrayList<PeriodStatisticVo>();
		int length = 0;
		
		if(type.equals("date")) {
			length = (int) ((endDate.getTimeInMillis() - startDate.getTimeInMillis())/1000/(24*60*60) + 1);
			param.put("type", "D");
		}else if(type.equals("month")) {
			length = (int) ((endDate.getTimeInMillis() - startDate.getTimeInMillis())/1000/(24*60*60)/30);
			param.put("type", "M");
		}else if(type.equals("year")) {
			length = (int) ((endDate.getTimeInMillis() - startDate.getTimeInMillis())/1000/(24*60*60)/365 + 1);
			param.put("type", "Y");
		}
		
		
		
		for(int i = 0; i < length; i++) {
			Calendar cal = endDate;
			
			if(type.equals("date")) {
				cal.add(GregorianCalendar.DATE, -1);				
			}else if(type.equals("month")) {
				cal.add(GregorianCalendar.MONTH, -1);				
			}else if(type.equals("year")) {
				cal.add(GregorianCalendar.YEAR, -1);
			}
			
			param.put("date", cal.getTime());
			PeriodStatisticVo statistic = new PeriodStatisticVo();
			
			try {
				statistic = statisticsService.selectPeriodStatistics(param);
			
			} catch (Exception e) {}
			
			if(statistic == null) {
				statistic = new PeriodStatisticVo();
				statistic.setPaidAt(cal.getTime());
			}
			
			result.add(statistic);
		}
		
		Collections.reverse(result);
		model.addAttribute("result", result);
		
		if(type.equals("date")) {
			return "statistics/period_day";
		}else if(type.endsWith("month")) {
			return "statistics/period_month";
		}
		
		return "statistics/period_year";
	}
	
	private GregorianCalendar strToIntDate(String dateStr, String type){
		int year=0; int month=0; int day = 0;
		if(type.equals("year")) {
			year = Integer.parseInt((dateStr.substring(0, 4)));
			return new GregorianCalendar(year+2, 0, 0);
			
		}else if(type.equals("month")) {
			year = Integer.parseInt((dateStr.substring(0, 4)));
			month = Integer.parseInt((dateStr.substring(5, 7))) - 1;
			
			return new GregorianCalendar(year, month +2, 0);
		}else if(type.equals("date")) {
			year = Integer.parseInt((dateStr.substring(0, 4)));
			month = Integer.parseInt((dateStr.substring(5, 7))) - 1;
			day = Integer.parseInt((dateStr.substring(8, 10)));
			return new GregorianCalendar(year, month, day+1);			
		}
		
		return null;
		
	}
	
	@RequestMapping(value="/product")
	public String statisticsProduct(Model model, @ModelAttribute("search") Search search) throws Exception {
		System.out.println("statistics/product 시작");
		ProductStatisticVo product = new ProductStatisticVo();
		product.setRegStartdate(search.getStart_date());
		product.setRegEnddate(search.getEnd_date());
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("search", search);
		map.put("product", product);
		Map<String, Object> resultMap = statisticsService.selectProductStatistics(map);
		System.out.println("데이터 확인 ::: "+resultMap.get("list"));
		model.addAttribute("list", resultMap.get("list"));
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
