package com.naedam.form.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.naedam.mir9.model.dao.FormDao;

@Service
public class FormServiceImpl implements FormService {
	@Autowired
	private FormDao formDao;
}
