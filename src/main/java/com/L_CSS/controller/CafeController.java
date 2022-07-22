package com.L_CSS.controller;

import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.L_CSS.dto.CafeDto;
import com.L_CSS.service.CafeService;

@Controller
public class CafeController {
	
	@Autowired
	CafeService csv;
	
	//카페 업로드 요청
	@RequestMapping (value="/CafeUpLoad")
	public ModelAndView  CafeUpLoad() {
		System.out.println("카페 업로드 ");
		ModelAndView mav = new ModelAndView();
		
		mav = csv.CafeUpLoad();
		return mav;
	}
	//카페 목록 요청
	@RequestMapping(value="/cafeList")
	public  ModelAndView cafeList(String page) {
		System.out.println("카페 목록 요청");
		System.out.println(page);
		ModelAndView mav = new ModelAndView();
		
		mav = csv.cafeList(page);
		return mav;
	}
	//카페 상세보기 요청
	@RequestMapping(value="/cafeInfo")
	public ModelAndView cafeInfo(String cfcode) {
		System.out.println("카페 상세보기 요청");
		System.out.println(cfcode);
		ModelAndView mav = new ModelAndView();
		mav = csv.cafeInfo(cfcode);
		return mav;
	}
	
	//내 카페등록 페이지 요청
	@RequestMapping(value="/mycafeInsert")
	public String mycafeInsert() {
		System.out.println("내 카페등록 페이지 이동 요청");
		
		return "Cafe/MycafeInsert";
	}
	//내 카페등록 등록요청
	@RequestMapping(value="/createMycafe")
	public ModelAndView createMycafe(CafeDto cafe,RedirectAttributes ra) throws IllegalStateException, IOException {
		
		ModelAndView mav = new ModelAndView();
		
		mav = csv.createMycafe(cafe,ra);
		
		
		return mav;
	}
	
	//내 카페정보 페이지 요청
	@RequestMapping(value="mycafeInfo")
	public ModelAndView mycafeInfo(RedirectAttributes ra) {
		System.out.println("내 카페정보 페이지 이동 요청");
		ModelAndView mav = new ModelAndView();
		
		mav = csv.mycafeInfo(ra);
		
		return mav;
	}
	
	//내 카페 정보 수정요청
	@RequestMapping(value= "mycafeModify")
	public ModelAndView mycafeModify(CafeDto cafe,RedirectAttributes ra ) throws IllegalStateException, IOException {
		System.out.println("내 카페정보 수정 요청");
		System.out.println(cafe);
		
		ModelAndView mav = csv.mycafeModify(cafe,ra);
		
		return mav;
	}
	//메뉴정보 입력 페이지 이동
		@RequestMapping(value = "/mymenuInsert")
		public ModelAndView menuInsert(RedirectAttributes ra) {
			ModelAndView mav = new ModelAndView();
			
			System.out.println("메뉴정보 입력 페이지 요청");

			mav = csv.mycafeMenu(ra);
			return mav;
		}
	
}
