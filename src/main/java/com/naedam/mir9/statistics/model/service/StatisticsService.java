package com.naedam.mir9.statistics.model.service;

import java.util.List;
import java.util.Map;

import com.naedam.mir9.statistics.model.vo.PeriodStatisticVo;

public interface StatisticsService {

	PeriodStatisticVo selectPeriodStatistics(Map<String, Object> param);
	
	Map<String, Object> selectProductStatistics(Map<String, Object> map) throws Exception;
}
