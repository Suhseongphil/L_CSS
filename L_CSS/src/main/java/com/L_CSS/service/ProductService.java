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
import com.L_CSS.dto.MenuDto;
import com.L_CSS.dto.ProductDto;

@Service
public class ProductService {
	
	@Autowired
	ProductDao pdao;
	
	
	//업체 상품 업로드 
	public ModelAndView productUpLoad() throws IOException {
		
		
		
		
		String imgurl = "https://www.cofm.co.kr/goods/goods_list.php?cateCd=069&mode=categoryMode";
		
		Document doc = Jsoup.connect(imgurl).get();
		
		Elements img = doc.select("#content > div > div > div.cboth.cg-main > div.goods-list > div > div > ul > li > div > div> a > img");
		
		
		Elements name = doc.select("#content > div > div > div.cboth.cg-main > div.goods-list > div > div > ul > li> div > div > a > div > strong");
		
		
		Elements price = doc.select("#content > div > div > div.cboth.cg-main > div.goods-list > div > div > ul > li> div > div> span > strong");
		
		ArrayList<ProductDto> ProductList = new ArrayList<ProductDto>();
		ProductDto pd = null;
		String cfcode ="CM001";
		String type = "원두";
		
		for(int i = 0; i < img.size(); i++) {
			pd = new ProductDto();
			
			
			int prices = Integer.parseInt(price.eq(i).text().replace(",", ""));
			
			pd.setPdcode(cfcode);
			pd.setPdtype(type);
			pd.setPdstate(1);
			pd.setPdname(name.eq(i).text());
			pd.setPdimg(img.get(i).attr("data-original"));
			pd.setPdprice(prices);
			System.out.println(name.eq(i).text());
			System.out.println(img.get(i).attr("data-original"));
			System.out.println(price.eq(i).text().replace(",", ""));
			ProductList.add(pd);
		}
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
			
			if(ProductList.get(i).getPdprice() > 0 ) {
				
				int insert = pdao.insert(ProductList.get(i));
			}
				
		
		}
		
		return null;
	}
}
