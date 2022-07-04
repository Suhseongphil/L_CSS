package com.L_CSS.dto;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class CompanyDto {

	private	String	cmcode;
	private	String	cmname;
	
	private	String	cmaddress;
	private String cmpostcode;
	private String cmaddr;
	private String cmdetailaddress;
	private String cmextraaddress;
	
	private	String	cmtel;
	
	private String cmimg;
	private MultipartFile[] cmimgs;
	
	private	int	cmstate;
	private	String	cmlink;
	
	
}
