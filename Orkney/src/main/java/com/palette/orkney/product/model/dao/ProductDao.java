package com.palette.orkney.product.model.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

public interface ProductDao {


		List<Map> productList(SqlSession session);
		List<Map> checkProduct(SqlSession session, ArrayList<String> checkboxname); 
		List<Map> filter(SqlSession session,Map<String, Object> filter);
		List<Map> lowPriceFilter(SqlSession session);
		List<Map> highPriceFilter(SqlSession session);
		List<Map> newProductFilter(SqlSession session);
		List<Map> nameFilter(SqlSession session);
		List<Map> productDetail(SqlSession session, String productno);
		List<Map> review(SqlSession session, String productno);
//==================================================================================
	List<Map> selectRooms(SqlSession session,String type);
	List<Map>selectRoomsProduct(SqlSession session ,String type);
	List<Map>roomsDetail(SqlSession session, String type);

	List<Map>listProduct(SqlSession session,String type);
	String allProductList(SqlSession session);
	List<Map>productCategory(SqlSession session,Map texts);
	List<Map>sale(SqlSession session);
	List<Map>selectRoomsTitle(SqlSession session,String type); 




}
