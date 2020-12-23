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
	
	int updateDetail(SqlSession session,Cart cart);
	
	int sumPrice(SqlSession session,String cartNo);
	
	int productSum(SqlSession session,Map<String, String> param1);

	int countCart(SqlSession session,String memberNo);
	
	int updateCart(SqlSession session,Cart cart);
	
	int insertCart(SqlSession session,Cart cart);
	
	int selectCount(SqlSession session,String cartNo);
	
	int cartDelete(SqlSession session,String memberNo);
	
	int insertDetail(SqlSession session,Cart cart);
	
	int countProduct(SqlSession session,String productNo,String cartNo);
}


