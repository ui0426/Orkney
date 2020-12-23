package com.palette.orkney.product.model.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

public interface ProductDao {


		List<Map> sCategory(SqlSession session,Map<String, Object> sCategory);
		List<Map> reviewImg(SqlSession session,Map<String, Object> id);
		List<Map> productList(SqlSession session, Map<String,Object> category);
		List<Map> checkProduct(SqlSession session, ArrayList<String> checkboxname); 
		List<Map> filter(SqlSession session,Map<String, Object> filter);
		List<Map> productDetail(SqlSession session, String productno);
		List<Map> review(SqlSession session, String productno);
		List<Map> average(SqlSession session, Map<String, Object> productno);

//==================================================================================
	List<Map> selectRooms(SqlSession session,String type);
	List<Map>selectRoomsProduct(SqlSession session ,String type);
	List<Map>roomsDetail(SqlSession session, String type);
	List<Map>listProduct(SqlSession session,String type);
	String allProductList(SqlSession session);
	List<Map>productCategory(SqlSession session,Map texts);
	List<Map>sale(SqlSession session);
	List<Map>selectRoomsTitle(SqlSession session,String type); 
	int insertRoom(SqlSession session,Map<String, Object> room);
	List<Map> roomChange(SqlSession session);
	int updateRoom(SqlSession session,Map rooms);
	int roomsTitle(SqlSession session,Map titles);
	 List<Map> buttomProduct(SqlSession session ,Map ty); 

//==================================================================================
	//재고 갱신
	int updateStock(SqlSession session, Map m);
	
	String selectSale(SqlSession session,String productNo);
}
