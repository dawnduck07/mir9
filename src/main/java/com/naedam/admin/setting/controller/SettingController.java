package com.naedam.admin.setting.controller;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.util.Arrays;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.naedam.admin.banner.model.vo.Banner;
import com.naedam.admin.category.model.vo.Category;
import com.naedam.admin.common.Mir9Utils;
import com.naedam.admin.coupon.model.vo.Coupon;
import com.naedam.admin.delivery.model.vo.DeliveryCompany;
import com.naedam.admin.delivery.model.vo.DeliveryNotice;
import com.naedam.admin.delivery.model.vo.DeliverySetting;
import com.naedam.admin.delivery.model.vo.Doseosangan;
import com.naedam.admin.history.model.vo.History;
import com.naedam.admin.map.model.service.MapService;
import com.naedam.admin.map.model.vo.MapApi;
import com.naedam.admin.map.model.vo.Maps;
import com.naedam.admin.point.model.vo.Point;
import com.naedam.admin.point.model.vo.PointSave;
import com.naedam.admin.point.model.vo.PointUse;
import com.naedam.admin.popup.model.vo.Popup;
import com.naedam.admin.setting.model.service.SettingService;
import com.naedam.admin.setting.model.vo.AdminMenu;
import com.naedam.admin.setting.model.vo.AdminSetting;
import com.naedam.admin.setting.model.vo.Locale;
import com.naedam.admin.setting.model.vo.SeoSetting;
import com.naedam.admin.setting.model.vo.SnsSetting;
import com.naedam.admin.setting.model.vo.Staff;
import com.naedam.admin.setting.model.vo.PGs.BillingPgSetting;
import com.naedam.admin.setting.model.vo.PGs.EximbaySetting;
import com.naedam.admin.setting.model.vo.PGs.KcpSetting;
import com.naedam.admin.setting.model.vo.PGs.KgIniSetting;
import com.naedam.admin.setting.model.vo.PGs.NaverShoppingSetting;
import com.naedam.admin.setting.model.vo.PGs.NaverpaySetting;
import com.naedam.admin.setting.model.vo.PGs.XpaySetting;

import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/admin/setting")
@Slf4j
public class SettingController {
	@Autowired
	private SettingService settingService;
	@Autowired
	private MapService mapService;
	// (??????-????????????) : ???????????? ?????????
	@Autowired
	ServletContext application;

	/*
	 * ????????? ????????? ???????????? ?????? ?????????
	 */
	@GetMapping("/point")
	public void point(Model model) {
		Map<String, Object> resultMap = settingService.selectPoint();
		model.addAttribute("point", resultMap.get("point"));
		model.addAttribute("pointUse", resultMap.get("pointUse"));
		model.addAttribute("pointSave", resultMap.get("pointSave"));
	}

	/*
	 * ??????????????? ???????????? ?????? ?????????
	 */
	@GetMapping("/coupon")
	public void coupon(Model model, HttpServletRequest request) throws Exception {
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("mode", "1");
		Map<String, Object> resultMap = settingService.selectCouponListByParam(param, request);
		model.addAttribute("couponList", resultMap.get("couponList"));
	}

	/*
	 * ??????????????? ????????? ?????? Post????????? ?????????
	 */
	@PostMapping("/coupon")
	@SuppressWarnings("rawtypes")
	public void coupon(HttpServletRequest request, Model model) {
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("mode", "2");
		Map<String, Object> resultMap = settingService.selectCouponListByParam(param, request);
		model.addAttribute("couponList", resultMap.get("couponList"));
		model.addAttribute("param",resultMap.get("param"));
	}

	/*
	 * ??????????????? ???????????? ?????? ?????????
	 */
	@GetMapping("/popup")
	public void popup(Model model) {
		Map<String, Object> param = new HashMap<String, Object>();
		List<Popup> popupList = settingService.selectPopupListByParam(param);
		model.addAttribute("popupList", popupList);
	}

	/*
	 * ??????????????? ????????? ?????? Post????????? ?????????
	 */
	@PostMapping("/popup")
	public String popup(HttpServletRequest request, Model model) {
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("start_date", request.getParameter("start_date"));
		param.put("end_date", request.getParameter("end_date"));
		param.put("field", request.getParameter("field"));
		param.put("keyword", request.getParameter("keyword"));
		List<Popup> popupList = settingService.selectPopupListByParam(param);
		model.addAttribute("param", param);
		model.addAttribute("popupList", popupList);
		return "/admin/setting/popup";
	}

