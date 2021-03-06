package com.L_CSS.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;


import com.L_CSS.dao.CartDao;
import com.L_CSS.dao.OrderDao;
import com.L_CSS.dao.ReservationDao;
import com.L_CSS.dto.CartDto;
import com.L_CSS.dto.OrderDto;
import com.L_CSS.dto.ReservationDto;
import com.google.gson.Gson;

@Service
public class ReservationService {
	
	@Autowired
	ReservationDao rdao;
	@Autowired
	CartDao cdao;
	@Autowired
	OrderDao odao;
	public ModelAndView reservationUpLoad() {
		
		String max = rdao.getmax();
		String recode = "RE";
		
		if(max == null) {
			recode = recode + "001";
		}else {
			max = max.substring(2);
			int maxCode = Integer.parseInt(max)+1;		
			if(maxCode < 10) {
				recode = recode + "00" + maxCode;
		}else if(maxCode < 100) {
			recode = recode + "0" + maxCode;
		}else {
			recode = recode + maxCode;
		}
		
		
		}
		System.out.println(recode);
		
		
		return null;
	}

	public ModelAndView reservInsert(String ctcode, String loginId, ReservationDto reserv) {
		
		ModelAndView mav = new ModelAndView();
		String max = rdao.getmax();
		String recode = "RE";
		ArrayList<CartDto>selectCartList = cdao.selectCartList(loginId,ctcode);
		
		
		
		
		String recfcode = null;
		String repdcode = null;
		int amount = 0;
		int price = 0;
		
		for(int i =0; i < selectCartList.size(); i++) {
			recfcode = selectCartList.get(i).getCtcfcmcode();
			repdcode = selectCartList.get(i).getCtmupdcode();
			amount = selectCartList.get(i).getCtamount();
			price = selectCartList.get(i).getCttotal();
			ReservationDto rv = null;
			reserv.setRemid(loginId);
			reserv.setRecfcmcode(recfcode);
			reserv.setReprice(price);
			reserv.setRemupdcode(repdcode);
			reserv.setReamount(amount);
			
			if(max == null) {
				recode = recode + "001";
			}else {
				max = max.substring(2);
				int maxCode = Integer.parseInt(max)+1;		
				if(maxCode < 10) {
					recode = recode + "00" + maxCode;
				}else if(maxCode < 100) {
					recode = recode + "0" + maxCode;
				}else {
					recode = recode + maxCode;
				}
				
				
			}
			reserv.setRecode(recode);
			System.out.println(recfcode);
			System.out.println(repdcode);
			System.out.println(amount);
			System.out.println(price);
			
			
		}
		int insertReTable = rdao.insertReTable(reserv);
		if(insertReTable > 0 ) {
			int deleteCart = cdao.deleteCart(ctcode);
			mav.setViewName("Main");
		}else {
			mav.setViewName("redirect:/myCartPage");
		}
		
		return mav;
	}
	//???????????? ??????
	public ModelAndView selectReserv(String loginId) {
		System.out.println("selectReserv ()??????");
		ModelAndView mav  = new ModelAndView();
		ArrayList<OrderDto>OrderList = odao.OrderList(loginId);
		System.out.println(OrderList);
		mav.addObject("OrderList",OrderList);
		mav.setViewName("option/orderhistory");
		return mav;
	}
	//????????????
	public ModelAndView orderCancel(String recode) {
		System.out.println("orderCancel()??????");
		ModelAndView mav  = new ModelAndView();
		
		
		
		
		int orderCancel = rdao.orderCancel(recode);
		
		
		mav.setViewName("redirect:/orderhistory");
		
		return mav;
	}
	//????????????
	public ModelAndView orderCheck(String recode) {
		System.out.println("orderCheck()??????");
		ModelAndView mav = new ModelAndView();
		
		int orderCheck = rdao.orderCheck(recode);
		
		mav.setViewName("redirect:/orderhistory");
		return mav;
	}
	//?????? ?????? ??????
		public String selectReview(String recode) {
			System.out.println("selectReView()??????");
			OrderDto select = odao.selectRecode(recode);
			System.out.println(select);
			Gson gson = new Gson();
			String RecodeSelect = gson.toJson(select);
			return RecodeSelect;
		}

	
	
}
