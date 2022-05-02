package com.naedam.mir9.community.model.vo;

import java.io.Serializable;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class SmsSetting implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;	
	
	private int smsStCode; 
	private String smsTemplateId;
	private String smsTemplateName;
	private String isSend; 
	private String isSendAdmin;

}
