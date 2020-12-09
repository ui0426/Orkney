package com.palette.orkney.cart.controller;

import java.lang.reflect.Member;
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
import com.palette.orkney.member.model.service.MemberService;

@Controller
public class CartController {
   
   @Autowired
   private CartService service;
   @Autowired
   private MemberService service1;
      
   //장바구니 화면 이동
   @RequestMapping("/cart/cart.do")
   public ModelAndView cart(HttpSession session, ModelAndView mv) {         
      System.out.println(session.getAttribute("login"));      
      String memberNo = (String)((Map)session.getAttribute("login")).get("MEMBER_NO");
            
      System.out.println("장바구니전1:"+memberNo);                        
            
      List<Cart> c = service.selectCart(memberNo);      
      System.out.println("장바구니전2:"+c);            
      
      mv.addObject("cart",c);
      mv.setViewName("cart/cart");
      return mv;
   }
   
   
   //장바구니 내용물 삭제 ajax처리
   @RequestMapping("/cart/deleteProduct.do")
   public ModelAndView deletecontent(
         @RequestParam(value="productNo",defaultValue="0") String productNo,
         @RequestParam(value="cartNo",defaultValue="0") String cartNo, ModelAndView mv, HttpSession session){                  
      
      String memberNo = (String)((Map)session.getAttribute("login")).get("MEMBER_NO");      
      
      
      System.out.println("장바구니 돌고:"+memberNo+" "+cartNo+" "+productNo);
                        
      Map<String, String> param =new HashMap();
       param.put("cartNo",cartNo);
      param.put("productNo",productNo);
                  
      System.out.println("마지막 sys : "+param);      
      
         if(!productNo.equals("0") && !cartNo.equals("0")) {                      
            int product = service.deleteProduct(param);                                       
         }else if(productNo.equals("0") && cartNo.equals("0")){}   
         
         List<Cart> c = service.selectCart(memberNo);         
         
         mv.addObject("cart",c);                         
         mv.setViewName("ajax/cartproduct");
         return mv;
   }      
   
   
   //결제전 화면이동
   @RequestMapping("/cart/payment.do")
   public ModelAndView payment(ModelAndView mv, HttpSession session) {
      String memberNo = (String)((Map)session.getAttribute("login")).get("MEMBER_NO");
      //Member m = service.memberInfo(memberNo);
      
     // mv.addObject("member",m);
      mv.setViewName("cart/payment");
      return mv;
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
   
   
   @RequestMapping("/member/selectInfo.do")
   public ModelAndView memberInfo(ModelAndView mv, HttpSession session) {
      String memberNo = (String)((Map)session.getAttribute("login")).get("MEMBER_NO");   
      
      //Member m = service.memberInfo(memberNo);
      
      
      
      //mv.addObject("member",m);
      return mv;
   }
   
   
   
   
   
}
