package com.palette.orkney.product.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.commons.collections.map.HashedMap;
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

	@Override
	public List<Map> listProduct(SqlSession session,String type) {
		// TODO Auto-generated method stub
		return session.selectList("product.listProduct",type);
	}

	@Override
	public String allProductList(SqlSession session) {
		// TODO Auto-generated method stub
		return session.selectOne("product.allProductList");
	}

	@Override
	public List<Map> productCategory(SqlSession session, Map texts) {
		// TODO Auto-generated method stub
		return session.selectList("product.productCategory",texts);
	}

	@Override
	public List<Map> sale(SqlSession session) {
		// TODO Auto-generated method stub
		return session.selectList("product.sale");
	}

	@Override
	public int insertRoom(SqlSession session, Map<String, Object> room) {
		// TODO Auto-generated method stub
		System.out.println(room);
		return session.update("product.insertRoom",room);
		
	}

	@Override
	public List<Map> roomChange(SqlSession session) {
		// TODO Auto-generated method stub
		return session.selectList("product.roomChange");
	}

	@Override
	public int updateRoom(SqlSession session, Map rooms) {
		// TODO Auto-generated method stub
		/*for(Object map : rooms) {
			System.out.println("????????????????????????????????????????????????");*/
		
		return session.insert("product.updateRoom",rooms);
			/*
			 * } return 0;
			 */
		
	}

	@Override
	public int roomsTitle(SqlSession session, Map titles) {
		// TODO Auto-generated method stub
		System.out.println(titles);
		return session.update("product.roomsTitle",titles);
		
	}

	
	  @Override public List<Map> buttomProduct(SqlSession session, Map ty) {
		  // TODO Auto-generated method stub 
		  return session .selectList("product.buttomProduct",ty); 
		  }
	  
	 

	
	 


}
