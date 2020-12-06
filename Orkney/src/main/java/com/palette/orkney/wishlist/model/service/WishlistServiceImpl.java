package com.palette.orkney.wishlist.model.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.palette.orkney.wishlist.model.dao.WishlistDao;
import com.palette.orkney.wishlist.model.vo.Wishlist;

@Service
public class WishlistServiceImpl implements WishlistService {

	@Autowired
	private WishlistDao dao;
	@Autowired
	private SqlSession session;
	
	@Override
	public Wishlist selectWishlist(String mNo) {
		return dao.selectWishlist(session, mNo);
	}

	@Override
	public Wishlist selectWishlistCookie(Map nos) {
		return dao.selectWishlistCookie(session, nos);
	}

	
}
