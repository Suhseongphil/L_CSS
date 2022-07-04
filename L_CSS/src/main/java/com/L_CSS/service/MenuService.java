package com.L_CSS.service;

import java.io.IOException;
import java.util.ArrayList;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.L_CSS.dao.MenuDao;

import com.L_CSS.dto.MenuDto;


@Service
public class MenuService {
	
	@Autowired
	MenuDao mdao;

	public ModelAndView menuUpLoad() throws IOException {
		

		System.out.println("getimg");
		ModelAndView mav = new ModelAndView();

			
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
			
		
		return null;
	}
}
