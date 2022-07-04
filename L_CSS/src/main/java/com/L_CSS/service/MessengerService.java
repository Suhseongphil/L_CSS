package com.L_CSS.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.L_CSS.dao.MessengerDao;

@Service
public class MessengerService {
	
	@Autowired
	MessengerDao mdao;

	public ModelAndView messengerUpLoad() {
		String max = mdao.getmax();
		String mscode = "MS";
		
		if(max == null) {
			mscode = mscode + "001";
		}else {
			max = max.substring(2);
			int maxCode = Integer.parseInt(max)+1;		
			if(maxCode < 10) {
				mscode = mscode + "00" + maxCode;
		}else if(maxCode < 100) {
			mscode = mscode + "0" + maxCode;
		}else {
			mscode = mscode + maxCode;
		}
		
		
		}
		System.out.println(mscode);
		
		return null;
	}
}
