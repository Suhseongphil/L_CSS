package com.L_CSS.dao;

import org.apache.ibatis.annotations.Param;

import com.L_CSS.dto.OrderDto;
import com.L_CSS.dto.ReservationDto;

public interface ReservationDao {

	String getmax();

	int insertReTable(ReservationDto reserv);

	int orderCancel(@Param("recode")String recode);

	int deleteOrder(String recode);

	int orderCheck(String recode);

	

	

}
