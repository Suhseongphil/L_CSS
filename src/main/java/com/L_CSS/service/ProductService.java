package com.L_CSS.service;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.L_CSS.dao.CompanyDao;
import com.L_CSS.dao.ProductDao;
import com.L_CSS.dto.CafeDto;
import com.L_CSS.dto.CompanyDto;
import com.L_CSS.dto.PageDto;
import com.L_CSS.dto.ProductDto;
import com.L_CSS.dto.ReviewProductDto;
import com.google.gson.Gson;

@Service
public class ProductService {

	@Autowired
	ProductDao pdao;
	@Autowired
	CompanyDao cdao;

	@Autowired
	private HttpSession session;

	private String savePath = "C:\\Users\\user\\git\\L_CSS\\src\\main\\webapp\\resources\\fileUpLoad\\ProductFile";

	public ModelAndView mainProduct() {
		ArrayList<ProductDto> productList = new ArrayList<ProductDto>();
		ModelAndView mav = new ModelAndView();

		for (int i = 1; i < 3; i++) {
			productList.add(pdao.getProduct("원두", i));
			productList.add(pdao.getProduct("소스", i));
			productList.add(pdao.getProduct("파우더", i));
			productList.add(pdao.getProduct("머신", i));
			productList.add(pdao.getProduct("제빙기", i));
			productList.add(pdao.getProduct("테이블", i));
			productList.add(pdao.getProduct("의자", i));
		}
		System.out.println(productList);
		ArrayList<ReviewProductDto>reviewList = cdao.reviewList();
		mav.addObject("reviewList", reviewList);
		mav.addObject("productList", productList);
		mav.setViewName("/Main");

		return mav;
	}

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

	// 테이블 추가
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

