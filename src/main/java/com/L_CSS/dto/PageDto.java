package com.L_CSS.dto;

import lombok.Data;

@Data
public class PageDto {
	
	private int page;
	private int maxPate;
	private int startPage;
	private int endPage;
	private boolean prev;
	private boolean next;
}
