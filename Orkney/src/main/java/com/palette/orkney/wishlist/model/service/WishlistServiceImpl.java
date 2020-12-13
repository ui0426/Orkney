package com.palette.orkney.wishlist.model.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.palette.orkney.wishlist.model.dao.WishlistDao;
import com.palette.orkney.wishlist.model.vo.Wishlist;
import com.palette.orkney.wishlist.model.vo.Wishlist_detail;

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

	//위시리스트들의 리스트 가져오기
	@Override
	public List<Wishlist> wishlistList(String mNo) {
		return dao.wishlistList(session, mNo);
	}

	//위시리스트 제품 삭제하기
	@Override
	public int deleteWishProduct(Map data) {
		return dao.deleteWishProduct(session, data);
	}
	
	
	//다른 리스트로 제품 이동
	@Override
	public int moveWishlist(Map nos) {
		int result = dao.moveWishlist(session, nos);
		
		if(result > 0) {
			Wishlist_detail wd = dao.isProductNo(session, nos);
			System.out.println("요기요요요요요" + wd);
			if(wd != null) {
				result = dao.countUp(session, nos);
			} else {
				result = dao.insertWishProduct(session, nos);
			}
		}
		
		return result;
	}

	//위시리스트 이름 바꾸기
	@Override
	public int wishNameUpdate(Map data) {
		System.out.println("위시 이름 바꾸기 service");
		return dao.wishNameUpdate(session, data);
	}

	//위시리스트 삭제하기
	@Override
	public int deleteWishlist(String wNo) {
		return dao.deleteWishlist(session, wNo);
	}

	//위시리스트 추가하기
	@Override
	public int addWishlist(Map data) {
		return dao.addWishlist(session, data);
	}

	//제품수량 업하기
	@Override
	public int countUp(Map data) {
		return dao.countUp(session, data);
	}

	//제품 수량 다운하기
	@Override
	public int countDown(Map data) {
		return dao.countDown(session, data);
	}

	
}
