package com.palette.orkney.order.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

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
	
	
	

}
