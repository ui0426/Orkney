package com.palette.orkney.cart.controller;

import java.util.ArrayList;
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
import com.palette.orkney.member.model.service.MemberService;
import com.palette.orkney.member.model.vo.Addr;

@Controller
public class CartController {

	
	@Autowired
	private CartService service;	
	
	@Autowired
	private MemberService mservice;
	
	//0.장바구니 추가
	@RequestMapping("/cart/cartInsert.do")
	public ModelAndView cartInsert(HttpSession session,ModelAndView mv,String productNo, int productPrice) {				
		String memberNo = (String)((Map)session.getAttribute("login")).get("MEMBER_NO");					
		String cartNo=service.selectCartNo(memberNo);						
				
		//2. 경록이형 연결
		Cart cart = new Cart();
		cart.setMemberNo(memberNo);
		cart.setProductNo(productNo);	
		cart.setProductPrice(productPrice);	
		cart.setCartNo(cartNo);				
		
		//3. 카트 존재 유무
		int count = service.countCart(memberNo);		
		
		//4. 카트에 상품
		if (count==0)  count = service.insertCart(cart); 				//카트가 없을시 카트 및 디테일 생성
		else if (count>0) count= service.insertDetail(cart);			 //카트가 있다면 디테일에 상품만 추가
				
		mv.setViewName("product/productDetail");						
		return mv;
	}
		
	//1.장바구니 화면 이동(장바구니 확인)
	@RequestMapping("/cart/cart.do")
	public ModelAndView cart(HttpSession session, ModelAndView mv, String productNo) {					
		
		String memberNo = (String)((Map)session.getAttribute("login")).get("MEMBER_NO");	
		System.out.println(memberNo);
		List<Cart> c = service.selectCart(memberNo);
		System.out.println("c정보:"+c);
		int sum=service.sumPrice(c.get(0).getCartNo());	
		
		mv.addObject("cart",c);
		mv.addObject("cN",c.get(0).getCartNo());
		mv.addObject("sumprice",sum);				
		mv.setViewName("cart/cart");
		return mv;
	}
		
	//2. 장바구니 전체 삭제
	@RequestMapping("/cart/deleteBasket.do")
	public ModelAndView deletebasket(ModelAndView mv, 
			@RequestParam(value="cartNo",defaultValue="0") String cartNo,HttpSession session,
			@RequestParam(value="sumPrice",defaultValue="0") String sumPrice) {		
		String memberNo = (String)((Map)session.getAttribute("login")).get("MEMBER_NO");		
		System.out.println("cartNo"+cartNo);
		
		sumPrice=null;
		int basket = service.cartDelete(cartNo);
		System.out.println("sum:"+sumPrice);
		cartNo=null;
		System.out.println("cartNo"+cartNo);		
		
		List<Cart> c = service.selectCart(memberNo);
		mv.addObject("cart",c);
		mv.addObject("cN",cartNo);
		mv.addObject("sumprice",sumPrice);
		mv.setViewName("ajax/cartproduct");
		return mv;
	}		
	
	//3. 장바구니 내용물 삭제 ajax처리
	@RequestMapping("/cart/deleteProduct.do")
	public ModelAndView deletecontent(
			@RequestParam(value="productNo",defaultValue="0") String productNo,
			@RequestParam(value="cartNo",defaultValue="0") String cartNo, ModelAndView mv, HttpSession session,
			@RequestParam(value="sumPrice",defaultValue="0") int sumPrice, String cN ){											
			String memberNo = (String)((Map)session.getAttribute("login")).get("MEMBER_NO");				
			
			Map<String, String> param =new HashMap();
		 	param.put("cartNo",cartNo);
			param.put("productNo",productNo);											
			
			if(!productNo.equals("0") && !cartNo.equals("0")) {							 
				int product = service.deleteProduct(param);													
			}else if(productNo.equals("0") && cartNo.equals("0")){}	
			
			List<Cart> c = service.selectCart(memberNo);			
			
			System.out.println(cN);
			mv.addObject("cN",cN);
			mv.addObject("sumprice",sumPrice);
			mv.addObject("cart",c);								 
			mv.setViewName("ajax/cartproduct");
			return mv;
	}			
	
	//4. 수량 저장 ajax처리
	@RequestMapping("/cart/updateQty.do")	
	public ModelAndView updateQty(ModelAndView mv, int qty, String cartNo, String productNo, String totalPrice, HttpSession session, int productPrice){		
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
		System.out.println(c);
				
		//추가주소
		List<Addr> list = mservice.addAddrList(memberNo);		
		List<Addr> list2 = new ArrayList<Addr>();
				
		//주소 떼내기
		for(Addr addr : list) {
			String fullAddr = addr.getAddress();

			System.out.println("추가주소리스트:"+addr);
			System.out.println("원래주소:"+fullAddr);
			
			String[] a=fullAddr.split("/");
			addr.setAddress_post(a[0]);
			addr.setAddress_addr(a[1]);
			addr.setAddress_detail(a[2]);
			list2.add(addr);
		}
		
		
		System.out.println("해당회원주소:"+list2);
		
		//회원정보만 가져와서 저장
		CartDetail m = new CartDetail();		
		m.setMember_name(c.get(0).getMember_name());
		m.setPhone(c.get(0).getPhone());
		m.setPoint(c.get(0).getPoint());		
		m.setMember_id(c.get(0).getMember_id());
		m.setCartNo(c.get(0).getCartNo());

		
		
		//결제관련 logic
		int sum=service.sumPrice(m.getCartNo());						//상품 총 가격
		int shipFee = sum>= 30000 ? 0 : 5000; 							//배송비 : 기본 5000원, 주문금액 30000원 넘을시 무료
		int additionalTax = (int)(((sum+shipFee)-m.getPoint())*0.1);    //부가세
		int totalFee = ((sum+shipFee)-m.getPoint())+additionalTax;		//총 계산된 값
		int predicpoint = (int) (totalFee*0.05); 						//예상되는 포인트적립 (총가격의 0.05)
		m.setPredicpoint(predicpoint);
		
		//상품종류의 수량(ordertable)
		int kopQty = service.selectCount(c.get(0).getCartNo()); 
		
		
		mv.addObject("addrList", list2);
		mv.addObject("kopQty",kopQty);
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
		
		int sum=service.sumPrice(m.getCartNo());		
			
		Map<String, Object>map = new HashMap<String, Object>();
		int shipFee = sum>= 50000 ? 0 : 5000; //주문금액 50000원 넘을시 무료
		int additionalTax = (int)(sum*0.1);		
		int willpoint2=0;
		try {			
			if(willpoint!=null) willpoint2=Integer.parseInt(willpoint);		
		}catch(NumberFormatException e) {
			e.printStackTrace();
		}

		int	totalFee = ((sum+shipFee)-(willpoint2))+additionalTax;						
		map.put("sumprice",sum);
		map.put("shipFee",shipFee);
		map.put("point",m.getPoint());
		map.put("addTax", additionalTax);
		map.put("totalFee",totalFee);		
		map.put("willpoint",willpoint);		
								
		mv.addObject("map",map);
		mv.setViewName("ajax/paymentDetail");
		return mv;
	}
		
	
	
	
	
}
	
	
	

