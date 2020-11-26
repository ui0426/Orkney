package com.palette.orkney.order.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class OrderDaoImpl implements OrderDao {

	@Override
	public List<Map> selectOrderList(SqlSession session, String mNo) {
		return session.selectList("order.selectOrderList", mNo);
	}
	
	

}
