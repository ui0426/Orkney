package com.palette.orkney.wishlist.model.dao;

import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;

import org.apache.ibatis.session.SqlSession;

import com.palette.orkney.wishlist.model.vo.Wishlist;

public interface WishlistDao {

	Wishlist selectWishlist(SqlSession session, String mNo);

	Wishlist selectWishlistCookie(SqlSession session, Map nos);



}
