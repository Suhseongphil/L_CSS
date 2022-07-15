package com.L_CSS.dto;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class InquIreDto {

	private	String	iqcode;
	private	String	iqmid;
	private	String	iqcategory;
	private	String	iqtitle;
	private	String	iqcomment;
	private	String	iqimg;
	private MultipartFile iqfile;
	private	int	iqstate;
	private String iqdate;
}
