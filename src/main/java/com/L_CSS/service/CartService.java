package com.L_CSS.service;


import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.L_CSS.dao.CartDao;
import com.L_CSS.dto.CartDto;
import com.google.gson.Gson;

@Service
public class CartService {

	@Autowired
	CartDao cdao;

	// 나의 장바구니 호출
	public String myCart(String loginId) {

		System.out.println("myCart()호출");
		ArrayList<CartDto> myCart = cdao.selectMyCart(loginId);
		System.out.println(myCart);
		Gson gson = new Gson();
		String cart = gson.toJson(myCart);

		System.out.println(myCart);
		return cart;
	}

	// 장바구니 수량 빼기
	public String updateMinus(String ctamount, String ctcode, String loginId) {
		System.out.println("updateMinus()호출");
		int amount = Integer.parseInt(ctamount);
		cdao.updateMinus(amount, ctcode);

		Gson gson = new Gson();
		ArrayList<CartDto> myCart = cdao.selectMyCart(loginId);

		int count = 0; // 제품 장바구니
		int price = 0; // 제품 가격
		int toTal = 0; // 총가격
		String ctctcode = null;
		for (int i = 0; i < myCart.size(); i++) {

			count = myCart.get(i).getCtamount();
			price = myCart.get(i).getPdprice();
			ctctcode = myCart.get(i).getCtcode();
			System.out.println(i + "]" + ctctcode);
			System.out.println(i + "]" + count);
			System.out.println(i + "]" + price);
			toTal = count * price;
			System.out.println(toTal);
			cdao.updateTotal(ctctcode, toTal);

		}

		String update = gson.toJson(myCart);
		System.out.println(update);
		return update;

	}

	// 장바구니 수량 더하기
	public String updatePlus(String ctamount, String ctcode, String loginId) {
		System.out.println("updatePlus()호출");
		int amount = Integer.parseInt(ctamount);
		cdao.updatePlus(amount, ctcode);

		Gson gson = new Gson();
		ArrayList<CartDto> myCart = cdao.selectMyCart(loginId);

		int count = 0;
		int price = 0;
		int toTal = 0;
		String ctctcode = null;
		for (int i = 0; i < myCart.size(); i++) {

			count = myCart.get(i).getCtamount();
			price = myCart.get(i).getPdprice();
			ctctcode = myCart.get(i).getCtcode();
			System.out.println(count);
			System.out.println(price);
			toTal = count * price;
			System.out.println(toTal);

			cdao.updateTotal(ctctcode, toTal);

		}
		String update = gson.toJson(myCart);
		return update;

	}

	public ArrayList<CartDto> selectCart(String loginId) {
		System.out.println("카카오페이 결제 내역 가져오기");
		ArrayList<CartDto> selectCart = cdao.selectCart(loginId);
		System.out.println(selectCart);
		return selectCart;
	}

	// 장바구니 담기
	public String cartInsert(CartDto mycart, RedirectAttributes ra) {
		System.out.println("cartInsert()호출");
		String max = cdao.getmax();
		String ctcode = "CT";
		if (max == null) {
			ctcode = ctcode + "001";
		} else {
			max = max.substring(2);
			int maxCode = Integer.parseInt(max) + 1;
			if (maxCode < 10) {
				ctcode = ctcode + "00" + maxCode;
			} else if (maxCode < 100) {
				ctcode = ctcode + "0" + maxCode;
			} else {
				ctcode = ctcode + maxCode;
			}
		}
		mycart.setCtcode(ctcode);
		
		int insertCart = cdao.InsertCart(mycart);
		if(insertCart>0) {
			ra.addFlashAttribute("msg", "장바구니에 저장되었습니다.");
		}else {
			ra.addFlashAttribute("msg", "장바구니에 담기지 않았습니다.");
		}
		return "redirect:/fullMain";
	}

	// 선택 목록 삭제
	public void deleteCart(String ctcode) {
		System.out.println("deleteCart()호출");

		int deleteCart = cdao.deleteCartList(ctcode);
		System.out.println(ctcode);
		System.out.println(deleteCart);
		
	}

}
