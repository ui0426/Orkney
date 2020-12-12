package com.palette.orkney.order.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.palette.orkney.cart.model.vo.Cart;
import com.palette.orkney.member.model.vo.Point;
import com.palette.orkney.order.model.vo.OrderDetail;
import com.palette.orkney.order.model.vo.Orders;

public interface OrderDao {
	
	List<Map> selectOrderList(SqlSession session, String mNo);
	
	Orders selectOrder(SqlSession session, String oNo);

	List<OrderDetail> selectOrderDetail(SqlSession session, String oNo);
	
	int cancelRequest(SqlSession session, Orders order);
	
	String selectEmail(SqlSession session, String oNo);
	
	int insertOrders(SqlSession session,Orders orders);
	
	int insertDetail(SqlSession session,Cart cart);
	
	int insertPoint(SqlSession session,Point point);
	
	int insertPoint2(SqlSession session, Point point);
}
