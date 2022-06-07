package com.naedam.admin.order.model.service;

import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import com.naedam.admin.order.model.vo.OrderDetail;
import com.naedam.admin.order.model.vo.OrderExcelForm;
import com.naedam.admin.order.model.vo.OrderStatus;

public interface OrderService {

	Map<String, Object> orderListSetting(Map<String, String> param);

	int updateOrderStaus(Map<String, Object> param);

	int updateAdminMemo(Map<String, Object> param);

	Map<String, Object> orderDetail(String orderNo);

	int getZipcodeByOrderNo(long orderNo);

	int updateOrderStausAuto(Map<String, String> param);

	String selectOrderStatusNameByOrderNo(String orderNo);

	List<OrderExcelForm> selectOrderExcelForm();

	int orderDelete(HttpServletRequest request);

	int selectTodayOrderCnt();

	int selectMonthOrderCnt();

	List<OrderDetail> selectOrderDetailList();

	OrderStatus selectDashBoardOrderList(Map<String, Object> map);

}
