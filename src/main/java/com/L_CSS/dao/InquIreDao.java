package com.L_CSS.dao;

import java.util.ArrayList;

import com.L_CSS.dto.InquIreDto;

public interface InquIreDao {

	String getmax();

	int insertInquire(InquIreDto in);

	ArrayList<InquIreDto> selectInquire(String loginId);

}
