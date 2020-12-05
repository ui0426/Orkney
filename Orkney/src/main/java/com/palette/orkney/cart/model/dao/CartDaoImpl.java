package com.palette.orkney.cart.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.palette.orkney.cart.model.vo.Cart;
import com.palette.orkney.cart.model.vo.CartDetail;

@Repository
public class CartDaoImpl implements CartDao{

	@Override
	public List<Cart> selectCart(SqlSession session, String memberNo) {
		return session.selectList("cart.selectCart",memberNo);
	}
	
	@Override
	public String selectCartNo(SqlSession session, String memberNo) {
		return session.selectOne("cart.selectCartNo",memberNo);
	}

	@Override
	public int deleteProduct(SqlSession session, Map<String, String> param) {
		return session.delete("cart.deleteProduct", param);
	}		
	
	@Override
	public int deleteBasket(SqlSession session, String cartNo) {		
		return session.delete("cart.deleteBasket",cartNo);
	}

	@Override
	public Cart memberInfo(SqlSession session, String memberNo) {
		return session.selectOne("cart.memberInfo", memberNo);
	}

	@Override
	public int updateDetail(SqlSession session, CartDetail detail) {	
		return session.update("cart.updateDetail",detail);
	}

	
	





	
}
