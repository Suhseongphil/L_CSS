package com.L_CSS.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import com.L_CSS.dto.CafeDto;

public interface CafeDao {
	
	
	String getmax();

	ArrayList<CafeDto> selectCafeList(@Param("start")int startRow,@Param("end")int endRow);

	int TotalCount();

	CafeDto CafeInfo(String cfcode);

	int insertMyCafe(CafeDto cafe);

	CafeDto MyCafeInfo(String loginId);

	int updateMycafe(CafeDto cafe);

	String getCafeImg(String cfmid);

	String getCafesigImg(String cfmid);



}
