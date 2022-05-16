package com.naedam.admin.form.model.vo;

import java.io.Serializable;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class FormPost implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private int code;
	private Form form;
	private String name;
	private String email;
	private String phone;
	private String subject;
	private String message;
	private String orderName;
	private String date;
	private String sysdate;
}
