package com.L_CSS.service;

import java.io.File;
import java.io.IOException;
import java.net.URLEncoder;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.L_CSS.dao.MemberDao;
import com.L_CSS.dto.MemberDto;
import com.google.gson.Gson;

@Service
public class MemberService {

	@Autowired
	MemberDao mdao;

	@Autowired
	private HttpSession session;
	private String savePath = "C:\\Users\\user\\git\\L_CSS\\src\\main\\webapp\\resources\\fileUpLoad\\MemberFrofile";
	
	
	// 회원가입 요청 메소드
	public ModelAndView memberJoin(MemberDto member, RedirectAttributes ra, HttpServletResponse response) throws IllegalStateException, IOException {
		System.out.println("memberJoin ()호출");
		System.out.println(member);
		ModelAndView mav = new ModelAndView();
		String email = member.getMemail() + "@" + member.getEmailDomain();
		MultipartFile mfile = member.getMfile();

		member.setMemail(email);
		System.out.println(mfile.isEmpty()); // 첨부파일이 있는지없는지 비교해주는 방법
		String mprofile = "";
		String bsfile = "BS.jpg";
		if (!mfile.isEmpty()) {
			System.out.println("첨부파일 있음");

			// 32자리의 임의코드를 만들어주는 명령어
			UUID uuid = UUID.randomUUID();
			System.out.println(uuid.toString() + "_" + mfile.getOriginalFilename());
			// 1.파일명 생성 (파일명이 중복되지않게 생성)
			mprofile = uuid.toString() + "_" + mfile.getOriginalFilename();
			// 프로필 이미지 파일 저장
			mfile.transferTo(new File(savePath, mprofile));

		} else {
			mprofile = bsfile;

		}

		if (member.getMextraaddress().length() == 0 && member.getMdetailaddress().length() == 0) {
			member.setMaddress(member.getMpostercode() + "_" + member.getMaddr());
		} else {
			if (member.getMextraaddress().length() == 0) {
				member.setMaddress(
						member.getMpostercode() + "_" + member.getMaddr() + "_" + member.getMdetailaddress());
			} else if (member.getMdetailaddress().length() == 0) {
				member.setMaddress(member.getMpostercode() + "_" + member.getMaddr() + "_" + member.getMextraaddress());
			} else {
				member.setMaddress(member.getMpostercode() + "_" + member.getMaddr() + "_" + member.getMextraaddress()
						+ "_" + member.getMdetailaddress());
			}
		}

		member.setMprofile(mprofile);

		int inserMember = mdao.InsertMember(member);

		if (inserMember > 0) {
			ra.addFlashAttribute("msg", "회원가입 되었습니다.");
			mav.setViewName("redirect:/memberLoginPage");
		} else {
			ra.addFlashAttribute("msg", "회원가입 실패하였습니다.");
			mav.setViewName("redirect:/memberJoin");
		}
		return mav;
	}

	// 로그인 요청 메소드
	public ModelAndView memberLogin(String mid, String mpw, RedirectAttributes ra) {
		System.out.println("memberLogin()호출");
		ModelAndView mav = new ModelAndView();
		System.out.println(mid);
		System.out.println(mpw);

		MemberDto memberLogin = mdao.MemberLogin(mid, mpw);
		if (mid.equals("adMin") && mpw.equals("1234")) {
			mav.setViewName("redirect:/admin");
		} else {
			
			int mstateCheck = memberLogin.getMstate();
			if (memberLogin != null && mstateCheck == 0) {
				session.setAttribute("loginId", memberLogin.getMid());
				session.setAttribute("myProfile", memberLogin.getMprofile());
				session.setAttribute("loginType", memberLogin.getMtype());
				
				mav.setViewName("Main");
			} else {
				
				if(mstateCheck == 0) {
					
					ra.addFlashAttribute("msg","아이디또는 비밀번호가 틀렸습니다.");
					mav.setViewName("redirect:/memberLoginPage");
				}else {
					ra.addFlashAttribute("msg","활동정지된 계정입니다.");
					mav.setViewName("redirect:/memberLoginPage");
				}
				
			}
		}
		return mav;
	}

