package com.naedam.mir9.statistics.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.naedam.mir9.statistics.model.vo.AddressStatisticVo;
import com.naedam.mir9.statistics.model.vo.AreaVo;
import com.naedam.mir9.statistics.model.vo.PeriodStatisticVo;
import com.naedam.mir9.statistics.model.vo.ProductStatisticVo;

@Repository
public class StatisticsDaoImpl implements StatisticsDao {
	@Autowired
	private SqlSession session;

	@Override
	public PeriodStatisticVo selectPeriodStatistics(Map<String, Object> param) {
		// TODO Auto-generated method stub
		return session.selectOne("statistics.selectPeriodStatistics", param);
	}

	@Override
	public List<ProductStatisticVo> selectProductStatistics(Map<String, Object> map) throws Exception {
		return session.selectList("statistics.selectProductStatistics", map);
	}

	@Override
	public AddressStatisticVo selectAddressStatistics(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return session.selectOne("statistics.selectAddressStatistics", map);
	}

	@Override
	public List<AreaVo> selectAreaPayment(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return session.selectList("statistics.selectAreaPayment", map);
	}

	@Override
	public List<AreaVo> selectArea() {
		// TODO Auto-generated method stub
		return session.selectList("statistics.selectArea");
	}

	
	
	
}
