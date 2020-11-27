package com.palette.orkney.order.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

public interface OrderDao {
	
	List<Map> selectOrderList(SqlSession session, String mNo);

}
