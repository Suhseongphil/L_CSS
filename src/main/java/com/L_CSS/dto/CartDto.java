package com.L_CSS.dto;

import lombok.Data;

@Data
public class CartDto {
	private	String	ctcode;
	private	String	ctmid;
	private	String	ctcfcmcode;
	private	String	ctmupdcode;
	private int ctamount;
	
	private int pdprice;
	private String pdname;
				
	private String pdimg;
	private int cttotal;
	
}
