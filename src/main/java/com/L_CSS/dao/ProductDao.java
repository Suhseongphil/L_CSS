package com.L_CSS.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import com.L_CSS.dto.CafeDto;
import com.L_CSS.dto.CompanyDto;
import com.L_CSS.dto.ProductDto;
import com.L_CSS.dto.ReviewProductDto;


public interface ProductDao {

   String getmax();

   void inserttbList(ProductDto productDto);

   void insertcmList(ProductDto productDto);

   void inserthdList(ProductDto productDto);

   ArrayList<ProductDto> selectPro();

   ProductDto getProduct(@Param("type")String type, @Param("i")int i);

   ArrayList<ProductDto> proInfo(String cmcode);

   ArrayList<ProductDto> searchList(@Param("pdcategory")String pdcategory,@Param("searchText")String searchText, @Param("start")int startRow, @Param("end")int endRow);

   ArrayList<ProductDto> searchType(@Param("start")int startRow, @Param("end")int endRow, @Param("pdtype")String pdtype);

   CompanyDto MyProduct(String loginId);

   void insertProduct(ProductDto product);


   void updateState(@Param("pdcode") String pdcode,@Param("pdstate") int pdstate);

   void deleteProduct(String pdcode);

   CafeDto MyProductInfo(String loginId);

   ArrayList<ProductDto> getProduct2();

   ArrayList<ProductDto> getMyProduct(String pdcmcode);

   String getMyProductImg(String pdcode);

   void updateMyProduct(ProductDto product);

   ArrayList<String> getPdType();
   
   ProductDto productInfo(String pdcode);

   ArrayList<ProductDto> selectproductList(@Param("start")int startRow,@Param("end")int endRow, @Param("type")String type);

   int TotalCount2(String rere);
   int TotalCount3();

ArrayList<ProductDto> productList(@Param("start")int startRow, @Param("end")int endRow);

ArrayList<ReviewProductDto> ReviewProductList();

ArrayList<ProductDto> reverseList(@Param("start")int startRow, @Param("end")int endRow);

ArrayList<ProductDto> reverseType(@Param("start")int startRow, @Param("end")int endRow, @Param("pdtype")String pdtype);

ArrayList<ProductDto> reversesearch(@Param("pdcategory")String pdcategory,@Param("searchText")String searchText, @Param("start")int startRow, @Param("end")int endRow);

int selectProduct(@Param("pdcategory")String pdcategory, @Param("searchText")String searchText);



	




   
}