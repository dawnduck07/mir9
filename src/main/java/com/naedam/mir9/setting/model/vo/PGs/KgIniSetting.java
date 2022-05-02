package com.naedam.mir9.setting.model.vo.PGs;

import java.io.Serializable;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class KgIniSetting implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String useIni;
	private String moduleVersion;
	private String useCredit;
	private String useBank;
	private String useVBank;
	private int pgMode;
	private String storeId;
	private String signKey;
	private String keyFile;

}
