package com.naedam.admin.history.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.naedam.admin.history.model.service.HistoryService;
import com.naedam.admin.history.model.vo.History;

import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/admin/history")
@Slf4j
public class HistoryController {
	@Autowired
	private HistoryService historyService;
	
	/**
	 * 모달창 연혁 조회
	 * @param historyNo
	 * @return history.jsp
	 */
	@PostMapping("/getHistory")
	@ResponseBody
	public History getHistory(int historyNo) {
		History history = historyService.selectOneHistoryByHisNo(historyNo);
		return history;
	}
	
	/**
	 * 공통 : 연혁 등록, 수정, 삭제
	 * @param request
	 * @param history
	 * @param redirectAttr
	 * @return history.jsp
	 * @throws Exception
	 */
	@PostMapping("history_process")
	public String history_process(
			HttpServletRequest request, 
			History history, 
			RedirectAttributes redirectAttr) throws Exception {
		Map<String, Object> map = new HashMap<>();
		map.put("history", history);
		map.put("mode", request.getParameter("mode"));
		map.put("request", request);
		Map<String, Object> resultMap = historyService.historyProcess(map);
		redirectAttr.addFlashAttribute("msg", (String)resultMap.get("msg"));
		return "/admin/setting/history";
	}
	
}
