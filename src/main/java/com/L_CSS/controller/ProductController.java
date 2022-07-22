package com.L_CSS.controller;

import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.L_CSS.service.ProductService;

@Controller
public class ProductController {

	@Autowired
	ProductService psv;

	// 메인 페이지 이동
	@RequestMapping(value = "/")
	public ModelAndView Main() {
		System.out.println("메인 페이지 호출");
		ModelAndView mav = new ModelAndView();
		
		mav = psv.mainProduct();
		
		return mav;
	}

	@RequestMapping(value = "/productUpLoad")
	public ModelAndView productUpLoad() {
		System.out.println("업체 상품 정보 업로드");
		ModelAndView mav = new ModelAndView();

		mav = psv.productUpLoad();

		return mav;
	}

	@RequestMapping(value = "/gettb")
	public ModelAndView gettb() throws IOException {
		System.out.println("테이블 상품 업로드");
		ModelAndView mav = new ModelAndView();

		mav = psv.gettb();

		return mav;
	}

	@RequestMapping(value = "/getcm")
	public ModelAndView getcm() throws IOException {
		System.out.println("커피머신기 상품 업로드");
		ModelAndView mav = new ModelAndView();

		mav = psv.getcm();

		return mav;
	}

	@RequestMapping(value = "/gethd")
	public ModelAndView gethd() throws IOException {
		System.out.println("종이컵홀더 상품 업로드");
		ModelAndView mav = new ModelAndView();

		mav = psv.gethd();

		return mav;
	}

	// 상품목록 출력
	@RequestMapping(value = "/shopMain")
	public ModelAndView shopMain() {
		System.out.println("상품 목록 출력");
		ModelAndView mav = new ModelAndView();

		mav = psv.selectProduct();

		return mav;
	}
	//검색창
	@RequestMapping(value="/searchProduct")
	public  ModelAndView searchText(String pdcategory,String searchText) {
		System.out.println("상품검색");
		System.out.println(pdcategory);
		System.out.println(searchText);
		ModelAndView mav = new ModelAndView();

		mav = psv.searchProduct(pdcategory,searchText);
		
		return mav;
	}

	//카테고리 선택
	@RequestMapping(value="/searchType")
	public ModelAndView searchType(String type) {
		System.out.println("카테고리 선택");
		System.out.println(type);
		
		ModelAndView mav = new ModelAndView();

		mav = psv.searchType(type);
		return mav;
	}























}
