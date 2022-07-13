package com.L_CSS.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import com.L_CSS.dto.CompanyDto;

public interface CompanyDao {

	String getmax();

	ArrayList<CompanyDto> selectCompanyList(@Param("start")int startRow,@Param("end")int endRow);

	int TotalCount();

}
