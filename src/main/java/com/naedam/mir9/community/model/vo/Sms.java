package com.naedam.mir9.community.model.vo;

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
public class Sms implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;	
	
	private int smsCode;
	private int memberNo;
	private int smsStCode;
	private int orderNo;
	private int receiveCode;
	private int smsPoint;
	private Date receiveDate;

}
