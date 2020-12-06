package com.palette.orkney.wishlist.model.dao;

import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.Cookie;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.palette.orkney.wishlist.model.vo.Wishlist;
import com.palette.orkney.wishlist.model.vo.Wishlist_detail;

@Repository
public class WishlistDaoImpl implements WishlistDao {

	@Override
	public Wishlist selectWishlist(SqlSession session, String mNo) {
		Wishlist wish = session.selectOne("wishlist.selectWishlist", mNo);
		String wNo = wish.getWishlist_no();
		ArrayList<Wishlist_detail> wide = (ArrayList)session.selectList("wishlist.selectWishlistDetail", wNo);
		
		wish.setWishlist_detail(wide);
		return wish;
	}

	@Override
	public Wishlist selectWishlistCookie(SqlSession session, Map nos) {
		Wishlist wish = session.selectOne("wishlist.selectWishlistCookie", nos);
		String wNo = wish.getWishlist_no();
		ArrayList<Wishlist_detail> wide = (ArrayList)session.selectList("wishlist.selectWishlistDetail", wNo);
		
		wish.setWishlist_detail(wide);
		return wish;
	}


	

}
