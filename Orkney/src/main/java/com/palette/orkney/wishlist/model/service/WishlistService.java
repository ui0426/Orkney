package com.palette.orkney.wishlist.model.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;

import com.palette.orkney.wishlist.model.vo.Wishlist;

public interface WishlistService {

	Wishlist selectWishlist(String mNo);

	Wishlist selectWishlistCookie(Map nos);


}
