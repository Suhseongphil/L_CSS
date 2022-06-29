package com.L_CSS.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.L_CSS.service.MemberService;

@Controller
public class MemberController {
	
	@Autowired
	MemberService mvc;
	
	
}
