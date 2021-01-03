   package com.palette.orkney.wishlist.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.collections.map.HashedMap;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.palette.orkney.wishlist.model.service.WishlistService;
import com.palette.orkney.wishlist.model.vo.Wishlist;
import com.palette.orkney.wishlist.model.vo.Wishlist_detail;

@Controller
public class WishlistController {
   
   @Autowired
   private WishlistService service;
   
   //위시리스트 화면으로 이동
   @RequestMapping("/wishlist/wishlist.do")
   public ModelAndView wishlistView(HttpSession session, ModelAndView mv, @CookieValue(value = "wNo", required = false) String wNo, HttpServletResponse response, @RequestParam(value="addwNo", required = false) String addwNo) {
      Map login = ((Map)session.getAttribute("login")); //로그인 된 유저
      String mNo = (String)login.get("MEMBER_NO"); //로그인 유저 넘버
      Wishlist wish = null; //jsp에서 wish가 null 이면, null 아니면 해주기!
      System.out.println("쿠키wNo11" + wNo);
      
      //이 부분 추가..201220
      if(addwNo != null) {
    	 wNo = addwNo;
      }
      System.out.println("쿠키wNo22" + wNo);
      //위시리스트 가져오기...
      if(wNo == null || wNo == "") {
         wish = service.selectWishlist(mNo);
         Cookie c = new Cookie("wNo", wish.getWishlist_no());
         c.setMaxAge(60 * 60 * 24);//하루
         c.setPath("/");
         response.addCookie(c);
         System.out.println("쿠키값" + c.getValue());
         
      } else {
         Map nos = new HashedMap();
         nos.put("mNo", mNo);
         nos.put("wNo", wNo);
         
         wish = service.selectWishlistCookie(nos);
         if(wish == null) {
        	 wish = service.selectWishlist(mNo);
             Cookie c = new Cookie("wNo", wish.getWishlist_no());
             c.setMaxAge(60 * 60 * 24);//하루
             c.setPath("/");
             response.addCookie(c);
             System.out.println("쿠키값" + c.getValue());
        	 
         }
      }
      
      List<Wishlist> wlList = service.wishlistList(mNo);   
      
      System.out.println("wishlist.do" + wish);      
      
      int allPrice = 0;
      for(Wishlist_detail wd : wish.getWishlist_detail()) {
    	  int price = Integer.parseInt(wd.getProduct().getSale_per()) * wd.getProduct_qty();
    	  allPrice += price;
      }
      
      mv.addObject("wish", wish);
      mv.addObject("wlList", wlList);
      mv.addObject("allPrice", allPrice);
      mv.setViewName("wishlist/wishlist");
      return mv;
   }
   
   //테스트 ajax
   //보여질 위시리스트 바꾸기
   @RequestMapping("/wishlist/productlist.do")
   public String test(Model m, HttpSession session, HttpServletResponse response,
                                          @CookieValue(value = "wNo") String cwNo,
                                          @RequestParam(value = "wNo", required = false) String wNo,
                                          @RequestParam(value = "dwNo", required = false) String dwNo) {
      
      if(dwNo != null && dwNo.equals(cwNo)) { //삭제된 위시리스트 넘이 쿠키에 있는 위시넘과 같다면
         Map login = ((Map)session.getAttribute("login")); //로그인 된 유저
         String mNo = (String)login.get("MEMBER_NO"); //로그인 유저 넘버
         wNo = service.selectWishlist(mNo).getWishlist_no();
      } else if(dwNo != null && !dwNo.equals(cwNo)) {
         wNo = cwNo;
      }
         
      Cookie c = new Cookie("wNo", wNo);
      c.setMaxAge(60 * 60* 24);//하루
      c.setPath("/");
      response.addCookie(c);
      
      System.out.println("/productlist" + wNo);
      Map login = ((Map)session.getAttribute("login")); //로그인 된 유저
      String mNo = (String)login.get("MEMBER_NO"); //로그인 유저 넘버
      
      Map nos = new HashedMap();
      nos.put("mNo", mNo);
      nos.put("wNo", wNo);
      
      Wishlist wish = service.selectWishlistCookie(nos);
      List<Wishlist> wlList = service.wishlistList(mNo);
      
      //총가격~~
      int allPrice = 0;
      for(Wishlist_detail wd : wish.getWishlist_detail()) {
    	  int price = Integer.parseInt(wd.getProduct().getSale_per()) * wd.getProduct_qty();
    	  allPrice += price;
    	  System.out.println(wd.getProduct_qty());
    	  System.out.println(allPrice);
      }
      
      System.out.println(allPrice);
      
      m.addAttribute("wish", wish);
      m.addAttribute("wlList", wlList);
      m.addAttribute("allPrice", allPrice);
      return "wishlist/wl_productlist";
   }
   
