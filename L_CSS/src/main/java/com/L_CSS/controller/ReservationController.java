package com.L_CSS.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.L_CSS.service.ReservationService;

@Controller
public class ReservationController {
	
	@Autowired
	ReservationService rsv;
	@RequestMapping (value="/reservationUpLoad")
	public ModelAndView reservationUpLoad() {
		System.out.println("주문정보 ");
		ModelAndView mav = new ModelAndView();
		
		mav = rsv.reservationUpLoad();
		
		return mav;
	}
}
