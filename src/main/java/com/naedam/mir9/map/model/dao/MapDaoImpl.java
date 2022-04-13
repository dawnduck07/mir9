package com.naedam.mir9.map.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.naedam.mir9.map.model.vo.MapApi;
import com.naedam.mir9.map.model.vo.Maps;

@Repository
public class MapDaoImpl implements MapDao {
	@Autowired
	private SqlSession session;

	@Override
	public Maps selectOneMapByMapNo(int mapNo) {
		// TODO Auto-generated method stub
		return session.selectOne("map.selectOneMapByMapNo");
	}

	@Override
	public List<MapApi> selectAllMapApiList() {
		// TODO Auto-generated method stub
		return session.selectList("map.selectAllMapApiList");
	}
	
	
	
	
}
