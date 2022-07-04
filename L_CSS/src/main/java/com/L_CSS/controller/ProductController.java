package com.L_CSS.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.L_CSS.service.ProductService;

@Controller
public class ProductController {
	
	@Autowired
	ProductService psv;
	
	@RequestMapping (value="/productUpLoad")
	public ModelAndView productUpLoad() {
		System.out.println("업체 상품 정보 업로드");
		ModelAndView mav = new ModelAndView();
		
		mav = psv.productUpLoad();
		
		return mav;
	}
}