	/*
	 * ???????????? ???????????? ?????? ?????????
	 * api????????? ???????????? ??????????????? ?????? apikey
	 */	
	@GetMapping("/map")
	public void map(Model model) {
		List<Maps> mapList = settingService.selectMapList();
		List<MapApi> apiList = mapService.selectAllMapApiList();
		model.addAttribute("mapList", mapList);
		model.addAttribute("apiList", apiList);
		model.addAttribute("apiKey", "D914287C-19AA-31AD-B187-1532CEF93E7F");
	}

	
	/*
	 * ???????????? ???????????? ?????? ????????? 
	 */
	@GetMapping("/history")
	public void history(Model model) {
		List<History> historyList = settingService.selectHistoryList();
		model.addAttribute("historyList", historyList);
	}

	/*
	 * ???????????? ???????????? ?????? ?????????
	 */
	@GetMapping("/banner")
	public void banner(Model model) {
		List<Banner> bannerList = settingService.selectBannerList();
		List<Category> menuCteList = settingService.selectMenuCteList();
		model.addAttribute("bannerList", bannerList);
		model.addAttribute("menuCteList", menuCteList);
	}

	@GetMapping("/contract")
	public void contract() {
	}

	/*
	 * ???????????? ???????????? ?????? ?????????
	 */
	@GetMapping("/delivery_setting")
	public String deliverySertting(Model model) {
		DeliverySetting deliverySetting = settingService.selectOneDeliverySetting();
		List<Doseosangan> doseosanganList = settingService.selectDoseosanganList();
		model.addAttribute("deliverySetting", deliverySetting);
		model.addAttribute("doseosanganList", doseosanganList);
		return "admin/setting/deliverySetting";
	}

	/*
	 * ??????????????? ???????????? ?????? ?????????
	 */
	@GetMapping("/delivery_company")
	public String deliveryCompany(Model model) {
		List<DeliveryCompany> deliveryCompanyList = settingService.selectDeliveryCompanyList();
		model.addAttribute("deliveryCompanyList", deliveryCompanyList);
		model.addAttribute("companyListCnt", deliveryCompanyList.size());
		return "admin/setting/deliveryCompany";
	}

	/*
	 * ???????????????, ????????????, ????????? ?????? ????????? ?????? ?????????
	 */
	@GetMapping("/info")
	public void info(Model model) {
		List<AdminMenu> adminMenuList = settingService.selectAdminMenuList();
		List<Locale> localeList = settingService.selectLocaleList();
		AdminSetting adminSetting = settingService.selectAdminSetting();
		model.addAttribute("adminSetting", adminSetting);
		model.addAttribute("adminMenuList", adminMenuList);
		model.addAttribute("localeList", localeList);
	}

	@GetMapping("/img_view")
	public void img_view(String type, Model model) {
		AdminSetting adminSetting = settingService.selectAdminSetting();
		String url = null;
		if (type.equals("thumb")) {
			url = adminSetting.getThumbnailImg();
		} else if (type.equals("favicon")) {
			url = adminSetting.getFaviconImg();
		}
		model.addAttribute("url", url);
	}

	@PostMapping("/getDeliveryNotice.do")
	@ResponseBody
	public DeliveryNotice getDeliveryNotice(String locale) {
		DeliveryNotice deliveryNotice = settingService.selectOneDeliveryNotice(locale);

		return deliveryNotice;
	}

	@PostMapping("/process.do")
	public String process(HttpServletRequest request, AdminSetting adminSetting, DeliveryNotice deliveryNotice,
			AdminMenu adminMenu) {
		Map<String, Object> map = new HashMap<>();
		map.put("mode", request.getParameter("mode"));
		map.put("request", request);
		map.put("adminSetting", adminSetting);
		map.put("deliveryNotice", deliveryNotice);
		int result = settingService.infoProcess(map);
		return "redirect:/admin/setting/info";
	}

	@GetMapping("/seo")
	public void seo(Model model) throws Exception {
		SeoSetting seo = settingService.selectSeoSetting();
		model.addAttribute("seo", seo);
	}

