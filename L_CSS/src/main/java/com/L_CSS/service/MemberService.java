package com.L_CSS.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.L_CSS.dao.MemberDao;

@Service
public class MemberService {
	
	@Autowired
	MemberDao mdao;
}