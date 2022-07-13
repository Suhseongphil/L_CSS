package com.L_CSS.dto;

import lombok.Data;

@Data
public class CartDto {
	private	String	ctcode;
	private	String	ctmid;
	private	String	ctcfcmcode;
	private	String	ctmupdcode;
	
	private String pdprice;
	private String pdname;
	private int pdamount;
	private String pdimg;
	private int total;
	
}
