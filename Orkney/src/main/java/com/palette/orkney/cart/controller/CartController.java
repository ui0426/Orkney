package com.palette.orkney.cart.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.palette.orkney.cart.model.service.CartService;
import com.palette.orkney.cart.model.vo.Cart;
import com.palette.orkney.cart.model.vo.CartDetail;

@Controller
public class CartController {
	
	@Autowired
	private CartService service;	
		
	//1.장바구니 화면 이동
	@RequestMapping("/cart/cart.do")
	public ModelAndView cart(HttpSession session, ModelAndView mv) {					
		String memberNo = (String)((Map)session.getAttribute("login")).get("MEMBER_NO");								
		List<Cart> c = service.selectCart(memberNo);						
		String cNo = service.selectCartNo(memberNo);	
		
		System.out.println("장바구니:"+c);
		mv.addObject("cN", cNo);
		mv.addObject("cart",c);
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
			@RequestParam(value="cartNo",defaultValue="0") String cartNo, ModelAndView mv, HttpSession session){								
		String memberNo = (String)((Map)session.getAttribute("login")).get("MEMBER_NO");																
		Map<String, String> param =new HashMap();
	 	param.put("cartNo",cartNo);
		param.put("productNo",productNo);								
		
			if(!productNo.equals("0") && !cartNo.equals("0")) {							 
				int product = service.deleteProduct(param);													
			}else if(productNo.equals("0") && cartNo.equals("0")){}	
			
			List<Cart> c = service.selectCart(memberNo);			
			
			mv.addObject("cart",c);								 
			mv.setViewName("ajax/cartproduct");
			return mv;
	}			
	
	//4. 결제전 화면이동
	@RequestMapping("/cart/payment.do")
	public ModelAndView payment(ModelAndView mv, HttpSession session,
			@RequestParam int[] amount, @RequestParam String[] productNo) {
		
		String memberNo = (String)((Map)session.getAttribute("login")).get("MEMBER_NO");																
		List<Cart> c = service.selectCart(memberNo);																			
		
		Cart cart= service.memberInfo(memberNo);
		System.out.println(cart);		
				
		
		//상품번호 받아오기
		//수량받아오기
		//cart_detail 수정
		for(int i=0; i<productNo.length;i++) {
			CartDetail detail=new CartDetail();
			detail.setCartQTY(amount[i]);
			detail.setProductNo(productNo[i]);
			System.out.println("장바구니상세:"+detail);
			
			int re = service.updateDetail(detail);			
		}
		
						

		
		
		mv.addObject("member",cart);
		mv.addObject("cart",c);
		mv.setViewName("cart/payment");
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

