package com.L_CSS.controller;

import java.io.IOException;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.L_CSS.dto.InquIreDto;
import com.L_CSS.service.InquIreService;

@Controller
public class InquIreController {

	@Autowired
	InquIreService isv;
	@Autowired
	private HttpSession session;

	// 고객문의 페이지 이동요청
	@RequestMapping(value = "/inquirePage")
	public String InquirePage() {
		System.out.println("고객문의 페이지 이동");

		return "option/Inquire";
	}

	@RequestMapping(value = "/InquIreUpLoad")
	public ModelAndView InquIreUpLoad() {
		System.out.println("리뷰정보 ");
		ModelAndView mav = new ModelAndView();

		mav = isv.InquIreUpLoad();

		return mav;
	}

	// 문의작성 페이지이동
	@RequestMapping(value = "/insertInquirePage")
	public String insertInquirePage() {
		System.out.println("문의작성 페이지 이동");

		return "option/insertInquire";
	}

	// 문의작성
	@RequestMapping(value = "/insertInquire")
	public ModelAndView insertInquire(InquIreDto in) throws IllegalStateException, IOException {
		System.out.println("문의작성 ");
		ModelAndView mav = new ModelAndView();
		System.out.println(in);

		mav = isv.insertInquire(in);

		return mav;
	}

	// 문의내용 출력
	@RequestMapping(value = "/myInquire")
	public @ResponseBody String myInquire() {
		System.out.println("문의내용 출력");
		String loginId = (String) session.getAttribute("loginId");
		System.out.println(loginId);
		String selectInquire = isv.selectInquire(loginId);
		return selectInquire;
	}

	// 검색기능 추가
	@RequestMapping(value = "/searchText")
	public ModelAndView searchText(String iqcategory, String searchText) {
		System.out.println("검색기능");
		ModelAndView mav = new ModelAndView();
		System.out.println(iqcategory);
		System.out.println(searchText);
		mav = isv.searchText(iqcategory, searchText);
		return mav;

	}

	// 문의 상세보기
	@RequestMapping(value = "/inquireInfo")
	public ModelAndView inquireInfo(String iqcode) {
		System.out.println("문의 상세보기");
		System.out.println(iqcode);
		ModelAndView mav = new ModelAndView();
		mav = isv.inquireInfo(iqcode);
		return mav;
	}

	// 문의 상세보기
	@RequestMapping(value = "/deleteInquire")
	public ModelAndView deleteInquire(String iqcode) {
		System.out.println("문의 삭제");
		System.out.println(iqcode);
		ModelAndView mav = new ModelAndView();
		mav = isv.deleteInquire(iqcode);
		return mav;
	}

}
