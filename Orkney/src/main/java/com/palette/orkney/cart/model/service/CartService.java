package com.palette.orkney.cart.model.service;

import java.util.List;

import com.palette.orkney.cart.model.vo.Cart;

public interface CartService {

	List<Cart> selectCart(String memberNo);

}
