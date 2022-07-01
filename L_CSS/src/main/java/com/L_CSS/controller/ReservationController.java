package com.L_CSS.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.L_CSS.service.ReservationService;

@Controller
public class ReservationController {
	
	@Autowired
	ReservationService rsv;
}
