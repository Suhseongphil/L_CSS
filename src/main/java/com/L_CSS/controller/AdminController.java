package com.L_CSS.controller;

import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.L_CSS.dto.CafeDto;
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

		return "Admin/AdminCompany";
	}

	// 회사 정보 직접 입력
	@RequestMapping(value = "/adminCreateInfo")
	public @ResponseBody void adminCreateInfo(CompanyDto company) throws IllegalStateException, IOException {
		System.out.println("회사정보 입력_어드민");

		adsvc.insertCompany(company);
	}

	// 회사정보 리스트
	@RequestMapping(value = "/getCompanyInfo")
	public @ResponseBody String getCompanyInfo() {
		System.out.println("회사정보 출력_어드민");

		String companyInfo = adsvc.getCompany();

		return companyInfo;
	}

	// 회사 활동상태 변경
	@RequestMapping(value = "/cmstateModify")
	public @ResponseBody void cmstateModify(String cmcode, int cmstate) {
		System.out.println("회사 상태 변경");
		adsvc.cmstateModify(cmcode, cmstate);
	}

	// 회사 정보 삭제
	@RequestMapping(value = "/companyDelete")
	public @ResponseBody void companyDelete(String cmcode) {
		System.out.println("회사 정보 삭제");
		adsvc.companyDelete(cmcode);
	}

	// 회사 정보 수정
	@RequestMapping(value = "/adminCompanyModify")
	public @ResponseBody void adminCompanyModify(CompanyDto company) throws IllegalStateException, IOException {
		System.out.println("회사정보 수정_어드민");

		adsvc.updateCompany(company);
	}

	// 카페 정보 직접 입력
	@RequestMapping(value = "/adminCreateCafeInfo")
	public @ResponseBody void adminCreateCafeInfo(CafeDto cafe) throws IllegalStateException, IOException {
		System.out.println("카페정보 입력_어드민");
		adsvc.insertCafe(cafe);
	}

	// 카페 출력
	@RequestMapping(value = "/getCafeInfo")
	public @ResponseBody String getCafeInfo() {
		System.out.println("카페정보 출력_어드민");

		String cafeInfo = adsvc.getCafeInfo();

		return cafeInfo;
	}

	// 어드민 카페정보 입력 페이지 이동
	@RequestMapping(value = "/admincafeInsert")
	public String admincafeInsert() {
		System.out.println("어드민 카페정보 입력 페이지");

		return "Admin/AdminCafe";
	}

	// 어드민 메뉴정보 입력 페이지 이동
	@RequestMapping(value = "/adminmenuInsert")
	public String adminmenuInsert() {
		System.out.println("어드민 메뉴정보 입력 페이지");

		return "Admin/AdminMenuInsert";
	}

	// 카페 활동상태 변경
	@RequestMapping(value = "/cfstateModify")
	public @ResponseBody void cfstateModify(String cfcode, int cfstate) {
		System.out.println("회사 상태 변경");
		adsvc.cfstateModify(cfcode, cfstate);
	}

	// 카페 정보 삭제
	@RequestMapping(value = "/cafeDelete")
	public @ResponseBody void cafeDelete(String cfcode) {
		System.out.println("카페 정보 삭제");

		adsvc.deleteCafe(cfcode);
	}

	// 카페 정보 수정
	@RequestMapping(value = "/adminCafeModify")
	public @ResponseBody void adminCafeModify(CafeDto cafe) throws IllegalStateException, IOException {
		System.out.println("카페정보 수정_어드민");

		adsvc.updateCafe(cafe);
	}

	// 어드민 회원 페이지 이동
	@RequestMapping(value = "/adminMember")
	public String adminMember() {
		System.out.println("어드민 페이지 호출");

		return "Admin/AdminMember";
	}

	// 회원 정보 출력
	@RequestMapping(value = "/getMemberInfo")
	public @ResponseBody String getMemberInfo() {
		System.out.println("회원정보 가져오기");

		String memberList = adsvc.getMemberInfo();

		return memberList;
	}

	// 회원 활동상태 변경
	@RequestMapping(value = "/memberStateModify")
	public @ResponseBody void memberStateModify(String mid, int mstate) {
		System.out.println("회원 상태 변경");
		adsvc.memberStateModify(mid, mstate);
	}

	// 회원 정보 삭제
	@RequestMapping(value = "/memberDelete")
	public @ResponseBody void memberDelete(String mid) {
		System.out.println("회원 정보 삭제");

		adsvc.deleteMember(mid);
	}
	//고객문의 내용 확인
	@RequestMapping(value="/admininquirePage")
	public ModelAndView admininquirePage() {
		ModelAndView mav = new ModelAndView();
		
		mav = adsvc.InquireList();
		return mav;
	}

}
