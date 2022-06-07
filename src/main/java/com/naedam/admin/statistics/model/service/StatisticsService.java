package com.naedam.admin.statistics.model.service;

import java.util.List;
import java.util.Map;

import com.naedam.admin.board.model.vo.Search;
import com.naedam.admin.statistics.model.vo.AddressStatisticVo;
import com.naedam.admin.statistics.model.vo.AreaVo;
import com.naedam.admin.statistics.model.vo.BeforeYearStatisticVo;
import com.naedam.admin.statistics.model.vo.MemberStatisticVo;
import com.naedam.admin.statistics.model.vo.PeriodStatisticVo;

public interface StatisticsService {

	Map<String, Object> statisticsAddress(Map<String, Object> map) throws Exception;
	
	Map<String, Object> selectPeriodStatistics(Map<String, Object> map);
	
	Map<String, Object> selectProductStatistics(Map<String, Object> map) throws Exception;

	Map<String, Object> selectMemberStatisticsList(Map<String, Object> param);
	
	Map<String, Object> homeControllerStatistics(Map<String, Object> map);
}
