package com.L_CSS.controller;

import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.L_CSS.dto.MemberDto;
import com.L_CSS.service.MemberService;

@Controller
public class MemberController {

	@Autowired
	MemberService mvc;

	// 회원가입 페이지 이동요청 메소드
	@RequestMapping(value = "/memberJoinPage")
	public String MemberJoin() {
		System.out.println("회원가입 페이지 호출");

		return "Member/MemberJoin";
	}

	// 로그인 페이지 이동요청 메소드
	@RequestMapping(value = "/memberLoginPage")
	public String MemberLogin() {
		System.out.println("로그인 페이지 호출");

		return "Member/MemberLogin";
	}

	// 회원가입 요청 메소드
	@RequestMapping(value = "/memberJoin")
	public ModelAndView memberJoin(MemberDto member, RedirectAttributes ra) throws IllegalStateException, IOException {
		System.out.println("회원가입 요청");
		ModelAndView mav = new ModelAndView();

		mav = mvc.memberJoin(member, ra);
		return mav;
	}

	// 로그인 요청 메소드
	@RequestMapping(value = "/memberLogin")
	public ModelAndView memberLogin(String mid, String mpw, RedirectAttributes ra) {
		System.out.println("로그인 요청");
		ModelAndView mav = new ModelAndView();
		mav = mvc.memberLogin(mid, mpw, ra);
		return mav;
	}

	// 내정보 페이지
	@RequestMapping(value = "/memberInfo")
	public ModelAndView memberInfo(String mpw, RedirectAttributes ra) {
		System.out.println("내정보 페이지 요청");
		ModelAndView mav = new ModelAndView();
		mav = mvc.memberInfo(mpw, ra);

		return mav;
	}

	// 내정보 확인 페이지

	@RequestMapping(value = "/myInfo")
	public String MyInfo() {
		System.out.println("정보확인 페이지 호출");

		return "Member/MyInfo";
	}

	// 로그아웃 요청
	@RequestMapping(value = "/memberLogout")
	public ModelAndView MemberLogout() {
		System.out.println("로그아웃 요청");
		ModelAndView mav = new ModelAndView();
		mav = mvc.memberLogout();

		return mav;

	}

	// 고객문의 페이지 이동요청
	@RequestMapping(value = "/inquirePage")
	public String InquirePage() {
		System.out.println("고객문의 페이지 이동");

		return "option/Inquire";
	}

	// 카카오 로그인
	@RequestMapping(value = "/memberKakaoLogin")
	public ModelAndView memberKakaoLogin(MemberDto member, RedirectAttributes ra) {
		System.out.println("카카오로 로그인 요청");
		System.out.println(member);

		ModelAndView mav = mvc.memberKakaoLogin(member, ra);

		return mav;
	}

	// 내정보수정
	@RequestMapping(value = "/memberModify")
	public ModelAndView memberModify(MemberDto member, RedirectAttributes ra)
			throws IllegalStateException, IOException {
		System.out.println("내정보 수정 요청");
		System.out.println(member);

		ModelAndView mav = mvc.memberModify(member, ra);

		return mav;
	}

}
