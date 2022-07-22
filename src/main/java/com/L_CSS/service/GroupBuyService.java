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

	// 공동구매 글 작성 페이지
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

	public ModelAndView insertGroupBuy(GroupBuyDto groupBuy) {
		System.out.println("AdminService.insertGroupBuy() 호출");
		System.out.println(groupBuy);
		
		// 코드생성
		String max = gbdao.getmax();
		String gbcode = "GB";
		if (max == null) {
			gbcode = gbcode + "001";
		} else {
			max = max.substring(2);
			int maxCode = Integer.parseInt(max) + 1;
			if (maxCode < 10) {
				gbcode = gbcode + "00" + maxCode;
			} else if (maxCode < 100) {
				gbcode = gbcode + "0" + maxCode;
			} else {
				gbcode = gbcode + maxCode;
			}

		}
		System.out.println(gbcode);
		groupBuy.setGbcode(gbcode);
		
		// 아이디
		String loginId = (String)session.getAttribute("loginId");
		groupBuy.setGbmid(loginId);
		
		
		// 줄바꿈, 띄어쓰기 처리 토요일날 할부분!!
//		String gbcomment = groupBuy.getGbcomment();
//		gbcomment = gbcomment.replaceAll(" ", "$nbsp;");
//		groupBuy.setGbcomment(gbcomment.replaceAll("\r\n", "<br>"));
		
		System.out.println(groupBuy);
		return null;
	}

}
