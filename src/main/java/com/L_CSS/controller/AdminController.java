package com.L_CSS.controller;

import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.L_CSS.dto.CompanyDto;
import com.L_CSS.service.AdminService;

@Controller
public class AdminController {
	@Autowired
	AdminService adsvc;

	// 어드민 메인 페이지 이동
	@RequestMapping(value = "/admin")
	public String admin() {
		System.out.println("어드민 페이지 호출");

		return "Admin/AdminMain";
	}

	// 어드민 회사정보 입력 페이지 이동
	@RequestMapping(value = "/admincompanyInsert")
	public String admincompanyInsert() {
		System.out.println("어드민 회사정보 입력 페이지");

		return "Admin/AdminCompanyInsert";
	}

	// 회사 정보 직접 입력
	@RequestMapping(value = "/adminCreateInfo")
	public @ResponseBody void adminCreateInfo(CompanyDto company) throws IllegalStateException, IOException {
		System.out.println("회사정보 입력_어드민");

		adsvc.insertCompany(company);
	}
	
	// 회사 정보 직접 입력
	@RequestMapping(value = "/getCompanyInfo")
	public @ResponseBody String getCompanyInfo(){
		System.out.println("회사정보 출력_어드민");

		String companyInfo = adsvc.getCompany();
		
		return companyInfo;
	}
}
