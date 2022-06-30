package com.L_CSS.dto;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class MemberDto {
	
	private String mid;
	private String mpw;
	private String mname;
	private String memail;
	private String maddress;
	private String mprofile;
	private int mtype;
	private	int	mstate;
	
	private MultipartFile mfile;
	private String sample6_postcode;
	private String sample6_address;
	private String sample6_detailAddress;
	private String sample6_extraAddress;
	
	
}
