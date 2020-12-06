package com.palette.orkney.order.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.palette.orkney.order.model.vo.OrderDetail;
import com.palette.orkney.order.model.vo.Orders;

public interface OrderDao {
	
	List<Map> selectOrderList(SqlSession session, String mNo);
	
	Orders selectOrder(SqlSession session, String oNo);

	List<OrderDetail> selectOrderDetail(SqlSession session, String oNo);
	
	int cancelRequest(SqlSession session, Orders order);
	
	String selectEmail(SqlSession session, String oNo);
}