   //위시리스트들의 리스트 가져오기
   @RequestMapping("/wishlist/wishlistList.do")
   public String wishlistList(HttpSession session, Model m) {
      Map login = ((Map)session.getAttribute("login")); //로그인 된 유저
      String mNo = (String)login.get("MEMBER_NO"); //로그인 유저 넘버
      
      List<Wishlist> wlList = service.wishlistList(mNo);   
      System.out.println("/wishlistList.do" + wlList);
      
      m.addAttribute("wlList", wlList);
      return "wishlist/wl_SelectModal";
   }

   //다른 리스트로 이동 모달 띄우기
   @RequestMapping("/wishlist/moveModal.do")
   public String wishlistList(HttpSession session, Model m, @RequestParam(value="wNo", required=false) String wNo, 
                                                @RequestParam(value = "pNo", required=false) String pNo,
                                                @RequestParam(value="pQty", required=false) int pQty) {
      Map login = ((Map)session.getAttribute("login")); //로그인 된 유저
      String mNo = (String)login.get("MEMBER_NO"); //로그인 유저 넘버
      
      List<Wishlist> wlList = service.wishlistList(mNo);   
      System.out.println("/moveModal" + wlList);
      
      m.addAttribute("wlList", wlList);
      m.addAttribute("wNo", wNo);
      m.addAttribute("pNo", pNo);
      m.addAttribute("pQty", pQty);
      return "wishlist/wl_moveModal";
   }
   
   //다른 리스트로 제품 이동
   @RequestMapping("/wishlist/moveWishlist.do")
   public String moveWishlist(String MwNo, String pNo, String wNo, int pQty, HttpSession session, Model m) {
      
      Map login = ((Map)session.getAttribute("login")); //로그인 된 유저
      String mNo = (String)login.get("MEMBER_NO"); //로그인 유저 넘버
      System.out.println("ddddd"+wNo+pNo);
      Map nos = new HashedMap();
      nos.put("mNo", mNo);
      nos.put("wNo", wNo);
      nos.put("pNo", pNo);
      nos.put("IwNo", MwNo);
      nos.put("pQty", pQty);
      
      int result = service.moveWishlist(nos);
      System.out.println("/moveWishlist.do" + result);
      
      if(result > 0) {
         Wishlist wish = service.selectWishlistCookie(nos);
         m.addAttribute("wish", wish);
         System.out.println("/moveWishlist.do" + wish);
      }
      return "wishlist/wl_productlist";
      
      
   }
   
   //위시리스트의 제품 삭제하기
   @RequestMapping("/wishlist/deleteWishProduct.do")
   public String deleteWishProduct(HttpSession session, String wNo, String pNo, Model m) {
      Map login = ((Map)session.getAttribute("login")); //로그인 된 유저
      String mNo = (String)login.get("MEMBER_NO"); //로그인 유저 넘버
      
      Map data = new HashedMap();
      data.put("wNo", wNo);
      data.put("pNo", pNo);
      data.put("mNo", mNo);
      int result  =service.deleteWishProduct(data);
      
      
      Wishlist wish = service.selectWishlistCookie(data);
      m.addAttribute("wish", wish);
      return "wishlist/wl_productlist";
      
   }
   
   //위시리스트 이름 바꾸기
   @RequestMapping("/wishlist/wishNameUpdate.do")
   @ResponseBody
   public int wishNameUpdate(String wNo, String wName) {
      System.out.println("wishNameUpdate.do" + wNo + wName);
      Map data = new HashedMap();
      data.put("wNo", wNo);
      data.put("wName", wName);
      
      int result = service.wishNameUpdate(data);
      
      if(result > 0) {
         System.out.println("바뀜");
      } else{
      
         System.out.println("바뀜");
      }
      
      return result;
   }
   
