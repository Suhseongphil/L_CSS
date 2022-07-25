package com.L_CSS.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import com.L_CSS.dto.CafeDto;
import com.L_CSS.dto.CompanyDto;
import com.L_CSS.dto.ProductDto;

public interface ProductDao {

	String getmax();

	void inserttbList(ProductDto productDto);

	void insertcmList(ProductDto productDto);

	void inserthdList(ProductDto productDto);

	ArrayList<ProductDto> selectPro();

	ProductDto getProduct(@Param("type")String type, @Param("i")int i);

	ArrayList<ProductDto> proInfo(String cmcode);

	ArrayList<ProductDto> searchList(@Param("pdcategory")String pdcategory,@Param("searchText")String searchText);

	ArrayList<ProductDto> searchType(String type);

	CompanyDto MyProduct(String loginId);

	int insertProduct(ProductDto product);


	int updateState(String pdcode, int pdstate);

	int deleteProduct(String pdcode);

	CafeDto MyProductInfo(String loginId);

	ArrayList<ProductDto> getProduct2();

	ArrayList<ProductDto> getMyProduct(String pdcmcode);

	String getMyProductImg(String pdcode);

	int updateMyProduct(ProductDto product);

	int TotalCount2();

	ArrayList<ProductDto> selectproductList(@Param("start")int startRow,@Param("end")int endRow);

	

}
