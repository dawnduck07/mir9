package com.naedam.admin.order.model.service;

import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.naedam.admin.delivery.model.dao.DeliveryDao;
import com.naedam.admin.delivery.model.vo.DeliverySetting;
import com.naedam.admin.option.model.vo.OrderOption;
import com.naedam.admin.order.model.dao.OrderDao;
import com.naedam.admin.order.model.vo.Order;
import com.naedam.admin.order.model.vo.OrderDetail;
import com.naedam.admin.order.model.vo.OrderExcelForm;
import com.naedam.admin.order.model.vo.OrderStatus;
import com.naedam.admin.setting.model.dao.SettingDao;

@Service
public class OrderServiceImpl implements OrderService {
	@Autowired
	private OrderDao orderDao;
	
	@Autowired
	private DeliveryDao deliveryDao;
	
	@Autowired
	private SettingDao settingDao;

	@Override
	public Map<String, Object> orderListSetting(Map<String, String> param) {
		List<Order> orderList = orderDao.selectOrderList(param);
		List<OrderStatus> orderStatusList = orderDao.selectOrderStatusList();
		int orderCnt = orderDao.selectOrderCnt(param);
		DeliverySetting deliSet = settingDao.selectOneDeliverySetting();
		
		Map<String, Object> map = new HashMap<>();
		map.put("orderList", orderList);
		map.put("orderStatusList", orderStatusList);
		map.put("orderCnt", orderCnt);
		map.put("deliSet", deliSet);
		return map;
	}
	
	@Override
	public int updateOrderStaus(Map<String, Object> param) {
		// TODO Auto-generated method stub
		return orderDao.updateOrderStaus(param);
	}

	@Override
	public int updateAdminMemo(Map<String, Object> param) {
		// TODO Auto-generated method stub
		return orderDao.updateAdminMemo(param);
	}

	@Override
	public Map<String, Object> orderDetail(String orderNo) {
		OrderDetail orderDetail = orderDao.selectOneOrderDetailByOrderNo(Long.parseLong(orderNo));
		List<OrderOption> orderOptionList = orderDao.selectOrderOptionListByOrderNo(Long.parseLong(orderNo));

		Map<String, Object> result = new HashMap<>();
		result.put("orderDetail", orderDetail);
		result.put("orderOptionList", orderOptionList);
		return result;
	}

	@Override
	public int getZipcodeByOrderNo(long orderNo) {
		int zipcode = orderDao.getZipcodeByOrderNo(orderNo);
		int doseosangan = deliveryDao.selectDoseosanganFeeByZipcode(zipcode);
		return doseosangan;
	}

	@Override
	public int updateOrderStausAuto(Map<String, String> param) {
		// TODO Auto-generated method stub
		return orderDao.updateOrderStausAuto(param);
	}

	@Override
	public String selectOrderStatusNameByOrderNo(String orderNo) {
		// TODO Auto-generated method stub
		return orderDao.selectOrderStatusNameByOrderNo(orderNo);
	}

	@Override
	public List<OrderExcelForm> selectOrderExcelForm() {
		// TODO Auto-generated method stub
		return orderDao.selectOrderExcelForm();
	}

	@Override
	public int orderDelete(HttpServletRequest request) {
		int result = 0;
		List<String> orderNoList =  Arrays.asList(request.getParameterValues("list[]"));
		for(String orderNo : orderNoList) {
			result = orderDao.deleteOrderByOrderNo(orderNo);
		}
		return result;
	}
	
	@Override
	public int selectTodayOrderCnt() {
		// TODO Auto-generated method stub
		return orderDao.selectTodayOrderCnt();
	}

	@Override
	public int selectMonthOrderCnt() {
		// TODO Auto-generated method stub
		return orderDao.selectMonthOrderCnt();
	}

	@Override
	public List<OrderDetail> selectOrderDetailList() {
		// TODO Auto-generated method stub
		return orderDao.selectOrderDetailList();
	}

	@Override
	public OrderStatus selectDashBoardOrderList(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return orderDao.selectDashBoardOrderList(map);
	}

}
