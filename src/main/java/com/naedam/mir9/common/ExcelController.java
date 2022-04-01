package com.naedam.mir9.common;

import java.io.IOException;
import java.lang.reflect.Field;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.naedam.mir9.order.model.service.OrderService;
import com.naedam.mir9.order.model.vo.OrderExcelForm;

import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/excel")
@Slf4j
public class ExcelController {
	
	@Autowired
	private OrderService orderService;
	
	private static final int WIDTH = 2800;
	
    private final String[] orderHeader = {"순번", "주문번호", "상품명", "주문자", "연락처", "결제금액", "결제방법", "입금은행명", "예금주명", "수취인 성명", "수취인 연락처", "배송지 주소", "고객요청 사항", "상태"};

	
	
	
	@PostMapping("/download.do")
	public void excelDownload(HttpServletResponse response, HttpServletRequest request) throws IOException {
		String type = request.getParameter("download_type");
		
		List<String> excelHeader = null;
		List<Object> excelContentList = new ArrayList<Object>(); 
		Workbook wb = new XSSFWorkbook();
		Sheet sheet = null;
		String fileName = "";
		
		// type에 따른 엑셀 헤더 세팅, dao 연결 세팅 ~> 밑에서 자동으로 씀
		if(type.equals("order")) {
			excelHeader = Arrays.asList(orderHeader);
			sheet = wb.createSheet("order_list");
			fileName += "order_list_" + dateCode();
			List<OrderExcelForm> orderExcelFormList = orderService.selectOrderExcelForm();
			for(OrderExcelForm o : orderExcelFormList) {
				excelContentList.add(o);
			}
			
		}

		Row row = null;
		Cell cell = null;
		int rowNum = 0;
		

		
		// header
		row = sheet.createRow(rowNum++);
		for(int i = 0; i < excelHeader.size(); i++) {
			sheet.setHorizontallyCenter(true);
			cell = row.createCell(i);
			cell.setCellValue(excelHeader.get(i));
		}

		

		
		// body
		for(Object vo : excelContentList) {
			int cnt = 0;
			row = sheet.createRow(rowNum++);
		    try{
		        Object obj = vo;
		        for (Field field : obj.getClass().getDeclaredFields()){
		            field.setAccessible(true);
		            Object value = field.get(obj);

		            if(!field.getName().equals("serialVersionUID")) {
		            	// 셀 너비 자동 조절
		    			sheet.autoSizeColumn(cnt);
		    		    sheet.setColumnWidth(cnt, (sheet.getColumnWidth(cnt))+(short)1024);
			            // 데이터 작성
		    		    cell = row.createCell(cnt);
			            cell.setCellValue(String.valueOf(value));
			            cnt++;
		            }
		        }
		    }catch (Exception e){
		    	e.printStackTrace();
		    }
		}

		
		// 컨텐츠 타입과 파일명 지정
		response.setContentType("ms-vnd/excel");
		fileName += ".xlsx";
		response.setHeader("content-Disposition", "attachment;filename=" + fileName);
		
		// Excel file output
		wb.write(response.getOutputStream());
		wb.close();
		
	}
	
	private String dateCode() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyMMdd");
		Date now = new Date();
		
		return sdf.format(now);
	}
}
