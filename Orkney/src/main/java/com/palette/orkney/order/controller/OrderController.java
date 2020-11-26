package com.palette.orkney.order.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class OrderController {
	
	@RequestMapping("/order/order.do")
	public String orderMain() {
		return "order/orderMain";
	}
	
	@RequestMapping("/order/orderForm.do")
	public String orderform() {
		return "order/orderForm";
	}
	
	@RequestMapping("/order/orderLogin.do")
	public String orderLogin() {
		return "order/orderLogin";
	}
	
	@RequestMapping("/order/orderList.do")
	public String orderList() {
		return "order/orderList";
	}
	
	@RequestMapping("/order/orderView.do")
	public String orderView() {
		return "order/orderView";
	}
	
	//임시
	@RequestMapping("/order/orderView2.do")
	public String orderView2() {
		return "order/orderView2";
	}

}
