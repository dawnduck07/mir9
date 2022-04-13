package com.naedam.mir9.map.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.naedam.mir9.map.model.dao.MapDao;
import com.naedam.mir9.map.model.vo.MapApi;
import com.naedam.mir9.map.model.vo.Maps;

@Service
public class MapServiceImpl implements MapService {
	
	@Autowired
	private MapDao mapDao;

	@Override
	public Maps selectOneMapByMapNo(int mapNo) {
		// TODO Auto-generated method stub
		return mapDao.selectOneMapByMapNo(mapNo);
	}

	@Override
	public List<MapApi> selectAllMapApiList() {
		// TODO Auto-generated method stub
		return mapDao.selectAllMapApiList();
	}
	
	
	
}
