package com.palette.orkney.order.model.service;

import java.util.List;
import java.util.Map;

import com.palette.orkney.cart.model.vo.Cart;
import com.palette.orkney.order.model.vo.OrderDetail;
import com.palette.orkney.order.model.vo.Orders;

public interface OrderService {

	List<Map> selectOrderList(String mNo);
	
	List<Map> selectOrderEndList(String mNo);
	
	Orders selectOrder(String oNo);
	
	List<OrderDetail> selectOrderDetail(String oNo);
	
	int cancelRequest(Orders order);
	
	String selectEmail(String oNo);
	
	int orderConfirm(OrderDetail od, String mNo);
	
	//주문 추가 //cartNo=orderNo갱신
	int insertOrders(Orders orders,List<Cart> c);
		
	//포인트 차감
	int insertPoint(Map<String, Object> point);
	
	//포인트 적립
//	int insertPoint2(Map<String, Object> point2);
	
	String selectOno(Orders orders);
	
	int updateRefund(OrderDetail od);
	
}