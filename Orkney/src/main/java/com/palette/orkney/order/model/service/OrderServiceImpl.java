package com.palette.orkney.order.model.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.palette.orkney.cart.model.vo.Cart;
import com.palette.orkney.member.model.vo.Point;
import com.palette.orkney.order.model.dao.OrderDao;
import com.palette.orkney.order.model.vo.OrderDetail;
import com.palette.orkney.order.model.vo.Orders;

@Service
public class OrderServiceImpl implements OrderService {

	@Autowired
	private OrderDao dao;
	@Autowired
	private SqlSession session;
		
	@Override
	public List<Map> selectOrderList(String mNo) {
		return dao.selectOrderList(session, mNo);
	}
	
	@Override
	public Orders selectOrder(String oNo) {
		return dao.selectOrder(session, oNo);
	}

	@Override
	public List<OrderDetail> selectOrderDetail(String oNo) {
		return dao.selectOrderDetail(session, oNo);
	}
	

	@Override
	public int cancelRequest(Orders order) {
		return dao.cancelRequest(session, order);
	}

	@Override
	public String selectEmail(String oNo) {
		return dao.selectEmail(session, oNo);
	}
	

	@Override
	public int insertOrders(Orders orders, List<Cart> c) {
		int result =dao.insertOrders(session, orders);
		if(result>0) {
			for(Cart cart : c) {
				cart.setCartNo(orders.getOrder_no());
				result =dao.insertDetail(session,cart );
			}			
		}		
		return result;
	}

	@Override
	public int insertPoint(Point point) {
		return dao.insertPoint(session,point);
	}

	@Override
	public int insertPoint2(Point point) {	
		return dao.insertPoint(session, point);
	}

	
	

}
