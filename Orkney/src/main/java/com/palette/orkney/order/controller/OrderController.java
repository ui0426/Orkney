package com.palette.orkney.order.controller;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.palette.orkney.member.model.service.MemberService;
import com.palette.orkney.order.model.service.OrderService;
import com.palette.orkney.order.model.vo.Orders;

@SessionAttributes("login")
@Controller
public class OrderController {
	
	@Autowired
	private OrderService service;
	@Autowired
	private MemberService mservice;
	@Autowired
	private BCryptPasswordEncoder pwEncoder;
	
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
			System.out.println("로그인 한 상태에서 주문내역 조회 : "+service.selectOrderList(mNo));
			mv.setViewName("order/orderList");
		}else {
			mv.setViewName("order/orderLogin");			
		}
		return mv;
	}
	
	//로그인 안한 상태로 주문관리 클릭 후 주문조회만을 위한 로그인 할 때
	@RequestMapping("/order/orderLogin.do")
	public String orderLogin(String id, String password, Model m) {
		
		Map login=mservice.loginCheck(id);
		
		if(login!=null&&pwEncoder.matches(password,(String)login.get("MEMBER_PWD"))) {
			String mNo = (String)login.get("MEMBER_NO");
			m.addAttribute("login",login);
			m.addAttribute("list", service.selectOrderList(mNo));
			return "order/orderList";
		}else {
			m.addAttribute("msg", "사용하신 인증정보가 올바르지 않습니다. 확인 후 다시 시도해주세요.");
			return "order/orderLogin";
		}
	}
	
	//주문상세내역 보기
	@RequestMapping("/order/orderView.do")
	public ModelAndView orderView(ModelAndView mv, String oNo) {
		
		Orders order = service.selectOrder(oNo);
		order.setOdList(service.selectOrderDetail(oNo));
		mv.addObject("order", order);
		System.out.println("주문 상세내역까지 담은 주문내역 : "+order);
		mv.setViewName("order/orderView");
		return mv;
	}

	//임시
	@RequestMapping("/order/orderEndView.do")
	public String oev() {
		return "order/orderEndView";
	}
}
