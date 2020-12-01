package com.palette.orkney.cart.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.palette.orkney.cart.model.service.CartService;
import com.palette.orkney.cart.model.vo.Cart;

@Controller
public class CartController {
	
	@Autowired
	private CartService service;
	
	
	//장바구니 화면 이동
	@RequestMapping("/cart/cart.do")
	public ModelAndView cart(HttpSession session, ModelAndView mv) {	
		
		System.out.println(session.getAttribute("login"));
		
		String memberNo = (String)((Map)session.getAttribute("login")).get("MEMBER_NO");
		System.out.println(memberNo);
				
		List<Cart> c = service.selectCart(memberNo);
		
		System.out.println(c);
		
//		Cart total = service.selectTotal(c);
			
		
		mv.addObject("cart",c);
		mv.setViewName("cart/cart");
		return mv;
	}
	
	
	//결제전 화면이동
	@RequestMapping("/cart/payment.do")
	public String payment() {
		return "cart/payment";
	}
	//결제후 화면이동
	@RequestMapping("/cart/complete.do")
	public String complete() {
		return "cart/complete";
	}
	//결제화면이동
	@RequestMapping("/cart/creditpay.do")
	public String pay() {
		return "cart/pay";
	}
}

