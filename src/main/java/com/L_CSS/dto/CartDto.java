package com.L_CSS.dto;

import lombok.Data;

@Data
public class CartDto {
	private	String	ctcode;
	private	String	ctmid;
	private	String	ctcfcmcode;
	private	String	ctmupdcode;
	
	
	private String pdname;
	private int ctamount;
				
	private String pdimg;
	private int total;
	
}
