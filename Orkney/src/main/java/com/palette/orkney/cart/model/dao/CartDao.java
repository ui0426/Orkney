package com.palette.orkney.cart.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.palette.orkney.cart.model.vo.Cart;
import com.palette.orkney.cart.model.vo.CartDetail;

public interface CartDao {

	List<Cart> selectCart(SqlSession session,String memberNo);
	
	String selectCartNo(SqlSession session,String memberNo);
	
	int deleteProduct(SqlSession session,Map<String, String>param);
	
	int deleteBasket(SqlSession session,String cartNo);
	
	Cart memberInfo(SqlSession session,String memberNo);
	
	int updateDetail(SqlSession session,CartDetail detail);
}


