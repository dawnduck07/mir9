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
public class ReviewImg implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private int reviewImgNo;
	private int reviewNo;
	// private int reviewImgLevel;
	private String originName;
	private String changeName;
	private String reviewImgUrl;
	
}
