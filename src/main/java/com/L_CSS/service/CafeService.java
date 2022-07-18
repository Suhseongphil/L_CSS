package com.L_CSS.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.L_CSS.dao.CafeDao;
import com.L_CSS.dto.CafeDto;
import com.L_CSS.dto.PageDto;

@Service
public class CafeService {
	
	@Autowired
	CafeDao cdao;
	
	
	//카페 업로드 요청
	public ModelAndView CafeUpLoad() {
		
		String max = cdao.getmax();
		String cfcode = "CF";
		
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

	//카페 목록 요청
	public ModelAndView cafeList(String page) {
		System.out.println("cafeList()호출");
		ModelAndView mav = new ModelAndView();
		int TotalCount = cdao.TotalCount();
		int page2 = 1;
		
		if(page != null) {
			page2 = Integer.parseInt(page);
		};
		
		//한페이지에 보여줄 글 개수
		int pageCount = 8;
		//한페이지에 보여줄 페이지 번호 개수
		int pageNumCount = 5;
		
		int startRow = (page2 - 1) * pageCount +1;
		int endRow = page2 * pageCount;
		
		int maxPage = (int)(Math.ceil((double)TotalCount/pageCount));
		int startPage = (int)(Math.ceil((double)page2/pageCount));
		
		int endPage = startPage + pageNumCount-1;
		
		if(endPage > maxPage) {
			endPage = maxPage;
		}
		System.out.println(startRow);
		System.out.println(endRow);
		ArrayList<CafeDto> selectCafeList = cdao.selectCafeList(startRow,endRow);
		PageDto pagedto = new PageDto();
		pagedto.setPage(page2);
		pagedto.setMaxPate(maxPage);
		pagedto.setStartPage(startPage);
		pagedto.setEndPage(endPage);
		mav.addObject("pagedto",pagedto);
		mav.addObject("selectCafeList",selectCafeList);
		mav.setViewName("Cafe/CafeList");
		System.out.println(selectCafeList);
		
		return mav;
	}
}
