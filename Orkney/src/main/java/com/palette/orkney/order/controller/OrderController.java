package com.palette.orkney.order.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.palette.orkney.cart.model.service.CartService;
import com.palette.orkney.cart.model.vo.Cart;
import com.palette.orkney.member.model.service.MemberService;
import com.palette.orkney.order.model.service.OrderService;
import com.palette.orkney.order.model.vo.OrderDetail;
import com.palette.orkney.order.model.vo.Orders;
import com.palette.orkney.review.model.vo.ReviewImage;

@SessionAttributes("login")
@Controller
public class OrderController {
	
	private static final String Map = null;
	@Autowired
	private OrderService service;
	@Autowired
	private MemberService mservice;
	@Autowired
	private BCryptPasswordEncoder pwEncoder;
	@Autowired
	private CartService cservice;	
	
	//결제후
	@RequestMapping("/cart/complete.do")
	@ResponseBody
	public ModelAndView complete(ModelAndView mv,
			String reName,String rePhone,HttpSession session,
			String reAddress, String message,int kopQty, String paymentMethod,	
			Orders orders,int totalFee, int willPoint,int addTax,int totalPoint,int sumProduct,int shipFee
			)throws NumberFormatException {
		
		String memberNo = (String)((Map)session.getAttribute("login")).get("MEMBER_NO");
		String memberId = (String)((Map)session.getAttribute("login")).get("MEMBER_ID");		
		
		//order insert 필요한거  
		//회원번호0, 받는사람 이름0, 받는사람 전화번호0, 받는사람 주소0, 주문수량(상품종류 몇개인지)0, 상품 총가격0, 결제방법0		
		orders.setMember_no(memberNo);
		orders.setOrder_name(reName);
		orders.setOrder_phone(rePhone);
		orders.setOrder_address(reAddress);		
		orders.setOrder_qty(kopQty);
		orders.setTotal_price(totalFee);
		orders.setPayment_method(paymentMethod);
		orders.setOrder_memo(message);	
		orders.setMember_id(memberId);
		
		int afterPoint=totalPoint-willPoint;
		Map<String, Object> uppo = new HashMap();
		uppo.put("member_no", memberNo);
		uppo.put("point",afterPoint);
		
		System.out.println(uppo);
		
		//point inert
		Map<String, Object> point =new HashMap();
		point.put("member_no", memberNo);
		point.put("point_point",willPoint);							
		if(willPoint!=0) {
			int insertPoint = service.insertPoint(point); //포인트 차감
			int updatePoint = mservice.updatePoint(uppo);
			orders.setPoint_no(Integer.parseInt((String)point.get("POINT_NO")));//방금 인서트한 포인트 넘버를 orders객체 포인트 넘버 변수에 담는다
			System.out.println("사용한 포인트 적립 내역 번호 : "+orders.getPoint_no());
		}	
				
		//orders/order_detail insert
		List<Cart> c = cservice.selectCart(memberNo);	
		int insertOrders = service.insertOrders(orders,c); 																		
		
		Map<String, Object>mapping = new HashMap<String, Object>();														
		mapping.put("sumprice",sumProduct);
		mapping.put("shipFee",shipFee);
		mapping.put("point",totalPoint);
		mapping.put("addTax", addTax);
		mapping.put("totalFee",totalFee);		
		mapping.put("willpoint",willPoint);
									
		session.setAttribute("info", mapping);
		session.setAttribute("orders", orders);				
		return mv;
	}
	
	
	//화면이동
	@RequestMapping("/cart/completeEnd.do")
	public ModelAndView completeEnd(ModelAndView mv,HttpSession session){
		String memberNo = (String)((Map)session.getAttribute("login")).get("MEMBER_NO");
		List<Cart> c = cservice.selectCart(memberNo);													
		
		Map info=((Map)session.getAttribute("info"));
		Orders orders=((Orders)session.getAttribute("orders"));		
		
		mv.addObject("cart",c);
		mv.addObject("orders",orders);
		mv.addObject("map",info);
		mv.setViewName("cart/complete");
		int cartDelete = cservice.cartDelete(c.get(0).getCartNo());
		session.removeAttribute("info");
		return mv;
	}


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
	
	//로그인 안한 상태로 주문관리 클릭 후 로그인 할 때
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
	
