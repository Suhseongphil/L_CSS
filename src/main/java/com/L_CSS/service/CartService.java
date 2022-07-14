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
	public String myCart(String loginId) {
		
		System.out.println("myCart()호출");
		ArrayList<CartDto>myCart = cdao.selectMyCart(loginId);
		System.out.println(myCart);
		Gson gson = new Gson();
		String cart = gson.toJson(myCart);
		CartDto total = null;
		int count = 0;
		int price = 0;
		int toTal = 0;
		for(int i = 0; i < myCart.size(); i++) {
			total = new CartDto();
			count = myCart.get(i).getCtamount();
			price = myCart.get(i).getPdprice();
			System.out.println(count);
			System.out.println(price);
			toTal = count * price;
			System.out.println(toTal);
			total.setCttotal(toTal);
			
		}
		 
		myCart.add(total);	
		System.out.println(myCart);
		return cart;
	}
	//장바구니 수량 빼기
	public String updateMinus(String ctamount, String ctcode, String loginId) {
		System.out.println("updateMinus()호출");
		int amount = Integer.parseInt(ctamount);
		int updateMinus = cdao.updateMinus(amount,ctcode);
		
		Gson gson = new Gson();
		ArrayList<CartDto>myCart = cdao.selectMyCart(loginId);
		CartDto total = null;
		int count = 0; //제품 장바구니 
		int price = 0; //제품 가격
		int toTal = 0; // 총가격 
		for(int i = 0; i < myCart.size(); i++) {
			total = new CartDto();
			count = myCart.get(i).getCtamount();
			price = myCart.get(i).getPdprice();
			System.out.println(count);
			System.out.println(price);
			toTal = count * price;
			System.out.println(toTal);
			total.setCttotal(toTal);
			
		}
		
		myCart.add(total);	
		String update = gson.toJson(myCart);
		System.out.println(update);
		return update;
		
	}
	//장바구니 수량 더하기
	public String updatePlus(String ctamount, String ctcode, String loginId) {
		System.out.println("updatePlus()호출");
		int amount = Integer.parseInt(ctamount);
		int updatePlus = cdao.updatePlus(amount,ctcode);
		
		Gson gson = new Gson();
		ArrayList<CartDto>myCart = cdao.selectMyCart(loginId);
		CartDto total = null;
		int count = 0;
		int price = 0;
		int toTal = 0;
		for(int i = 0; i < myCart.size(); i++) {
			total = new CartDto();
			count = myCart.get(i).getCtamount();
			price = myCart.get(i).getPdprice();
			System.out.println(count);
			System.out.println(price);
			toTal = count * price;
			System.out.println(toTal);
			total.setCttotal(toTal);
					
		}
		myCart.add(total);
		String update = gson.toJson(myCart);
		return update;
		
	}
}
