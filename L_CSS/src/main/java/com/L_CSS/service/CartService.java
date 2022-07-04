package com.L_CSS.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.L_CSS.dao.CartDao;

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
}
