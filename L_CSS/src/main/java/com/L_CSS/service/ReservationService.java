package com.L_CSS.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.L_CSS.dao.ReservationDao;

@Service
public class ReservationService {
	
	@Autowired
	ReservationDao rdao;
}
