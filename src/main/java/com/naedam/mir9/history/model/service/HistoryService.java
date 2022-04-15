package com.naedam.mir9.history.model.service;

import com.naedam.mir9.history.model.vo.History;

public interface HistoryService {

	History selectOneHistoryByHisNo(int historyNo);

	int insertHistory(History history);

	int updateHistory(History history);

	int deleteHistory(int historyNo);

}
