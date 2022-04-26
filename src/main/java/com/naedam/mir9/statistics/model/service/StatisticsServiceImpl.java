package com.naedam.mir9.statistics.model.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.naedam.mir9.statistics.model.dao.StatisticsDao;
import com.naedam.mir9.statistics.model.vo.PeriodStatisticVo;

@Service
public class StatisticsServiceImpl implements StatisticsService {
	@Autowired
	private StatisticsDao statisticsDao;

	@Override
	public PeriodStatisticVo selectPeriodStatistics(Map<String, Object> param) {
		// TODO Auto-generated method stub
		return statisticsDao.selectPeriodStatistics(param);
	}

	@Override
	public Map<String, Object> selectProductStatistics(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("list", statisticsDao.selectProductStatistics(map));
		return resultMap;
	}


	
	
}
