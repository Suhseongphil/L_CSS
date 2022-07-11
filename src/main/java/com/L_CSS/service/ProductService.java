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

	// 업체 상품 업로드
	public ModelAndView productUpLoad() {

		String max = pdao.getmax();
		String pdcode = "PD";

		if (max == null) {
			pdcode = pdcode + "001";
		} else {
			max = max.substring(2);
			int maxCode = Integer.parseInt(max) + 1;
			if (maxCode < 10) {
				pdcode = pdcode + "00" + maxCode;
			} else if (maxCode < 100) {
				pdcode = pdcode + "0" + maxCode;
			} else {
				pdcode = pdcode + maxCode;
			}

		}
		System.out.println(pdcode);

		return null;
	}
	//테이블 추가
	public ModelAndView gettb() throws IOException {
		ModelAndView mav = new ModelAndView();

		String tbUrl = "https://smartstore.naver.com/feelwell/category/bd9d1ccfea7d4dcea376ba0a50a2b480?cp=1";

		Document doc = Jsoup.connect(tbUrl).get();

		Elements tb_img = doc.select("#CategoryProducts > ul > li > a > div._2Yq8Q_jTJv > div > div > img");
		System.out.println(tb_img.size());
		System.out.println(tb_img.attr("src"));

		Elements tb_name = doc.select("#CategoryProducts > ul > li > a > strong");
		System.out.println(tb_name.size());
		System.out.println(tb_name.text());

		Elements tb_price1 = doc.select("#CategoryProducts > ul > li > a > div._23DThs7PLJ > span > span.nIAdxeTzhx");
		System.out.println(tb_price1.size());
		// System.out.println(cm_price1.text());

		ArrayList<ProductDto> tbList = new ArrayList<ProductDto>();

		int insertCount = 0;
		String[] str = null;
		String str2 = "0";
		for (int i = 0; i < tb_price1.size(); i++) {
			ProductDto pd = new ProductDto();
			String max = pdao.getmax();
			String pdcode = "PD";

			if (max == null) {
				pdcode = pdcode + "001";
			} else {
				max = max.substring(2);
				int maxCode = Integer.parseInt(max) + 1;
				if (maxCode < 10) {
					pdcode = pdcode + "00" + maxCode;
				} else if (maxCode < 100) {
					pdcode = pdcode + "0" + maxCode;
				} else {
					pdcode = pdcode + maxCode;
				}

			}

			pd.setPdcode(pdcode);
			pd.setPdimg(tb_img.get(i).attr("src"));
			pd.setPdname(tb_name.get(i).text());
			pd.setPdtype("테이블");
			pd.setPdstate(1);
			pd.setPdcmcode("CM005");
			pd.setPdamount(10);
			str = tb_price1.get(i).text().split(",");
			str2 = str[0] + str[1];

			int num = Integer.parseInt(str2);
			// System.out.println("가격 : " + num);
			pd.setPdprice(num);
			tbList.add(pd);

			pdao.inserttbList(tbList.get(i));
			insertCount++;

		}

		System.out.println(insertCount + "개 제품 추가");
		mav.setViewName("redirect:/");
		return mav;
	}
	
	//커피머신기 추가
	public ModelAndView getcm() throws IOException {
		ModelAndView mav = new ModelAndView();
		
		
		
		String cmUrl = "https://smartstore.naver.com/lianbean/search?q=%EC%BB%A4%ED%94%BC%EB%A8%B8%EC%8B%A0&st=HIGHPRICE&free=false&dt=BIG_IMAGE&page=1&size=40";
		
		Document doc = Jsoup.connect(cmUrl).get();
		
		Elements cm_img = doc.select("#content > div > ul > li > a > div._2Yq8Q_jTJv > div > div > img");
		System.out.println(cm_img.size());
		System.out.println(cm_img.attr("src"));
		
		Elements cm_name = doc.select("#content > div > ul > li > a > strong");
		System.out.println(cm_name.size());
		System.out.println(cm_name.text());
		
		Elements cm_price1 = doc.select("#content > div > ul > li > a > div._23DThs7PLJ > span > span.nIAdxeTzhx");
		System.out.println(cm_price1.size());
		System.out.println(cm_price1.text());
		
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
			pd.setPdtype("머신");
			pd.setPdamount(10);
			pd.setPdstate(1);
			pd.setPdcmcode("CM006");
			pd.setPdimg(cm_img.get(i).attr("src"));
			pd.setPdname(cm_name.get(i).text());
			str = cm_price1.get(i).text().split(",");
			str2 = str[0] + str[1] + str[2];
			
			int num = Integer.parseInt(str2);
			System.out.println("가격 : " + num);
			pd.setPdprice(num);
			cmList.add(pd);
			
			pdao.insertcmList(cmList.get(i));
			insertCount++;
			
			
		}
	
		
		
		System.out.println(insertCount + "개 제품 추가");
		
			 
		return mav;
	}
	//종이컵홀더 추가
	//그라인더 추가
	//제빙기 추가
	//아이스컵 추가
	//아이스컵 뚜껑 추가
	//스트로우 추가
	//냅킨 추가
	//종이컵 추가
	//종이컵 뚜껑 추가
	//소스 추가
	//시럽 추가
	//원두 추가
	//의자 추가
	//파우더 추가
	//텀블러 추가
	//머그잔 추가
	
	public ModelAndView gethd() throws IOException {
		ModelAndView mav = new ModelAndView();
		
		
		
		String hdUrl = "https://smartstore.naver.com/coffeecg/category/c8c445db54ae4690ac55df6001a23ac8?cp=1	";
		
		Document doc = Jsoup.connect(hdUrl).get();
		
		Elements hd_img = doc.select("#CategoryProducts > ul > li > a > div._2Yq8Q_jTJv > div > div > img");
		System.out.println(hd_img.size());
		System.out.println(hd_img.attr("src"));
		
		Elements hd_name = doc.select("#CategoryProducts > ul > li > a > strong");
		System.out.println(hd_name.size());
		System.out.println(hd_name.text());
		
		Elements hd_price1 = doc.select("#CategoryProducts > ul > li > a > div._23DThs7PLJ > strong > span.nIAdxeTzhx");
		System.out.println(hd_price1.size());
		System.out.println(hd_price1.text());
		
		ArrayList<ProductDto> cmList = new ArrayList<ProductDto>();
		
		int insertCount = 0;
		String[] str = null;
		String str2 = "0";
		for(int i = 0; i < hd_price1.size(); i++) {
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
			pd.setPdtype("원두");
			pd.setPdamount(10);
			pd.setPdstate(1);
			pd.setPdcmcode("CM001");
			pd.setPdimg(hd_img.get(i).attr("src"));
			pd.setPdname(hd_name.get(i).text());
			str = hd_price1.get(i).text().split(",");
			    
			
			str2 = str[0] + str[1];
			
			int num = Integer.parseInt(str2);
			//System.out.println("가격 : " + num);
			pd.setPdprice(num);
			cmList.add(pd);
			
			pdao.inserthdList(cmList.get(i));
			insertCount++;
			
			
		}
		System.out.println(insertCount + "개 제품 추가");
		
		
		
		
			 
		return mav;
	}
	
	
}
