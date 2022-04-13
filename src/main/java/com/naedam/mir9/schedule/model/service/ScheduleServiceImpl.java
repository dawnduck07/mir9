package com.naedam.mir9.schedule.model.service;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.naedam.mir9.schedule.model.dao.ScheduleDao;
import com.naedam.mir9.schedule.model.vo.Schedule;

@Service
public class ScheduleServiceImpl implements ScheduleService {

	@Autowired
	private ScheduleDao scheduleDao;

	@Override
	public int addSchedule(Schedule schedule) throws Exception {
		return scheduleDao.addSchedule(schedule);
	}

	@Override
	public Map<String, Object> getScheduleList(Map<String, Object> map) throws Exception {
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("list", scheduleDao.getScheduleList(map));
		
		return resultMap;
	}

	@Override
	public int getSchedule(int scheduleNo) throws Exception {
		return scheduleDao.getSchedule(scheduleNo);
	}

	@Override
	public int updateSchedule(Schedule schedule) throws Exception {
		return scheduleDao.updateSchedule(schedule);
	}

	@Override
	public void deleteSchedule(int scheduleNo) throws Exception {
		scheduleDao.deleteSchedule(scheduleNo);
	}
}















