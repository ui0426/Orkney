package com.palette.orkney.product.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

public interface ProductDao {

	List<Map> selectRooms(SqlSession session,String type);
	List<Map>selectRoomsProduct(SqlSession session);
	List<Map>roomsDetail(SqlSession session, String type);
	List<Map>selectRoomsTitle(SqlSession session,String type); 
}
