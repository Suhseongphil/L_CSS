package com.L_CSS.service;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.L_CSS.dao.AdminDao;
import com.L_CSS.dto.CompanyDto;

@Service
public class AdminService {

	@Autowired
	AdminDao adao;

	// 저장경로 ) 본인 로컬주소로 변경!!
	private String savePath_cm = "/Users/suhseongphil/Programming/github_project/L_CSS/L_CSS/src/main/webapp/resources/fileUpLoad/CompanyFile";

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
				cmimg = cmimg + "/" +imgFile;
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
				company.setCmaddress(company.getCmpostcode() + "_" + company.getCmaddr() + "_" + company.getCmextraaddress());
			} else {
				company.setCmaddress(company.getCmpostcode() + "_" + company.getCmaddr() + "_" + company.getCmextraaddress()
						+ "_" + company.getCmdetailaddress());
			}
		}
		
		// 회사정보 입력
		System.out.println(company);
		
		adao.insertCompany(company);
	}

}
