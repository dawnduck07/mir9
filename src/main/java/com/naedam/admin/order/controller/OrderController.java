package com.naedam.admin.order.controller;

import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.naedam.admin.order.model.service.OrderService;
import com.naedam.admin.payment.model.service.PaymentService;
import com.naedam.admin.payment.model.vo.PaymentInfo;

import lombok.extern.slf4j.Slf4j;
import net.sf.json.JSONObject;

@Controller
@RequestMapping("/admin/order")
@Slf4j
public class OrderController {
	@Autowired
	private OrderService orderService;
	@Autowired
	private PaymentService paymentService;
	
	@GetMapping("/list")
	public String orderList(Model model) {
		Map<String, String> param = new HashMap<String, String>();
		orderListSetting(model, param);
		return "admin/order/orderList";
	}
	
	@SuppressWarnings("rawtypes")
	@PostMapping("/list")
	public String orderSearch(HttpServletRequest request, Model model) {
		Map<String, String> param = new HashMap<String, String>();
		Enumeration params = request.getParameterNames();
		while (params.hasMoreElements()){
		    String name = (String)params.nextElement();
		    param.put(name, request.getParameter(name));
		}
		orderListSetting(model, param);
		return "admin/order/orderList";
	}
	
	@ResponseBody
	@GetMapping("/orderDetail")
	public Map<String, Object> orderDetail(String orderNo) {
		Map<String, Object> map = orderService.orderDetail(orderNo);
		return map;
	}
	
	@ResponseBody
	@GetMapping("/updateOrderStatus")
	public int updateOrderStatus(String orderNo, String statusNo) {
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("orderNo", Long.parseLong(orderNo));
		param.put("statusNo", Integer.parseInt(statusNo));
		int result = orderService.updateOrderStaus(param);
		return result;
	}
	
	@ResponseBody
	@GetMapping("/updateAdminMemo")
	public int updateAdminMemo(String orderInfoNo, String memo) {
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("orderInfoNo", Integer.parseInt(orderInfoNo));
		param.put("memo", memo);
		int result = orderService.updateAdminMemo(param);
		return result;
	}
	
	@ResponseBody
	@GetMapping("/getDoseosangan")
	public int getDoseosangan(String orderNo) {
		int doseosangan = orderService.getZipcodeByOrderNo(Long.parseLong(orderNo));
		return doseosangan;
	}
	
	@GetMapping(value= "/statusAutoUpdate", produces = "application/text; charset=UTF-8")
	@ResponseBody
	public String statusAutoUpdate(String orderNo, String statusNo) {
		Map<String, String> param = new HashMap<String, String>();
		log.debug("statusNo = {}",statusNo);
		param.put("orderNo", orderNo);
		param.put("statusNo", statusNo);
		if(!statusNo.equals('0')) {
			int result = orderService.updateOrderStausAuto(param);			
		}
		
		String orderStatusName = orderService.selectOrderStatusNameByOrderNo(orderNo);
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("orderStatusName", orderStatusName);

		return jsonObject.toString();
	}
	
	@PostMapping("/delete")
	public String orderDelete(HttpServletRequest request, RedirectAttributes redirectAttr) {
		int result = orderService.orderDelete(request);
		if(result > 0) redirectAttr.addFlashAttribute("msg", "?????????????????????.");
		return "redirect:/admin/order/list";
	}
	
	@GetMapping("/log_list")
	public String paymentLogList(Model model) {
		List<PaymentInfo> paymentInfoList = paymentService.selectPaymentInfoList();
		model.addAttribute("paymentInfoList", paymentInfoList);
		return "admin/order/logList";
	}
	
	@GetMapping("/pay_test")
	public void pay_test() {
		
	}
	
	private void orderListSetting(Model model, Map<String, String> param) {
		log.debug("======param = {}=========", param);
		Map<String, Object> map = orderService.orderListSetting(param);
		model.addAllAttributes(map);
	}
	
	@GetMapping("/dashBoardOrderList")
	private String dashBoardOrderList(Model model, HttpServletRequest request) throws Exception{
		Map<String, String> param = new HashMap<String, String>();
		param.put("order_status", request.getParameter("order_status"));
		orderListSetting(model, param);
		return "admin/order/orderList";
	}
}
