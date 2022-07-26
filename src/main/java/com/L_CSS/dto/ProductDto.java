package com.L_CSS.dto;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class ProductDto {
	private int rn;
	private	String	pdcode;
	private	String	pdname;
	private	String	pdtype;
	private	int	pdprice;
	private	int	pdamount;
	private	String	pdimg;
	private	String	pdcmcode;
	private	int	pdstate;
	
	private MultipartFile pdimgs;
}
