package com.L_CSS.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.L_CSS.dao.ReviewDao;

@Service
public class ReviewService {
	
	@Autowired
	ReviewDao rdao;

	public ModelAndView reViewUpLoad() {
		
		String max = rdao.getmax();
		String rvrecode = "RV";
		
		if(max == null) {
			rvrecode = rvrecode + "001";
		}else {
			max = max.substring(2);
			int maxCode = Integer.parseInt(max)+1;		
			if(maxCode < 10) {
				rvrecode = rvrecode + "00" + maxCode;
		}else if(maxCode < 100) {
			rvrecode = rvrecode + "0" + maxCode;
		}else {
			rvrecode = rvrecode + maxCode;
		}
		
		
		}
		System.out.println(rvrecode);
		
		
		return null;
	
	}
}
