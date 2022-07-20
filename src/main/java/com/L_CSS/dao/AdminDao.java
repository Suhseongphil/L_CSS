package com.L_CSS.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import com.L_CSS.dto.CafeDto;
import com.L_CSS.dto.CompanyDto;
import com.L_CSS.dto.MemberDto;

public interface AdminDao {

	// company
	String getMaxCmcode();

	void insertCompany(CompanyDto company);

	ArrayList<CompanyDto> getCompany();
	
	void cmstateModify(@Param("cmcode")String cmcode, @Param("cmstate")int cmstate);

	void companyDelete(String cmcode);
	
	// cafe
	void insertCafe(CafeDto cafe);

	ArrayList<CafeDto> getCafe();

	String getMaxCfcode();

	void updateCompany(CompanyDto company);

	void cfstateModify(@Param("cfcode")String cfcode, @Param("cfstate")int cfstate);

	CafeDto getDelCfimg(String cfcode);

	void deleteCafe(String cfcode);

	void updateCafe(CafeDto cafe);
	
	ArrayList<String> getMucode();

	String getCompanyImg(String cmcode);

	ArrayList<MemberDto> getMemberInfo();
	

}
