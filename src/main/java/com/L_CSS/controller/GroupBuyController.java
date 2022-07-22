package com.L_CSS.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.L_CSS.service.GroupBuyService;

@Controller
public class GroupBuyController {
	
	@Autowired
	GroupBuyService gbsvc;
	
	// 공동구매 게시판
	@RequestMapping (value="/groupBuyBoard")
	public ModelAndView groupBuyBoard() {
		System.out.println("공동구매");
		ModelAndView mav = new ModelAndView();
		
		mav = gbsvc.getGroupBuyInfo();
		
		return mav;
	}
	
	// 공동구매 글 작성
	@RequestMapping (value="/gbBoardWrite_form")
	public ModelAndView gbBoardWrite_form() {
		System.out.println("공동구매 글 작성 페이지");
		ModelAndView mav = new ModelAndView();
		mav = gbsvc.getPdType();
		
		return mav;
	}
	
	// 구매할 상품 종류 선택
	@RequestMapping (value="/selectPdtype")
	public @ResponseBody String selectPdtype(String pdtype) {
		System.out.println("상품종류");
		
		String productList= gbsvc.getPdname(pdtype);
		
		return productList;
	}
}
