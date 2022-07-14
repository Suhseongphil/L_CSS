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
	public @ResponseBody String myCart() {
		System.out.println("장바구니 리스트요청");
		
		
		String loginId = (String)session.getAttribute("loginId");
		System.out.println(loginId);
		String myCartList  = csv.myCart(loginId);
		
		return myCartList;
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
	//장바구니 수량 더하기
	@RequestMapping(value="/updatePlus")
	public @ResponseBody String updatePlus(String ctamount,String ctcode) {
		System.out.println("장바구니 더하기");
		System.out.println(ctamount);
		System.out.println(ctcode);
		String loginId = (String)session.getAttribute("loginId");
		String updatePlus = csv.updatePlus(ctamount,ctcode,loginId);
		
		return updatePlus;
		
	}
	//장바구니 페이지 이동
	@RequestMapping(value="/myCartPage")
	public String myCartPage() {
		System.out.println("장바구니 페이지이동 요청");
		return "option/MyCart";
		
	}
}
