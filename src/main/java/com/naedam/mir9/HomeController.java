package com.naedam.mir9;

import java.util.HashMap;
import java.util.Locale;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.naedam.mir9.member.model.service.MemberService;
import com.naedam.mir9.order.model.service.OrderService;
import com.naedam.mir9.payment.model.service.PaymentService;

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
	public String goDashBoard(Locale locale, Model model) {
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
		
		
		
		model.addAttribute("counts", counts);

		
		return "forward:/dashBoard.jsp";
	}
	
	
}
