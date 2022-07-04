package com.L_CSS.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.L_CSS.service.InquIreService;

@Controller
public class InquIreController {
	
	@Autowired
	InquIreService isv;
	
	@RequestMapping (value="/InquIreUpLoad")
	public ModelAndView InquIreUpLoad() {
		System.out.println("리뷰정보 ");
		ModelAndView mav = new ModelAndView();
		
		mav = isv.InquIreUpLoad();
		
		return mav;
	}
}
