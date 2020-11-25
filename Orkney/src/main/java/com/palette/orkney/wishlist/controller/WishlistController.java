package com.palette.orkney.wishlist.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class WishlistController {
	
	//위시리스트 화면으로 이동
	@RequestMapping("/wishlist/wishlist.do")
	public String wishlistView() {
		return "wishlist/wishlist";
	}
}
