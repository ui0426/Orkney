package com.palette.orkney.cart.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class CartController {

//	@Autowired
//	private CartService service;	
	@RequestMapping("/cart/cart.do")
	public String cart() {
		
		return "cart/cart";
	}	
	@RequestMapping("/cart/payment.do")
	public String payment() {
		return "cart/payment";
	}
	@RequestMapping("/cart/complete.do")
	public String complete() {
		return "cart/complete";
	}
}

