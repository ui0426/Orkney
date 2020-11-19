package com.palette.orkney.order.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class OrderController {
	
	@RequestMapping("/order/order.do")
	public String order() {
		return "order/order";
	}
	
	@RequestMapping("/order/orderForm.do")
	public String orderform() {
		return "order/orderForm";
	}

}
