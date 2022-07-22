package com.L_CSS.service;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

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
	private HttpSession session;
	
	@Autowired
	GroupBuyDao gbdao;

	// 공동구매 게시판
	public ModelAndView getGroupBuyInfo() {
		System.out.println("AdminService.insertCompany() 호출");
		ModelAndView mav = new ModelAndView();
		ArrayList<GroupBuyDto> groupBuyList = gbdao.getGroupBuyInfo();
		
		mav.addObject("groupBuyList", groupBuyList);
		mav.setViewName("GroupBuy/GroupBuyBoard");
		return mav;
	}

	// 공동구매 글 작성
	public ModelAndView getPdType() {
		System.out.println("AdminService.getPdType() 호출");
		ModelAndView mav = new ModelAndView();
		ArrayList<String> productType = gbdao.getPdType();
		
		String loginId = (String)session.getAttribute("loginId");
		
		String region = gbdao.getAddress(loginId);
		
		if(region !=null) {
			region = region.split("_")[1].split(" ")[0];
		}
		
		mav.addObject("region",region);
		mav.addObject("productType", productType);
		mav.setViewName("GroupBuy/GroupBuyWrite_form");
		return mav;
	}

	// 구매할 상품 종류 선택
	public String getPdname(String pdtype) {
		System.out.println("AdminService.getPdname() 호출");
		
		ArrayList<ProductDto> getProductList = gbdao.getProduct(pdtype);
		
		Gson gson = new Gson();
		String productList = gson.toJson(getProductList);
		return productList;
	}

}
