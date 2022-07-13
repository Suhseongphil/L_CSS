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
	private String emailDomain;
	
	private MultipartFile mfile;
	private String mpostercode;
	private String maddr;
	private String mdetailaddress;
	private String mextraaddress;
	
	
}
