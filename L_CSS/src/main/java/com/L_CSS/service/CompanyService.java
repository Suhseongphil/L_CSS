package com.L_CSS.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.L_CSS.dao.CompanyDao;

@Service
public class CompanyService {

	@Autowired
	CompanyDao cdao;
}
