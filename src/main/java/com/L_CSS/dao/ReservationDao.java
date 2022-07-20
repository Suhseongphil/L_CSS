package com.L_CSS.dao;

import java.util.ArrayList;

import com.L_CSS.dto.ReservationDto;

public interface ReservationDao {

	String getmax();

	int insertReTable(ReservationDto reserv);

}
