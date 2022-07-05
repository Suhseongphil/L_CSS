package com.L_CSS.service;

import java.io.IOException;
import java.util.ArrayList;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cglib.beans.ImmutableBean;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.L_CSS.dao.ProductDao;
import com.L_CSS.dto.MenuDto;
import com.L_CSS.dto.ProductDto;

@Service
public class ProductService {
	
	@Autowired
	ProductDao pdao;
	
	
	//업체 상품 업로드 
	public ModelAndView productUpLoad() throws IOException {
		
		
		
		
		String imgurl = "http://www.cndgagu.com/shop/shopbrand.html?xcode=042&type=X&mcode=002";
		
		
		Document doc = Jsoup.connect(imgurl).get();
		
		Elements img = doc.select("#productClass > div.page-body > div.prd-list > table > tbody > tr > td > div > ul > li > div > a > img");
		
		Elements name = doc.select("#productClass > div.page-body > div.prd-list > table > tbody > tr > td > div > ul > li.dsc.name");
		
		
		Elements price = doc.select("#productClass > div.page-body > div.prd-list > table > tbody > tr > td> div > ul > li.price");
		int prices = 0;
		ArrayList<ProductDto> ProductList = new ArrayList<ProductDto>();
		ProductDto pd = null;
		String pdcmcode ="CM003";
		String type = "의자";
		String totalImg = null;
		String imghttp = "http://www.cndgagu.com";
		
		for(int i = 0; i < img.size(); i++) {
			
			if(price.get(i).text().equals("전화문의")) {
				
			}else {
				totalImg = imghttp + img.get(i).attr("src");
				String[] priceArr = price.get(i).text().split(":");
				String[] number = priceArr[1].split("원");
				
				String[] number1 = number[0].split(",");
				String[] number2 = number1[0].split(" ");
				
				String str = number2[1] + number1[1];
				pd = new ProductDto();
				
				pd.setPdcmcode(pdcmcode);
				pd.setPdtype(type);
				pd.setPdstate(1);
				pd.setPdamount(10);
				pd.setPdname(name.eq(i).text());
				pd.setPdimg(totalImg);
				prices = Integer.parseInt(str);
				
				
				pd.setPdprice(prices);
				ProductList.add(pd);
				
			}
		
		}
		/*
		for(int j = 0; j < img.size(); j++) {
			pd = new ProductDto();
			
			pd.setPdcmcode(pdcmcode);
			pd.setPdtype(type);
			pd.setPdstate(1);
			pd.setPdamount(10);
			pd.setPdname(name.eq(j).text());
			pd.setPdimg(totalImg);
			prices = Integer.parseInt(str);
			
			
			pd.setPdprice(prices);
			System.out.println(name.eq(j).text());
			System.out.println(img.get(j).attr("src"));
			System.out.println(price.eq(j).text().replace(",", ""));
			ProductList.add(pd);
		}
		
*/
		System.out.println(ProductList);
		for(int i = 0; i < ProductList.size(); i++) {
			
			String max = pdao.getmax();
			String pdcode = "PD";
			
			if(max == null) {
				pdcode = pdcode + "001";
			}else {
				max = max.substring(2);
				int maxCode = Integer.parseInt(max)+1;		
				if(maxCode < 10) {
					pdcode = pdcode + "00" + maxCode;
			}else if(maxCode < 100) {
				pdcode = pdcode + "0" + maxCode;
			}else {
				pdcode = pdcode + maxCode;
			}
			
			
			}
			ProductList.get(i).setPdcode(pdcode);
			
			if(ProductList.get(i).getPdprice() > 0  ) {
				
				int insert = pdao.insert(ProductList.get(i));
			}
				
		
		}
		
		return null;
	}
}
