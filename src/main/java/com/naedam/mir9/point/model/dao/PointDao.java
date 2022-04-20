package com.naedam.mir9.point.model.dao;

import java.util.List;

import com.naedam.mir9.point.model.vo.MemberPointExcelForm;
import com.naedam.mir9.point.model.vo.Point;
import com.naedam.mir9.point.model.vo.PointSave;
import com.naedam.mir9.point.model.vo.PointUse;

public interface PointDao {

	int updatePoint(Point point);

	int updatePointSave(PointSave pointSave);

	int updatePointUse(PointUse pointUse);

	List<MemberPointExcelForm> selectMemberPointExcelForm();

}
