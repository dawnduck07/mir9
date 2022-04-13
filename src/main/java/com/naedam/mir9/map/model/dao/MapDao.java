package com.naedam.mir9.map.model.dao;

import java.util.List;

import com.naedam.mir9.map.model.vo.MapApi;
import com.naedam.mir9.map.model.vo.Maps;

public interface MapDao {

	Maps selectOneMapByMapNo(int mapNo);

	List<MapApi> selectAllMapApiList();

}
