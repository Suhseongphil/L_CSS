package com.L_CSS.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.L_CSS.dao.CompanyDao;
import com.L_CSS.dao.ProductDao;
import com.L_CSS.dto.CompanyDto;
import com.L_CSS.dto.PageDto;
import com.L_CSS.dto.ProductDto;

@Service
public class CompanyService {

	@Autowired
	CompanyDao cdao;
	@Autowired
	ProductDao pdao;
	//업체 업로드 
	public ModelAndView comPanyUpLoad() {
		
		String max = cdao.getmax();
		String cmcode = "CM";
		
		if(max == null) {
			cmcode = cmcode + "001";
		}else {
			max = max.substring(2);
			int maxCode = Integer.parseInt(max)+1;		
			if(maxCode < 10) {
			cmcode = cmcode + "00" + maxCode;
		}else if(maxCode < 100) {
			cmcode = cmcode + "0" + maxCode;
		}else {
			cmcode = cmcode + maxCode;
		}
		
		
		}
		System.out.println(cmcode);
		
		return null;
	}
	//업체 리스트 출력
	public ModelAndView companyList(String page) {
		System.out.println("companyList()호출");
		ModelAndView mav = new ModelAndView();
		int TotalCount = cdao.TotalCount();
		int page2 = 1;
		
		if(page != null) {
			page2 = Integer.parseInt(page);
		};
		
		//한페이지에 보여줄 글 개수
		int pageCount = 5;
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
		ArrayList<CompanyDto> selestCompanyList = cdao.selectCompanyList(startRow,endRow);
		
		PageDto pagedto = new PageDto();
		pagedto.setPage(page2);
		pagedto.setMaxPate(maxPage);
		pagedto.setStartPage(startPage);
		pagedto.setEndPage(endPage);
		mav.addObject("pagedto",pagedto);
		mav.addObject("selestCompanyList",selestCompanyList);
		mav.setViewName("Company/CompanyList");
		
		return mav;
	}
	//업체 상세보기
	public ModelAndView companyInfo(String cmcode) {
		System.out.println("companyInfo()호출");
		CompanyDto comInfo = cdao.ComInfo(cmcode);
		ArrayList<ProductDto> proInfo = pdao.proInfo(cmcode);
		ModelAndView mav = new ModelAndView();
		mav.addObject("comInfo", comInfo);
		mav.addObject("proInfo", proInfo);
		System.out.println("출력  : " + proInfo);
		mav.setViewName("Company/CompanyInfo");
		return mav;
	}
}
