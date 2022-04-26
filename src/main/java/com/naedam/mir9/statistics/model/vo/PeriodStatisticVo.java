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
public class PeriodStatisticVo implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private Date paidAt;
	private double amount;
	private double cancelAmont;
	private int salePrice;
	private int basicDeliveryFee;
	private int FreeShippingSettings;
	private String ExtraDeliFeeYn;
	private int couponNo;
	private String couponName;
	private String provideType;
	private String bebefitType;
	private String discountType;
	private int discount;
	private int useLimit;
	private int useMax;
	private int point;
	private double totalAmount;
	private double totalCancelAmount;
}
