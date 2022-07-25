package com.L_CSS.controller;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.client.support.HttpAccessor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.L_CSS.dto.CartDto;
import com.L_CSS.service.CartService;

@Controller
public class CartController {
	
	@Autowired
	CartService csv;
	@Autowired
	private HttpSession session;
	@RequestMapping (value="/cartUpLoad")
	public ModelAndView cartUpLoad() {
		System.out.println("장바구니 상품 정보 업로드");
		ModelAndView mav = new ModelAndView();
		
		mav = csv.cartUpLoad();
		
		return mav;
	}
	//장바구니 이동 요청
	@RequestMapping(value="/myCart")
	public @ResponseBody String myCart() {
		System.out.println("장바구니 리스트요청");
		
		
		String loginId = (String)session.getAttribute("loginId");
		System.out.println(loginId);
		String myCartList  = csv.myCart(loginId);
		
		return myCartList;
	}
	//장바구니 수량 빼기
	@RequestMapping(value="/updateMinus")
	public @ResponseBody String updateMinus(String ctamount,String ctcode) {
		System.out.println("장바구니 수량 빼기");
		System.out.println(ctamount);
		System.out.println(ctcode);
		String loginId = (String)session.getAttribute("loginId");
		String updateMinus = csv.updateMinus(ctamount,ctcode,loginId);
		
		return updateMinus;
		
	}
	//장바구니 수량 더하기
	@RequestMapping(value="/updatePlus")
	public @ResponseBody String updatePlus(String ctamount,String ctcode) {
		System.out.println("장바구니 더하기");
		System.out.println(ctamount);
		System.out.println(ctcode);
		String loginId = (String)session.getAttribute("loginId");
		String updatePlus = csv.updatePlus(ctamount,ctcode,loginId);
		
		return updatePlus;
		
	}
	//장바구니 페이지 이동
	@RequestMapping(value="/myCartPage")
	public String myCartPage() {
		System.out.println("장바구니 페이지이동 요청");
		return "option/MyCart";
		
	}
	//카카오페이 테스트
	@RequestMapping(value="/kokopayTest")
	public @ResponseBody String kokopayTest() {
		System.out.println("카카오페이 테스트");
		
		
		
		
		String loginId = (String)session.getAttribute("loginId");
		ArrayList<CartDto>cartList = csv.selectCart(loginId);
		
		String name = null;
		String ctcode = null;
		int price = 0;
		int sum = 0;
		
		for(int i = 0; i < cartList.size(); i++) {
			name = cartList.get(i).getPdname();
			price = cartList.get(i).getCttotal();
			ctcode = cartList.get(i).getCtcode();
			sum = sum + price; 
		}
		try {
			
			//카카오 페이api 주소 
			URL http = new URL("https://kapi.kakao.com/v1/payment/ready");
			//서버를 연결해줄때 사용하는 클래스
			HttpURLConnection httpConnection = (HttpURLConnection) http.openConnection();
			httpConnection.setRequestMethod("POST");					
			httpConnection.setRequestProperty("Authorization", "KakaoAK 8ba7dcf95e8a610a27ee2841524d1510");
			httpConnection.setRequestProperty("Content-type", "application/x-www-form-urlencoded;charset=utf-8");
			//내가 서버에 전해줄 내용이 있는지 없는지  있으면 true 없다면false
			httpConnection.setDoOutput(true);
			String parem = "cid=TC0ONETIME"
					+ "&partner_order_id=partner_order_id"
					+ "&partner_user_id=partner_user_id"
					+ "&item_name="+URLEncoder.encode(name,"UTF-8")+""
					+ "&quantity=5"
					+ "&total_amount="+sum+""
					+ "&tax_free_amount=100"
					+ "&approval_url=http://localhost:8080/controller/reservInsert?ctcode=" +ctcode+ ""
					+ "&cancel_url=http://localhost:8080/controller/"
					+ "&fail_url=http://localhost:8080/controller/";
			//데이터를 주는클래스
			OutputStream stream = httpConnection.getOutputStream();
			//데이터 주는 클래스
			DataOutputStream dateStream = new DataOutputStream(stream);
			dateStream.writeBytes(parem);
			//flush 비운다는 뜻 
			//dateStream.flush();
			//close 호출하면 flush 자동으로 호출
			dateStream.close();
			int result = httpConnection.getResponseCode();
			//데이터를 받는 클래스
			InputStream returnStream;
			
			if(result == 200) {
				returnStream = httpConnection.getInputStream();
			}else {
				returnStream = httpConnection.getErrorStream();
			}
			//받아온 데이터를 읽어주는 클래스
			InputStreamReader readerClass = new InputStreamReader(returnStream);
			//형변환을 해주는 클래스
			BufferedReader buffeClass = new BufferedReader(readerClass);
			
			return buffeClass.readLine();
			
		} catch (MalformedURLException e) {
			
			e.printStackTrace();
		} catch (IOException e) {
		
			e.printStackTrace();
		}
		return "";
	}
	//장바구니 담기
	@RequestMapping(value="/cartIn")
	public String cartinsert (String pdcode,String pdcmcode,RedirectAttributes ra) {
		System.out.println("장바구니 담기");
		String loginId = (String)session.getAttribute("loginId");
		System.out.println(pdcode);
		System.out.println(pdcmcode);
		String  cartInsert = csv.cartInsert(pdcode,pdcmcode,loginId,ra);
		return cartInsert;
	}
}