package com.naedam.mir9.point.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.naedam.mir9.point.model.dao.PointDao;
import com.naedam.mir9.point.model.vo.Point;
import com.naedam.mir9.point.model.vo.PointSave;
import com.naedam.mir9.point.model.vo.PointUse;

@Service
public class pointServiceImpl implements PointService {
	@Autowired
	private PointDao pointDao;

	@Override
	public int updatePoint(Point point) {
		// TODO Auto-generated method stub
		return pointDao.updatePoint(point);
	}

	@Override
	public int updatePointSave(PointSave pointSave) {
		// TODO Auto-generated method stub
		return pointDao.updatePointSave(pointSave);
	}

	@Override
	public int updatePointUse(PointUse pointUse) {
		// TODO Auto-generated method stub
		return pointDao.updatePointUse(pointUse);
	}
	
	
}
