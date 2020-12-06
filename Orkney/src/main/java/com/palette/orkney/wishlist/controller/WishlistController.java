package com.palette.orkney.wishlist.controller;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.commons.collections.map.HashedMap;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.palette.orkney.wishlist.model.service.WishlistService;
import com.palette.orkney.wishlist.model.vo.Wishlist;

@Controller
public class WishlistController {
	
	@Autowired
	private WishlistService service;
	
	//위시리스트 화면으로 이동
	@RequestMapping("/wishlist/wishlist.do")
	public ModelAndView wishlistView(HttpSession session, ModelAndView mv, @CookieValue(value = "wNo", required = false) String wNo) {
		Map login = ((Map)session.getAttribute("login")); //로그인 된 유저
		String mNo = (String)login.get("MEMBER_NO"); //로그인 유저 넘버
		Wishlist wish = null; //jsp에서 wish가 null 이면, null 아니면 해주기!
		//위시리스트 가져오기...
		if(wNo == null) {
			wish = service.selectWishlist(mNo);
		} else {
			Map nos = new HashedMap();
			nos.put("mNo", mNo);
			nos.put("wNo", wNo);
			
			wish = service.selectWishlistCookie(nos);
		}
		
		System.out.println(wish);
		mv.addObject("wish", wish);
		mv.setViewName("wishlist/wishlist");
		return mv;
	}
	
	//테스트 ajax
	@RequestMapping("/wishlist/productlist.do")
	public String test(Model m, HttpSession session) {
		Map login = ((Map)session.getAttribute("login")); //로그인 된 유저
		String mNo = (String)login.get("MEMBER_NO"); //로그인 유저 넘버
		
		Wishlist wish = service.selectWishlist(mNo);
		m.addAttribute("wish", wish);
		return "wishlist/wl_productlist";
	}
	
	//테스트 ajax2
	@RequestMapping("/test2.do")
	@ResponseBody
	public String test2() {
		return "dd";
	}
}
