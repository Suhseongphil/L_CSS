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

import com.L_CSS.dao.CompanyDao;
import com.L_CSS.dao.OrderDao;
import com.L_CSS.dao.ProductDao;
import com.L_CSS.dao.ReservationDao;
import com.L_CSS.dto.CafeDto;
import com.L_CSS.dto.CompanyDto;
import com.L_CSS.dto.OrderDto;
import com.L_CSS.dto.PageDto;
import com.L_CSS.dto.ProductDto;

@Service
public class CompanyService {

	@Autowired
	CompanyDao cdao;
	@Autowired
	ProductDao pdao;
	@Autowired
	OrderDao odao;
	@Autowired
	ReservationDao rdao;
	@Autowired
	private HttpSession session;

	
	private String savePath = "C:\\Users\\user\\git\\L_CSS\\src\\main\\webapp\\resources\\fileUpLoad\\CompanyFile";
	// 업체 업로드
	public ModelAndView comPanyUpLoad() {

		String max = cdao.getmax();
		String cmcode = "CM";

		if (max == null) {
			cmcode = cmcode + "001";
		} else {
			max = max.substring(2);
			int maxCode = Integer.parseInt(max) + 1;
			if (maxCode < 10) {
				cmcode = cmcode + "00" + maxCode;
			} else if (maxCode < 100) {
				cmcode = cmcode + "0" + maxCode;
			} else {
				cmcode = cmcode + maxCode;
			}

		}
		System.out.println(cmcode);

		return null;
	}

	// 업체 리스트 출력
	public ModelAndView companyList(String page) {
		System.out.println("companyList()호출");
		ModelAndView mav = new ModelAndView();
		int TotalCount = cdao.TotalCount();
		int page2 = 1;

		if (page != null) {
			page2 = Integer.parseInt(page);
		}
		;

		// 한페이지에 보여줄 글 개수
		int pageCount = 9;
		// 한페이지에 보여줄 페이지 번호 개수
		int pageNumCount = 5;

		int startRow = (page2 - 1) * pageCount + 1;
		int endRow = page2 * pageCount;

		int maxPage = (int) (Math.ceil((double) TotalCount / pageCount));
		int startPage = (int) (Math.ceil((double) page2 / pageCount));

		int endPage = startPage + pageNumCount - 1;

		if (endPage > maxPage) {
			endPage = maxPage;
		}
		ArrayList<CompanyDto> selestCompanyList = cdao.selectCompanyList(startRow, endRow);

		PageDto pagedto = new PageDto();
		pagedto.setPage(page2);
		pagedto.setMaxPate(maxPage);
		pagedto.setStartPage(startPage);
		pagedto.setEndPage(endPage);
		mav.addObject("pagedto", pagedto);
		mav.addObject("selestCompanyList", selestCompanyList);
		mav.setViewName("Company/CompanyList");

		return mav;
	}

	// 업체 상세보기
	public ModelAndView companyInfo(String cmcode) {
		System.out.println("companyInfo()호출");
		CompanyDto comInfo = cdao.ComInfo(cmcode);
		ArrayList<ProductDto> proInfo = pdao.proInfo(cmcode);
		ModelAndView mav = new ModelAndView();
		mav.addObject("comInfo", comInfo);
		mav.addObject("proInfo", proInfo);
		System.out.println("출력  : " + proInfo);
		mav.setViewName("Company/CompanyInfo");
		return mav;
	}

	// 주문 내역 호출
	public ModelAndView orderList() {
		System.out.println("orderList()호출");
		ModelAndView mav = new ModelAndView();
		String comId = (String) session.getAttribute("loginId");
		ArrayList<OrderDto> orList = odao.CompanyOrderList(comId);
		System.out.println(orList);
		mav.addObject("orList", orList);
		mav.setViewName("Company/CompanyOrderList");
		return mav;
	}

	// 주문 취소
	public ModelAndView deleteOrder(String recode) {
		System.out.println("주문취소");
		ModelAndView mav = new ModelAndView();
		int deleteOrder = rdao.deleteOrder(recode);

		mav.setViewName("Company/CompanyOrderList");
		return mav;
	}

