package com.palette.orkney.order.controller;

import java.io.IOException;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
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
			String mNo = (String)login.get("MEMBER_NO");
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
	@ResponseBody
	public String orderLoginAjax(String id, String pw, Model m) throws IOException {
		Map login=mservice.loginCheck(id);
		System.out.println(login);
		if(login!=null&&pwEncoder.matches(pw,(String)login.get("MEMBER_PWD"))) {
			m.addAttribute("login", login);
			return "true";
		}else {
			return "false";
		}
	}
//	public String orderLogin(String id, String password, Model m) {
//		
//		Map login=mservice.loginCheck(id);
//		
//		if(login!=null&&pwEncoder.matches(password,(String)login.get("MEMBER_PWD"))) {
//			String mNo = (String)login.get("MEMBER_NO");
//			m.addAttribute("login",login);
//			m.addAttribute("list", service.selectOrderList(mNo));
//			return "order/orderList";
//		}else {
//			m.addAttribute("msg", "사용하신 인증정보가 올바르지 않습니다. 확인 후 다시 시도해주세요.");
//			return "order/orderLogin";
//		}
//	}
	
	//주문상세내역 보기
	@RequestMapping("/order/orderView.do")
	public ModelAndView orderView(ModelAndView mv, String oNo) {
			System.out.println(oNo);
			Orders order = service.selectOrder(oNo);
			//주소 나누기(우편번호, 기본, 상세)
			String[] addr = order.getOrder_address().split("/");
			order.setAddress_post(addr[0]);
			order.setAddress_addr(addr[1]);
			order.setAddress_detail(addr[2]);
			System.out.println("주소나눈 후 : "+order);
			order.setOdList(service.selectOrderDetail(oNo));
			mv.addObject("order", order);
			System.out.println("주문 상세내역까지 담은 주문내역 : "+order);
			mv.setViewName("order/orderView");
		
		return mv;
	}
	
	@RequestMapping("/order/orderFormCheck.do")
	@ResponseBody
	public boolean orderFormCheck(String oNo, String mId) {
		System.out.println(oNo);
		Orders order = service.selectOrder(oNo);
		Map login=mservice.loginCheck(mId);
		System.out.println("입력한 주문번호가 있는 건가?"+order);
		System.out.println("입력한 아이디가 있는 건가?"+login);
		if(order != null && login != null) {
			order.setOdList(service.selectOrderDetail(oNo));
			if(order.getMember_no().equals((String)login.get("MEMBER_NO"))) {//주문번호로 주문한 회원과 입력한 아이디가 동일한 회원이 맞는지도 확인해야함!!
				return true;
			}else {
				System.out.println("주문번호로 조회한 주문정보에 담긴 회원번호와 입력한 회원번호가 일치하지 않음");
				return false;
			}
		}else {
			return false;
		}
		//return order != null && login != null? true : false; 
	}
	
	//취소요청 모달 ajax
	@RequestMapping("/order/cancelRequest.do")
	@ResponseBody
	public String orderCancelRequest(String oNo, String oState, String cReason) {
		Orders order = new Orders();
		order.setOrder_no(oNo);
		order.setOrder_state(oState);
		order.setCancel_reason(cReason);
		System.out.println("취소사유 : "+order.getCancel_reason());
		
		int result = service.cancelRequest(order);
		System.out.println("취소요청으로 바뀌고 취소사유 담은 후 : "+order);
		String email="";
		if(result>0) {
			System.out.println("업데이트 후 결과 값 : "+result);
			email = service.selectEmail(oNo);
			System.out.println("주문자의 이메일 : "+email);
		}
		return email;
	}
	

	//임시
	@RequestMapping("/order/orderEndView.do")
	public String oev() {
		return "order/orderEndView";
	}
}
