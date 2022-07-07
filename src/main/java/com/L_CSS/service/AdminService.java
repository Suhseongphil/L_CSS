package com.L_CSS.service;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.L_CSS.dao.AdminDao;
import com.L_CSS.dto.CafeDto;
import com.L_CSS.dto.CompanyDto;
import com.google.gson.Gson;

@Service
public class AdminService {

	@Autowired
	AdminDao adao;

	// 저장경로 ) 본인 로컬주소로 변경!!
	private String savePath_cm = "/Users/suhseongphil/Programming/github_project/L_CSS/src/main/webapp/resources/fileUpLoad/CompanyFile";
	private String savePath_cf = "/Users/suhseongphil/Programming/github_project/L_CSS/src/main/webapp/resources/fileUpLoad/CafeFile";

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

		Gson gson = new Gson();

		String company = gson.toJson(companyList);

		return company;
	}

	public void cmstateModify(String cmcode, int cmstate) {
		System.out.println("AdminService.cmstateModify() 호출");

		adao.cmstateModify(cmcode, cmstate);
	}

	public void companyDelete(String cmcode, String cmimg) {
		System.out.println("AdminService.companyDelete() 호출");
		File file = new File(savePath_cm + "/" + cmimg);
		file.delete();
		adao.companyDelete(cmcode);
	}

	public void updateCompany(CompanyDto company) throws IllegalStateException, IOException {
		System.out.println("AdminService.updateCompany() 호출");
		
		
		// 기존 이미지 삭제
		if (company.getCmimg() != null) {
			File file = new File(savePath_cm + "/" + company.getCmimg());
			file.delete();
		}

		// 이미지 저장
		String imgFile = "";
		if (company.getCmimgs() != null) {
			MultipartFile[] imgs = company.getCmimgs();
			for (MultipartFile multipartFile : imgs) {
				UUID uuid = UUID.randomUUID();
				imgFile = uuid.toString() + "_" + multipartFile.getOriginalFilename();

				multipartFile.transferTo(new File(savePath_cm, imgFile));
			}
		}
		System.out.println("imgFile : " + imgFile);
		company.setCmimg(imgFile);

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

		// 카페링크
		if (cafe.getCflink().length() == 0) {
			cafe.setCflink("없음");
		}

		// 카페정보 입력
		System.out.println(cafe);

		adao.insertCafe(cafe);
	}

	public String getCafe() {
		System.out.println("AdminService.getCafe() 호출");

		ArrayList<CafeDto> cafeList = adao.getCafe();

		Gson gson = new Gson();

		String cafe = gson.toJson(cafeList);

		return cafe;
	}

}
