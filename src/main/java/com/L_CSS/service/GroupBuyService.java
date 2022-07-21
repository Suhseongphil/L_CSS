package com.L_CSS.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.L_CSS.dao.GroupBuyDao;
import com.L_CSS.dto.GroupBuyDto;

@Service
public class GroupBuyService {

	@Autowired
	GroupBuyDao gbdao;

	public ModelAndView getGroupBuyInfo() {
		System.out.println("AdminService.insertCompany() 호출");
		
		ArrayList<GroupBuyDto> groupBuyList = gbdao.getGroupBuyInfo(); 
		return null;
	}

}
