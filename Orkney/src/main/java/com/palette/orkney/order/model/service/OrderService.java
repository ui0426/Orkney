package com.palette.orkney.order.model.service;

import java.util.List;
import java.util.Map;

import com.palette.orkney.cart.model.vo.Cart;
import com.palette.orkney.member.model.vo.Point;
import com.palette.orkney.order.model.vo.OrderDetail;
import com.palette.orkney.order.model.vo.Orders;

public interface OrderService {

	List<Map> selectOrderList(String mNo);
	
	Orders selectOrder(String oNo);
	
	List<OrderDetail> selectOrderDetail(String oNo);
	
	int cancelRequest(Orders order);
	
	String selectEmail(String oNo);
	
	
	//주문 추가 //cartNo=orderNo갱신
	int insertOrders(Orders orders,List<Cart> c);
	
	
	//포인트 차감
	int insertPoint(Point point);
	
	//포인트 적립
	int insertPoint2(Point point);
		
	

}