package com.L_CSS.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.L_CSS.dao.InquIreDao;

@Service
public class InquIreService {
	
	@Autowired
	InquIreDao Idao;

	public ModelAndView InquIreUpLoad() {
		
		String max = Idao.getmax();
		String iqcode = "IQ";
		
		if(max == null) {
			iqcode = iqcode + "001";
		}else {
			max = max.substring(2);
			int maxCode = Integer.parseInt(max)+1;		
			if(maxCode < 10) {
				iqcode = iqcode + "00" + maxCode;
		}else if(maxCode < 100) {
			iqcode = iqcode + "0" + maxCode;
		}else {
			iqcode = iqcode + maxCode;
		}
		
		
		}
		System.out.println(iqcode);
		return null;
	}
}
