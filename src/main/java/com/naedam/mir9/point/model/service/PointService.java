package com.naedam.mir9.point.model.service;

import java.util.List;

import com.naedam.mir9.member.model.vo.MemberListExcelForm;
import com.naedam.mir9.point.model.vo.MemberPointExcelForm;
import com.naedam.mir9.point.model.vo.Point;
import com.naedam.mir9.point.model.vo.PointSave;
import com.naedam.mir9.point.model.vo.PointUse;

public interface PointService {

	int updatePoint(Point point);

	int updatePointSave(PointSave pointSave);

	int updatePointUse(PointUse pointUse);

	List<MemberPointExcelForm> selectMemberPointExcelForm();


}
