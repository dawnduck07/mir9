package com.naedam.admin.map.model.service;

import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.naedam.admin.map.model.dao.MapDao;
import com.naedam.admin.map.model.vo.MapApi;
import com.naedam.admin.map.model.vo.Maps;

@Service
public class MapServiceImpl implements MapService {
	
	@Autowired
	private MapDao mapDao;

	/**
	 * 공통 : 약도 등록, 수정, 삭제
	 */
	@Override
	public Map<String, Object> mapProcess(Map<String, Object> param) {
		Map<String, Object> resultMap = new HashMap<>();
		Maps map = (Maps) param.get("map");
		HttpServletRequest request = (HttpServletRequest) param.get("request");
		if("insert".equals(param.get("mode"))) {
			mapDao.insertMap(map);
			resultMap.put("msg", "약도가 생성되었습니다.");
		}else if("update".equals(param.get("mode"))) {
			mapDao.updateMapMyMap(map);
			resultMap.put("msg", "약도 정보가 수정되었습니다.");
		}else if("delete".equals(param.get("mode"))) {
			List<String> mapNoList = Arrays.asList(request.getParameterValues("list[]"));
			for(String mapNo : mapNoList) {
				mapDao.deleteMap(Integer.parseInt(mapNo));
			}
			resultMap.put("msg", "약도가 삭제되었습니다.");
		}
		return resultMap;
	}
	
	/**
	 * 약도 조회
	 */
	@Override
	public List<MapApi> selectAllMapApiList() {
		return mapDao.selectAllMapApiList();
	}
	
	/**
	 * 모달창 약도 조회
	 */
	@Override
	public Maps selectOneMapByMapNo(int mapNo) {
		return mapDao.selectOneMapByMapNo(mapNo);
	}

	/**
	 * 약도 등록
	 */
	@Override
	public int insertMap(Maps map) {
		return mapDao.insertMap(map);
	}
	
	/**
	 * 약도 수정
	 */
	@Override
	public int updateMapByMap(Maps map) {
		return mapDao.updateMapMyMap(map);
	}

	/**
	 * 약도 삭제
	 */
	@Override
	public int deleteMap(int mapNo) {
		return mapDao.deleteMap(mapNo);
	}

}
