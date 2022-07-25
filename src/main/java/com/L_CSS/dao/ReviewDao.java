package com.L_CSS.dao;

import org.apache.ibatis.annotations.Param;

public interface ReviewDao {

	String getmax();

	int insertResult(@Param("pdcode")String pdcode,@Param("recomment")String recomment, 
			@Param("rvrecommend")int rvrecommend, @Param("loginId")String loginId, @Param("rvrecode")String recode);

}
