package com.palette.orkney.cart.model.service;

import java.lang.reflect.Member;
import java.util.List;
import java.util.Map;

import com.palette.orkney.cart.model.vo.Cart;

public interface CartService {

	List<Cart> selectCart(String memberNo);

	String selectCartNo(String memberNo);

	int deleteProduct(Map<String, String> param);
	
	int deleteBasket(String cartNo);
	
	Member memberInfo(String memberNo);
	
}
