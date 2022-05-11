package com.naedam.mir9.statistics.model.dao;

import java.util.List;
import java.util.Map;


import com.naedam.mir9.statistics.model.vo.AddressStatisticVo;
import com.naedam.mir9.statistics.model.vo.AreaVo;
import com.naedam.mir9.statistics.model.vo.BeforeYearStatisticVo;
import com.naedam.mir9.statistics.model.vo.MemberStatisticVo;
import com.naedam.mir9.statistics.model.vo.PeriodStatisticVo;
import com.naedam.mir9.statistics.model.vo.ProductStatisticVo;

public interface StatisticsDao {

	PeriodStatisticVo selectPeriodStatistics(Map<String, Object> param);
	
	List<ProductStatisticVo> selectProductStatistics(Map<String, Object> map) throws Exception;
	
	AddressStatisticVo selectAddressStatistics(Map<String, Object> map);
	
	AddressStatisticVo selectAddressStatistics2(Map<String, Object> map);
	
	List<AreaVo> selectAreaPayment(Map<String, Object> map);
	
	List<AreaVo> selectArea();

	List<MemberStatisticVo> selectMemberStatisticsList(Map<String, Object> param);
	
	BeforeYearStatisticVo selectBeforeStatisticsList(Map<String, Object> param);

}
