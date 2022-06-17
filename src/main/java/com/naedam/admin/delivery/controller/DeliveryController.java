package com.naedam.admin.delivery.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.naedam.admin.common.Mir9Utils;
import com.naedam.admin.delivery.model.service.DeliveryService;
import com.naedam.admin.delivery.model.vo.DeliveryCompany;

import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/admin/delivery")
@Slf4j
public class DeliveryController {
	@Autowired
	private DeliveryService deliveryService;
	
	/**
	 * @param zipcode
	 * @return
	 */
	@GetMapping("/doseosangan")
	@ResponseBody
	public int doseosangan(int zipcode) {
		int result = deliveryService.selectDoseosanganFeeByZipcode(zipcode);
		return result;
	}
	
	/**
	 * 공통 : 배송업체 등록, 수정, 삭제
	 * @param deliveryCompany
	 * @param deliComNoArr
	 * @return deliveryCompany.jsp
	 */
	@ResponseBody
	@PostMapping("/deliveryCompanyProcess")
	public int deliveryCompanyProcess(@ModelAttribute DeliveryCompany deliveryCompany,
									  @RequestParam(value="checkedNo[]", required = false) List<Integer> deliComNoArr){
		Map<String, Object> map = new HashMap<>();
		map.put("deliveryCompany", deliveryCompany);
		map.put("deliComNoArr", deliComNoArr);
		int result = deliveryService.deliveryCompanyProcess(map);
		return result;
	}
	
	/**
	 * 배송업체 상세 조회
	 * @param comNo
	 * @return deliveryCompany.jsp
	 */
	@PostMapping("/companyDetail")
	@ResponseBody
	public DeliveryCompany companyDetail(String comNo) {
		log.debug("comNo = {}",comNo);
		DeliveryCompany deliCom = deliveryService.selectOneDeliveryCompanyByComNo(comNo);
		return deliCom;
	}
	
	/**
	 * 배송업체 검색
	 * @param jsonStr
	 * @return deliveryCompany.jsp
	 */
	@ResponseBody
	@GetMapping("/companySearch")
	public List<DeliveryCompany> companySearch(String jsonStr) {
		Map<String, Object> param = Mir9Utils.parseJsonStr(jsonStr);
		List<DeliveryCompany> companyList = deliveryService.selectDeliveryCompanyListByParam(param);
		return companyList;
	}
	
	/**
	 * 도서산간 배송비 수정
	 * @param jsonStr
	 * @return deliverySetting.jsp
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	@ResponseBody 
	@GetMapping("/updateDeliSet_Doseo")
	public int updateDeliSetDoseo(String jsonStr) throws Exception {
		Map<String, Object> param = Mir9Utils.parseJsonStr(jsonStr);
		int result = deliveryService.updateDeliverySettingByVo(param);
		return result;
	}
	
}
