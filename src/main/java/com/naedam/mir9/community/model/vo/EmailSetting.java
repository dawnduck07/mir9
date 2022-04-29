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
public class EmailSetting implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;	
	
	private int emailStCode; 
	private String emailTemplateId;
	private String emailTemplateName;
	private String isSend; 
	private String isSendAdmin;

}