package com.L_CSS.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import com.L_CSS.dto.AnswerDto;
import com.L_CSS.dto.InquIreDto;

public interface InquIreDao {

	String getmax();

	void insertInquire(InquIreDto in);

	ArrayList<InquIreDto> selectInquire(String loginId);

	ArrayList<InquIreDto> searchList(@Param("search")String iqcategory, @Param("text")String searchText);

	InquIreDto inquireInfo(String iqcode);

	ArrayList<InquIreDto> selectInquireList();

	InquIreDto AdminInquireInfo(String iqcode);

	AnswerDto AnswerList(String iqcode);

	void deleteInquire(String iqcode);

	InquIreDto delIqInfo(String iqcode);

}
