package com.L_CSS.controller;

import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.L_CSS.dto.MenuDto;
import com.L_CSS.service.MenuService;

@Controller
public class MenuController {
	
	@Autowired
	MenuService msv;
	
	@RequestMapping (value="/menuUpLoad")
	public ModelAndView menuUpLoad() {
		System.out.println("메뉴 업로드 ");
		ModelAndView mav = new ModelAndView();
		
		mav = msv.menuUpLoad();
		
		
		return mav;
	}
	//메뉴 정보 입력
	@RequestMapping(value="/menuInsert")
	public @ResponseBody void menuInsert(MenuDto menu) throws IllegalStateException, IOException {
		System.out.println("메뉴정보 입력 기능호출 ");
		msv.menuInsert(menu);
	}
	//메뉴 정보 출력
	@RequestMapping(value="/getMenuInfo")
	public @ResponseBody String getMenuInfo() {
		System.out.println("메뉴정보 출력 ");
		
		String getMenuInfo = msv.getMenu();
		
		return getMenuInfo;
	}
	//메뉴 상태 변경
	@RequestMapping(value="/mustateModify")
	public @ResponseBody void mustateModify(String mucode, int mustate) {
		System.out.println("메뉴 수정");
		msv.mustateModify(mucode,mustate);
	}
	//메뉴 삭제 
	@RequestMapping(value="/menuDelete")
	public @ResponseBody void menuDelete(String mucode) {
		System.out.println("메뉴 삭제");
		msv.menuDelete(mucode);
	}
}
