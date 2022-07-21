package com.L_CSS.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.L_CSS.service.GroupBuyService;

@Controller
public class GroupBuyController {
	
	@Autowired
	GroupBuyService gbsvc;
	@RequestMapping (value="/groupBuyBoard")
	public ModelAndView groupBuyBoard() {
		System.out.println("공동구매");
		ModelAndView mav = new ModelAndView();
		
		mav = gbsvc.getGroupBuyInfo();
		
		return mav;
	}
}
