package com.naedam.mir9.map.model.vo;

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
public class Maps implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private int mapNo;
	private String mapTitle;
	private int mapApiNo;
	private String mapApiName;
	private String apiKey;
	private long latitude;
	private long longitude;
	private int sizePer;
	private int sizePx;
	private int zoomLevel;
	private String popupInfo;
	private String connectingAddr;
	private Date regDate;

}
