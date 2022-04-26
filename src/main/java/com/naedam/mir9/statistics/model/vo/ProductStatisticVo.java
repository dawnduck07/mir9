package com.naedam.mir9.statistics.model.vo;

import java.io.Serializable;
import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class ProductStatisticVo implements Serializable {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private Date paidAt;
	private double amount;
	private String modelName;
	private String productName;
	private String regStartdate;
	private String regEnddate;
	private int orderStatusNo;
	private String status;
	private String statusName;
	private int categoryNo;
	private String categoryName;
	private int parentNo;
	private int paymentCount;
	private int returnCount;
	private double paymentSum;
	private int productRank;
}	
