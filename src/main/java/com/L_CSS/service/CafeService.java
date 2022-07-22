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

import com.L_CSS.dao.CafeDao;
import com.L_CSS.dao.MenuDao;
import com.L_CSS.dto.CafeDto;
import com.L_CSS.dto.MenuDto;
import com.L_CSS.dto.PageDto;

@Service
public class CafeService {
	
	@Autowired
	CafeDao cdao;
	@Autowired
	MenuDao mdao;
	@Autowired
	private HttpSession session;
	
	private String savePath = "C:\\Users\\user\\git\\L_CSS\\src\\main\\webapp\\resources\\fileUpLoad\\CafeFile";
	
	//카페 업로드 요청
	public ModelAndView CafeUpLoad() {
		
		String max = cdao.getmax();
		String cfcode = "CF";
		
		if(max == null) {
			cfcode = cfcode + "001";
		}else {
			max = max.substring(2);
			int maxCode = Integer.parseInt(max)+1;		
			if(maxCode < 10) {
			cfcode = cfcode + "00" + maxCode;
		}else if(maxCode < 100) {
			cfcode = cfcode + "0" + maxCode;
		}else {
			cfcode = cfcode + maxCode;
		}
		
		
		}
		
		
		return null;
	}

	//카페 목록 요청
	public ModelAndView cafeList(String page) {
		System.out.println("cafeList()호출");
		ModelAndView mav = new ModelAndView();
		int TotalCount = cdao.TotalCount();
		int page2 = 1;
		
		if(page != null) {
			page2 = Integer.parseInt(page);
		};
		
		//한페이지에 보여줄 글 개수
		int pageCount = 8;
		//한페이지에 보여줄 페이지 번호 개수
		int pageNumCount = 5;
		
		int startRow = (page2 - 1) * pageCount +1;
		int endRow = page2 * pageCount;
		
		int maxPage = (int)(Math.ceil((double)TotalCount/pageCount));
		int startPage = (int)(Math.ceil((double)page2/pageCount));
		
		int endPage = startPage + pageNumCount-1;
		
		if(endPage > maxPage) {
			endPage = maxPage;
		}
		System.out.println(startRow);
		System.out.println(endRow);
		ArrayList<CafeDto> selectCafeList = cdao.selectCafeList(startRow,endRow);
		PageDto pagedto = new PageDto();
		pagedto.setPage(page2);
		pagedto.setMaxPate(maxPage);
		pagedto.setStartPage(startPage);
		pagedto.setEndPage(endPage);
		mav.addObject("pagedto",pagedto);
		mav.addObject("selectCafeList",selectCafeList);
		mav.setViewName("Cafe/CafeList");
		System.out.println(selectCafeList);
		
		return mav;
	}
	//카페 상세보기 요청
	public ModelAndView cafeInfo(String cfcode) {
		System.out.println("cafeInfo()호출");
		ModelAndView mav = new ModelAndView();
		CafeDto cafeInfo = cdao.CafeInfo(cfcode);
		ArrayList<MenuDto>menuInfo = mdao.MenuInfo(cfcode);
		mav.addObject("cafeInfo", cafeInfo);
		mav.addObject("menuInfo", menuInfo);
		mav.setViewName("Cafe/CafeInfo");
		return mav;
	}

	public ModelAndView createMycafe(CafeDto cafe, RedirectAttributes ra) throws IllegalStateException, IOException {
		System.out.println("createMycafe() 호출");
		ModelAndView mav = new ModelAndView();
		
		
		// 카페코드 생성
				String max = cdao.getmax();
				String cfcode = "CF";
				if (max == null) {
					cfcode = cfcode + "001";
				} else {
					max = max.substring(2);
					int maxCode = Integer.parseInt(max) + 1;
					if (maxCode < 10) {
						cfcode = cfcode + "00" + maxCode;
					} else if (maxCode < 100) {
						cfcode = cfcode + "0" + maxCode;
					} else {
						cfcode = cfcode + maxCode;
					}
				}
				cafe.setCfcode(cfcode);

				// 이미지 저장
				String imgFile = "";
				String cfimg = "";
				if (cafe.getCfimgs() != null) {
					MultipartFile[] imgs = cafe.getCfimgs();
					for (MultipartFile multipartFile : imgs) {
						UUID uuid = UUID.randomUUID();
						imgFile = uuid.toString() + "_" + multipartFile.getOriginalFilename();

						multipartFile.transferTo(new File(savePath, imgFile));
						cfimg = cfimg + "/" + imgFile;
					}

				}
				cafe.setCfimg(cfimg);

				MultipartFile sgimgFile = cafe.getCfsigimgs();
				String cfsgimg = "";
				if (!sgimgFile.isEmpty()) {
					UUID uuid = UUID.randomUUID();
					cfsgimg = uuid.toString() + "_" + sgimgFile.getOriginalFilename();
					sgimgFile.transferTo(new File(savePath, cfsgimg));
				}
				cafe.setCfsigimg(cfsgimg);

				// 주소
				if (cafe.getCfextraaddress().length() == 0 && cafe.getCfdetailaddress().length() == 0) {
					cafe.setCfaddress(cafe.getCfpostcode() + "_" + cafe.getCfaddr());
				} else {
					if (cafe.getCfextraaddress().length() == 0) {
						cafe.setCfaddress(cafe.getCfpostcode() + "_" + cafe.getCfaddr() + "_" + cafe.getCfdetailaddress());
					} else if (cafe.getCfdetailaddress().length() == 0) {
						cafe.setCfaddress(cafe.getCfpostcode() + "_" + cafe.getCfaddr() + "_" + cafe.getCfextraaddress());
					} else {
						cafe.setCfaddress(cafe.getCfpostcode() + "_" + cafe.getCfaddr() + "_" + cafe.getCfextraaddress() + "_"
								+ cafe.getCfdetailaddress());
					}
				}
				
				//카페 정보 입력
				System.out.println(cafe);
				
				int resultCafe = cdao.insertMyCafe(cafe);
				
				if (resultCafe > 0) {
					ra.addFlashAttribute("msg", "등록되었습니다.");
					mav.setViewName("Cafe/MycafeInsert");
				} else {
					ra.addFlashAttribute("msg", "수정에 실패하였습니다.");
					mav.setViewName("redirect:/");
				}
		
		return mav;
	}

