package com.naedam.mir9.setting.model.dao;

import java.util.List;

import com.naedam.mir9.delivery.model.vo.DeliveryCompany;

public interface SettingDao {

	List<DeliveryCompany> selectDeliveryCompanyList();

}
