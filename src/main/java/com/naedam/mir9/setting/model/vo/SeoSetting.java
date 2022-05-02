package com.naedam.mir9.setting.model.vo;

import java.io.Serializable;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class SeoSetting implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private String naverFileUrl;
	private String googleFileUrl;
	private String bingFileUrl;
	private String siteMapUrl;
	private String naverFileName;
	private String googleFileName;
	private String bingFileName;
	private String siteMapFileName;
	
	private String robots;
	private String richSnippet;
	
}