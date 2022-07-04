package com.L_CSS.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.L_CSS.service.CompanyService;

@Controller
public class CompanyController {
	
	@Autowired
	CompanyService csv;
	
	@RequestMapping (value="/comPanyUpLoad")
	public ModelAndView comPanyUpLoad() {
		System.out.println("업체 업로드 ");
		ModelAndView mav = new ModelAndView();
		
		mav = csv.comPanyUpLoad();
		
		
		return mav;
	}
	
}
