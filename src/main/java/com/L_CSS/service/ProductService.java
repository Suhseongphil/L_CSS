package com.L_CSS.service;

import java.io.IOException;
import java.util.ArrayList;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.L_CSS.dao.ProductDao;
import com.L_CSS.dto.ProductDto;

@Service
public class ProductService {
	
	@Autowired
	ProductDao pdao;
	
	
	//업체 상품 업로드 
	public ModelAndView productUpLoad() {
		ModelAndView mav = new ModelAndView();
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
		System.out.println(pdcode);
		
		mav.setViewName("redirect:/");
		return mav;
	}
	
	public ModelAndView getcm() throws IOException {
		ModelAndView mav = new ModelAndView();
		
		
		
		String cmUrl = "https://smartstore.naver.com/feelwell/category/bd9d1ccfea7d4dcea376ba0a50a2b480?cp=1";
		
		Document doc = Jsoup.connect(cmUrl).get();
		
		Elements cm_img = doc.select("#CategoryProducts > ul > li > a > div._2Yq8Q_jTJv > div > div > img");
		System.out.println(cm_img.size());
		System.out.println(cm_img.attr("src"));
		
		Elements cm_name = doc.select("#CategoryProducts > ul > li > a > strong");
		System.out.println(cm_name.size());
		System.out.println(cm_name.text());
		
		Elements cm_price1 = doc.select("#CategoryProducts > ul > li > a > div._23DThs7PLJ > span > span.nIAdxeTzhx");
		System.out.println(cm_price1.size());
		//System.out.println(cm_price1.text());
		
		ArrayList<ProductDto> cmList = new ArrayList<ProductDto>();
		
		int insertCount = 0;
		String[] str = null;
		String str2 = "0";
		for(int i = 0; i < cm_price1.size(); i++) {
			ProductDto pd = new ProductDto();
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
				pdcode = pdcode+ "0"+ maxCode;
			}else {
				pdcode = pdcode + maxCode;
			}
			
			
			}
			
			
			pd.setPdcode(pdcode);
			pd.setPdimg(cm_img.get(i).attr("src"));
			pd.setPdname(cm_name.get(i).text());
			pd.setPdtype("머신");
			pd.setPdstate(1);
			pd.setPdcmcode("CM005");
			pd.setPdamount(10);
			str = cm_price1.get(i).text().split(",");
			str2 = str[0] + str[1];
			
			int num = Integer.parseInt(str2);
			//System.out.println("가격 : " + num);
			pd.setPdprice(num);
			cmList.add(pd);
			
			pdao.insertcmList(cmList.get(i));
			insertCount++;
			
			
		}
		
		
		
		System.out.println(insertCount + "개 제품 추가");
		mav.setViewName("redirect:/");
		return mav;
	}
}
