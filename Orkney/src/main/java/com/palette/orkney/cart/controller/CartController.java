package com.palette.orkney.cart.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.palette.orkney.cart.model.service.CartService;
import com.palette.orkney.cart.model.vo.Cart;
import com.palette.orkney.cart.model.vo.CartDetail;

@Controller
public class CartController {

	
	@Autowired
	private CartService service;	
		
	//1.장바구니 화면 이동(장바구니 확인 /추가/수정)
	@RequestMapping("/cart/cart.do")
	public ModelAndView cart(HttpSession session, ModelAndView mv,String productNo) {					
		
		String memberNo = (String)((Map)session.getAttribute("login")).get("MEMBER_NO");										
		List<Cart> c = service.selectCart(memberNo);
		System.out.println("첫카트list:"+c);
		System.out.println(c.get(0).getCartNo());							
		
		//2. 경록이형 연결시 추가 ( 상품번호 가져옴)
		Cart cart = new Cart();
		cart.setMemberNo(memberNo);
		cart.setProductNo("p9");				
		
		//3. 카트 존재 유무
		int count = service.countCart(cart.getProductNo(), memberNo);
		System.out.println("count:"+count);
		
		//4. 카트 없을시 추가 있을시 없데이트
//		if (count==0)  count = service.insertCart(cart);
//		else count = service.updateCart(cart);
		
		int sum=service.sumPrice(c.get(0).getCartNo());	
		
//		mv.addObject("cart",c);
		mv.addObject("cN",c.get(0).getCartNo());
		mv.addObject("sumprice",sum);				
		mv.setViewName("cart/cart");
		return mv;
	}
		
	//2. 장바구니 전체 삭제
	@RequestMapping("/cart/deleteBasket.do")
	public ModelAndView deletebasket(ModelAndView mv, @RequestParam(value="cartNo",defaultValue="0") String cartNo) {		
		int basket = service.deleteBasket(cartNo);			
		mv.setViewName("cart/cart");
		return mv;
	}		
	
	//3. 장바구니 내용물 삭제 ajax처리
	@RequestMapping("/cart/deleteProduct.do")
	public ModelAndView deletecontent(
			@RequestParam(value="productNo",defaultValue="0") String productNo,
			@RequestParam(value="cartNo",defaultValue="0") String cartNo, ModelAndView mv, HttpSession session,
			@RequestParam(value="sumPrice",defaultValue="0") int sumPrice ){											
			String memberNo = (String)((Map)session.getAttribute("login")).get("MEMBER_NO");				
			
			Map<String, String> param =new HashMap();
		 	param.put("cartNo",cartNo);
			param.put("productNo",productNo);											
			
			if(!productNo.equals("0") && !cartNo.equals("0")) {							 
				int product = service.deleteProduct(param);													
			}else if(productNo.equals("0") && cartNo.equals("0")){}	
			
			List<Cart> c = service.selectCart(memberNo);			
			
			
			mv.addObject("sumprice",sumPrice);
			mv.addObject("cart",c);								 
			mv.setViewName("ajax/cartproduct");
			return mv;
	}			
	
	//4. 수량 저장 ajax처리
	@RequestMapping("/cart/updateQty.do")	
	public ModelAndView updateQty(ModelAndView mv, int qty, String cartNo, String productNo, String totalPrice, HttpSession session, int productPrice){		
		System.out.println("상품가격"+totalPrice);
		System.out.println("수량:"+qty);
		System.out.println("카트번호:"+cartNo);		
		
		//수량저장
		Cart cart = new Cart();
		cart.setCartQTY(qty);
		cart.setCartNo(cartNo);
		cart.setProductNo(productNo);										
		int rs=service.updateDetail(cart);							
		
		//가격*수량 업데이트
		String memberNo = (String)((Map)session.getAttribute("login")).get("MEMBER_NO");
		List<Cart> c = service.selectCart(memberNo);																
		totalPrice = Integer.toString(qty*productPrice);
		
		int sum=0;		
		for(Cart list : c) {			
			if(list.getProductNo().equals(cart.getProductNo())) {											
				Map<String, String> param1 = new HashMap();
				param1.put("totalPrice",totalPrice);
				param1.put("productNo", productNo);
				int productSum = service.productSum(param1);		
				//총가격(상품가격*수량)
				 sum=service.sumPrice(cartNo);		
			}else {}
		}
			
		List<Cart> c1 = service.selectCart(memberNo);
		mv.addObject("cart",c1);
		mv.addObject("sumprice",sum);		
		mv.setViewName("ajax/cartproduct");
		return mv;
	}	
	
