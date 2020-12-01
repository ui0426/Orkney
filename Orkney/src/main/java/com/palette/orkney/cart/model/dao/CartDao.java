package com.palette.orkney.cart.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.palette.orkney.cart.model.vo.Cart;

public interface CartDao {

	List<Cart> selectCart(SqlSession session,String memberNo);

}
