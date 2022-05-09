package com.naedam.mir9;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collections;
import java.util.GregorianCalendar;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.naedam.mir9.board.model.service.BoardService;
import com.naedam.mir9.board.model.vo.Board;
import com.naedam.mir9.member.model.service.MemberService;
import com.naedam.mir9.order.model.service.OrderService;
import com.naedam.mir9.order.model.vo.OrderDetail;
import com.naedam.mir9.order.model.vo.OrderStatus;
import com.naedam.mir9.payment.model.service.PaymentService;
import com.naedam.mir9.product.model.service.ProductService;
import com.naedam.mir9.product.model.vo.ProductDetail;
import com.naedam.mir9.statistics.model.service.StatisticsService;
import com.naedam.mir9.statistics.model.vo.PeriodStatisticVo;

import lombok.extern.slf4j.Slf4j;

/**
 * Handles requests for the application home page.
 */
@Controller
@Slf4j
public class HomeController {
	@Autowired
	private OrderService orderService;
	@Autowired
	private PaymentService paymentService;
	@Autowired
	private MemberService memberService;
	@Autowired
	private BoardService boardService;
	@Autowired
	private ProductService productService;
	@Autowired
	private StatisticsService statisticsService;
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String goIndex(Locale locale, Model model) {
		log.debug("HomeController ---- forward ----> index.jsp");
		// welcompage
		return "forward:/index.jsp";
	}
	
	@RequestMapping(value = "/dashBoard", method = RequestMethod.GET)
	public String goDashBoard(Locale locale, Model model) throws Exception {
		log.debug("HomeController ---- forward ----> dashBoard");
		Map<String, Integer> counts = new HashMap<String, Integer>();
		counts.put("todayOrderCnt", orderService.selectTodayOrderCnt());
		counts.put("todayPaidCnt", paymentService.selectTodayPaidCnt());
		counts.put("todayPayReadyCnt", paymentService.selectTodayPayReadyCnt());
		counts.put("todayRegMemberCnt", memberService.selectTodayRegMemberCnt());
		counts.put("totalSaleAmountMonth", paymentService.selectTotalSaleAmountMonth());
		counts.put("monthOrderCnt", orderService.selectMonthOrderCnt());
		counts.put("totalCancelAmountMonth", paymentService.selectTotalCancelAmountMonth());
		counts.put("monthCancelCnt", paymentService.selectMonthCancelCnt());
		Map<String, Object> param = new HashMap<String, Object>();
		List<PeriodStatisticVo> periodMonthList = new ArrayList<PeriodStatisticVo>();
		String now = LocalDate.now().toString().substring(0, 4);
		String startDateStr = now+"-01-01";
		String endDateStr = now+"-12-31";
		String type = "month";
		GregorianCalendar startDate = strToIntDate(startDateStr, type);
		GregorianCalendar endDate = strToIntDate(endDateStr, type);
		int length = (int) ((endDate.getTimeInMillis() - startDate.getTimeInMillis())/1000/(24*60*60)/30);
		param.put("type", "M");	
		for(int i = 0; i < length+1; i++) {
			Calendar cal = endDate;
			cal.add(GregorianCalendar.MONTH, -1);				
			param.put("date", cal.getTime());
			PeriodStatisticVo statistic = new PeriodStatisticVo();
			try {
				statistic = statisticsService.selectPeriodStatistics(param);
			} catch (Exception e) {}
			if(statistic == null) {
				statistic = new PeriodStatisticVo();
				statistic.setPaidAt(cal.getTime());
			}
			periodMonthList.add(statistic);
		}
		Collections.reverse(periodMonthList);
		Calendar cal = Calendar.getInstance();
		String year = LocalDate.now().toString().substring(0,4);
		String month = LocalDate.now().toString().substring(5,7);
		cal.set(Integer.parseInt(year),Integer.parseInt(month),1);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("startDate", year+"-"+month+"-0"+cal.getActualMinimum(Calendar.DAY_OF_MONTH));
		map.put("endDate", year+"-"+month+"-"+cal.getActualMaximum(Calendar.DAY_OF_MONTH));
		List<OrderStatus> orderStatusList = new ArrayList<OrderStatus>();
		for(int i = 1; i <= 7; i++) {
			map.put("code", i);
			OrderStatus orderStatus = orderService.selectDashBoardOrderList(map);
			orderStatusList.add(orderStatus);
		}
		List<Board> boardList = boardService.getBoardTitle();		
		List<OrderDetail> orderList = orderService.selectOrderDetailList();
		List<ProductDetail> productList = productService.selectAllProductList();
		model.addAttribute("counts", counts);
		model.addAttribute("boardList", boardList);
		model.addAttribute("orderList",orderList);
		model.addAttribute("productList",productList);
		model.addAttribute("periodMonthList", periodMonthList);
		model.addAttribute("orderStatusList", orderStatusList);
		
		
		return "forward:/dashBoard.jsp";
	}
	
	private GregorianCalendar strToIntDate(String dateStr, String type){
		int year=0; int month=0; int day = 0;
		if(type.equals("year")) {
			year = Integer.parseInt((dateStr.substring(0, 4)));
			return new GregorianCalendar(year+2, 0, 0);
			
		}else if(type.equals("month")) {
			year = Integer.parseInt((dateStr.substring(0, 4)));
			month = Integer.parseInt((dateStr.substring(5, 7))) - 1;
			
			return new GregorianCalendar(year, month +2, 0);
		}else if(type.equals("date")) {
			year = Integer.parseInt((dateStr.substring(0, 4)));
			month = Integer.parseInt((dateStr.substring(5, 7))) - 1;
			day = Integer.parseInt((dateStr.substring(8, 10)));
			return new GregorianCalendar(year, month, day+1);			
		}
		
		return null;
		
	}
}
