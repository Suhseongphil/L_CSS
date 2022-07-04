package com.L_CSS.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.L_CSS.dao.ReservationDao;

@Service
public class ReservationService {
	
	@Autowired
	ReservationDao rdao;
	
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
	
}