	//5. 결제전 화면이동
	@RequestMapping("/cart/payment.do")	
	public ModelAndView payment(ModelAndView mv, HttpSession session) {
		
		String memberNo = (String)((Map)session.getAttribute("login")).get("MEMBER_NO");																
		List<Cart> c = service.selectCart(memberNo);																											

		
		CartDetail m = new CartDetail();		
		m.setMember_name(c.get(0).getMember_name());
		m.setPhone(c.get(0).getPhone());
		m.setPoint(c.get(0).getPoint());		
		m.setMember_id(c.get(0).getMember_id());
		m.setCartNo(c.get(0).getCartNo());
		
		System.out.println("memberInfo:"+m);		
		System.out.println("cartlist내용 :"+c);					
				
		int sum=service.sumPrice(m.getCartNo());
		int shipFee = sum>= 30000 ? 0 : 2500; //주문금액 30000원 넘을시 무료
		int additionalTax = (int)(((sum+shipFee)-m.getPoint())*0.1);
		int totalFee = ((sum+shipFee)-m.getPoint())+additionalTax;
		int predicpoint = (int) (totalFee*0.05); 
		m.setPredicpoint(predicpoint);
		
		
		mv.addObject("member",m);
		mv.addObject("cart",c);
		mv.setViewName("cart/payment");
		return mv;
	}	
	
	//6. 포인트사용시 값 변경
	@RequestMapping("/cart/updatePayment.do")
	@ResponseBody
	public ModelAndView updatePayment(ModelAndView mv,HttpSession session, String willpoint) {
		String memberNo = (String)((Map)session.getAttribute("login")).get("MEMBER_NO");																
		List<Cart> c = service.selectCart(memberNo);				
		
		CartDetail m = new CartDetail();
		m.setCartNo(c.get(0).getCartNo());
		m.setPoint(c.get(0).getPoint());

		System.out.println("포인트사용값:"+willpoint);
		int sum=service.sumPrice(m.getCartNo());		
		
		
		Map<String, Object>map = new HashMap<String, Object>();
		int shipFee = sum>= 50000 ? 0 : 2500; //주문금액 50000원 넘을시 무료
		int additionalTax = (int)(sum*0.1);
		
		int willpoint2=0;
		if(willpoint!=null) willpoint2=Integer.parseInt(willpoint);		

		int	totalFee = ((sum+shipFee)-(willpoint2))+additionalTax;				
		
		map.put("sumprice",sum);
		map.put("shipFee",shipFee);
		map.put("point",m.getPoint());
		map.put("addTax", additionalTax);
		map.put("totalFee",totalFee);		
		map.put("willpoint",willpoint);		
		
		
		System.out.println("부가세:"+additionalTax);
		
		//예상적립포인트		
		mv.addObject("map",map);
		mv.setViewName("ajax/paymentDetail");
		return mv;
	}
	
	
	
	//결제화면이동
		@RequestMapping("/cart/creditpay.do")
		public String pay() {
			return "cart/pay";
		}
	
	
	//결제후 화면이동
	@RequestMapping("/cart/complete.do")
	public String complete() {
		return "cart/complete";
	}
	
	
	
}
	
	
	

