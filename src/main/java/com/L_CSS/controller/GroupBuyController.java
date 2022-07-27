package com.L_CSS.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.L_CSS.dto.GbpeopleDto;
import com.L_CSS.dto.GroupBuyDto;
import com.L_CSS.service.GroupBuyService;

@Controller
public class GroupBuyController {

	@Autowired
	GroupBuyService gbsvc;

	// 공동구매 게시판
	@RequestMapping(value = "/groupBuyBoard")
	public ModelAndView groupBuyBoard() {
		System.out.println("공동구매");
		ModelAndView mav = new ModelAndView();

		mav = gbsvc.getGroupBuyInfo();

		return mav;
	}

	// 공동구매 글 작성 페이지
	@RequestMapping(value = "/gbBoardWrite_form")
	public ModelAndView gbBoardWrite_form() {
		System.out.println("공동구매 글 작성 페이지");
		ModelAndView mav = new ModelAndView();
		mav = gbsvc.getPdType();

		return mav;
	}

	// 구매할 상품 종류 선택
	@RequestMapping(value = "/selectPdtype")
	public @ResponseBody String selectPdtype(String pdtype) {
		System.out.println("상품종류");

		String productList = gbsvc.getPdname(pdtype);

		return productList;
	}

	// 공동구매 글 작성
	@RequestMapping(value = "/groupBuyWrite")
	public ModelAndView groupBuyWrite(GroupBuyDto groupBuy) {
		System.out.println("공동구매 글 작성 요청");
		ModelAndView mav = new ModelAndView();
		mav = gbsvc.insertGroupBuy(groupBuy);

		return mav;
	}

	// 공동구매 글 상세보기
	@RequestMapping(value = "/groupBuyBoardView")
	public ModelAndView groupBuyBoardView(String gbcode) {
		System.out.println("공동구매 글 상세보기 요청");
		ModelAndView mav = new ModelAndView();
		mav = gbsvc.getGroupBuy(gbcode);

		return mav;
	}

	// 공동구매 참여
	@RequestMapping(value = "/joinGroupBuy")
	public ModelAndView joinGroupBuy(GbpeopleDto gbInfo) {
		System.out.println("공동구매 참여 요청");
		ModelAndView mav = new ModelAndView();

		mav = gbsvc.insertGbpeople(gbInfo);

		return mav;
	}

	// 공동구매 삭제
	@RequestMapping(value = "/deleteBoard")
	public ModelAndView deleteBoard(String gbcode) {
		System.out.println("공동구매 삭제 요청");
		ModelAndView mav = new ModelAndView();

		mav = gbsvc.deleteGroupBuyBoard(gbcode);

		return mav;
	}

	// 공동구매 채팅방 참여 요청
	@RequestMapping(value = "/chatRoom")
	public ModelAndView chatRoom(String gbcode) {
		System.out.println("공동구매 채팅방 참여 요청");
		ModelAndView mav = new ModelAndView();

		mav = gbsvc.groupBuyChatRoom(gbcode);

		return mav;
	}

	// 공동구매 삭제
	@RequestMapping(value = "/outGroupBuy")
	public ModelAndView outGroupBuy(String gbcode) {
		System.out.println("공동구매 탈퇴 요청");
		ModelAndView mav = new ModelAndView();

		mav = gbsvc.outGroupBuy(gbcode);

		return mav;
	}

}
