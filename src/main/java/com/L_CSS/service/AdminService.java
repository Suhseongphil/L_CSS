package com.L_CSS.service;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.L_CSS.dao.AdminDao;
import com.L_CSS.dao.InquIreDao;
import com.L_CSS.dto.CafeDto;
import com.L_CSS.dto.CompanyDto;
import com.L_CSS.dto.InquIreDto;
import com.L_CSS.dto.MemberDto;
import com.google.gson.Gson;

@Service
public class AdminService {

	@Autowired
	AdminDao adao;
	@Autowired
	InquIreDao Idao;
	// 저장경로 ) 본인 로컬주소로 변경!!
	private String savePath_cm = "/Users/suhseongphil/Programming/github_project/L_CSS/src/main/webapp/resources/fileUpLoad/CompanyFile";
	private String savePath_cf = "/Users/suhseongphil/Programming/github_project/L_CSS/src/main/webapp/resources/fileUpLoad/CafeFile";
	private String savePath_mb = "/Users/suhseongphil/Programming/github_project/L_CSS/src/main/webapp/resources/fileUpLoad/MemberFrofile";

	public void insertCompany(CompanyDto company) throws IllegalStateException, IOException {
		System.out.println("AdminService.insertCompany() 호출");

		// 회사코드 생성
		String max = adao.getMaxCmcode();
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
		company.setCmcode(cmcode);

		// 이미지 저장
		String imgFile = "";
		String cmimg = "";
		if (company.getCmimgs() != null) {
			MultipartFile[] imgs = company.getCmimgs();
			for (MultipartFile multipartFile : imgs) {
				UUID uuid = UUID.randomUUID();
				imgFile = uuid.toString() + "_" + multipartFile.getOriginalFilename();

				multipartFile.transferTo(new File(savePath_cm, imgFile));
				cmimg = cmimg + "/" + imgFile;
			}
		}
		company.setCmimg(cmimg);

		// 주소
		if (company.getCmextraaddress().length() == 0 && company.getCmdetailaddress().length() == 0) {
			company.setCmaddress(company.getCmpostcode() + "_" + company.getCmaddr());
		} else {
			if (company.getCmextraaddress().length() == 0) {
				company.setCmaddress(
						company.getCmpostcode() + "_" + company.getCmaddr() + "_" + company.getCmdetailaddress());
			} else if (company.getCmdetailaddress().length() == 0) {
				company.setCmaddress(
						company.getCmpostcode() + "_" + company.getCmaddr() + "_" + company.getCmextraaddress());
			} else {
				company.setCmaddress(company.getCmpostcode() + "_" + company.getCmaddr() + "_"
						+ company.getCmextraaddress() + "_" + company.getCmdetailaddress());
			}
		}

		// 회사정보 입력
		System.out.println(company);

		adao.insertCompany(company);
	}

	public String getCompany() {
		System.out.println("AdminService.getCompany() 호출");

		ArrayList<CompanyDto> companyList = adao.getCompany();

		for (int i = 0; i < companyList.size(); i++) {
			if (companyList.get(i).getCmaddress() != null) {
				String[] cfaddress_split = companyList.get(i).getCmaddress().split("_");
				if (cfaddress_split.length >= 1) {
					companyList.get(i).setCmpostcode(cfaddress_split[0]);
					if (cfaddress_split.length >= 2) {
						companyList.get(i).setCmaddr(cfaddress_split[1]);
						if (cfaddress_split.length >= 3) {
							companyList.get(i).setCmdetailaddress(cfaddress_split[2]);
							if (cfaddress_split.length == 4) {
								companyList.get(i).setCmextraaddress(cfaddress_split[3]);
							}
						}
					}
				}
			}
		}

		Gson gson = new Gson();

		String company = gson.toJson(companyList);

		return company;
	}

	public void cmstateModify(String cmcode, int cmstate) {
		System.out.println("AdminService.cmstateModify() 호출");

		adao.cmstateModify(cmcode, cmstate);
	}

