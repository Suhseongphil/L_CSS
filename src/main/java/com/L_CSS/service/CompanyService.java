package com.L_CSS.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.L_CSS.dao.CompanyDao;
import com.L_CSS.dto.CompanyDto;

@Service
public class CompanyService {

	@Autowired
	CompanyDao cdao;

	//업체 업로드 
	public ModelAndView comPanyUpLoad() {
		
		String max = cdao.getmax();
		String cmcode = "CM";
		
		if(max == null) {
			cmcode = cmcode + "001";
		}else {
			max = max.substring(2);
			int maxCode = Integer.parseInt(max)+1;		
			if(maxCode < 10) {
			cmcode = cmcode + "00" + maxCode;
		}else if(maxCode < 100) {
			cmcode = cmcode + "0" + maxCode;
		}else {
			cmcode = cmcode + maxCode;
		}
		
		
		}
		System.out.println(cmcode);
		
		return null;
	}
	//업체 리스트 출력
	public ModelAndView companyList() {
		System.out.println("companyList()호출");
		ModelAndView mav = new ModelAndView();
		ArrayList<CompanyDto> selestCompanyList = cdao.selectCompanyList();
		
		mav.addObject("selestCompanyList",selestCompanyList);
		mav.setViewName("Company/CompanyList");
		
		return mav;
	}
}
