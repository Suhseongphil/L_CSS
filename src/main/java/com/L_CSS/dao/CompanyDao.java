package com.L_CSS.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import com.L_CSS.dto.CompanyDto;
import com.L_CSS.dto.ReviewProductDto;

public interface CompanyDao {

	String getmax();

	ArrayList<CompanyDto> selectCompanyList(@Param("start")int startRow,@Param("end")int endRow);

	int TotalCount();

	CompanyDto ComInfo(String cmcode);

	int insertMyCompany(CompanyDto company);

	CompanyDto MycompanyInfo(String loginId);

	String getcompanyImg(String cmmid);

	int updateMycompany(CompanyDto company);
	
	CompanyDto companyInfo(String pdcode);

	String getLoginId(String loginId);

	int getintId(String loginId);

	ArrayList<ReviewProductDto> reviewList();

	int getmaxnum();
	

}
