package com.naedam.mir9.statistics.model.dao;

import java.util.List;
import java.util.Map;

import com.naedam.mir9.statistics.model.vo.PeriodStatisticVo;

public interface StatisticsDao {

	PeriodStatisticVo selectPeriodStatistics(Map<String, Object> param);

}
