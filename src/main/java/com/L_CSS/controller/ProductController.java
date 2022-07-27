package com.L_CSS.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.L_CSS.dto.ProductDto;
import com.L_CSS.service.ProductService;

@Controller
public class ProductController {

   @Autowired
   ProductService psv;

   // 메인 페이지 이동
   @RequestMapping(value = "/")
   public ModelAndView Main() {
      System.out.println("메인 페이지 호출");
      ModelAndView mav = new ModelAndView();
      
      mav = psv.mainProduct();
      
      return mav;
   }

   @RequestMapping(value = "/productUpLoad")
   public ModelAndView productUpLoad() {
      System.out.println("업체 상품 정보 업로드");
      ModelAndView mav = new ModelAndView();

      mav = psv.productUpLoad();

      return mav;
   }

   @RequestMapping(value = "/gettb")
   public ModelAndView gettb() throws IOException {
      System.out.println("테이블 상품 업로드");
      ModelAndView mav = new ModelAndView();

      mav = psv.gettb();

      return mav;
   }

   @RequestMapping(value = "/getcm")
   public ModelAndView getcm() throws IOException {
      System.out.println("커피머신기 상품 업로드");
      ModelAndView mav = new ModelAndView();

      mav = psv.getcm();

      return mav;
   }

   @RequestMapping(value = "/gethd")
   public ModelAndView gethd() throws IOException {
      System.out.println("종이컵홀더 상품 업로드");
      ModelAndView mav = new ModelAndView();

      mav = psv.gethd();

      return mav;
   }

   // 상품목록 출력
   @RequestMapping(value = "/shopMain")
   public ModelAndView shopMain(String page , String pdtype) {
      System.out.println("상품 목록 출력");
      System.out.println(pdtype);
      ModelAndView mav = new ModelAndView();
      
      mav = psv.productList(page,pdtype);

      return mav;
   }
   //검색창
   @RequestMapping(value="/searchProduct")
   public  ModelAndView searchText(String pdcategory,String searchText,String page) {
      System.out.println("상품검색");
      System.out.println(pdcategory);
      System.out.println(searchText);
      ModelAndView mav = new ModelAndView();

      mav = psv.searchProduct(pdcategory,searchText,page);
      
      return mav;
   }
/*
   //카테고리 선택
   @RequestMapping(value="/searchType")
   public ModelAndView searchType(String type) {
      System.out.println("카테고리 선택");
      System.out.println(type);
      
      ModelAndView mav = new ModelAndView();

      mav = psv.searchType(type);
      return mav;
   }*/
   //메뉴정보 입력 페이지 이동
      @RequestMapping(value = "/myProduct")
      public ModelAndView myProduct(RedirectAttributes ra) {
         ModelAndView mav = new ModelAndView();
                  
         System.out.println("상품정보 입력 페이지 요청");

         mav = psv.myProduct(ra);
         return mav;
      }
      
      // 메뉴 정보 입력
      @RequestMapping(value = "/productInsert")
      public @ResponseBody void productInsert(ProductDto product) throws IllegalStateException, IOException {
         System.out.println("상품정보 입력 기능호출 ");
         psv.productInsert(product);
      }

      // 메뉴 정보 출력
      @RequestMapping(value = "/getProductInfo")
      public @ResponseBody String getProductInfo() {
         System.out.println("상품정보 출력 ");

         String getProductInfo = psv.getMyProduct2();

         return getProductInfo;
      }

      // 메뉴 상태 변경
      @RequestMapping(value = "/pdstateModify")
      public @ResponseBody void pdstateModify(String pdcode, int pdstate) {
         System.out.println("상품 수정");
         psv.pdstateModify(pdcode, pdstate);
      }

      // 메뉴 삭제
      @RequestMapping(value = "/productDelete")
      public @ResponseBody void productDelete(String pdcode, String pdimg) {
         System.out.println("상품 삭제");
         psv.productDelete(pdcode, pdimg);
      }
      
      //내카페 메뉴 정보 출력
         @RequestMapping(value = "/getMyProductInfo")
         public @ResponseBody String getMyProductInfo(String pdcmcode) {
            System.out.println("내업체 상품정보 출력 ");

            String getMyProductInfo = psv.getMyProduct(pdcmcode);

            return getMyProductInfo;
         }
      //내카페 메뉴 수정 출력
         @RequestMapping(value= "/MypdModify")
         public @ResponseBody void MypdModify(ProductDto product) throws IllegalStateException, IOException {
            System.out.println("내 업체 상품 수정 요청");
            System.out.println(product);
            
            psv.MypdModify(product);
            
         }
         //제품 상세보기 페이지
         @RequestMapping (value="/productInfo")
         public ModelAndView productInfo(String pdcode) {
            System.out.println("제품 상세보기 페이지 이동");
            ModelAndView mav = new ModelAndView();
            System.out.println(pdcode);
            mav = psv.productInfo(pdcode);

            return mav;
         }
         
       //전체 상품 출력
     	@RequestMapping(value="/fullMain")
     	public ModelAndView fullMain(String page) {
     		System.out.println("전체 상품 보기");
     		ModelAndView mav = new ModelAndView();
     		mav = psv.fullProduet(page);
     		return mav;
     	}

}