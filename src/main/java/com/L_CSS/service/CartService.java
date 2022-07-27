package com.L_CSS.service;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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
		
		int count = 0; //제품 장바구니 
		int price = 0; //제품 가격
		int toTal = 0; // 총가격 
		String ctctcode = null;
		for(int i = 0; i < myCart.size(); i++) {
			
			count = myCart.get(i).getCtamount();
			price = myCart.get(i).getPdprice();
			ctctcode = myCart.get(i).getCtcode();
			System.out.println(i+"]"+ ctctcode);
			System.out.println(i+"]"+count);
			System.out.println(i+"]"+price);
			toTal = count * price;
			System.out.println(toTal);
			int updateTotal = cdao.updateTotal(ctctcode,toTal);
			
		}
		
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
		
		int count = 0;
		int price = 0;
		int toTal = 0;
		String ctctcode = null;
		for(int i = 0; i < myCart.size(); i++) {
			
			count = myCart.get(i).getCtamount();
			price = myCart.get(i).getPdprice();
			ctctcode = myCart.get(i).getCtcode();
			System.out.println(count);
			System.out.println(price);
			toTal = count * price;
			System.out.println(toTal);
			
			int updateTotal = cdao.updateTotal(ctctcode,toTal);
					
		}
		String update = gson.toJson(myCart);
		return update;
		
	}
	public ArrayList<CartDto> selectCart(String loginId) {
		System.out.println("카카오페이 결제 내역 가져오기");
		ArrayList<CartDto>selectCart = cdao.selectCart(loginId);
		System.out.println(selectCart);
		return selectCart;
	}
	//장바구니 담기
	public String cartInsert(String pdcode, String pdcmcode, String loginId, RedirectAttributes ra) {
		System.out.println("cartInsert()호출");
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
		
		int insertCart = cdao.InsertCart(pdcode,pdcmcode,loginId,ctcode);
		
		ra.addFlashAttribute("msg", "장바구니에 저장되었습니다.");
		return "redirect:/shopMain";
	}
	//선택 목록 삭제
	public String deleteCart(String ctcode, RedirectAttributes ra) {
		System.out.println("deleteCart()호출");
		
		int deleteCart = cdao.deleteCartList(ctcode);
		System.out.println(ctcode);
		System.out.println(deleteCart);
		if(deleteCart > 0) {
			ra.addFlashAttribute("msg","선택 물품 삭제");
			return  "redirect:/myCartPage";
		}else {
			ra.addFlashAttribute("msg","잘못 선택하셨습니다.");
			return  "redirect:/myCartPage";
		}
		
	
	}
	
	
}
