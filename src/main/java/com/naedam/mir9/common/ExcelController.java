package com.naedam.mir9.common;

import java.io.IOException;
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

import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/excel")
@Slf4j
public class ExcelController {
	
	@Autowired
	private OrderService orderService;
	
	private static final int WIDTH = 2800;
	
	@PostMapping("/download.do")
	public void excelDownload(HttpServletResponse response, HttpServletRequest request) throws IOException {
		String type = request.getParameter("download_type");
		List<String> headerList = null;
		if(type.equals("order")) {
			//headerList = 
		}
		
		Workbook wb = new XSSFWorkbook();
		
		Sheet sheet = wb.createSheet("첫번째 시트");
		Row row = null;
		Cell cell = null;
		int rowNum = 0;
		
		
		// header
		row = sheet.createRow(rowNum++);
		cell = row.createCell(0);
		cell.setCellValue("번호");
		
		cell = row.createCell(1);
		cell.setCellValue("이름");
		
		cell = row.createCell(2);
		cell.setCellValue("제목");
		
		// body
		for(int i = 0; i < 3; i++) {
			row = sheet.createRow(rowNum++);
			cell = row.createCell(0);
			cell.setCellValue(i);
			
			cell = row.createCell(1);
			cell.setCellValue(i+"_name");
			
			cell = row.createCell(2);
			cell.setCellValue(i + "_title");
		}
		
		// 컨텐츠 타입과 파일명 지정
		response.setContentType("ms-vnd/excel");
		response.setHeader("content-Disposition", "attachment;filename=AAAexample.xlsx");
		
		// Excel file output
		wb.write(response.getOutputStream());
		wb.close();
		
	}
}
