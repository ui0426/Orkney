package com.palette.orkney.product.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class ProductDaoImpl implements ProductDao {

	@Override
	public List<Map> selectRooms(SqlSession session,String type) {
		// TODO Auto-generated method stub
		return session.selectList("product.selectRooms",type);
	}

	@Override
	public List<Map> selectRoomsProduct(SqlSession session) {
		// TODO Auto-generated method stub
		return session.selectList("product.selectRoomsProduct");
	}

	@Override
	public List<Map> roomsDetail(SqlSession session, String type) {
		// TODO Auto-generated method stub
		return session.selectList("product.roomsDetail",type);
	}

	
	 @Override public List<Map> selectRoomsTitle(SqlSession session, String type)
	 { // TODO Auto-generated method stub return
		 return session.selectList("product.selectRoomsTitle",type); }
	 

}
