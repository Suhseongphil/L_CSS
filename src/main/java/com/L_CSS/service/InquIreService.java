package com.L_CSS.service;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.L_CSS.dao.InquIreDao;
import com.L_CSS.dto.AnswerDto;
import com.L_CSS.dto.InquIreDto;
import com.google.gson.Gson;

@Service
public class InquIreService {

	@Autowired
	InquIreDao Idao;
	// 사용자 변경시 주소 변경 확인하기
	private String savePath = "C:\\Users\\user\\git\\L_CSS\\src\\main\\webapp\\resources\\fileUpLoad\\InquireFile";
	
	public ModelAndView InquIreUpLoad() {

		String max = Idao.getmax();
		String iqcode = "IQ";

		if (max == null) {
			iqcode = iqcode + "001";
		} else {
			max = max.substring(2);
			int maxCode = Integer.parseInt(max) + 1;
			if (maxCode < 10) {
				iqcode = iqcode + "00" + maxCode;
			} else if (maxCode < 100) {
				iqcode = iqcode + "0" + maxCode;
			} else {
				iqcode = iqcode + maxCode;
			}

		}
		System.out.println(iqcode);
		return null;
	}

	// 문의 내용 작성
	public ModelAndView insertInquire(InquIreDto in) throws IllegalStateException, IOException {
		System.out.println("insertInquire()호출 ");
		ModelAndView mav = new ModelAndView();
		String max = Idao.getmax();
		String iqcode = "IQ";

		if (max == null) {
			iqcode = iqcode + "001";
		} else {
			max = max.substring(2);
			int maxCode = Integer.parseInt(max) + 1;
			if (maxCode < 10) {
				iqcode = iqcode + "00" + maxCode;
			} else if (maxCode < 100) {
				iqcode = iqcode + "0" + maxCode;
			} else {
				iqcode = iqcode + maxCode;
			}

		}
		in.setIqcode(iqcode);
		MultipartFile iqfile = in.getIqfile();
		String iqimgFile = "";
		if (!iqfile.isEmpty()) {
			System.out.println("첨부파일 있음");
			// 32자리의 임의코드를 만들어주는 명령어
			UUID uuid = UUID.randomUUID();
			System.out.println(uuid.toString() + "_" + iqfile.getOriginalFilename());
			// 1.파일명 생성 (파일명이 중복되지않게 생성)
			iqimgFile = uuid.toString() + "_" + iqfile.getOriginalFilename();
			// 프로필 이미지 파일 저장
			iqfile.transferTo(new File(savePath, iqimgFile));

		} else {

		}
		in.setIqimg(iqimgFile);
		System.out.println(in);

		// 줄바꿈, 띄어쓰기 처리
		String gbcomment = in.getIqcomment();
		gbcomment = gbcomment.replaceAll(" ", "&nbsp;");
		gbcomment = gbcomment.replaceAll("\r\n", "<br>");
		in.setIqcomment(gbcomment);

		int insertInquire = Idao.insertInquire(in);

		mav.setViewName("option/Inquire");
		return mav;
	}

	// 내 문의내용 출력
	public String selectInquire(String loginId) {
		System.out.println("selectInquire()호출");
		Gson gson = new Gson();
		ArrayList<InquIreDto> inquireList = Idao.selectInquire(loginId);
		System.out.println(inquireList);
		String inquire = gson.toJson(inquireList);

		return inquire;
	}

	// 검색기능
	public ModelAndView searchText(String iqcategory, String searchText) {
		System.out.println("serchText()호출");
		ModelAndView mav = new ModelAndView();
		ArrayList<InquIreDto> searchList = Idao.searchList(iqcategory, searchText);
		System.out.println(searchList);
		mav.addObject("searchList", searchList);
		mav.setViewName("option/searchInquire");
		return mav;
	}

	// 문의 상세보기
	public ModelAndView inquireInfo(String iqcode) {
		System.out.println("inquireInfo()호출");
		ModelAndView mav = new ModelAndView();

		InquIreDto inquireInfo = Idao.inquireInfo(iqcode);
		AnswerDto AnswerList = Idao.AnswerList(iqcode);

		// 줄바꿈, 띄어쓰기 처리
		if (AnswerList != null) {
			String gbcomment = AnswerList.getAncomment();
			gbcomment = gbcomment.replaceAll("&nbsp;", " ");
			gbcomment = gbcomment.replaceAll("<br>", "\r\n");
			AnswerList.setAncomment(gbcomment);
		}

		String gbcomment2 = inquireInfo.getIqcomment();
		gbcomment2 = gbcomment2.replaceAll("&nbsp;", " ");
		gbcomment2 = gbcomment2.replaceAll("<br>", "\r\n");
		inquireInfo.setIqcomment(gbcomment2);

		mav.addObject("inquireInfo", inquireInfo);
		mav.addObject("AnswerList", AnswerList);
		mav.setViewName("option/InquireInfo");
		return mav;
	}

	// 문의 삭제
	public ModelAndView deleteInquire(String iqcode) {
		System.out.println("inquireInfo()호출");
		ModelAndView mav = new ModelAndView();

		InquIreDto delIqInfo = Idao.delIqInfo(iqcode);
		
		// 기존 이미지 삭제
		if (delIqInfo.getIqimg() != null) {
			File file = new File(savePath + "/" +delIqInfo.getIqimg());
			file.delete();
		}

		Idao.deleteInquire(iqcode);

		mav.setViewName("redirect:/inquirePage");
		return mav;
	}

}
