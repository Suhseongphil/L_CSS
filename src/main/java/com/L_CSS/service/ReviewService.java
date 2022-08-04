package com.L_CSS.service;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.L_CSS.dao.ReservationDao;
import com.L_CSS.dao.ReviewDao;

@Service
public class ReviewService {
	
	@Autowired
	ReviewDao rdao;
	@Autowired
	ReservationDao redao;
	@Autowired
	private HttpSession session;
	public ModelAndView reViewUpLoad() {
		
		String max = rdao.getmax();
		String rvrecode = "RV";
		
		if(max == null) {
			rvrecode = rvrecode + "001";
		}else {
			max = max.substring(2);
			int maxCode = Integer.parseInt(max)+1;		
			if(maxCode < 10) {
				rvrecode = rvrecode + "00" + maxCode;
		}else if(maxCode < 100) {
			rvrecode = rvrecode + "0" + maxCode;
		}else {
			rvrecode = rvrecode + maxCode;
		}
		
		
		}
		System.out.println(rvrecode);
		
		
		return null;
	
	}
	//리뷰 작성요청
	public String insertReview(String pdcode, String recomment, RedirectAttributes ra, String recode) {
		System.out.println("insertReView()호출");
		String loginId = (String)session.getAttribute("loginId");
		
		int insertResult = rdao.insertResult(pdcode,recomment,loginId,recode);
			
			if(insertResult > 0) {
				redao.updateResult(recode);
				ra.addFlashAttribute("msg", "리뷰가 작성되었습니다.");
				return "redirect:/orderhistory";
			}else {
				ra.addFlashAttribute("msg", "리뷰 작성에 실패하였습니다.");
				return "redirect:/orderhistory";
			}
		
		
	}
	
	
}
