package com.naedam.mir9.map.model.service;

import java.util.List;

import com.naedam.mir9.map.model.vo.MapApi;
import com.naedam.mir9.map.model.vo.Maps;

public interface MapService {

	Maps selectOneMapByMapNo(int mapNo);

	List<MapApi> selectAllMapApiList();

}
