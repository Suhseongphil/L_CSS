package com.L_CSS.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.L_CSS.service.CafeService;

@Controller
public class CafeController {
	
	@Autowired
	CafeService csv;
}
