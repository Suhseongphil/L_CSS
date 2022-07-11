package com.L_CSS.dao;

import java.util.ArrayList;

import org.springframework.web.servlet.ModelAndView;

import com.L_CSS.dto.CartDto;

public interface CartDao {

	String getmax();

	ArrayList<CartDto> selectMyCart(String loginId);


	

}
