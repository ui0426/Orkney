package com.palette.orkney.cart.model.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.palette.orkney.cart.model.dao.CartDao;
import com.palette.orkney.cart.model.vo.Cart;

@Service
public class CartServiceImpl implements CartService{

	@Autowired
	private CartDao dao;
	
	@Autowired
	private SqlSession session;

	@Override
	public List<Cart> selectCart(String memberNo) {
		return dao.selectCart(session,memberNo);
	}
	
	
	
}
