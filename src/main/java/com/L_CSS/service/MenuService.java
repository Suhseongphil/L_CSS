package com.L_CSS.service;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.L_CSS.dao.MenuDao;
import com.L_CSS.dto.CafeDto;
import com.L_CSS.dto.MenuDto;
import com.google.gson.Gson;

@Service
public class MenuService {

	@Autowired
	MenuDao mdao;
	
	@Autowired
	private HttpSession session;

	// 본인 로컬주소로 변경!
	private String savePath_mu = "C:\\Users\\user\\git\\L_CSS\\src\\main\\webapp\\resources\\fileUpLoad\\MenuFile";

	public ModelAndView menuUpLoad() {

		String max = mdao.getmax();
		String mucode = "MU";

		if (max == null) {
			mucode = mucode + "0001";
		} else {
			max = max.substring(2);
			int maxCode = Integer.parseInt(max) + 1;
			if (maxCode < 10) {
				mucode = mucode + "000" + maxCode;
			} else if (maxCode < 100) {
				mucode = mucode + "00" + maxCode;
			}else if (maxCode < 1000) {
				mucode = mucode + "0" + maxCode;
			} else {
				mucode = mucode + maxCode;
			}

		}
		System.out.println(mucode);
		return null;
	}

	// 메뉴 정보 입력
	public void menuInsert(MenuDto menu) throws IllegalStateException, IOException {
		System.out.println("menuInsert ()호출");

		String max = mdao.getmax();
		String mucode = "MU";

		if (max == null) {
			mucode = mucode + "001";
		} else {
			max = max.substring(2);
			int maxCode = Integer.parseInt(max) + 1;
			if (maxCode < 10) {
				mucode = mucode + "00" + maxCode;
			} else if (maxCode < 100) {
				mucode = mucode + "0" + maxCode;
			} else {
				mucode = mucode + maxCode;
			}

		}
		menu.setMucode(mucode);

		// 이미지 저장

		MultipartFile muFile = menu.getMuims();

		System.out.println(muFile.getOriginalFilename());
		String fileName = muFile.getOriginalFilename();
		String muimg = "";
		if (!muFile.isEmpty()) {
			if (fileName.contains("BS")) {
				muimg = fileName;

			} else {

				UUID uuid = UUID.randomUUID();
				muimg = uuid.toString() + "_" + muFile.getOriginalFilename();

				muFile.transferTo(new File(savePath_mu, muimg));

			}

		}

		menu.setMuimg(muimg);
		int insertMenu = mdao.insertMenu(menu);
	}

	// 메뉴정보 출력
	public String getMenu() {
		System.out.println("getMenu () 호출");
		ArrayList<MenuDto> menuList = mdao.getMenu();
		Gson gson = new Gson();
		String menu = gson.toJson(menuList);

		return menu;
	}

	// 메뉴 상태 변경 기능
	public void mustateModify(String mucode, int mustate) {
		System.out.println("mustateModify()호출");

		if (mustate == 0) {
			mustate = 1;
		} else {
			mustate = 0;
		}

		int updateMustate = mdao.updateState(mucode, mustate);

	}

	// 메뉴 삭제
	public void menuDelete(String mucode, String muimg) {
		System.out.println("menuDelete()호출");

		if (!muimg.contains("BS")) {
			File file = new File(savePath_mu + "/" + muimg);
			file.delete();
		}

		int deleteMenu = mdao.deleteMenu(mucode);

	}

	public ModelAndView mycafeMenu(RedirectAttributes ra) {
		ModelAndView mav = new ModelAndView();
		System.out.println("mycafeMenu() 호출");
		String loginId = (String) session.getAttribute("loginId");
		System.out.println("로그인아이디 : " + loginId);
		
		CafeDto mycafeInfo = mdao.MyCafeInfo(loginId);
		
		
		mav.addObject("mycafeInfo", mycafeInfo);
		mav.setViewName("Cafe/MycafeMenu");
		return mav;
	}

	public String getMyMenu(String mucfcode) {
		System.out.println("getMyMenu() 호출");
		System.out.println(mucfcode);
		ArrayList<MenuDto> menuList = mdao.getMyMenu(mucfcode);
		System.out.println(menuList);
		Gson gson = new Gson();
		String menu = gson.toJson(menuList);
		
		
		return menu;
	}
	/* 여기부터 해야됨
	public void MymuModify(MenuDto menu) {

		System.out.println("MymuModify() 호출");
		
		String imgFile = "";
		//기존이미지 가져오기
		String cfmuimg = mdao.getMyMenuImg(menu.getMucode());
		MultipartFile imgs = menu.getMuimg();
		if (!imgs.isEmpty()) {
			File file = new File(savePath_mu + cfmuimg);
			file.delete();
			UUID uuid = UUID.randomUUID();
			cfmuimg = uuid.toString() + "_" + imgs.getOriginalFilename();
			imgs.transferTo(new File(savePath_mu, cfmuimg));

		}
		menu.setmuimg(cfmuimg);
		
		int updateMymenu = mdao.updateMymenu(menu);
		
	}
	 */
}