	public ModelAndView mycafeInfo(RedirectAttributes ra) {
		ModelAndView mav = new ModelAndView();
		System.out.println("mycafeInfo() 호출");
		String loginId = (String) session.getAttribute("loginId");
		System.out.println("로그인아이디 : " + loginId);
		
		CafeDto mycafeInfo = cdao.MyCafeInfo(loginId);
		
		String[] mpost = mycafeInfo.getCfaddress().split("_");
		
		System.out.println("mpost.length : " + mpost.length);
		if (mpost.length != 4) {

			mycafeInfo.setCfaddr2(mpost[2]);
			mycafeInfo.setCfextraaddress(mpost[2]);

		} else {
			System.out.println(mpost[3]);
			mycafeInfo.setCfaddr2(mpost[2] + "  " + mpost[3]);
			mycafeInfo.setCfdetailaddress(mpost[3]);
			mycafeInfo.setCfextraaddress(mpost[2]);
		}
		mycafeInfo.setCfpostcode(mpost[0]);
		mycafeInfo.setCfaddr(mpost[1]);
		System.out.println(mpost[0]);
		
		mav.addObject("mycafeInfo", mycafeInfo);
		mav.setViewName("Cafe/MycafeInfo");
		
		
		
		return mav;
	}

	public ModelAndView mycafeModify(CafeDto cafe, RedirectAttributes ra) throws IllegalStateException, IOException {
		System.out.println("mycafeModify()호출");
		System.out.println("수정할 카페 정보");
		ModelAndView mav = new ModelAndView();
		String imgFile = "";
		//기존이미지 가져오기
		String cfimg = cdao.getCafeImg(cafe.getCfmid());
		String cfsgimg = cdao.getCafesigImg(cafe.getCfmid());
		MultipartFile imgs = cafe.getCfimgs2();
		if (!imgs.isEmpty()) {
			File file = new File(savePath + cfimg);
			file.delete();
			UUID uuid = UUID.randomUUID();
			cfimg = uuid.toString() + "_" + imgs.getOriginalFilename();
			imgs.transferTo(new File(savePath, cfimg));

		}
		cafe.setCfimg(cfimg);

		MultipartFile sgimgFile = cafe.getCfsigimgs();
		if (!sgimgFile.isEmpty()) {
			File file = new File(savePath + cfsgimg);
			file.delete();
			UUID uuid = UUID.randomUUID();
			cfsgimg = uuid.toString() + "_" + sgimgFile.getOriginalFilename();
			sgimgFile.transferTo(new File(savePath, cfsgimg));
		}
		cafe.setCfsigimg(cfsgimg);
		
		
		
		if (cafe.getCfextraaddress().length() == 0 && cafe.getCfdetailaddress().length() == 0) {
			cafe.setCfaddress(cafe.getCfpostcode() + "_" + cafe.getCfaddr());
		} else {
			if (cafe.getCfextraaddress().length() == 0) {
				cafe.setCfaddress(cafe.getCfpostcode() + "_" + cafe.getCfaddr() + "_" + cafe.getCfdetailaddress());
			} else if (cafe.getCfdetailaddress().length() == 0) {
				cafe.setCfaddress(cafe.getCfpostcode() + "_" + cafe.getCfaddr() + "_" + cafe.getCfextraaddress());
			} else {
				cafe.setCfaddress(cafe.getCfpostcode() + "_" + cafe.getCfaddr() + "_" + cafe.getCfextraaddress() + "_"
						+ cafe.getCfdetailaddress());
			}
		}
		
		System.out.println(cafe);
		
		int updateMycafe = cdao.updateMycafe(cafe);
		
		if (updateMycafe > 0) {
			ra.addFlashAttribute("msg", "수정되었습니다.");
			mav.setViewName("redirect:/");
		} else {
			ra.addFlashAttribute("msg", "수정에 실패하였습니다.");
			mav.setViewName("redirect:/mycafeModify");
		}
		return mav;
	}

	
}
