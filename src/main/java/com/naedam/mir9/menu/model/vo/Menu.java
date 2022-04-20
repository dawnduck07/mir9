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
public class Menu implements Serializable {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private int menuNo;
	private String menuName;
	private String menuLink;
	private String menuTarget;
	private String menuUrl;
	private String menuState;
	private String menuHeader;
	private String menuMeta;
	private String menuDate;
	private String menuCotent;
	
	
	
	
	
	
	
}