	/*
	 * seo?????? ???????????? ?????? ?????????
	 */
	@PostMapping("/seo_process")
	public String seo_process(HttpServletRequest request, 
			@ModelAttribute SeoSetting seo,
			@RequestParam("webmaster_naver") MultipartFile naverFileName,
			@RequestParam("webmaster_google") MultipartFile googleFileName,
			@RequestParam("webmaster_bing") MultipartFile bingFileName) throws Exception {
		Map<String, Object> map = new HashMap<>();
		map.put("seo", seo);
		map.put("naverFileName", naverFileName);
		map.put("googleFileName", googleFileName);
		map.put("bingFileName", bingFileName);
		map.put("request", request);
		settingService.seoProcess(map);
		return "redirect:/admin/setting/seo";
	}

	/*
	 * ??????PG????????? ??????????????? ????????? ?????? ?????????
	 */
	@GetMapping("/paymentpg")
	public void paymentpg(Model model) {
		BillingPgSetting pg = settingService.selectPgSetting();
		NaverShoppingSetting naverShopping = settingService.selectNaverShoppingSetting();
		model.addAttribute("pg", pg);
		model.addAttribute("naverShopping", naverShopping);
	}

	/*
	 * ??????PG????????? ???????????? ?????? ?????????
	 */
	@PostMapping("/pg_process")
	@ResponseBody
	public Object pg_process(String method, HttpServletRequest request) throws Exception {
		Map<String, Object> map = new HashMap<>();
		map.put("request", request);
		map.put("method", method);
		map.put("type", request.getParameter("type"));
		return settingService.paymentPGSelectProcess(map);
	}

	/*
	 * ??????PG????????? ?????? ???????????? ???????????? ?????? ???
	 */
	@PostMapping("/updatePaymentPG")
	public String updatePaymentPG(HttpServletRequest request, BillingPgSetting pg, KgIniSetting kg, XpaySetting xpay,
			KcpSetting kcp, NaverpaySetting naverpay, EximbaySetting eximbay, NaverShoppingSetting naverShopping) throws Exception {
		Map<String,Object> map = new HashMap<>();
		map.put("pg", pg);
		map.put("kg", kg);
		map.put("xpay", xpay);
		map.put("kcp", kcp);
		map.put("naverpay", naverpay);
		map.put("naverShopping", naverShopping);
		map.put("eximbay", eximbay);
		settingService.paymentPGProcess(map);
		return "admin/setting/paymentpg";
	}

	/*
	 * SNS??????????????? ???????????? ?????? ?????????
	 */
	@GetMapping("/snslogin")
	public String snsLogin(Model model, SnsSetting snsSetting) {
		snsSetting = settingService.selectSnsSetting();
		model.addAttribute("snsSetting", snsSetting);
		return "admin/setting/sns";
	}

	/*
	 * SNS??????????????? ???????????? ???????????? ?????? ?????????
	 */
	@PostMapping("/updateSnsSetting")
	public String updateSnsSetting(SnsSetting snsSetting) {
		settingService.updateSnsSetting(snsSetting);
		return "redirect:/admin/setting/snslogin";
	}

	@GetMapping("/locale")
	public void locale() {
	}

	@GetMapping("/version")
	public void version() {
	}

	@GetMapping("/test")
	public void test() {
	}

	// ?????? ????????? 
	@GetMapping("/staff.do")
	public void staffList(@RequestParam(defaultValue = "1") int cPage, Model model) {
		Map<String, Object> resultMap = settingService.selectStaffList();
		model.addAttribute("resultStaffList",resultMap.get("resultStaffList"));
		model.addAttribute("totalStaffListCount",resultMap.get("totalStaffListCount"));
	}
	
	// ?????? ??????/??????
	@PostMapping("/staff_process.do")
	public String staffProcess(@RequestParam(value="staffNo", required = false) int[] staffNo, Staff staff, RedirectAttributes redirectAttribute, HttpServletRequest request) {
		Map<String, Object> map = new HashMap<>();
		map.put("staff", staff);
		map.put("mode", request.getParameter("mode"));
		map.put("staffNo", staffNo);
		Map<String, Object> resultMap = settingService.staffProcess(map);
		redirectAttribute.addFlashAttribute("msg", (String)resultMap.get("msg"));
		return "redirect:/admin/setting/staff.do";
	}

	// ?????? ?????? ????????? ??????
	@ResponseBody
	@GetMapping("/staffTypeSearch.do")
	public Map<String, Object> staffTypeSearch(@RequestParam String type, @RequestParam String keyword, HttpServletRequest request) {
		Map<String, Object> param = new HashMap<>();
		param.put("type", type);
		param.put("keyword", keyword);
		Map<String, Object> resultMap = new HashMap<>();
		resultMap.put("searchStaffList", settingService.selectSearchStaffList(param));
		resultMap.put("searchStaffCount", settingService.selectsearchStaffListCount(param));
		return resultMap;
	}