	public ModelAndView createMycompany(CompanyDto company, RedirectAttributes ra) throws IllegalStateException, IOException {
		ModelAndView mav = new ModelAndView();
		
		// 업체코드 생성
		String max = cdao.getmax();
		String cmcode = "CM";
		System.out.println(max);
		if (max == null) {
			cmcode = cmcode + "001";
		} else {
			max = max.substring(2);
			int maxCode = Integer.parseInt(max) + 1;
			if (maxCode < 10) {
				cmcode = cmcode + "00" + maxCode;
			} else if (maxCode < 100) {
				cmcode = cmcode + "0" + maxCode;
			} else {
				cmcode = cmcode + maxCode;
			}
		}
		company.setCmcode(cmcode);
		System.out.println(cmcode);

		// 이미지 저장
		String imgFile = "";
		String cmimg = "";
		if (company.getCmimgs() != null) {
			MultipartFile[] imgs = company.getCmimgs();
			for (MultipartFile multipartFile : imgs) {
				UUID uuid = UUID.randomUUID();
				imgFile = uuid.toString() + "_" + multipartFile.getOriginalFilename();

				multipartFile.transferTo(new File(savePath, imgFile));
				cmimg = cmimg + "/" + imgFile;
			}

		}
		company.setCmimg(cmimg);


		// 주소
		if (company.getCmextraaddress().length() == 0 && company.getCmdetailaddress().length() == 0) {
			company.setCmaddress(company.getCmpostcode() + "_" + company.getCmaddr());
		} else {
			if (company.getCmextraaddress().length() == 0) {
				company.setCmaddress(company.getCmpostcode() + "_" + company.getCmaddr() + "_" + company.getCmdetailaddress());
			} else if (company.getCmdetailaddress().length() == 0) {
				company.setCmaddress(company.getCmpostcode() + "_" + company.getCmaddr() + "_" + company.getCmextraaddress());
			} else {
				company.setCmaddress(company.getCmpostcode() + "_" + company.getCmaddr() + "_" + company.getCmextraaddress() + "_"
						+ company.getCmdetailaddress());
			}
		}
		
		//업체 정보 입력
		System.out.println(company);
		
		int resultCompany = cdao.insertMyCompany(company);
		
		if (resultCompany > 0) {
			ra.addFlashAttribute("msg", "등록되었습니다.");
			mav.setViewName("Company/MycompanyInsert");
		} else {
			ra.addFlashAttribute("msg", "수정에 실패하였습니다.");
			mav.setViewName("redirect:/");
		}

return mav;
}

	public ModelAndView mycompanyInfo(RedirectAttributes ra) {
		ModelAndView mav = new ModelAndView();
		System.out.println("mycafeInfo() 호출");
		String loginId = (String) session.getAttribute("loginId");
		System.out.println("로그인아이디 : " + loginId);
		
		CompanyDto mycompanyInfo = cdao.MycompanyInfo(loginId);
		
		String[] mpost = mycompanyInfo.getCmaddress().split("_");
		
		System.out.println("mpost.length : " + mpost.length);
		if (mpost.length != 4) {

			mycompanyInfo.setCmaddr2(mpost[2]);
			mycompanyInfo.setCmextraaddress(mpost[2]);

		} else {
			System.out.println(mpost[3]);
			mycompanyInfo.setCmaddr2(mpost[2] + "  " + mpost[3]);
			mycompanyInfo.setCmdetailaddress(mpost[3]);
			mycompanyInfo.setCmextraaddress(mpost[2]);
		}
		mycompanyInfo.setCmpostcode(mpost[0]);
		mycompanyInfo.setCmaddr(mpost[1]);
		System.out.println(mpost[0]);
		
		mav.addObject("mycompanyInfo", mycompanyInfo);
		mav.setViewName("Company/MyCompanyInfo");
		
		return mav;
	}
	
}
