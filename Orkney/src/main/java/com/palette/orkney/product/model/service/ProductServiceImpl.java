package com.palette.orkney.product.model.service;


import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.palette.orkney.product.model.dao.ProductDao;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class ProductServiceImpl implements ProductService{
	
	@Autowired
	private ProductDao dao;
	@Autowired
	private SqlSession session;

	@Override
	public List<Map> productList() {
		// TODO Auto-generated method stub
		return dao.productList(session);
	}

	@Override
	public List<Map> lowPriceFilter() {
		// TODO Auto-generated method stub
		return dao.lowPriceFilter(session);
	}

	@Override
	public List<Map> highPriceFilter() {
		// TODO Auto-generated method stub
		return dao.highPriceFilter(session);
	}

	@Override
	public List<Map> newProductFilter() {
		// TODO Auto-generated method stub
		return dao.newProductFilter(session);
	}

	@Override
	public List<Map> nameFilter() {
		// TODO Auto-generated method stub
		return dao.nameFilter(session);
	}

	@Override
	public List<Map> filter(Map<String, Object> filter) {
		// TODO Auto-generated method stub
		return dao.filter(session,filter);
	}




//================================================================================

	

	
	@Override
	public List<Map> selectRooms(String type) {
		
		return dao.selectRooms(session,type);
	}

	@Override
	public List<Map> selectRoomsProduct(String type) {
		// TODO Auto-generated method stub
		return dao.selectRoomsProduct(session,type);
	}

	@Override
	public List<Map> roomsDetail(String type) {
		// TODO Auto-generated method stub
		return dao.roomsDetail(session,type);
	}

	
	  @Override public List<Map> selectRoomsTitle(String type) { 
		  // TODO Auto-generated method stub 
	  return dao.selectRoomsTitle(session,type); }
	 

	  
	

}
