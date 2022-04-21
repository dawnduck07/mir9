package com.naedam.mir9.menu.model.vo;

import java.io.Serializable;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class Meta implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private int metaNo;
	private String meta_title;
	private String meta_description;
	
	
}
