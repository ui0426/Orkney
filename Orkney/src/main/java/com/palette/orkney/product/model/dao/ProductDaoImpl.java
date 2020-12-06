package com.palette.orkney.product.model.dao;

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
	
	

}
