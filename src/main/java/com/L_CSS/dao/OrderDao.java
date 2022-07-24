package com.L_CSS.dao;

import java.util.ArrayList;

import com.L_CSS.dto.OrderDto;



public interface OrderDao {

	ArrayList<OrderDto> OrderList(String loginId);

	ArrayList<OrderDto> CompanyOrderList(String comId);

	OrderDto selectRecode(String recode);

}