	public void companyDelete(String cmcode) {
		System.out.println("AdminService.companyDelete() 호출");
		String cmimg = adao.getCompanyImg(cmcode);
		if (cmimg != null) {
			File file = new File(savePath_cm + cmimg);
			file.delete();
		}
		adao.companyDelete(cmcode);
	}

	public void updateCompany(CompanyDto company) throws IllegalStateException, IOException {
		System.out.println("AdminService.updateCompany() 호출");

		// 기존 이미지 가져오기
		String cmimg = adao.getCompanyImg(company.getCmcode());

		// 기존 이미지 삭제
		if (company.getCmimgs() != null) {
			File file = new File(savePath_cm + cmimg);
			file.delete();

			// 이미지 저장
			String imgFile = "";
			MultipartFile[] imgs = company.getCmimgs();
			for (MultipartFile multipartFile : imgs) {
				UUID uuid = UUID.randomUUID();
				imgFile = uuid.toString() + "_" + multipartFile.getOriginalFilename();

				multipartFile.transferTo(new File(savePath_cm, imgFile));
			}
			company.setCmimg(imgFile);
		} else {
			company.setCmimg(cmimg);
		}

		// 주소
		if (company.getCmextraaddress().length() == 0 && company.getCmdetailaddress().length() == 0) {
			company.setCmaddress(company.getCmpostcode() + "_" + company.getCmaddr());
		} else {
			if (company.getCmextraaddress().length() == 0) {
				company.setCmaddress(
						company.getCmpostcode() + "_" + company.getCmaddr() + "_" + company.getCmdetailaddress());
			} else if (company.getCmdetailaddress().length() == 0) {
				company.setCmaddress(
						company.getCmpostcode() + "_" + company.getCmaddr() + "_" + company.getCmextraaddress());
			} else {
				company.setCmaddress(company.getCmpostcode() + "_" + company.getCmaddr() + "_"
						+ company.getCmextraaddress() + "_" + company.getCmdetailaddress());
			}
		}

		adao.updateCompany(company);
	}

