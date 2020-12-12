package com.palette.orkney.order.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.palette.orkney.cart.model.vo.Cart;
import com.palette.orkney.member.model.vo.Point;
import com.palette.orkney.order.model.vo.OrderDetail;
import com.palette.orkney.order.model.vo.Orders;

@Repository
public class OrderDaoImpl implements OrderDao {

	@Override
	public List<Map> selectOrderList(SqlSession session, String mNo) {
		return session.selectList("order.selectOrderList", mNo);
	}

	@Override
	public Orders selectOrder(SqlSession session, String oNo) {
		return session.selectOne("order.selectOrder", oNo);
	}

	@Override
	public List<OrderDetail> selectOrderDetail(SqlSession session, String oNo) {
		return session.selectList("order.selectOrderDetail", oNo);
	}

	@Override
	public int cancelRequest(SqlSession session, Orders order) {
		return session.update("order.updatecancelRequest", order);
	}

	@Override
	public String selectEmail(SqlSession session, String oNo) {
		return session.selectOne("order.selectEmail", oNo);
	}

	@Override
	public int insertOrders(SqlSession session, Orders orders) {
		return session.insert("order.insertOrders",orders);
	}

	@Override
	public int insertDetail(SqlSession session, Cart cart) {	
		return session.insert("order.insertDetail",cart);
	}

	@Override
	public int insertPoint(SqlSession session, Point point) {	
		return session.insert("order.insertPoint",point);
	}

	@Override
	public int insertPoint2(SqlSession session, Point point) {	
		return session.insert("order.inserPoint2",point);
	}
	
	
	

}