	// 내정보 페이지 요청
	public ModelAndView memberInfo(String mpw, RedirectAttributes ra) {
		ModelAndView mav = new ModelAndView();
		System.out.println("memberInfo ()호출");
		String loginId = (String) session.getAttribute("loginId");
		System.out.println("로그인아이디 : " + loginId);
		System.out.println(mpw);

		MemberDto MyInfoResult = mdao.MyInfoResult(loginId, mpw);

		if (MyInfoResult != null) {
			MemberDto MemberInfo = mdao.MemberInfo(loginId);
			String memail2 = MemberInfo.getMemail();
			MemberInfo.setMemail2(memail2);
			String[] mpost = MemberInfo.getMaddress().split("_");
			String[] email = MemberInfo.getMemail().split("@");
			
			System.out.println("memail2 :" + memail2);
			System.out.println("mpost.length : " + mpost.length);
			if (mpost.length != 4) {

				MemberInfo.setMaddr2(mpost[2]);
				MemberInfo.setMextraaddress(mpost[2]);

			} else {
				System.out.println(mpost[3]);
				MemberInfo.setMaddr2(mpost[2] + "  " + mpost[3]);
				MemberInfo.setMdetailaddress(mpost[3]);
				MemberInfo.setMextraaddress(mpost[2]);
			}
			MemberInfo.setMpostercode(mpost[0]);
			MemberInfo.setMaddr(mpost[1]);

			System.out.println(email[0]);
			System.out.println(email[1]);

			MemberInfo.setEmailDomain(email[1]);
			MemberInfo.setMemail(email[0]);

			mav.addObject("memberInfo", MemberInfo);
			mav.setViewName("Member/MemberInfo");

		} else {
			ra.addFlashAttribute("msg", "비밀번호가 틀렸습니다.");
			mav.setViewName("redirect:/memberInfo");
		}

		return mav;
	}

	// 로그아웃 요청
	public ModelAndView memberLogout(RedirectAttributes ra, HttpServletResponse response, HttpServletRequest request) throws IOException {
		System.out.println("memberLogout()요청");
		ModelAndView mav = new ModelAndView();
		
		session.invalidate();
		
		
		mav.setViewName("redirect:/");
		
		
		return mav;
	}

	public ModelAndView memberKakaoLogin(MemberDto member, RedirectAttributes ra) {
		System.out.println("MemberService.memberKakaoLogin() 호출");
		ModelAndView mav = new ModelAndView();

		MemberDto kakaoMember = mdao.selectMemberKakao(member.getMid());
		System.out.println(kakaoMember);
		if (kakaoMember != null) {
			// 로그인 처리
			session.setAttribute("loginId", kakaoMember.getMid());
			session.setAttribute("loginProfile", kakaoMember.getMprofile());
			ra.addFlashAttribute("msg", "카카오 계정으로 로그인 되었습니다.");
			mav.setViewName("redirect:/");

		} else {
			// 회원가입 처리
			member.setMpw("1234");
			mdao.insertMemberKakao(member);
			ra.addFlashAttribute("msg", "회원정보가 등록 되었습니다. 다시 로그인 해주세요!");
			mav.setViewName("redirect:/MemberLoginPage");
		}

		return mav;
	}

	public ModelAndView memberModify(MemberDto member, RedirectAttributes ra)
			throws IllegalStateException, IOException {
		System.out.println("MemberService.memberModify() 호출");
		System.out.println("수정할 회원 정보");
		ModelAndView mav = new ModelAndView();
		String email = member.getMemail() + "@" + member.getEmailDomain();
		member.setMemail(email);
		System.out.println(member.getMemail());
		if (member.getMextraaddress().length() == 0 && member.getMdetailaddress().length() == 0) {
			member.setMaddress(member.getMpostercode() + "_" + member.getMaddr());
		} else {
			if (member.getMextraaddress().length() == 0) {
				member.setMaddress(
						member.getMpostercode() + "_" + member.getMaddr() + "_" + member.getMdetailaddress());
			} else if (member.getMdetailaddress().length() == 0) {
				member.setMaddress(member.getMpostercode() + "_" + member.getMaddr() + "_" + member.getMextraaddress());
			} else {
				member.setMaddress(member.getMpostercode() + "_" + member.getMaddr() + "_" + member.getMextraaddress()
						+ "_" + member.getMdetailaddress());
			}

		}

		System.out.println(member);

		int updateResult = mdao.memberUpdate(member);

		if (updateResult > 0) {
			ra.addFlashAttribute("msg", "수정되었습니다.");
			mav.setViewName("Member/MyInfo");
		} else {
			ra.addFlashAttribute("msg", "수정에 실패하였습니다.");
			mav.setViewName("redirect:/");
		}
		return mav;
	}
	//아이디 중복체크
	public String idCheck(String inputId) {
		System.out.println("idCheck()호출");
		System.out.println(inputId);
		Gson gson = new Gson();
		
		String idCheck = mdao.idCheck(inputId);
		
		
		
		if(idCheck == null) {
			return "OK";
		}else {
			return "NO";
		}
		
	}

}
