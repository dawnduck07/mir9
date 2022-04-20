package com.naedam.mir9.point.model.service;

import com.naedam.mir9.point.model.vo.Point;
import com.naedam.mir9.point.model.vo.PointSave;
import com.naedam.mir9.point.model.vo.PointUse;

public interface PointService {

	int updatePoint(Point point);

	int updatePointSave(PointSave pointSave);

	int updatePointUse(PointUse pointUse);

}
