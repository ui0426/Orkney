package com.palette.orkney.product.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

public interface ProductDao {

	List<Map> selectRooms(SqlSession session,String type);
	List<Map>selectRoomsProduct(SqlSession session ,String type);
	List<Map>roomsDetail(SqlSession session, String type);
	List<Map>selectRoomsTitle(SqlSession session,String type);
	List<Map>listProduct(SqlSession session,String type);
	String allProductList(SqlSession session);
	List<Map>productCategory(SqlSession session,Map texts);
	List<Map>sale(SqlSession session);
}
