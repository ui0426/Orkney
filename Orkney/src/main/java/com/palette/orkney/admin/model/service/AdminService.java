package com.palette.orkney.admin.model.service;

import java.util.List;
import java.util.Map;

import com.palette.orkney.order.model.vo.Orders;

public interface AdminService {

	List<Map> chatData(Map m);

	List<String> userCount();

	List<String> roomNo(String data);
	
	List<Orders> selectOrderList();
	
	int updateOrderState(Map o);

}
