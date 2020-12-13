package com.palette.orkney.product.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository

public class ProductDaoImpl implements ProductDao{

	@Override
	public List<Map> productList(SqlSession session) {
		
		System.out.println(session.selectList("product.productList"));
		/* 받은 데이터 확인 ( 삭제 ) */
		return session.selectList("product.productList");
	}
	@Override
	public List<Map> checkProduct(SqlSession session, ArrayList<String> list) {
		// TODO Auto-generated method stub
		return session.selectList("product.checkProduct",list);
	}
	 

	@Override
	public List<Map> lowPriceFilter(SqlSession session) {
		// TODO Auto-generated method stub
		System.out.println(session.selectList("product.lowPriceFilter"));
		/* 받은 데이터 확인 ( 삭제 ) */
		return session.selectList("product.lowPriceFilter");
	}

	@Override
	public List<Map> highPriceFilter(SqlSession session) {
		// TODO Auto-generated method stub
		return session.selectList("product.highPriceFilter");
	}

	@Override
	public List<Map> newProductFilter(SqlSession session) {
		// TODO Auto-generated method stub
		System.out.println(session.selectList("product.newProductFilter"));
		return session.selectList("product.newProductFilter");
	}

	@Override
	public List<Map> nameFilter(SqlSession session) {
		// TODO Auto-generated method stub
		return session.selectList("product.nameFilter");
	}

	@Override
	public List<Map> filter(SqlSession session, Map<String, Object> filter) {
		// TODO Auto-generated method stub
		System.out.println("dao:"+session.selectList("product.filter",filter));
		return session.selectList("product.filter",filter);
	}
	@Override
	public List<Map> productDetail(SqlSession session, String productNo) {
		// TODO Auto-generated method stub
		System.out.println("제품정보:"+session.selectList("product.productDetail",productNo));
		return session.selectList("product.productDetail",productNo);
	}
	@Override
	public List<Map> review(SqlSession session, String productNo) {
		// TODO Auto-generated method stub
		System.out.println("리뷰정보:"+session.selectList("product.review",productNo));
		return session.selectList("product.review",productNo);
	}
	
	
//====================================================================


	@Override
	public List<Map> selectRooms(SqlSession session,String type) {
		// TODO Auto-generated method stub
		return session.selectList("product.selectRooms",type);
	}

	@Override
	public List<Map> selectRoomsProduct(SqlSession session, String type) {
		// TODO Auto-generated method stub
		return session.selectList("product.selectRoomsProduct",type);
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