	public void insertCafe(CafeDto cafe) throws IllegalStateException, IOException {
		System.out.println("AdminService.insertCafe() 호출");

		// 카페코드 생성
		String max = adao.getMaxCfcode();
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

				multipartFile.transferTo(new File(savePath_cf, imgFile));
				cfimg = cfimg + "/" + imgFile;
			}

		}
		cafe.setCfimg(cfimg);

		MultipartFile sgimgFile = cafe.getCfsigimgs();
		String cfsgimg = "";
		if (!sgimgFile.isEmpty()) {
			UUID uuid = UUID.randomUUID();
			cfsgimg = uuid.toString() + "_" + sgimgFile.getOriginalFilename();
			sgimgFile.transferTo(new File(savePath_cf, cfsgimg));
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

		// 카페정보 입력
		System.out.println(cafe);

		adao.insertCafe(cafe);
	}

	public String getCafeInfo() {
		System.out.println("AdminService.getCafeInfo() 호출");

		ArrayList<CafeDto> cafeList = adao.getCafe();

		for (int i = 0; i < cafeList.size(); i++) {
			if (cafeList.get(i).getCfaddress() != null) {
				String[] cfaddress_split = cafeList.get(i).getCfaddress().split("_");
				cafeList.get(i).setCfpostcode(cfaddress_split[0]);
				cafeList.get(i).setCfaddr(cfaddress_split[1]);
				if (cfaddress_split.length >= 3) {
					cafeList.get(i).setCfdetailaddress(cfaddress_split[2]);
					if (cfaddress_split.length == 4) {
						cafeList.get(i).setCfextraaddress(cfaddress_split[3]);
					}
				}
			}
		}

		Gson gson = new Gson();

		String cafe = gson.toJson(cafeList);

		return cafe;
	}

	public void cfstateModify(String cfcode, int cfstate) {
		System.out.println("AdminService.cfstateModify() 호출");

		adao.cfstateModify(cfcode, cfstate);

	}

	public void deleteCafe(String cfcode) {
		System.out.println("AdminService.deleteCafe() 호출");

		CafeDto deleteCfimg = adao.getDelCfimg(cfcode);

		if (deleteCfimg.getCfimg() != null) {
			for (int i = 1; i < deleteCfimg.getCfimg().split("/").length; i++) {
				File file = new File(savePath_cf + "/" + deleteCfimg.getCfimg().split("/")[i]);
				file.delete();
			}
		}

		if (deleteCfimg.getCfsigimg() != null) {
			File file = new File(savePath_cf + "/" + deleteCfimg.getCfsigimg());
			file.delete();
		}

		adao.deleteCafe(cfcode);

	}

	public void updateCafe(CafeDto cafe) throws IllegalStateException, IOException {
		System.out.println("AdminService.updateCafe() 호출");

		CafeDto deleteCfimg = adao.getDelCfimg(cafe.getCfcode());

		// 기존이미지삭제
		if (deleteCfimg.getCfimg() != null) {
			for (int i = 1; i < deleteCfimg.getCfimg().split("/").length; i++) {
				File file = new File(savePath_cf + "/" + deleteCfimg.getCfimg().split("/")[i]);
				file.delete();
				System.out.println(i + "번째 카페 이미지 삭제 성공");
			}

			// 이미지 저장
			String imgFile = "";
			String cfimg = "";
			if (cafe.getCfimgs() != null) {
				MultipartFile[] imgs = cafe.getCfimgs();
				for (MultipartFile multipartFile : imgs) {
					UUID uuid = UUID.randomUUID();
					imgFile = uuid.toString() + "_" + multipartFile.getOriginalFilename();

					multipartFile.transferTo(new File(savePath_cf, imgFile));
					cfimg = cfimg + "/" + imgFile;
				}

			}
			cafe.setCfimg(cfimg);
		} else {
			cafe.setCfimg(deleteCfimg.getCfimg());
		}
		if (deleteCfimg.getCfsigimg() != null) {
			File file = new File(savePath_cf + "/" + deleteCfimg.getCfsigimg());
			file.delete();
			System.out.println("시그니처 이미지 삭제 성공");

			MultipartFile sgimgFile = cafe.getCfsigimgs();
			String cfsgimg = "";
			if (!sgimgFile.isEmpty()) {
				UUID uuid = UUID.randomUUID();
				cfsgimg = uuid.toString() + "_" + sgimgFile.getOriginalFilename();
				sgimgFile.transferTo(new File(savePath_cf, cfsgimg));
			}
			cafe.setCfsigimg(cfsgimg);
		} else {
			cafe.setCfsigimg(deleteCfimg.getCfsigimg());
		}

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

		// 카페정보 입력
		System.out.println(cafe);

		adao.updateCafe(cafe);

	}

	public String getMemberInfo() {
		System.out.println("AdminService.getMemberInfo() 호출");

		ArrayList<MemberDto> memberList = adao.getMemberInfo();

		Gson gson = new Gson();
		String memberList_ajax = gson.toJson(memberList);

		return memberList_ajax;
	}

	public void memberStateModify(String mid, int mstate) {
		System.out.println("AdminService.memberStateModify() 호출");

		adao.memberStateModify(mid, mstate);
	}

	public void deleteMember(String mid) {
		System.out.println("AdminService.deleteMember() 호출");
		// 삭제할 정보
		MemberDto memberInfo = adao.getDeleteMemberInfo(mid);
		if (memberInfo != null) {
			// 기존이미지 삭제
			if (memberInfo.getMprofile() != null) {
				if (memberInfo.getMtype() != 3) {
					File file = new File(savePath_mb + "/" + memberInfo.getMprofile());
					file.delete();
				}
			}
			adao.deleteMember(mid);
		}
	}
	//문의 목록 출력
	public ModelAndView InquireList() {
		System.out.println("InquireList()호출");
		ModelAndView mav = new ModelAndView();
		ArrayList<InquIreDto>inquireList = Idao.selectInquireList();
		
		mav.addObject("inquireList", inquireList);
		mav.setViewName("Admin/AdminInquire");
		return mav;
	}

	
	
	
	
	
	
	
	
	
	
	
	
	
}
