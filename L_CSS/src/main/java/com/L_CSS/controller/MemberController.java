package com.L_CSS.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.L_CSS.service.MemberService;

@Controller
public class MemberController {
	
	@Autowired
	MemberService mvc;
	
	//메인 페이지 이동
	@RequestMapping (value="/Main")
	public String Main() {
		System.out.println("메인 페이지 호출");
		
		
		return "Main";
	}
	//회원가입 페이지 이동요청 메소드
	@RequestMapping (value="/MemberJoin")
	public String MemberJoin() {
		System.out.println("회원가입 페이지 호출");
		
		
		return "Member/MemberJoin";
	}
	//로그인 페이지 이동요청 메소드
	@RequestMapping (value="/MemberLogin")
	public String MemberLogin() {
		System.out.println("로그인 페이지 호출");
		
		return "Member/MemberLogin";
	}
	
}
