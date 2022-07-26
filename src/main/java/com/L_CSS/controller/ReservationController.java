package com.L_CSS.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.L_CSS.dto.ReservationDto;
import com.L_CSS.service.ReservationService;

@Controller
public class ReservationController {
	
	@Autowired
	ReservationService rsv;
	@Autowired
	private HttpSession session;
	@RequestMapping (value="/reservationUpLoad")
	public ModelAndView reservationUpLoad() {
		System.out.println("주문정보 ");
		ModelAndView mav = new ModelAndView();
		
		mav = rsv.reservationUpLoad();
		
		return mav;
	}
	//주문내역 insert 
	@RequestMapping (value="/reservInsert")
	public ModelAndView reservInsert(String ctcode,ReservationDto reserv,RedirectAttributes ra) {
		ModelAndView mav = new ModelAndView();
		System.out.println(ctcode);
		String loginId = (String)session.getAttribute("loginId");
		System.out.println(loginId);
		mav = rsv.reservInsert(ctcode,loginId,reserv,ra);
		return mav;
	}
	//주문 목록 확인
	
	@RequestMapping(value="/orderhistory")
	public ModelAndView orderhistory() {
		System.out.println("주문목록 확인 ");
		String loginId = (String)session.getAttribute("loginId");
		ModelAndView mav  = new ModelAndView();
		mav = rsv.selectReserv(loginId);
		
		
		return mav;
	}
	//주문 취소
	@RequestMapping(value="/orderCancel")
	public  ModelAndView  orderCancel(String recode) {
		System.out.println("주문취소");
		
		
		System.out.println(recode);
		ModelAndView mav  = new ModelAndView();
		mav= rsv.orderCancel(recode);
		return mav;
	}
	//배송요청
	@RequestMapping(value="/orderCheck")
	public ModelAndView orderCheck(String recode) {
		System.out.println("주문확인");
		
		ModelAndView mav = new ModelAndView();
		mav = rsv.orderCheck(recode);
		
		
		return mav;
	}
	//리뷰 모달 호출
	@RequestMapping(value="/selectRecode")
	public @ResponseBody String selectRecode(String recode) {
		System.out.println("리뷰 작성 제품 호출");
		System.out.println(recode);
		String selectReview = rsv.selectReview(recode);
		return selectReview;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
