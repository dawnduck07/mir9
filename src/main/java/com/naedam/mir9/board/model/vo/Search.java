package com.naedam.mir9.board.model.vo;

import lombok.Data;

@Data
public class Search {
	
	///Field
	private int currentPage;
	private String searchCondition;
	private String searchKeyword;
	private String searchType;
	private String start_date;
	private String end_date;
	private int categoryCode;
	private int pageSize;
	private int searchBoardNo;
	
	
	public int getEndRowNum() {
		return getCurrentPage()*getPageSize();
	}
	public int getStartRowNum() {
		return (getCurrentPage()-1)*getPageSize()+1;
	}

}


