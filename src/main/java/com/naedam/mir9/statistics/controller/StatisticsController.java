package com.naedam.mir9.statistics.controller;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.time.temporal.ChronoUnit;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collections;
import java.util.GregorianCalendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.stream.Collectors;
import java.util.stream.IntStream;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.naedam.mir9.board.model.vo.Search;
import com.naedam.mir9.category.model.service.CategoryService;
import com.naedam.mir9.category.model.vo.Category;
import com.naedam.mir9.statistics.model.service.StatisticsService;
import com.naedam.mir9.statistics.model.vo.AddressStatisticVo;
import com.naedam.mir9.statistics.model.vo.AreaVo;
import com.naedam.mir9.statistics.model.vo.PeriodStatisticVo;
import com.naedam.mir9.statistics.model.vo.ProductStatisticVo;

import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/statistics")
@Slf4j
public class StatisticsController {
	@Autowired
	private StatisticsService statisticsService;
	@Autowired
	private CategoryService categoryService;
	
	@GetMapping("/period_day")
	public String statisticsPeriod_day(Model model) {
		Map<String, Object> param = new HashMap<String, Object>();
		List<PeriodStatisticVo> result = new ArrayList<PeriodStatisticVo>();
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
	
	@PostMapping("/period_day")
	public String statisticsPeriod_day(Model model, HttpServletRequest request) {
		String type = request.getParameter("statistics_type");
		String startDateStr = request.getParameter("start_date");
		String endDateStr = request.getParameter("end_date");
		GregorianCalendar startDate = strToIntDate(startDateStr);
		GregorianCalendar endDate = strToIntDate(endDateStr);
		
		int length = (int) ((endDate.getTimeInMillis() - startDate.getTimeInMillis())/1000/(24*60*60) + 1);
		
		
		
		Map<String, Object> param = new HashMap<String, Object>();
		List<PeriodStatisticVo> result = new ArrayList<PeriodStatisticVo>();
		
		for(int i = 0; i < length; i++) {
			Calendar cal = endDate;
			cal.add(GregorianCalendar.DATE, -1);
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
		}
		
		return "";
	}
	
	private GregorianCalendar strToIntDate(String dateStr){
		int year = Integer.parseInt((dateStr.substring(0, 4)));
		int month = Integer.parseInt((dateStr.substring(5, 7))) - 1;
		int day = Integer.parseInt((dateStr.substring(8, 10)));
		
		return new GregorianCalendar(year, month, day+1);
	}
	
	@GetMapping("/period_month")
	public String statisticsPeriod_month() {
		
		return "statistics/period_month";
	}
	
	@GetMapping("/period_year")
	public String statisticsPeriod_year() {
		
		return "statistics/period_year";
	}
	
	@RequestMapping(value="/product")
	public String statisticsProduct(Model model, @ModelAttribute("search") Search search) throws Exception {
		System.out.println("statistics/product 시작");
		String type = "product";
		ProductStatisticVo product = new ProductStatisticVo();
		product.setRegStartdate(search.getStart_date());
		product.setRegEnddate(search.getEnd_date());
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("search", search);
		map.put("product", product);
		Map<String, Object> resultMap = statisticsService.selectProductStatistics(map);
		List<Category> categoryList = categoryService.selectProductCategory(type);
		model.addAttribute("list", resultMap.get("list"));
		model.addAttribute("list2", categoryList);
		return "statistics/product";
	}
	
	@GetMapping("/member")
	public String statisticsMember() {
		
		return "statistics/member";
	}
	
	@GetMapping("/address_day")
	public String statisticsAddress_day(Model model, Search search) throws Exception {
		System.out.println("get/statistics/address_day 시작");
		LocalDate now = LocalDate.now();
		String startDate = now.minusDays(7).toString();
		String endDate = now.toString();
		search.setStart_date(startDate);
		search.setEnd_date(endDate);
		Map<String, Object> map = new HashMap<String, Object>();
		AddressStatisticVo addressVo = new AddressStatisticVo();
		addressVo.setAddressCategory(1);
		map.put("search", search);
		map.put("addressVo", addressVo);
		List<AddressStatisticVo> resultList = new ArrayList<AddressStatisticVo>();
		List<AreaVo> areaAddress = new ArrayList<AreaVo>(); 
		areaAddress = statisticsService.selectAreaPayment(map);
		List<AreaVo> area = statisticsService.selectArea();

		for(int i = 0; i < areaAddress.size(); i++) {
			area.set(areaAddress.get(i).getAreaNo()-1, areaAddress.get(i));
		}

		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
		
		LocalDate startDateLocal = LocalDate.parse(startDate, formatter);
		LocalDate endDateLocal = LocalDate.parse(endDate, formatter);
				
		List<LocalDate> localDate = startDateLocal.datesUntil(endDateLocal.plusDays(1)).collect(Collectors.toList());
		
		for(int i = 0; i < localDate.size(); i++) {
			map.put("date", localDate.get(i));
			
			AddressStatisticVo address = new AddressStatisticVo();
			try {
				address = statisticsService.selectAddressStatistics(map);
			} catch (Exception e) {
				
				e.printStackTrace();
			}
			if(address == null) {
				address = new AddressStatisticVo();
				address.setPaidAt(localDate.get(i));
			}
			resultList.add(address);
		}
		
		model.addAttribute("list", resultList);
		model.addAttribute("list2", area);
		return "statistics/address_day";
	}
	
	@PostMapping("/address_day")
	public String statisticsAddress_day(Model model, HttpServletRequest request, Search search) throws Exception {
		System.out.println("post/statistics/statisticsAddress_day 시작");
		
		String startDate = request.getParameter("start_date");
		String endDate = request.getParameter("end_date");
		search.setStart_date(startDate);
		search.setEnd_date(endDate);
		Map<String, Object> map = new HashMap<String, Object>();
		AddressStatisticVo addressVo = new AddressStatisticVo();
		addressVo.setAddressCategory(1);
		map.put("search", search);
		map.put("addressVo", addressVo);
		List<AddressStatisticVo> resultList = new ArrayList<AddressStatisticVo>();
		List<AreaVo> areaAddress = new ArrayList<AreaVo>(); 
		areaAddress = statisticsService.selectAreaPayment(map);
		List<AreaVo> area = statisticsService.selectArea();

		for(int i = 0; i < areaAddress.size(); i++) {
			area.set(areaAddress.get(i).getAreaNo()-1, areaAddress.get(i));
		}

		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
		
		LocalDate startDateLocal = LocalDate.parse(startDate, formatter);
		LocalDate endDateLocal = LocalDate.parse(endDate, formatter);
				
		List<LocalDate> localDate = startDateLocal.datesUntil(endDateLocal.plusDays(1)).collect(Collectors.toList());
		
		for(int i = 0; i < localDate.size(); i++) {
			map.put("date", localDate.get(i));
			
			AddressStatisticVo address = new AddressStatisticVo();
			try {
				address = statisticsService.selectAddressStatistics(map);
			} catch (Exception e) {
				
				e.printStackTrace();
			}
			if(address == null) {
				address = new AddressStatisticVo();
				address.setPaidAt(localDate.get(i));
			}
			resultList.add(address);
		}
		
		model.addAttribute("list", resultList);
		model.addAttribute("list2", area);
		return "statistics/address_day";
	}	

	@GetMapping("/address_month")
	public String statisticsAddress_month(Model model, Search search) throws Exception {

		return "statistics/address_month";
	}
	
	@PostMapping("/address_month")
	public String statisticsAddress_month(Model model, HttpServletRequest request, Search search) throws Exception {
		System.out.println("post/statistics/statisticsAddress_month 시작");
		
		String startDate = request.getParameter("start_date");
		String endDate = request.getParameter("end_date");
		StringBuffer sbStartDate = new StringBuffer();
		StringBuffer sbEndDate = new StringBuffer();
		sbStartDate.append(startDate);
		sbEndDate.append(endDate);
		search.setStart_date(sbStartDate.append("-01").substring(0, 10));
		search.setEnd_date(sbEndDate.append("-01").substring(0, 10));
		Map<String, Object> map = new HashMap<String, Object>();
		AddressStatisticVo addressVo = new AddressStatisticVo();
		map.put("search", search);
		map.put("addressVo", addressVo);
		addressVo.setAddressCategory(2);
		List<AddressStatisticVo> resultList = new ArrayList<AddressStatisticVo>();
		List<AreaVo> areaAddress = new ArrayList<AreaVo>(); 
		areaAddress = statisticsService.selectAreaPayment(map);
		List<AreaVo> area = statisticsService.selectArea();

		for(int i = 0; i < areaAddress.size(); i++) {
			area.set(areaAddress.get(i).getAreaNo()-1, areaAddress.get(i));
		}
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
		
		LocalDate startDateLocal = LocalDate.parse(sbStartDate, formatter);
		LocalDate endDateLocal = LocalDate.parse(sbEndDate, formatter);
				
		int numOfDaysBetween = (int) ChronoUnit.MONTHS.between(startDateLocal, endDateLocal.plusMonths(1));
		
		List<LocalDate> localDate = IntStream.iterate(0, i -> i + 1)
						        	.limit(numOfDaysBetween)
						        	.mapToObj(i -> startDateLocal.plusMonths(i))
						        	.collect(Collectors.toList());
		
		for(int i = 0; i < localDate.size(); i++) {
			map.put("date", localDate.get(i));
			AddressStatisticVo address = new AddressStatisticVo();
			try {
				address = statisticsService.selectAddressStatistics(map);
			} catch (Exception e) {	
				e.printStackTrace();
			}
			if(address == null) {
				address = new AddressStatisticVo();
				address.setPaidAt(localDate.get(i));
			}
			resultList.add(address);
		}
		model.addAttribute("list", resultList);
		model.addAttribute("list2", area);
		return "statistics/address_month";
	}
	
	@GetMapping("/address_year")
	public String statisticsAddress_year(Model model, Search search) throws Exception {

		return "statistics/address_year";
	}
	
	@PostMapping("/address_year")
	public String statisticsAddress_year(Model model, HttpServletRequest request, Search search) throws Exception {
		System.out.println("post/statistics/statisticsAddress_year 시작");
		
		String startDate = request.getParameter("start_date");
		String endDate = request.getParameter("end_date");
		StringBuffer sbStartDate = new StringBuffer();
		StringBuffer sbEndDate = new StringBuffer();
		sbStartDate.append(startDate);
		sbEndDate.append(endDate);
		search.setStart_date(sbStartDate.append("-01-01").substring(0, 10));
		search.setEnd_date(sbEndDate.append("-01-01").substring(0, 10));		
		
		Map<String, Object> map = new HashMap<String, Object>();
		AddressStatisticVo addressVo = new AddressStatisticVo();
		addressVo.setAddressCategory(3);
		map.put("search", search);
		map.put("addressVo", addressVo);
		List<AddressStatisticVo> resultList = new ArrayList<AddressStatisticVo>();
		List<AreaVo> areaAddress = new ArrayList<AreaVo>(); 
		areaAddress = statisticsService.selectAreaPayment(map);
		List<AreaVo> area = statisticsService.selectArea();

		for(int i = 0; i < areaAddress.size(); i++) {
			area.set(areaAddress.get(i).getAreaNo()-1, areaAddress.get(i));
		}
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
		
		LocalDate startDateLocal = LocalDate.parse(sbStartDate, formatter);
		LocalDate endDateLocal = LocalDate.parse(sbEndDate, formatter);
				
		int numOfDaysBetween = (int) ChronoUnit.YEARS.between(startDateLocal, endDateLocal.plusYears(1));
		
		List<LocalDate> localDate = IntStream.iterate(0, i -> i + 1)
						        	.limit(numOfDaysBetween)
						        	.mapToObj(i -> startDateLocal.plusYears(i))
						        	.collect(Collectors.toList());
		
		for(int i = 0; i < localDate.size(); i++) {
			map.put("date", localDate.get(i));
			AddressStatisticVo address = new AddressStatisticVo();
			try {
				address = statisticsService.selectAddressStatistics(map);
			} catch (Exception e) {
				
				e.printStackTrace();
			}
			if(address == null) {
				address = new AddressStatisticVo();
				address.setPaidAt(localDate.get(i));
			}
			resultList.add(address);
		}
		model.addAttribute("list", resultList);
		model.addAttribute("list2", area);
		return "statistics/address_year";
	}
}
