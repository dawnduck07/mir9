package com.naedam.admin.statistics.controller;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collections;
import java.util.GregorianCalendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.naedam.admin.board.model.vo.Search;
import com.naedam.admin.category.model.service.CategoryService;
import com.naedam.admin.statistics.model.service.StatisticsService;
import com.naedam.admin.statistics.model.vo.MemberStatisticVo;
import com.naedam.admin.statistics.model.vo.PeriodStatisticVo;
import com.naedam.admin.statistics.model.vo.ProductStatisticVo;

import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/admin/statistics")
@Slf4j
public class StatisticsController {
	@Autowired
	private StatisticsService statisticsService;
	@Autowired
	private CategoryService categoryService;
	/*
	 * Get방식의 기본 기간별 매출 통계
	 */
	@GetMapping("/periodProcess")
	public String periodProcess(Model model, @RequestParam("type") String type) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("type", type);
		map.put("mapping", "get");
		Map<String, Object> resultMap = statisticsService.selectPeriodStatistics(map);
		model.addAttribute("result", resultMap.get("result"));
		return (String)resultMap.get("return");
	}
	
	/*
	 * 기간별 매출 통계의 검색을 통한 로직
	 */
	@PostMapping("/period_process")
	public String statisticsPeriod_day(Model model, HttpServletRequest request) {
		Map<String, Object> map = new HashMap<>();
		map.put("type", request.getParameter("statistics_type"));
		map.put("startDateStr", request.getParameter("start_date"));
		map.put("endDateStr", request.getParameter("end_date"));
		map.put("mapping", "post");
		Map<String, Object> resultMap = statisticsService.selectPeriodStatistics(map);
		model.addAttribute("result", resultMap.get("result"));
		model.addAttribute("startDateStr",resultMap.get("startDateStr"));
		model.addAttribute("endDateStr",resultMap.get("endDateStr"));
		return (String)resultMap.get("return");
	}
	
	/*
	 * 제품별 매출 통계
	 */
	@RequestMapping(value="/product")
	public String statisticsProduct(Model model, @ModelAttribute("search") Search search) throws Exception {
		ProductStatisticVo product = new ProductStatisticVo();
		product.setRegStartdate(search.getStart_date());
		product.setRegEnddate(search.getEnd_date());
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("search", search);
		map.put("product", product);
		Map<String, Object> resultMap = statisticsService.selectProductStatistics(map);
		model.addAttribute("list", resultMap.get("list"));
		model.addAttribute("list2", resultMap.get("list2"));
		return "admin/statistics/product";
	}
	
	/*
	 * 회원별 매출통계
	 */
	@GetMapping("/member")
	public String statisticsMember(Model model) {
		Map<String, Object> map = new HashMap<String, Object>();
		Calendar cal = new GregorianCalendar();
		map.put("endDate", cal.getTime());
		cal.add(GregorianCalendar.MONTH, -3);
		map.put("startDate", cal.getTime());
		map.put("mapping", "get");
		Map<String, Object> resultMap = statisticsService.selectMemberStatisticsList(map);
		model.addAttribute("result",resultMap.get("memberStatisticsList"));
		return "admin/statistics/member";
	}
	
	/*
	 * 회원별 매출통계 검색을 통한 로직
	 */
	@PostMapping("/member")
	public String statisticsMember(Model model, HttpServletRequest request) {
		Map<String, Object> map = new HashMap<>();
		map.put("startDateStr", request.getParameter("start_date"));
		map.put("endDateStr", request.getParameter("end_date"));
		map.put("type", "date");
		map.put("mapping", "post");
		Map<String, Object> resultMap = statisticsService.selectMemberStatisticsList(map);
		model.addAttribute("result",resultMap.get("memberStatisticsList"));
		model.addAttribute("startDateStr", request.getParameter("start_date"));
		model.addAttribute("endDateStr", request.getParameter("end_date"));
		return "admin/statistics/member";
	}
	
	/*
	 * Get 방식의 지역별 매출통계의 일별통계
	 */
	@GetMapping("/address_day")
	public String statisticsAddress_day(Model model, Search search) throws Exception {
		System.out.println("get/statistics/address_day 시작");
		Map<String, Object> map = new HashMap<String, Object>();
		LocalDate now = LocalDate.now();
		search.setStart_date(now.minusDays(7).toString());
		search.setEnd_date(now.toString());
		map.put("search", search);
		map.put("mode", "address_day");
		Map<String, Object> resultMap = statisticsService.statisticsAddress(map);

		model.addAttribute("list", resultMap.get("resultList"));
		model.addAttribute("list2", resultMap.get("area"));
		return (String)resultMap.get("return");
	}
	
	/*
	 * Post 방식의 검색을 통한 지역별 매출통계의 일별통계
	 */
	@PostMapping("/address_day")
	public String statisticsAddress_day(Model model, HttpServletRequest request, Search search) throws Exception {
		System.out.println("post/statistics/statisticsAddress_day 시작");
		Map<String, Object> map = new HashMap<String, Object>();
		String startDate = request.getParameter("start_date");
		String endDate = request.getParameter("end_date");
		search.setStart_date(startDate);
		search.setEnd_date(endDate);
		map.put("search", search);
		map.put("mode", "address_day");
		Map<String, Object> resultMap = statisticsService.statisticsAddress(map);
		model.addAttribute("list", resultMap.get("resultList"));
		model.addAttribute("list2", resultMap.get("area"));
		return (String)resultMap.get("return");
	}	
	
	/*
	 * Get 방식의 지역별 매출통계의 월별통계 
	 */
	@GetMapping("/address_month")
	public String statisticsAddress_month(Model model, Search search) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		LocalDate now = LocalDate.now();
		String startDate = now.minusMonths(1).toString();
		String endDate = now.toString();
		search.setStart_date(startDate);
		search.setEnd_date(endDate);
		map.put("search", search);
		map.put("mode", "address_month");
		Map<String, Object> resultMap = statisticsService.statisticsAddress(map);
		model.addAttribute("list", resultMap.get("resultList"));
		model.addAttribute("list2", resultMap.get("area"));
		return (String)resultMap.get("return");
	}
	
	/*
	 * Post 방식의 검색을 통한 지역별 매출통계의 월별통계
	 */
	@PostMapping("/address_month")
	public String statisticsAddress_month(Model model, HttpServletRequest request, Search search) throws Exception {
		System.out.println("post/statistics/statisticsAddress_month 시작");
		Map<String, Object> map = new HashMap<String, Object>();
		String startDate = request.getParameter("start_date");
		String endDate = request.getParameter("end_date");
		StringBuffer sbStartDate = new StringBuffer();
		StringBuffer sbEndDate = new StringBuffer();
		sbStartDate.append(startDate);
		sbEndDate.append(endDate);
		search.setStart_date(sbStartDate.append("-01").substring(0, 10));
		search.setEnd_date(sbEndDate.append("-01").substring(0, 10));
		map.put("search", search);
		map.put("mode", "address_month");
		Map<String, Object> resultMap = statisticsService.statisticsAddress(map);
		model.addAttribute("list", resultMap.get("resultList"));
		model.addAttribute("list2", resultMap.get("area"));
		return (String)resultMap.get("return");
	}
	
	/*
	 * Get 방식의 지역별 매출통계의 연별통계
	 */
	@GetMapping("/address_year")
	public String statisticsAddress_year(Model model, Search search) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();		
		LocalDate now = LocalDate.now();
		String startDate = now.minusYears(4).toString();
		String endDate = now.toString();
		search.setStart_date(startDate);
		search.setEnd_date(endDate);	
		map.put("search", search);
		map.put("mode", "address_year");
		Map<String, Object> resultMap = statisticsService.statisticsAddress(map);
		model.addAttribute("list", resultMap.get("resultList"));
		model.addAttribute("list2", resultMap.get("area"));
		return (String)resultMap.get("return");
	}
	
	/*
	 * Post 방식의 검색을 통한 지역별 매출통계의 연별통계
	 */
	@PostMapping("/address_year")
	public String statisticsAddress_year(Model model, HttpServletRequest request, Search search) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();		
		LocalDate now = LocalDate.now();
		String startDate = request.getParameter("start_date");
		String endDate = request.getParameter("end_date");
		StringBuffer sbStartDate = new StringBuffer();
		StringBuffer sbEndDate = new StringBuffer();
		sbStartDate.append(startDate);
		sbEndDate.append(endDate);
		search.setStart_date(sbStartDate.append("-01-01").substring(0, 10));
		search.setEnd_date(sbEndDate.append("-01-01").substring(0, 10));		
		map.put("search", search);
		map.put("mode", "address_year");
		Map<String, Object> resultMap = statisticsService.statisticsAddress(map);
		model.addAttribute("list", resultMap.get("resultList"));
		model.addAttribute("list2", resultMap.get("area"));
		return (String)resultMap.get("return");
	}
}

