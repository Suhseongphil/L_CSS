package com.L_CSS.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.L_CSS.dao.CafeDao;
import com.L_CSS.dto.CafeDto;

@Service
public class CafeService {
	
	@Autowired
	CafeDao cdao;
	
	
	//카페 업로드 요청
	public ModelAndView CafeUpLoad() {
		
		String max = cdao.getmax();
		String cfcode = "CF";
		
		CafeDto cf = new CafeDto();
		if(max == null) {
			cfcode = cfcode + "001";
		}else {
			max = max.substring(2);
			int maxCode = Integer.parseInt(max)+1;		
			if(maxCode < 10) {
			cfcode = cfcode + "00" + maxCode;
		}else if(maxCode < 100) {
			cfcode = cfcode + "0" + maxCode;
		}else {
			cfcode = cfcode + maxCode;
		}
		
		
		}
		
		
		
		
		return null;
	}
}