   //위시리스트 삭제하기
   @RequestMapping("/wishlist/deleteWishlist.do")
   @ResponseBody
   public int deleteWishlist(String wNo, HttpSession session) {
	  Map login = ((Map)session.getAttribute("login")); //로그인 된 유저
      String mNo = (String)login.get("MEMBER_NO"); //로그인 유저 넘버
      
      int result = service.deleteWishlist(wNo, mNo);
      
      return result;
   }
   
   //위시리스트 추가하기
   @RequestMapping("/wishlist/addWishlist.do")
   public String addWishlist(String addWName, HttpSession session, HttpServletResponse response, Model m) {
	   Map login = ((Map)session.getAttribute("login")); //로그인 된 유저
       String mNo = (String)login.get("MEMBER_NO"); //로그인 유저 넘버
       
       Map data = new HashedMap();
       data.put("mNo", mNo);
       data.put("addWName", addWName);
       
       int result2 = service.addWishlist(data);
       
       System.out.println("확인" + addWName + data.get("newwNo"));
       
       String wNo = "w" + data.get("newwNo");
       System.out.println(wNo);
       
       
       String result = "";
       if(result2 > 0) {
    	   Cookie c = new Cookie("wNo", wNo);
    	   c.setMaxAge(60 * 60* 24);//하루
    	   c.setPath("/");
    	   response.addCookie(c);
    	   
           data.put("wNo", wNo);
           
           Wishlist wish = service.selectWishlistCookie(data);
           
           System.out.println(wish);
    	   m.addAttribute("wish", wish);
    	   result = "wishlist/wl_productlist";
       }
       
       return result;
	   
   }
   
   //제품 수량 up 하기
   @RequestMapping("/wishlist/countUp.do")
   @ResponseBody
   public int countUp(String pNo, String wNo, HttpSession session) {
       System.out.println(pNo + wNo);
	   
       Map data = new HashedMap();
       data.put("pNo", pNo);
       data.put("wNo", wNo);
	   
	   int result = service.countUp(data);
	   
	   return result;
	   
	   
   }
   
   //제품 수량 down 하기
   @RequestMapping("/wishlist/countDown.do")
   @ResponseBody
   public int countDown(String pNo, String wNo, HttpSession session) {

       Map data = new HashedMap();
       data.put("pNo", pNo);
       data.put("wNo", wNo);
	   
	   int result = service.countDown(data);
	   
	   return result;
   }
   
   //위시리스트에 제품 추가하는 모달 띄우기
   @RequestMapping("/wishlist/insertWishModal.do")
   public String insertWishModal(HttpSession session, Model m,
           @RequestParam(value = "pNo", required=false) String pNo) {
		Map login = ((Map)session.getAttribute("login")); //로그인 된 유저
		
			
		String mNo = (String)login.get("MEMBER_NO"); //로그인 유저 넘버
		
		List<Wishlist> wlList = service.wishlistList(mNo);   
		System.out.println("/moveModal" + wlList);
		System.out.println("/moveModal" + pNo);
		
		m.addAttribute("wlList", wlList);
		m.addAttribute("pNo", pNo);
		return "product/wl_select";
		
	}
   
   //위시리스트에 제품 담기
   @RequestMapping("/wishlist/insertWish.do")
   public String insertWish(String pNo, String IwNo, HttpSession session, Model m) {
	   Map login = ((Map)session.getAttribute("login")); //로그인 된 유저
	   String mNo = (String)login.get("MEMBER_NO"); //로그인 유저 넘버
	   
	   Map data = new HashedMap();
	   data.put("mNo", mNo);
       data.put("pNo", pNo);
       data.put("IwNo", IwNo); //
	   data.put("pQty", 1);
	   
	   int result = service.insertWish(data);
	   
	   if(result > 0) {
		   m.addAttribute("wNo", IwNo);
		   return "product/wl_success";
	   } else {
		   return "";
	   }
   }
   
   //제품이 담겨있는 위시리스트의  총 개수 가져오기
   @RequestMapping("/wishlist/wlCount.do")
   @ResponseBody
   public int wlCount(HttpSession session) {
	   Map login = ((Map)session.getAttribute("login")); //로그인 된 유저
	   String mNo = (String)login.get("MEMBER_NO"); //로그인 유저 넘버
	   
	   int result = 0;
	   List<Wishlist> list = service.wishlistList(mNo);
	   for(Wishlist w : list) {
		   if(w.getWishlist_detail().size() > 0) {
			   result += 1;
		   }
	   }
	   
	   return result;
   }
   
}