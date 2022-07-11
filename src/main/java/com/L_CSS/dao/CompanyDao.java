package com.L_CSS.dao;

import java.util.ArrayList;

import com.L_CSS.dto.CompanyDto;

public interface CompanyDao {

	String getmax();

	ArrayList<CompanyDto> selectCompanyList();

}
