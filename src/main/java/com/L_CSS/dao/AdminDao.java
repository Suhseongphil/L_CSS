package com.L_CSS.dao;

import com.L_CSS.dto.CompanyDto;

public interface AdminDao {

	String getMaxCmcode();

	void insertCompany(CompanyDto company);

}
