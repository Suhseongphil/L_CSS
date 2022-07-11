package com.L_CSS.dao;

import java.util.ArrayList;

import com.L_CSS.dto.CafeDto;

public interface CafeDao {
	
	
	String getmax();

	ArrayList<CafeDto> selectCafeList();

}
