package com.naedam.mir9.statistics.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.naedam.mir9.statistics.model.vo.PeriodStatisticVo;

@Repository
public class StatisticsDaoImpl implements StatisticsDao {
	@Autowired
	private SqlSession session;

	@Override
	public PeriodStatisticVo selectPeriodStatistics(Map<String, Object> param) {
		// TODO Auto-generated method stub
		return session.selectOne("statistics.selectPeriodStatistics", param);
	}

	
	
	
}
