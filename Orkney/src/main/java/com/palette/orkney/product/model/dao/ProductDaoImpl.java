package com.palette.orkney.product.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository

public class ProductDaoImpl implements ProductDao{
//소카테고리 뽑아오기
	@Override
	public List<Map> sCategory(SqlSession session, Map<String, Object> sCategory) {
		// TODO Auto-generated method stub
		System.out.println("dao:"+session.selectList("product.filter",sCategory));
		return session.selectList("product.sCategory",sCategory);
	}
//리뷰이미지
	@Override
	public List<Map> reviewImg(SqlSession session, Map<String, Object> id) {
		// TODO Auto-generated method stub
		return session.selectList("product.reviewImg2",id);
	}
//제품리스트
	@Override
	public List<Map> productList(SqlSession session,  Map<String,Object> category) {
		System.out.println(session.selectList("product.productList",category));
		return session.selectList("product.productList",category);
	}
//체크된 제품 비교 모달로 이미지 연결
	@Override
	public List<Map> checkProduct(SqlSession session, ArrayList<String> list) {
		// TODO Auto-generated method stub
		return session.selectList("product.checkProduct",list);
	}
//필터기능
	@Override
	public List<Map> filter(SqlSession session, Map<String, Object> filter) {
		// TODO Auto-generated method stub
		System.out.println("dao:"+session.selectList("product.filter",filter));
		return session.selectList("product.filter",filter);
	}
//제품 상세 페이지
	@Override
	public List<Map> productDetail(SqlSession session, String productNo) {
		// TODO Auto-generated method stub
		return session.selectList("product.productDetail",productNo);
	}
//리뷰 불러오기
	@Override
	public List<Map> review(SqlSession session, String productNo) {
		// TODO Auto-generated method stub
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

	 



}
