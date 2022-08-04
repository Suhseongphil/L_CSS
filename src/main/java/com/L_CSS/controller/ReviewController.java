package com.L_CSS.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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
	
	//리뷰작성 요청
	@RequestMapping (value="/reViewInsert")
	public String reViewInsert(String pdcode,String recomment,RedirectAttributes ra,String recode ) {
		System.out.println("리뷰작성요청");
		System.out.println(pdcode);
		System.out.println(recomment);
		System.out.println(recode);
		String ReViewInsert = rsv.insertReview(pdcode,recomment,ra,recode);
		
		return ReViewInsert;
	}
	
	
	
	
	
	
	
	
	
	
	
}
