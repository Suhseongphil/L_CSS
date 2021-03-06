package com.L_CSS.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import com.L_CSS.dto.InquIreDto;

public interface InquIreDao {

	String getmax();

	int insertInquire(InquIreDto in);

	ArrayList<InquIreDto> selectInquire(String loginId);

	ArrayList<InquIreDto> searchList(@Param("search")String iqcategory, @Param("text")String searchText);

	ArrayList<InquIreDto> inquireInfo(String iqcode);

}
