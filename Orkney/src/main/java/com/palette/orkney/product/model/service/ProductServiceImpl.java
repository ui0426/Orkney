package com.palette.orkney.product.model.service;



import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.palette.orkney.product.model.dao.ProductDao;

@Service
public class ProductServiceImpl implements ProductService {
	
	@Autowired
	private ProductDao dao;
	
	@Autowired
	private SqlSession session;
	
	@Override
	public List<Map> selectRooms(String type) {
		
		return dao.selectRooms(session,type);
	}

	@Override
	public List<Map> selectRoomsProduct() {
		// TODO Auto-generated method stub
		return dao.selectRoomsProduct(session);
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
