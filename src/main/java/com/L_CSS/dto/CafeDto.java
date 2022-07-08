package com.L_CSS.dto;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class CafeDto {
	
	private String cfcode;
	private String cfname;
	private String cfaddrsee;
	private String cftel;
	private String cfstate;
	private	String cflink;
	
	private String cfimg;
	private MultipartFile[] cfimgs;
	
	private	String cfsigimg;
	private MultipartFile cfsigimgs;
	
	private	String cfaddress;
	private String cfpostcode;
	private String cfaddr;
	private String cfdetailaddress;
	private String cfextraaddress;
}
