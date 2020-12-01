package com.palette.orkney.cart.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.palette.orkney.cart.model.vo.Cart;

@Repository
public class CartDaoImpl implements CartDao{

	@Override
	public List<Cart> selectCart(SqlSession session, String memberNo) {
		return session.selectList("cart.selectCart",memberNo);
	}

	
}
