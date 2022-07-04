package com.L_CSS.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.L_CSS.service.MessengerService;

@Controller
public class MessengerController {
	
	@Autowired
	MessengerService msv;
	
	@RequestMapping (value="/messengerUpLoad")
	public ModelAndView messengerUpLoad() {
		System.out.println("리뷰정보 ");
		ModelAndView mav = new ModelAndView();
		
		mav = msv.messengerUpLoad();
		
		return mav;
	}
}