	// 커피머신기 추가
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
		for (int i = 0; i < cm_price1.size(); i++) {
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
	// 종이컵홀더 추가
	// 그라인더 추가
	// 제빙기 추가
	// 아이스컵 추가
	// 아이스컵 뚜껑 추가
	// 스트로우 추가
	// 냅킨 추가
	// 종이컵 추가
	// 종이컵 뚜껑 추가
	// 소스 추가
	// 시럽 추가
	// 원두 추가
	// 의자 추가
	// 파우더 추가
	// 텀블러 추가
	// 머그잔 추가

	public ModelAndView gethd() throws IOException {
		ModelAndView mav = new ModelAndView();

		String hdUrl = "https://smartstore.naver.com/bestmall0233/category/8484b8d67f33465fb73307f3a8bb6d57?cp=1";

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
		for (int i = 0; i < hd_price1.size(); i++) {
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
			pd.setPdtype("의자");
			pd.setPdamount(10);
			pd.setPdstate(1);
			pd.setPdcmcode("CM010");
			pd.setPdimg(hd_img.get(i).attr("src"));
			pd.setPdname(hd_name.get(i).text());
			str = hd_price1.get(i).text().split(",");
			str2 = str[0] + str[1];

			int num = Integer.parseInt(str2);
			// System.out.println("가격 : " + num);
			pd.setPdprice(num);
			cmList.add(pd);

			pdao.inserthdList(cmList.get(i));
			insertCount++;

		}

		System.out.println(insertCount + "개 제품 추가");

		return mav;
	}

	// 상품 목록 출력
	public ModelAndView selectProduct() {
		System.out.println("selectProduct()호출");
		ModelAndView mav = new ModelAndView();
		ArrayList<ProductDto> selectPro = pdao.selectPro();
		mav.addObject("selectPro", selectPro);
		mav.setViewName("Shop/ShopMain");

		return mav;
	}

	// 상품검색
	public ModelAndView searchProduct(String pdcategory, String searchText, String page) {
		System.out.println("searchProduct()호출");
		String category =null ;
		String text = null;
		ModelAndView mav = new ModelAndView();
		int TotalCount2 = pdao.TotalCount2();
		int page2 = 1;

		if (page != null) {
			page2 = Integer.parseInt(page);
		}
		
		if(pdcategory != null && searchText !=null) {
			System.out.println("실행");
			session.setAttribute("searchpdcategory", pdcategory);
			session.setAttribute("searchText", searchText);
			category = (String)session.getAttribute("searchpdcategory");
			text = (String)session.getAttribute("searchText");
		}else {
			
		}
		System.out.println("??"+text);
		// 한페이지에 보여줄 글 개수
		int pageCount = 8;
		// 한페이지에 보여줄 페이지 번호 개수
		int pageNumCount = 5;

		int startRow = (page2 - 1) * pageCount + 1;
		int endRow = page2 * pageCount;

		int maxPage = (int) (Math.ceil((double) TotalCount2 / pageCount));
		int startPage = (int) (Math.ceil((double) page2 / pageCount));

		int endPage = startPage + pageNumCount - 1;

		if (endPage > maxPage) {
			endPage = maxPage;
		}
		System.out.println(startRow);
		System.out.println(endRow);
		System.out.println("값2"+category);
		System.out.println("값"+text);
		// null > 원두
		if(category != null &&  text != null) {
			pdcategory = category;
			searchText = text;
			System.out.println("??2"+pdcategory);
			System.out.println("??1"+searchText);
			PageDto pagedto = new PageDto();
			pagedto.setPage(page2);
			pagedto.setMaxPate(maxPage);
			pagedto.setStartPage(startPage);
			pagedto.setEndPage(endPage);
			mav.addObject("pagedto", pagedto);
			ArrayList<ProductDto> searchList = pdao.searchList(pdcategory,searchText,startRow, endRow);
			System.out.println(searchList);
			mav.addObject("selectproductList", searchList);
			mav.setViewName("Shop/searchShop");
		}
		return mav;
	
	}

	/*
	 * // 카테고리 선택 public ModelAndView searchType(String type) {
	 * 
	 * //ArrayList<ProductDto> searchType = pdao.searchType(type); ModelAndView mav
	 * = new ModelAndView();
	 * 
	 * int TotalCount3 = pdao.TotalCount3(); int page2 = 1;
	 * 
	 * // 한페이지에 보여줄 글 개수 int pageCount = 10; // 한페이지에 보여줄 페이지 번호 개수 int pageNumCount
	 * = 10;
	 * 
	 * int startRow = (page2 - 1) * pageCount + 1; int endRow = page2 * pageCount;
	 * 
	 * int maxPage = (int) (Math.ceil((double) TotalCount3 / pageCount)); int
	 * startPage = (int) (Math.ceil((double) page2 / pageCount));
	 * 
	 * int endPage = startPage + pageNumCount - 1;
	 * 
	 * if (endPage > maxPage) { endPage = maxPage; } System.out.println(startRow);
	 * System.out.println(endRow);
	 * 
	 * ArrayList<ProductDto> selectproductList = pdao.selectproductList(startRow,
	 * endRow, type); PageDto pagedto = new PageDto(); pagedto.setPage(page2);
	 * pagedto.setMaxPate(maxPage); pagedto.setStartPage(startPage);
	 * pagedto.setEndPage(endPage); mav.addObject("pagedto", pagedto);
	 * mav.addObject("searchType", selectproductList);
	 * mav.setViewName("Shop/searchType"); System.out.println(pagedto);
	 * 
	 * //System.out.println(searchType); return mav;
	 * 
	 * }
	 */
	public ModelAndView myProduct(RedirectAttributes ra) {
		ModelAndView mav = new ModelAndView();
		System.out.println("myProduct() 호출");
		String loginId = (String) session.getAttribute("loginId");
		System.out.println("로그인아이디 : " + loginId);

		ArrayList<String> productType = pdao.getPdType();

		CompanyDto mycompanyInfo = pdao.MyProduct(loginId);

		mav.addObject("productType", productType);
		mav.addObject("mycompanyInfo", mycompanyInfo);
		mav.setViewName("Company/MyproductInsert");
		return mav;
	}

	// 메뉴 정보 입력
	public void productInsert(ProductDto product) throws IllegalStateException, IOException {
		System.out.println("productInsert ()호출");

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
		product.setPdcode(pdcode);

		// 이미지 저장

		MultipartFile pdFile = product.getPdimgs();

		System.out.println(pdFile.getOriginalFilename());
		String fileName = pdFile.getOriginalFilename();
		String pdimg = "";
		if (!pdFile.isEmpty()) {
			if (fileName.contains("BS")) {
				pdimg = fileName;

			} else {

				UUID uuid = UUID.randomUUID();
				pdimg = uuid.toString() + "_" + pdFile.getOriginalFilename();

				pdFile.transferTo(new File(savePath, pdimg));

			}

		}

		product.setPdimg(pdimg);

		int insertProduct = pdao.insertProduct(product);
	}

	// 메뉴정보 출력
	public String getMyProduct2() {
		System.out.println("getMyProduct2 () 호출");
		ArrayList<ProductDto> productList = pdao.getProduct2();
		Gson gson = new Gson();
		String product = gson.toJson(productList);

		return product;
	}

	// 메뉴 상태 변경 기능
	public void pdstateModify(String pdcode, int pdstate) {
		System.out.println("pdstateModify()호출");

		if (pdstate == 0) {
			pdstate = 1;
		} else {
			pdstate = 0;
		}

		int updateMustate = pdao.updateState(pdcode, pdstate);

	}

	// 메뉴 삭제
	public void productDelete(String pdcode, String pdimg) {
		System.out.println("productDelete()호출");
		System.out.println(pdimg);
		if (!pdimg.contains("BS")) {
			File file = new File(savePath + "/" + pdimg);
			file.delete();
		}

		int deleteProduct = pdao.deleteProduct(pdcode);

	}

	public ModelAndView myproductMenu(RedirectAttributes ra) {
		ModelAndView mav = new ModelAndView();
		System.out.println("myproductMenu() 호출");
		String loginId = (String) session.getAttribute("loginId");
		System.out.println("로그인아이디 : " + loginId);

		CafeDto myproductInfo = pdao.MyProductInfo(loginId);

		mav.addObject("myproductInfo", myproductInfo);
		mav.setViewName("Company/MyproductInsert");
		return mav;
	}

	public String getMyProduct(String pdcmcode) {
		System.out.println("getMyProduct() 호출");
		System.out.println(pdcmcode);
		ArrayList<ProductDto> productList = pdao.getMyProduct(pdcmcode);
		System.out.println(productList);
		Gson gson = new Gson();
		String product = gson.toJson(productList);

		return product;
	}

	// 내 상품 수정
	public void MypdModify(ProductDto product) throws IllegalStateException, IOException {

		System.out.println("MypdModify() 호출");

		String imgFile = "";
		// 기존이미지 가져오기
		String pdcmimg = pdao.getMyProductImg(product.getPdcode());
		System.out.println(product);
		System.out.println(pdcmimg);
		MultipartFile imgs = product.getPdimgs();
		System.out.println(imgs);
		if (imgs != null) {
			File file = new File(savePath + pdcmimg);
			file.delete();
			UUID uuid = UUID.randomUUID();
			pdcmimg = uuid.toString() + "_" + imgs.getOriginalFilename();
			imgs.transferTo(new File(savePath, pdcmimg));
			product.setPdimg(pdcmimg);
		} else {

			product.setPdimg(pdcmimg);
		}
		System.out.println("이미지 담음" + product);
		int updateMymenu = pdao.updateMyProduct(product);

	}

	// 제품 상세보기 페이지 이동
	public ModelAndView productInfo(String pdcode) {
		System.out.println("productInfo()호출");
		ModelAndView mav = new ModelAndView();
		ProductDto productInfo = pdao.productInfo(pdcode);
		CompanyDto companyInfo = cdao.companyInfo(pdcode);
		mav.addObject("productInfo", productInfo);
		mav.addObject("companyInfo", companyInfo);
		mav.setViewName("option/productInfo");

		return mav;
	}

	// 상품 내역 출력
	public ModelAndView productList(String page, String pdtype) {
		System.out.println("productList()호출");
		ModelAndView mav = new ModelAndView();
		int TotalCount2 = pdao.TotalCount2();
		int page2 = 1;

		if (page != null) {
			page2 = Integer.parseInt(page);
		}
		String rere = (String) session.getAttribute("typeResult");

		// 한페이지에 보여줄 글 개수
		int pageCount = 8;
		// 한페이지에 보여줄 페이지 번호 개수
		int pageNumCount = 5;

		int startRow = (page2 - 1) * pageCount + 1;
		int endRow = page2 * pageCount;

		int maxPage = (int) (Math.ceil((double) TotalCount2 / pageCount));
		int startPage = (int) (Math.ceil((double) page2 / pageCount));

		int endPage = startPage + pageNumCount - 1;

		if (endPage > maxPage) {
			endPage = maxPage;
		}
		System.out.println(startRow);
		System.out.println(endRow);
		// null > 원두

		if (rere == pdtype) {
			session.removeAttribute("typeResult");
			session.setAttribute("typeResult", pdtype);
			String rdrd = (String) session.getAttribute("typeResult");
			rere = rdrd;

		}

		if (pdtype == null && rere == null) {

			PageDto pagedto = new PageDto();
			pagedto.setPage(page2);
			pagedto.setMaxPate(maxPage);
			pagedto.setStartPage(startPage);
			pagedto.setEndPage(endPage);
			mav.addObject("pagedto", pagedto);
			ArrayList<ProductDto> productList = pdao.productList(startRow, endRow);
			mav.addObject("selectproductList", productList);
			mav.setViewName("Shop/ShopMain");
			return mav;
		} else {
			if (pdtype == null) {
				pdtype = rere;
			}
			session.setAttribute("typeResult", pdtype);
			PageDto pagedto = new PageDto();

			pagedto.setPage(page2);
			pagedto.setMaxPate(maxPage);
			pagedto.setStartPage(startPage);
			pagedto.setEndPage(endPage);
			mav.addObject("pagedto", pagedto);
			ArrayList<ProductDto> searchType = pdao.searchType(startRow, endRow, pdtype);
			session.setAttribute("typeResult", pdtype);
			mav.addObject("selectproductList", searchType);
			mav.setViewName("Shop/ShopMain");
			return mav;
		}

	}

	// 전체 상품 보기
	public ModelAndView fullProduet(String page) {
		System.out.println("fullProduct()호출");
		ModelAndView mav = new ModelAndView();
		session.removeAttribute("typeResult");
		int TotalCount2 = pdao.TotalCount2();
		int page2 = 1;

		if (page != null) {
			page2 = Integer.parseInt(page);
		}

		// 한페이지에 보여줄 글 개수
		int pageCount = 10;
		// 한페이지에 보여줄 페이지 번호 개수
		int pageNumCount = 5;

		int startRow = (page2 - 1) * pageCount + 1;
		int endRow = page2 * pageCount;

		int maxPage = (int) (Math.ceil((double) TotalCount2 / pageCount));
		int startPage = (int) (Math.ceil((double) page2 / pageCount));

		int endPage = startPage + pageNumCount - 1;

		if (endPage > maxPage) {
			endPage = maxPage;
		}
		System.out.println(startRow);
		System.out.println(endRow);

		PageDto pagedto = new PageDto();
		pagedto.setPage(page2);
		pagedto.setMaxPate(maxPage);
		pagedto.setStartPage(startPage);
		pagedto.setEndPage(endPage);
		mav.addObject("pagedto", pagedto);
		ArrayList<ReviewProductDto> ReviewProduct = pdao.ReviewProductList();
		ArrayList<ProductDto> fullProduct = pdao.productList(startRow, endRow);
		mav.addObject("ReviewProduct", ReviewProduct);
		mav.addObject("selectproductList", fullProduct);
		mav.setViewName("Shop/fullMain");
		return mav;

	}
}