	@RequestMapping(value="/order/orderFormCheck.do",produces="text/plain;charset=UTF-8")
	@ResponseBody
	public String orderFormCheck(String oNo, String mId, HttpSession session) {
		System.out.println(oNo);
		Map member=mservice.loginCheck(mId);
		System.out.println("입력한 아이디의 화원번호?"+member.get("MEMBER_NO"));
		
		Map login = (Map)session.getAttribute("login");
		System.out.println("로그인 한 회원번호 : "+member.get("MEMBER_NO"));
		if(login != null) {//로그인 한 상태에서 접속하려고 할 때
			if(member != null && member.get("MEMBER_NO").equals(login.get("MEMBER_NO")) ) {//지금 입력한 아이디와 로그인한 회원의 아이디가 일치하면
				Orders order = service.selectOrder(oNo);
				System.out.println("입력한 주문번호가 있는 건가?"+order);
				if(order != null) {//주문번호 있는건지 확인
					order.setOdList(service.selectOrderDetail(oNo));
					if(order.getMember_no().equals((String)member.get("MEMBER_NO"))) {//주문번호로 주문한 회원과 입력한 아이디가 동일한 회원이 맞는지도 확인해야함!!
						return "true";
					}else {//주문번호와 회원번호 불일치
						System.out.println("주문번호로 조회한 주문정보에 담긴 회원번호와 입력한 회원번호가 일치하지 않음");
						return "주문 번호(iSell 번호)와 주문하신 회윈의 이메일을 정확하게 입력해주세요.";
					}
				}else {//주문번호 잘못 입력
					return "주문 번호(iSell 번호)와 주문하신 회윈의 이메일을 정확하게 입력해주세요.";
				}
			}else {//지금 입력한 아이디와 로그인한 회원의 아이디가 불일치
				return "입력하신 이메일과 회원정보가 일치하지 않습니다.";
			}
		}else {//로그인 안 한 상태에서 접속하려고 할 때
			Orders order = service.selectOrder(oNo);
			System.out.println("입력한 주문번호가 있는 건가?"+order);
			if(order != null) {//주문번호 있는건지 확인
				order.setOdList(service.selectOrderDetail(oNo));
				if(order.getMember_no().equals((String)member.get("MEMBER_NO"))) {//주문번호로 주문한 회원과 입력한 아이디가 동일한 회원이 맞는지도 확인해야함!!
					return "true";
				}else {//주문번호와 회원번호 불일치
					System.out.println("주문번호로 조회한 주문정보에 담긴 회원번호와 입력한 회원번호가 일치하지 않음");
					return "주문 번호(iSell 번호)와 주문하신 회윈의 이메일을 정확하게 입력해주세요.";
				}
			}else {//주문번호 잘못 입력
				return "주문 번호(iSell 번호)와 주문하신 회윈의 이메일을 정확하게 입력해주세요.";
			}
		}
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
	
	//비밀번호 찾기 페이지로 이동
	@RequestMapping("/order/passwordCheck.do")
	public String passwordCheck() {
		return "order/orderPasswordCheck";
	}
	
	@RequestMapping(value="/order/updateRefund.do", produces="text/plain;charset=UTF-8", method = RequestMethod.POST)
	@ResponseBody
	public String updateRefund(OrderDetail od, MultipartFile file, HttpSession session) throws IOException {
		System.out.println("교환 혹은 환불 신청 한 오더 디테일 : "+od);
		String path=session.getServletContext().getRealPath("/resources/upload/order-refund");
		
		File dir = new File(path);
		
		if(!dir.exists()) dir.mkdirs();

		if(file!=null) {
			String originalName = file.getOriginalFilename();
			String ext = originalName.substring(originalName.lastIndexOf(".")+1);
			System.out.println(ext);
			
			SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMdd_HHmmssSSS");
			int rndValue = (int)(Math.random()*10000);
			String reName="refund"+sdf.format(System.currentTimeMillis())+"_"+rndValue+"."+ext;
			try {
				file.transferTo(new File(path+"/"+reName));
			}catch(IOException e) {
				e.printStackTrace();
			}
			od.setRefund_pic(reName);
			System.out.println(od);
		}
		int result = service.updateRefund(od);
		return result>0? od.getSort():"실패다.";
//		return "";
	}
	
	@RequestMapping("/order/orderConfirm.do")
	public String orderConfirm(String mNo, OrderDetail od, HttpSession session) {
		System.out.println("구매확정 한 회원번호 : "+mNo);
		System.out.println("구매확정 한 오더 디테일 번호 : "+od);
		Map login = (Map)session.getAttribute("login");
		if(login.get("MEMBER_NO").equals(mNo)) {			
			service.orderConfirm(od, mNo); 
		}
		return "redirect:/order/orderView.do?oNo="+od.getOrder_no();
	}
	

	//임시
	@RequestMapping("/order/orderEndView.do")
	public String oev() {
		return "order/orderEndView";
	}
}
