package com.L_CSS.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.L_CSS.service.CompanyService;

@Controller
public class CompanyController {
	
	@Autowired
	CompanyService csv;
	
}
