package com.L_CSS.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import com.L_CSS.dto.CompanyDto;

public interface AdminDao {

	String getMaxCmcode();

	void insertCompany(CompanyDto company);

	ArrayList<CompanyDto> getCompany();

	void cmstateModify(@Param("cmcode")String cmcode, @Param("cmstate")int cmstate);

	void companyDelete(String cmcode);

}
