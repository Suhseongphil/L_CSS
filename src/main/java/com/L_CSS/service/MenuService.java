package com.L_CSS.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.L_CSS.dao.MenuDao;

@Service
public class MenuService {
	
	@Autowired
	MenuDao mdao;

	public ModelAndView menuUpLoad() {
		
		
		String max = mdao.getmax();
		String mucode = "MU";
		
		if(max == null) {
			mucode = mucode + "001";
		}else {
			max = max.substring(2);
			int maxCode = Integer.parseInt(max)+1;		
			if(maxCode < 10) {
				mucode = mucode + "00" + maxCode;
		}else if(maxCode < 100) {
			mucode = mucode + "0" + maxCode;
		}else {
			mucode = mucode + maxCode;
		}
		
		
		}
		System.out.println(mucode);
		return null;
	}
}
