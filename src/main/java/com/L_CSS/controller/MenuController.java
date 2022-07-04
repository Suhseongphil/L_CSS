package com.L_CSS.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.L_CSS.service.MenuService;

@Controller
public class MenuController {
	
	@Autowired
	MenuService msv;
	
	@RequestMapping (value="/menuUpLoad")
	public ModelAndView menuUpLoad() {
		System.out.println("메뉴 업로드 ");
		ModelAndView mav = new ModelAndView();
		
		mav = msv.menuUpLoad();
		
		
		return mav;
	}
}
