package com.naedam.admin.statistics.model.service;

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
import java.util.stream.Collectors;
import java.util.stream.IntStream;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.naedam.admin.board.model.vo.Search;
import com.naedam.admin.category.model.dao.CategoryDao;
import com.naedam.admin.order.model.dao.OrderDao;
import com.naedam.admin.order.model.vo.OrderStatus;
import com.naedam.admin.statistics.model.dao.StatisticsDao;
import com.naedam.admin.statistics.model.vo.AddressStatisticVo;
import com.naedam.admin.statistics.model.vo.AreaVo;
import com.naedam.admin.statistics.model.vo.BeforeYearStatisticVo;
import com.naedam.admin.statistics.model.vo.MemberStatisticVo;
import com.naedam.admin.statistics.model.vo.PeriodStatisticVo;

@Service
public class StatisticsServiceImpl implements StatisticsService {
	@Autowired
	private StatisticsDao statisticsDao;
	@Autowired
	private CategoryDao categoryDao;
	@Autowired
	private OrderDao orderDao;
	
	/*
	 * 지역별 매출통계의 프로세스
	 * mode의 차이마다 조건을 주어 일별, 월별, 연별을 구분하였음
	 */
	public Map<String, Object> statisticsAddress(Map<String, Object> map) throws Exception{
		Map<String, Object> resultMap = new HashMap<String, Object>();
		Search search = (Search) map.get("search");
		AddressStatisticVo addressVo = new AddressStatisticVo();
		
		//지역별 매출통계의 일별통계
		if("address_day".equals(map.get("mode"))) {
			addressVo.setAddressCategory(1);
			map.put("addressVo", addressVo);
			List<AddressStatisticVo> resultList = new ArrayList<AddressStatisticVo>();
			List<AreaVo> areaAddress = new ArrayList<AreaVo>(); 
			areaAddress = statisticsDao.selectAreaPayment(map);
			List<AreaVo> area = statisticsDao.selectArea();
			for(int i = 0; i < areaAddress.size(); i++) {
				area.set(areaAddress.get(i).getAreaNo()-1, areaAddress.get(i));
			}
			DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
			LocalDate startDateLocal = LocalDate.parse(search.getStart_date(), formatter);
			LocalDate endDateLocal = LocalDate.parse(search.getEnd_date(), formatter);
			List<LocalDate> localDate = startDateLocal.datesUntil(endDateLocal.plusDays(1)).collect(Collectors.toList());
			for(int i = 0; i < localDate.size(); i++) {
				map.put("date", localDate.get(i));			
				AddressStatisticVo address = new AddressStatisticVo();
				try {
					address = statisticsDao.selectAddressStatistics2(map);
				} catch (Exception e) {				
					e.printStackTrace();
				}
				if(address == null) {
					address = new AddressStatisticVo();
					address.setPaidAt(localDate.get(i));
				}
				resultList.add(address);
			}
			resultMap.put("resultList", resultList);
			resultMap.put("area", area);
			resultMap.put("return", "admin/statistics/address_day");
			return resultMap;
		
		//지역별 매출 통계의 월별통계
		}else if("address_month".equals(map.get("mode"))) {
			addressVo.setAddressCategory(2);
			map.put("addressVo", addressVo);
			List<AddressStatisticVo> resultList = new ArrayList<AddressStatisticVo>();
			List<AreaVo> areaAddress = new ArrayList<AreaVo>(); 
			areaAddress = statisticsDao.selectAreaPayment(map);
			List<AreaVo> area = statisticsDao.selectArea();
			for(int i = 0; i < areaAddress.size(); i++) {
				area.set(areaAddress.get(i).getAreaNo()-1, areaAddress.get(i));
			}
			DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");			
			LocalDate startDateLocal = LocalDate.parse(search.getStart_date(), formatter);
			LocalDate endDateLocal = LocalDate.parse(search.getEnd_date(), formatter);					
			int numOfDaysBetween = (int) ChronoUnit.MONTHS.between(startDateLocal, endDateLocal.plusMonths(1));
			List<LocalDate> localDate = IntStream.iterate(0, i -> i + 1)
							        	.limit(numOfDaysBetween)
							        	.mapToObj(i -> startDateLocal.plusMonths(i))
							        	.collect(Collectors.toList());
			for(int i = 0; i < localDate.size(); i++) {
				map.put("date", localDate.get(i));
				AddressStatisticVo address = new AddressStatisticVo();
				try {
					address = statisticsDao.selectAddressStatistics2(map);
				} catch (Exception e) {	
					e.printStackTrace();
				}
				if(address == null) {
					address = new AddressStatisticVo();
					address.setPaidAt(localDate.get(i));
				}
				resultList.add(address);
			}
			resultMap.put("resultList", resultList);
			resultMap.put("area", area);
			resultMap.put("return", "admin/statistics/address_month");
			return resultMap;
		
		//지역별 매출 통계의 연별통계
		}else if("address_year".equals(map.get("mode"))) {
			addressVo.setAddressCategory(3);
			map.put("addressVo", addressVo);
			List<AddressStatisticVo> resultList = new ArrayList<AddressStatisticVo>();
			List<AreaVo> areaAddress = new ArrayList<AreaVo>(); 
			areaAddress = statisticsDao.selectAreaPayment(map);
			List<AreaVo> area = statisticsDao.selectArea();
			for(int i = 0; i < areaAddress.size(); i++) {
				area.set(areaAddress.get(i).getAreaNo()-1, areaAddress.get(i));
			}
			DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");			
			LocalDate startDateLocal = LocalDate.parse(search.getStart_date(), formatter);
			LocalDate endDateLocal = LocalDate.parse(search.getEnd_date(), formatter);			
			int numOfDaysBetween = (int) ChronoUnit.YEARS.between(startDateLocal, endDateLocal.plusYears(1));		
			List<LocalDate> localDate = IntStream.iterate(0, i -> i + 1)
							        	.limit(numOfDaysBetween)
							        	.mapToObj(i -> startDateLocal.plusYears(i))
							        	.collect(Collectors.toList());	
			for(int i = 0; i < localDate.size(); i++) {
				map.put("date", localDate.get(i));
				AddressStatisticVo address = new AddressStatisticVo();
				try {
					address = statisticsDao.selectAddressStatistics2(map);
				} catch (Exception e) {				
					e.printStackTrace();
				}
				if(address == null) {
					address = new AddressStatisticVo();
					address.setPaidAt(localDate.get(i));
				}
				resultList.add(address);
			}
			resultMap.put("resultList", resultList);
			resultMap.put("area", area);
			resultMap.put("return", "admin/statistics/address_year");
		}
		return resultMap;
	}
	
