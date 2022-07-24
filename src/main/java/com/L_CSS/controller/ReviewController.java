package com.L_CSS.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.L_CSS.service.ReviewService;

@Controller
public class ReviewController {
	
	@Autowired
	ReviewService rsv;
	@RequestMapping (value="/reViewUpLoad")
	public ModelAndView reViewUpLoad() {
		System.out.println("리뷰정보 ");
		ModelAndView mav = new ModelAndView();
		
		mav = rsv.reViewUpLoad();
		
		return mav;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
}
