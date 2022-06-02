package com.naedam.admin.schedule.model.service;

import java.util.List;
import java.util.Map;

import com.naedam.admin.schedule.model.vo.Schedule;

public interface ScheduleService {
	
	//일정 관리 프로세스
	public String scheduleProcess(Map<String, Object>map) throws Exception;
	
	//일정 등록
	public int addSchedule(Schedule schedule) throws Exception;
	
	//일정 리스트
	public List<Schedule> getScheduleList() throws Exception;
	
	//일정 데이터
	public int getSchedule(int scheduleNo) throws Exception;
	
	//일정 수정
	public int updateSchedule(Schedule schedule) throws Exception;
	
	//일정 삭제
	public void deleteSchedule(int scheduleNo) throws Exception;
	
}
