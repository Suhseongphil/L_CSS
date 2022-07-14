package com.L_CSS.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.L_CSS.dao.CartDao;
import com.L_CSS.dto.CartDto;
import com.google.gson.Gson;

@Service
public class CartService {
	
	@Autowired
	CartDao cdao;
	
	@RequestMapping (value="/cartUpLoad")
	public ModelAndView cartUpLoad() {
		
		String max = cdao.getmax();
		String ctcode = "CT";
		
		if(max == null) {
			ctcode = ctcode + "001";
		}else {
			max = max.substring(2);
			int maxCode = Integer.parseInt(max)+1;		
			if(maxCode < 10) {
				ctcode = ctcode + "00" + maxCode;
		}else if(maxCode < 100) {
			ctcode = ctcode + "0" + maxCode;
		}else {
			ctcode = ctcode + maxCode;
		}
		
		
		}
		System.out.println(ctcode);
		return null;
	}
	//나의 장바구니 호출
	public ModelAndView myCart(String loginId) {
		ModelAndView mav = new ModelAndView();
		System.out.println("myCart()호출");
		ArrayList<CartDto>myCart = cdao.selectMyCart(loginId);
		System.out.println(myCart);
		
		mav.addObject("myCart",myCart);
		mav.setViewName("option/MyCart");
		
		return mav;
	}
	//장바구니 수량 빼기
	public String updateMinus(String ctamount, String ctcode, String loginId) {
		System.out.println("updateMinus()호출");
		int amount = Integer.parseInt(ctamount)-1;
		int updateMinus = cdao.updateMinus(amount,ctcode);
		//수량 10 9  98
		Gson gson = new Gson();
		ArrayList<CartDto>myCart = cdao.selectMyCart(loginId);
		//8  가격 바뀐 8 가격 * 8 통합 총가격 setTotal(int)
		String update = gson.toJson(myCart);
		return update;
		
	}
}
