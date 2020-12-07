package com.palette.orkney.cart.model.service;

import java.util.List;
import java.util.Map;

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
	
	@Override
	public String selectCartNo(String memberNo) {
		return dao.selectCartNo(session,memberNo);
	}

	@Override
	public int deleteProduct(Map<String, String> param) {
		return dao.deleteProduct(session,param);
	}
		
	@Override
	public int deleteBasket(String cartNo) {
		return dao.deleteBasket(session,cartNo);
	}

	@Override
	public Cart memberInfo(String memberNo) {
		return dao.memberInfo(session,memberNo);
	}

	@Override
	public int updateDetail(Cart cart) {	
		return dao.updateDetail(session,cart);
	}

	@Override
	public int sumPrice(String cartNo) {	
		return dao.sumPrice(session,cartNo);
	}

	

	



	
	
	
}
