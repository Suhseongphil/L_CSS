package com.L_CSS.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.L_CSS.service.CompanyService;

@Controller
public class CompanyController {
	
	@Autowired
	CompanyService csv;
	@Autowired
	private HttpSession session;
	@RequestMapping (value="/comPanyUpLoad")
	public ModelAndView comPanyUpLoad() {
		System.out.println("업체 업로드 ");
		ModelAndView mav = new ModelAndView();
		
		mav = csv.comPanyUpLoad();
		
		
		return mav;
	}
	//업체리스트
	@RequestMapping (value="/companyList")
	public ModelAndView companyList(String page) {
		System.out.println("업체 리스트 ");
		ModelAndView mav = new ModelAndView();
		
		mav = csv.companyList(page);
		
		
		return mav;
	}
	//업체상세 정보 호출
	@RequestMapping(value="/compnayInfo")
	public ModelAndView compnayInfo(String cmcode) {
		System.out.println("업체 상세정보 호출");
		System.out.println(cmcode);
		ModelAndView mav = new ModelAndView();
		
		mav = csv.companyInfo(cmcode);
		return mav;
	}
	//주문내역 출력
	@RequestMapping(value="/orderList")
	public ModelAndView orderList() {
		System.out.println("주문 내역 호출");
		ModelAndView mav = new ModelAndView();
		
		mav = csv.orderList();
		return mav;
	}
	//주문 삭제
	@RequestMapping(value="/deleteOrder")
	public ModelAndView deleteOrder(String recode) {
		System.out.println("주문 취소 호출");
		ModelAndView mav = new ModelAndView();
		
		mav = csv.deleteOrder(recode);
		return mav;
	}
	
	
	
	
	
	
	
	
	
}