	/*
	 * 기간별 매출통계의 프로세스
	 * map으로 가져와 mapping과 type마다 일별, 월별, 연별 조건을 줌
	 */
	@Override
	public Map<String, Object> selectPeriodStatistics(Map<String, Object> map) {
		// TODO Auto-generated method stub
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("type", (String)map.get("type"));
		List<PeriodStatisticVo> result = new ArrayList<PeriodStatisticVo>();
		
		//Get방식의 Mapping
		if("get".equals(map.get("mapping"))) {
			//기간별 매출 통계의 일별통계
			if("D".equals(map.get("type"))) {
				for(int i = 0; i < 7; i++) {
					Calendar cal = new GregorianCalendar();
					cal.add(GregorianCalendar.DATE, -i);
					resultMap.put("date", cal.getTime());
					PeriodStatisticVo statistic = new PeriodStatisticVo();
					try {
						statistic = statisticsDao.selectPeriodStatistics(resultMap);
					
					} catch (Exception e) {}
					if(statistic == null) {
						statistic = new PeriodStatisticVo();
						statistic.setPaidAt(cal.getTime());
					}
					result.add(statistic);
				}
				Collections.reverse(result);
				resultMap.put("result", result);
				resultMap.put("return", "admin/statistics/period_day");
			//기간별 매출 통계의 월별통계
			}else if("M".equals(map.get("type"))) {
				for(int i = 0; i < 3; i++) {
					Calendar cal = new GregorianCalendar();
					cal.add(GregorianCalendar.MONTH, -i);
					resultMap.put("date", cal.getTime());
					PeriodStatisticVo statistic = new PeriodStatisticVo();
					statistic = statisticsDao.selectPeriodStatistics(resultMap);
					if(statistic == null) {
						statistic = new PeriodStatisticVo();
						statistic.setPaidAt(cal.getTime());
					}
					result.add(statistic);
				}
				Collections.reverse(result);
				resultMap.put("result", result);
				resultMap.put("return", "admin/statistics/period_month");
			
			//기간별 매출 통계의 연별통계
			}else if("Y".equals(map.get("type"))) {
				for(int i = 0; i < 5; i++) {
					Calendar cal = new GregorianCalendar();
					cal.add(GregorianCalendar.YEAR, -i);
					resultMap.put("date", cal.getTime());
					PeriodStatisticVo statistic = new PeriodStatisticVo();
					statistic = statisticsDao.selectPeriodStatistics(resultMap);
					if(statistic == null) {
						statistic = new PeriodStatisticVo();
						statistic.setPaidAt(cal.getTime());
					}
					result.add(statistic);
				}
				Collections.reverse(result);
				resultMap.put("result", result);
				resultMap.put("return", "admin/statistics/period_year");
			}
			
		//Post방식의 mapping
		}else if("post".equals(map.get("mapping"))) {
			String type = (String) map.get("type");
			GregorianCalendar startDate = strToIntDate((String)map.get("startDateStr"), type);
			GregorianCalendar endDate = strToIntDate((String)map.get("endDateStr"), type);
			int length = 0;
			
			//type의 조건에 따라 일별, 월별, 연별을 구별
			if(type.equals("date")) {
				length = (int) ((endDate.getTimeInMillis() - startDate.getTimeInMillis())/1000/(24*60*60) + 1);
				resultMap.put("type", "D");
			}else if(type.equals("month")) {
				length = (int) ((endDate.getTimeInMillis() - startDate.getTimeInMillis())/1000/(24*60*60)/30);
				resultMap.put("type", "M");
			}else if(type.equals("year")) {
				length = (int) ((endDate.getTimeInMillis() - startDate.getTimeInMillis())/1000/(24*60*60)/365 + 1);
				resultMap.put("type", "Y");
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
				
				resultMap.put("date", cal.getTime());
				PeriodStatisticVo statistic = new PeriodStatisticVo();
				
				try {
					statistic = statisticsDao.selectPeriodStatistics(resultMap);
				
				} catch (Exception e) {}
				
				if(statistic == null) {
					statistic = new PeriodStatisticVo();
					statistic.setPaidAt(cal.getTime());
				}
				
				result.add(statistic);
			}
			Collections.reverse(result);
			resultMap.put("result", result);
			resultMap.put("startDateStr", (String)map.get("startDateStr"));
			resultMap.put("endDateStr", (String)map.get("endDateStr"));
			if(type.equals("date")) {
				resultMap.put("return", "admin/statistics/period_day");
			}else if(type.endsWith("month")) {
				resultMap.put("return", "admin/statistics/period_month");
			}
		}
		return resultMap;
	}

