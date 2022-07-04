package com.L_CSS.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.L_CSS.service.CartService;

@Controller
public class CartController {
	
	@Autowired
	CartService csv;
	
	@RequestMapping (value="/cartUpLoad")
	public ModelAndView cartUpLoad() {
		System.out.println("장바구니 상품 정보 업로드");
		ModelAndView mav = new ModelAndView();
		
		mav = csv.cartUpLoad();
		
		return mav;
	}
}
