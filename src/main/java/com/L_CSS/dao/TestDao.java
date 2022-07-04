package com.L_CSS.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Insert;

import com.L_CSS.dto.TestDto;

public interface TestDao {

	
	@Insert("INSERT INTO TEST (IMG,NAME,PRICE) VALUES (#{img},#{name},#{price})")
	int insert(TestDto testDto);

	
}