	/*
	 * 대쉬보드에 나타나는 매출통계 데이터 출력을 위한 로직
	 */
	@Override
	public Map<String, Object> homeControllerStatistics(Map<String, Object> map) {
		// TODO Auto-generated method stub
		Map<String, Object> resultMap = new HashMap<String, Object>();
		List<OrderStatus> orderStatusList = new ArrayList<OrderStatus>();
		List<PeriodStatisticVo> periodMonthList = new ArrayList<PeriodStatisticVo>();
		List<BeforeYearStatisticVo> byList = new ArrayList<BeforeYearStatisticVo>();
		Calendar cal = Calendar.getInstance();
		for(int i = 1; i <= 7; i++) {
			map.put("code", i);
			OrderStatus orderStatus = orderDao.selectDashBoardOrderList(map);
			orderStatusList.add(orderStatus);
		}
		resultMap.put("orderStatusList", orderStatusList);
		GregorianCalendar endDate = strToIntDate((String) map.get("endDateStr"), "year");
		GregorianCalendar endDate2 = strToIntDate((String) map.get("endDateStr2"), "month");
		GregorianCalendar endDate3 = strToIntDate((String) map.get("endDateStr3"), "date");
		for(int i = 0; i < 12; i++) {
			endDate.add(GregorianCalendar.MONTH, -1);
			endDate2.add(GregorianCalendar.MONTH, -1);
			endDate3.add(GregorianCalendar.MONTH, -1);
			map.put("date",endDate.getTime());
			map.put("date2",endDate2.getTime());
			map.put("date3",endDate3.getTime());
			map.put("mapping", "get");
			PeriodStatisticVo statistic = new PeriodStatisticVo();
			BeforeYearStatisticVo statistic2 = new BeforeYearStatisticVo();
			statistic2 = statisticsDao.selectBeforeStatisticsList(map);	
			statistic = statisticsDao.selectPeriodStatistics(map);
			if(statistic == null) {
				statistic = new PeriodStatisticVo();
				statistic.setPaidAt(cal.getTime());
			}
			if(statistic2 == null) {
				statistic2 = new BeforeYearStatisticVo();
				statistic2.setYear("0");
				statistic2.setYearsAgo("0");
				statistic2.setTwoYearsAgo("0");
			}
			periodMonthList.add(statistic);
			byList.add(statistic2);
		}
		Collections.reverse(periodMonthList);
		resultMap.put("periodMonthList", periodMonthList);
		resultMap.put("byList", byList);
		return resultMap;
	}
	
	/*
	 * 기간별 매출 통계의 데이터 처리를 위한 매소드
	 */
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
	
	/*
	 * 상품별 매출통계
	 */
	@Override
	public Map<String, Object> selectProductStatistics(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("list", statisticsDao.selectProductStatistics(map));
		resultMap.put("list2", categoryDao.selectProductCategory("product"));
		return resultMap;
	}
	
	/*
	 * 회원별 매출 통계
	 */
	public Map<String, Object> selectMemberStatisticsList(Map<String, Object> map) {
		// TODO Auto-generated method stub
		Map<String, Object> resultMap = new HashMap<>();
		/*
		 * map에 mapping을 넣어 Get방식 Post방식에 따라 조건을 걸었음
		 */
		if("get".equals(map.get("mapping"))) {
			List<MemberStatisticVo> memberStatisticsList = statisticsDao.selectMemberStatisticsList(map);
			resultMap.put("memberStatisticsList", memberStatisticsList);
		}else if("post".equals(map.get("mapping"))) {
			GregorianCalendar startDate = strToIntDate((String)map.get("startDateStr"),(String)map.get("type"));
			GregorianCalendar endDate = strToIntDate((String)map.get("endDateStr"), (String)map.get("type"));
			map.put("startDate", startDate.getTime());
			map.put("endDate", endDate.getTime());
			List<MemberStatisticVo> memberStatisticsList = statisticsDao.selectMemberStatisticsList(map);
			resultMap.put("memberStatisticsList", memberStatisticsList);
		}
		return resultMap;
	}




	
	
}
