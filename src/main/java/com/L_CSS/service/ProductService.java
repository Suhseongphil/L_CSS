package com.L_CSS.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.L_CSS.dao.ProductDao;

@Service
public class ProductService {
	
	@Autowired
	ProductDao pdao;
	
	
	//업체 상품 업로드 
	public ModelAndView productUpLoad() {
		
		String max = pdao.getmax();
		String pdcode = "PD";
		
		if(max == null) {
			pdcode = pdcode + "001";
		}else {
			max = max.substring(2);
			int maxCode = Integer.parseInt(max)+1;		
			if(maxCode < 10) {
				pdcode = pdcode + "00" + maxCode;
		}else if(maxCode < 100) {
			pdcode = pdcode + "0" + maxCode;
		}else {
			pdcode = pdcode + maxCode;
		}
		
		
		}
		System.out.println(pdcode);
		
		return null;
	}
}