	// ???????????? ????????????
	@ResponseBody
	@GetMapping("/staffDetail.do/{staffNo}")
	public Map<String, Object> staffDetail(@PathVariable int staffNo, Model model, HttpServletRequest request, HttpServletResponse response) {
		Map<String, Object> resultMap = new HashMap<>();
		Staff staff = settingService.selectOneStaffByStaffNo(staffNo);
		resultMap.put("staff", staff);
		return resultMap;
	}

	// ?????? ?????? - ?????? ?????????
	@GetMapping("/imgView")
	public String imgView(@RequestParam(defaultValue = "0") int staffNo, Model model) throws Exception {
		Map<String, Object> resultMap = settingService.selectOneimgUrlBystaffNo(staffNo);
		model.addAttribute("url", resultMap.get("url"));
		return "/admin/setting/imgView";
	}

	// ?????? ?????? - ????????? ??????
	@PostMapping("/deleteImg.do/{staffNo}")
	public String deleteImg(@PathVariable int staffNo, RedirectAttributes redirectAttribute, HttpServletRequest request) throws Exception {
		settingService.deleteStaffImg(staffNo);
		String referer = request.getHeader("Referer");
		return "redirect:" + referer;
	}

	// ????????? ?????? ??????
	@SuppressWarnings("unchecked")
	@ResponseBody
	@PostMapping("/changeOrder.do")
	public Map<String, Object> changeOrder(@RequestBody String data, RedirectAttributes redirectAttribute) {
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> resultMap = new HashMap<>();
		
		try {
			Map<String, String> map = mapper.readValue(data, Map.class);
			String direction = map.get("direction");
			
			Staff paramStaff = new Staff();
			paramStaff.setStaffNo(Integer.parseInt(map.get("staffNo")));
			// ajax??? ???????????? ????????? ??? radio ????????? ?????? ??????
			resultMap.put("staffNo", map.get("staffNo"));
		
			// ?????? row_order
			Staff resultInputRowOrder = settingService.selectInputRowOrder(paramStaff);
			int input_row_order = resultInputRowOrder.getRowOrder();
			paramStaff.setRowOrder(input_row_order);
			
			if (direction.equals("up")) {
				// row_order ????????? ??????
				Staff resultMaxOrder = settingService.selectMaxOrder();
				int max_order = resultMaxOrder.getRowOrder();
				
				// ?????? ????????? ?????? ????????? row_order + 1
				int resultChangeOrderUp = settingService.updateChangeOrderUp(paramStaff);
				int changed_row_order = paramStaff.getRowOrder();
				
				/*
				 *  ????????? row_order + 1 ?????? ?????? row_order ??????????????? ????????? ????????? row_order - 1 ??????
				 *  ????????? row_order + 1 ?????? ??????????????? ?????? ?????? ?????? ????????? ?????????
				 */
				log.debug("paramStaff = {}", paramStaff);
				if(max_order > input_row_order && max_order >= changed_row_order) {
					// ?????? ????????? ?????? ?????? ????????? ????????? row_order - 1
					int resultChangeOrderUpNext = settingService.updateChangeOrderUpNext(paramStaff);
					resultMap.put("changeOrderUpBan", "success");
				} else {
					resultMap.put("changeOrderUpBan", "ban");
				}

			} else if (direction.equals("down")) {
				// row_order ????????? ??????
				Staff resultMinOrder = settingService.selectMinOrder();
				int min_order = resultMinOrder.getRowOrder();
				
				// ?????? ????????? ????????? ????????? row_order - 1
				int resultChangeOrderDown = settingService.updateChangeOrderDown(paramStaff);
				int changed_row_order = paramStaff.getRowOrder();
				
				if(min_order < input_row_order && changed_row_order >= min_order ) {
					// ?????? ????????? ????????? ?????? ????????? ????????? row_order + 1
					int resultChangeOrderDownNext = settingService.updateChangeOrderDownNext(paramStaff);
					resultMap.put("changeOrderDownBan", "success");
				} else {
					resultMap.put("changeOrderDownBan", "ban");
				}
			}

		} catch (Exception e) {
		}

		// ?????? ????????? ?????????
		Map<String, Object> map = settingService.selectStaffList();
		resultMap.put("staffList", map.get("resultStaffList"));

		return resultMap;
	}

}
