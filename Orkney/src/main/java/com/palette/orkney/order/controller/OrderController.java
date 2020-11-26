package com.palette.orkney.order.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.palette.orkney.order.model.service.OrderService;

@SessionAttributes("login")
@Controller
public class OrderController {
	
	@Autowired
	private OrderService service;
	
	@RequestMapping("/order/order.do")
	public String orderMain(HttpSession session) {
		return "order/orderMain";
	}
	
	//배송 1건만 조회
	@RequestMapping("/order/orderForm.do")
	public String orderform() {
		return "order/orderForm";
	}
	
	//주문관리
	@RequestMapping("/order/orderList.do")
	public ModelAndView orderList(HttpSession session, ModelAndView mv) {
		Map login = (Map)session.getAttribute("login");
		if(login != null && !login.isEmpty()) {
			String mNo = (String)((Map)session.getAttribute("login")).get("MEMBER_NO");
			mv.addObject("list", service.selectOrderList(mNo));
			System.out.println(service.selectOrderList(mNo));
			mv.setViewName("order/orderList");
		}else {
			mv.setViewName("order/orderLogin");			
		}
		return mv;
		
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
