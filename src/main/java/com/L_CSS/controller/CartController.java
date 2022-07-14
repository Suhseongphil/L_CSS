package com.L_CSS.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.ModelAndView;

import com.L_CSS.service.CartService;

@Controller
public class CartController {
	
	@Autowired
	CartService csv;
	@Autowired
	private HttpSession session;
	@RequestMapping (value="/cartUpLoad")
	public ModelAndView cartUpLoad() {
		System.out.println("장바구니 상품 정보 업로드");
		ModelAndView mav = new ModelAndView();
		
		mav = csv.cartUpLoad();
		
		return mav;
	}
	//장바구니 이동 요청
	@RequestMapping(value="/myCart")
	public ModelAndView myCart() {
		System.out.println("장바구니 페이지요청");
		
		ModelAndView mav = new ModelAndView();
		String loginId = (String)session.getAttribute("loginId");
		System.out.println(loginId);
		mav = csv.myCart(loginId);
		
		return mav;
	}
	//장바구니 수량 빼기
	@RequestMapping(value="/updateMinus")
	public @ResponseBody String updateMinus(String ctamount,String ctcode) {
		System.out.println("장바구니 수량 빼기");
		System.out.println(ctamount);
		System.out.println(ctcode);
		String loginId = (String)session.getAttribute("loginId");
		String updateMinus = csv.updateMinus(ctamount,ctcode,loginId);
		
		return updateMinus;
		
	}
}
