package com.naedam.mir9.statistics.model.dao;

import java.util.List;
import java.util.Map;

import com.naedam.mir9.statistics.model.vo.PeriodStatisticVo;
import com.naedam.mir9.statistics.model.vo.ProductStatisticVo;

public interface StatisticsDao {

	PeriodStatisticVo selectPeriodStatistics(Map<String, Object> param);
	
	List<ProductStatisticVo> selectProductStatistics(Map<String, Object> map) throws Exception;
}
