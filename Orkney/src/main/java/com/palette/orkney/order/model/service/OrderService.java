package com.palette.orkney.order.model.service;

import java.util.List;
import java.util.Map;

import com.palette.orkney.order.model.vo.OrderDetail;
import com.palette.orkney.order.model.vo.Orders;

public interface OrderService {

	List<Map> selectOrderList(String mNo);
	
	Orders selectOrder(String oNo);
	
	List<OrderDetail> selectOrderDetail(String oNo);
	
	int cancelRequest(Orders order);
	
	String selectEmail(String oNo);
	
	int updateSort(OrderDetail od);
	
}