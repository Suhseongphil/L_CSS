package com.L_CSS.service;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.L_CSS.dao.MemberDao;
import com.L_CSS.dto.MemberDto;

@Service
public class MemberService {
	
	@Autowired
	MemberDao mdao;
	
	@Autowired
	private HttpSession session;
	private String savePath = "C:\\Users\\user\\git\\L_CSS\\L_CSS\\src\\main\\webapp\\resources\\mprofileUpLoad";
	//회원가입 요청 메소드
	public ModelAndView memberJoin(MemberDto member, RedirectAttributes ra) throws IllegalStateException, IOException {
		System.out.println("memberJoin ()호출");
		System.out.println(member);
		ModelAndView mav = new ModelAndView();
		
		
		MultipartFile mfile = member.getMfile();

		System.out.println(mfile.isEmpty()); // 첨부파일이 있는지없는지 비교해주는 방법
		String mprofile = "";
		if (!mfile.isEmpty()) {
			System.out.println("첨부파일 있음");

			// 32자리의 임의코드를 만들어주는 명령어
			UUID uuid = UUID.randomUUID();
			System.out.println(uuid.toString() + "_" + mfile.getOriginalFilename());
			// 1.파일명 생성 (파일명이 중복되지않게 생성)
			mprofile = uuid.toString() + "_" + mfile.getOriginalFilename();
			// 프로필 이미지 파일 저장
			mfile.transferTo(new File(savePath, mprofile));

		}
		
		if (member.getSample6_extraAddress().length() == 0 && member.getSample6_detailAddress().length() == 0) {
			member.setMaddress(member.getSample6_postcode() + "_" + member.getSample6_address());
		} else {
			if (member.getSample6_extraAddress().length() == 0) {
				member.setMaddress(member.getSample6_postcode() + "_" + member.getSample6_address() + "_" + member.getSample6_detailAddress());
			} else if (member.getSample6_detailAddress().length() == 0) {
				member.setMaddress(member.getSample6_postcode() + "_" + member.getSample6_address() + "_" + member.getSample6_extraAddress());
			} else {
				member.setMaddress(member.getSample6_postcode() + "_" + member.getSample6_address() + "_" + member.getSample6_extraAddress() + "_"
						+ member.getSample6_detailAddress());
			}
		}
		
		
		System.out.println("mprofile : " + mprofile);
		member.setMprofile(mprofile);
	
		int inserMember = mdao.InsertMember(member);
		
		if(inserMember > 0) {
			ra.addFlashAttribute("msg", "회원가입 되었습니다.");
			mav.setViewName("redirect:/Main");
		}else {
			ra.addFlashAttribute("msg", "회원가입 실패하였습니다.");
			mav.setViewName("redirect:/memberJoin");
		}
		return mav;
	}
	
	//로그인 요청 메소드
	public ModelAndView memberLogin(String mid, String mpw, RedirectAttributes ra) {
		System.out.println("memberLogin()호출");
		ModelAndView mav = new ModelAndView();
		System.out.println(mid);
		System.out.println(mpw);
		
		MemberDto memberLogin = mdao.MemberLogin(mid,mpw);
		
		if(memberLogin != null) {
			session.setAttribute("loginId", memberLogin.getMid());
			session.setAttribute("myProfile", memberLogin.getMprofile());
			mav.setViewName("Main");
		}else {
			ra.addFlashAttribute("msg", "아이디 또는 비밀번호가 틀렸습니다.");
			mav.setViewName("redirect:/MemberLogin");
		}
		
		return mav;
	}
	
	//내정보 페이지 요청
	public ModelAndView memberInfo() {
		ModelAndView mav = new ModelAndView();
		System.out.println("memberInfo ()호출");
		String loginId = (String)session.getAttribute("loginId");
		System.out.println("로그인아이디 : " + loginId);
		
		MemberDto MemberInfo = mdao.MemberInfo(loginId);
		
		mav.addObject("memberInfo", MemberInfo);
		mav.setViewName("Member/MemberInfo");
		
		
		return mav;
	}
	//로그아웃 요청
	public ModelAndView memberLogout() {
		System.out.println("memberLogout()요청");
		ModelAndView mav = new ModelAndView();
		
		session.invalidate();
		
		mav.setViewName("Main");
		return mav;
	}
}
