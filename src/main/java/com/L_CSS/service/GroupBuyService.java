package com.L_CSS.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.L_CSS.dao.GroupBuyDao;
import com.L_CSS.dto.GroupBuyDto;
import com.L_CSS.dto.ProductDto;
import com.google.gson.Gson;

@Service
public class GroupBuyService {

	@Autowired
	GroupBuyDao gbdao;

	public ModelAndView getGroupBuyInfo() {
		System.out.println("AdminService.insertCompany() 호출");
		ModelAndView mav = new ModelAndView();
		ArrayList<GroupBuyDto> groupBuyList = gbdao.getGroupBuyInfo();
		
		mav.addObject("groupBuyList", groupBuyList);
		mav.setViewName("GroupBuy/GroupBuyBoard");
		return mav;
	}

	public ModelAndView getPdType() {
		System.out.println("AdminService.getPdType() 호출");
		ModelAndView mav = new ModelAndView();
		ArrayList<String> productType = gbdao.getPdType();
		
		mav.addObject("productType", productType);
		mav.setViewName("GroupBuy/GroupBuyWrite_form");
		return mav;
	}

	public String getPdname(String pdtype) {
		System.out.println("AdminService.getPdname() 호출");
		
		ArrayList<ProductDto> getProductList = gbdao.getProduct(pdtype);
		
		Gson gson = new Gson();
		String productList = gson.toJson(getProductList);
		return productList;
	}

}
