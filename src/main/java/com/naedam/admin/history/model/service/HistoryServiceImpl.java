package com.naedam.admin.history.model.service;

import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.naedam.admin.history.model.dao.HistoryDao;
import com.naedam.admin.history.model.vo.History;

@Service
public class HistoryServiceImpl implements HistoryService {
	@Autowired
	private HistoryDao historyDao;

	/**
	 * 공통 : 연혁 등록, 수정, 삭제
	 */
	@Override
	public Map<String, Object> historyProcess(Map<String, Object> map) throws Exception {
		Map<String, Object> resultMap = new HashMap<>();
		History history = (History) map.get("history");
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		if("insert".equals(map.get("mode")) || "update".equals(map.get("mode"))) {
			StringBuilder str = new StringBuilder();
			SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMdd");
			Date resultDate = new Date();
			str.append(request.getParameter("year"));
			if(request.getParameter("month").length() < 2) {
				str.append("0"+request.getParameter("month"));
			}else {
				str.append(request.getParameter("month"));
			}
			if(request.getParameter("date").length() < 2) {
				str.append("0" + request.getParameter("date"));
			}else {
				str.append(request.getParameter("date"));
			}
			resultDate = formatter.parse(str.toString());
			Date date = resultDate;
			history.setHistoryDate(date);
			if("insert".equals(map.get("mode"))) {
				historyDao.insertHistory(history);
				resultMap.put("msg", "연혁 정보가 등록되었습니다.");
			}else if("update".equals(map.get("mode"))) {
				historyDao.updateHistory(history);
				resultMap.put("msg", "연혁 정보가 수정되었습니다.");
			}
		}else if("delete".equals(map.get("mode"))) {
			List<String> historyNoList = Arrays.asList(request.getParameterValues("list[]"));
			for(String no : historyNoList) {
				historyDao.deleteHistory(Integer.parseInt(no));
			}
			resultMap.put("msg", "연혁이 삭제되었습니다.");
		}
		
		return resultMap;
	}
	
	/**
	 * 모달창 연혁 조회
	 */
	@Override
	public History selectOneHistoryByHisNo(int historyNo) {
		return historyDao.selectOneHistoryByHisNo(historyNo);
	}

	/**
	 * 연혁 등록
	 */
	@Override
	public int insertHistory(History history) {
		return historyDao.insertHistory(history);
	}

	/**
	 * 연혁 수정
	 */
	@Override
	public int updateHistory(History history) {
		return historyDao.updateHistory(history);
	}

	/**
	 * 연혁 삭제
	 */
	@Override
	public int deleteHistory(int historyNo) {
		return historyDao.deleteHistory(historyNo);
	}

}
