package com.L_CSS.dto;

import lombok.Data;

@Data
public class OrderDto {
	private String recode;
	private String cmname;
	private String pdname;
	private String pdcode;
	private int pdprice; 
	private int reamount;
	private int reprice;
	private int restate;
}
