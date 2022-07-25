package com.L_CSS.controller;

import java.io.IOException;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.L_CSS.dto.CafeDto;
import com.L_CSS.dto.CompanyDto;
import com.L_CSS.service.CompanyService;

@Controller
public class CompanyController {
	
	@Autowired
	CompanyService csv;
	@Autowired
	private HttpSession session;
	@RequestMapping (value="/comPanyUpLoad")
	public ModelAndView comPanyUpLoad() {
		System.out.println("업체 업로드 ");
		ModelAndView mav = new ModelAndView();
		
		mav = csv.comPanyUpLoad();
		
		
		return mav;
	}
	//업체리스트
	@RequestMapping (value="/companyList")
	public ModelAndView companyList(String page) {
		System.out.println("업체 리스트 ");
		ModelAndView mav = new ModelAndView();
		
		mav = csv.companyList(page);
		
		
		return mav;
	}
	//업체상세 정보 호출
	@RequestMapping(value="/compnayInfo")
	public ModelAndView compnayInfo(String cmcode) {
		System.out.println("업체 상세정보 호출");
		System.out.println(cmcode);
		ModelAndView mav = new ModelAndView();
		
		mav = csv.companyInfo(cmcode);
		return mav;
	}
	//주문내역 출력
	@RequestMapping(value="/orderList")
	public ModelAndView orderList() {
		System.out.println("주문 내역 호출");
		ModelAndView mav = new ModelAndView();
		
		mav = csv.orderList();
		return mav;
	}
	//주문 삭제
	@RequestMapping(value="/deleteOrder")
	public ModelAndView deleteOrder(String recode) {
		System.out.println("주문 취소 호출");
		ModelAndView mav = new ModelAndView();
		
		mav = csv.deleteOrder(recode);
		return mav;
	}
	//내 업체등록 페이지 요청
		@RequestMapping(value="/MycompanyInsert")
		public String MycompanyInsert() {
			System.out.println("내 업체등록 페이지 이동 요청");
			
			return "Company/MycompanyInsert";
		}
		
	//내 업체등록 등록요청
	@RequestMapping(value="/createMycompany")
	public ModelAndView createMycafe(CompanyDto company,RedirectAttributes ra) throws IllegalStateException, IOException {
			
		ModelAndView mav = new ModelAndView();
			
		mav = csv.createMycompany(company,ra);
			
			
		return mav;
	}
	//내 업체정보 페이지 요청
		@RequestMapping(value="mycompanyInfo")
		public ModelAndView mycompanyInfo(RedirectAttributes ra) {
			System.out.println("내 업체정보 페이지 이동 요청");
			ModelAndView mav = new ModelAndView();
			
			mav = csv.mycompanyInfo(ra);
			
			return mav;
		}
	
	//내 카페 정보 수정요청
	@RequestMapping(value= "mycompanyModify")
	public ModelAndView mycafeModify(CompanyDto company,RedirectAttributes ra ) throws IllegalStateException, IOException {
		System.out.println("내 업체정보 수정 요청");
		System.out.println(company);
			
		ModelAndView mav = csv.mycompanyModify(company,ra);
			
		return mav;
	}	
	
	
	
	
	
	
	
}
