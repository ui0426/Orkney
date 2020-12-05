package com.palette.orkney.cart.model.service;

import java.util.List;
import java.util.Map;

import com.palette.orkney.cart.model.vo.Cart;
import com.palette.orkney.cart.model.vo.CartDetail;

public interface CartService {

	List<Cart> selectCart(String memberNo);

	String selectCartNo(String memberNo);

	int deleteProduct(Map<String, String> param);
	
	int deleteBasket(String cartNo);
	
	Cart memberInfo(String memberNo);
	
	int updateDetail(CartDetail detail);
	
}
