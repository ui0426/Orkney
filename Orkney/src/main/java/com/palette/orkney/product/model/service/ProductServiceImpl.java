package com.palette.orkney.product.model.service;


import java.util.ArrayList;
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
	public List<Map> sCategory(Map<String, Object> sCategory) {
		// TODO Auto-generated method stub
		return dao.sCategory(session,sCategory);
	}
	@Override
	public List<Map> reviewImg(Map<String, Object> id) {
		// TODO Auto-generated method stub
		return dao.reviewImg(session,id);
	}
	
	@Override
	public List<Map> productList( Map<String,Object> category) {
		// TODO Auto-generated method stub
		return dao.productList(session,category);
	}
	@Override
	public List<Map> checkProduct(ArrayList<String> checkboxname) {
		// TODO Auto-generated method stub
		return dao.checkProduct(session, checkboxname);
	}

	@Override
	public List<Map> filter(Map<String, Object> filter) {
		// TODO Auto-generated method stub
		return dao.filter(session,filter);
	}
	@Override
	public List<Map> productDetail(String productno) {
		// TODO Auto-generated method stub
		return dao.productDetail(session,productno);
	}
	@Override
	public List<Map> review(String productno) {
		// TODO Auto-generated method stub
		return dao.review(session,productno);
	}
	@Override
	public List<Map> average(Map<String, Object> productno) {
		// TODO Auto-generated method stub
		return dao.average(session,productno);
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


	@Override
	public List<Map> listProduct(String type) {
		// TODO Auto-generated method stub
		return dao.listProduct(session,type);
	}

	@Override
	public String allProductList() {
		// TODO Auto-generated method stub
		return dao.allProductList(session);
	}

	@Override
	public List<Map> productCategory(Map texts) {
		// TODO Auto-generated method stub
		return dao.productCategory(session,texts);
	}

	@Override
	public List<Map> sale() {
		// TODO Auto-generated method stub
		return dao.sale(session);
	}



	 

	  
	

}
