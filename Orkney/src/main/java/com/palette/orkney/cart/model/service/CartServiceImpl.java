package com.palette.orkney.cart.model.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.palette.orkney.cart.model.dao.CartDao;
import com.palette.orkney.cart.model.vo.Cart;
import com.palette.orkney.cart.model.vo.CartDetail;

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
	public int updateDetail(Cart cart) {	
		return dao.updateDetail(session,cart);
	}

	@Override
	public int sumPrice(String cartNo) {	
		return dao.sumPrice(session,cartNo);
	}

	@Override
	public int productSum(Map<String, String> param1) {	
		return dao.productSum(session,param1);
	}

	@Override
	public int countCart(String memberNo) {	
		return dao.countCart(session,memberNo);
	}

	@Override
	public int updateCart(Cart cart) {	
		return dao.updateCart(session,cart);
	}

	@Override
	public int insertCart(Cart cart) {	
		return dao.insertCart(session,cart);
	}

	@Override
	public int selectCount(String cartNo) {
		return dao.selectCount(session,cartNo);
	}

	@Override
	public int cartDelete(String memberNo) {
		return dao.cartDelete(session,memberNo);
	}

	@Override
	public int insertDetail(Cart cart) {
		return dao.insertDetail(session,cart);
	}

	@Override
	public int countProduct(String productNo,String cartNo) {	
		return dao.countProduct(session,productNo,cartNo);
	}
	
	
	
	

	



	
	
	
}
