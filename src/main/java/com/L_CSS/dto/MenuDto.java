package com.L_CSS.dto;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class MenuDto {
	
	private String mucode;
	private String muname;
	private String mutype;
	private int muprice;
	private String muimg;
	private String mucfcode;
	private int mustate;
	
	
	private MultipartFile muims;
}
