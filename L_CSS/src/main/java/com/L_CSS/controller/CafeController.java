package com.L_CSS.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.L_CSS.service.CafeService;

@Controller
public class CafeController {
	
	@Autowired
	CafeService csv;
	
	//카페 업로드 요청
	@RequestMapping (value="/CafeUpLoad")
	public ModelAndView  CafeUpLoad() {
		System.out.println("카페 업로드 ");
		ModelAndView mav = new ModelAndView();
		
		mav = csv.CafeUpLoad();
		return mav;
	}
	
}
