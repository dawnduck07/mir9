package com.naedam.mir9.setting.model.vo;

import java.io.Serializable;
import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Staff implements Serializable {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private int staffNo;
	private String staffName;
	private String staffPosition;
	private String staffCareer;
	private String staffProfile;
	private Attachment attachment;
}
